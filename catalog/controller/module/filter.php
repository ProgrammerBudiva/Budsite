<?php
class ControllerModuleFilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else if(isset($this->request->get['latest_id'])){
            $parts = explode('_', (string)$this->request->get['latest_id']);
        } else if(isset($this->request->get['special_id'])){
            $parts = explode('_', (string)$this->request->get['special_id']);
        } else {
			$parts = array();
		}

		$category_id = end($parts);

		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->load->language('module/filter');

			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_all'] = $this->language->get('text_all');
			$data['text_special'] = $this->language->get('text_special');
			$data['text_latest'] = $this->language->get('text_latest');
			$data['text_instore'] = $this->language->get('text_instore');
			$data['text_range'] = $this->language->get('text_range');

            if(isset($this->request->get['section'])){
                $data['section'] = $this->request->get['section'];
            } else {
                $data['section'] = false;
            }

            if(isset($this->request->get['in_store'])){
                $data['in_store'] = $this->request->get['in_store'];
            } else {
                $data['in_store'] = false;
            }


            if($this->request->get['route'] == 'product/category'){
                $data['route'] = true;
            } else {
                $data['route'] = false;
            }

			if(isset($this->request->get['price'])){
				$price = explode("-", $this->request->get['price']);
				$min_price_session = $price[0];
				$max_price_session = $price[1];

				$data['min_price_session'] = $min_price_session;
				$data['max_price_session'] = $max_price_session;
			}

			$data['button_filter'] = $this->language->get('button_filter');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

            if(isset($this->request->get['path'])){
                $data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));
            } else if(isset($this->request->get['special_id'])){
                $data['action'] = str_replace('&amp;', '&', $this->url->link('product/special', 'special_id=' . $this->request->get['special_id'] . $url));
            } else if(isset($this->request->get['latest_id'])){
                    $data['action'] = str_replace('&amp;', '&', $this->url->link('product/latest', 'latest_id=' . $this->request->get['latest_id'] . $url));
            }



            if (isset($this->request->get['filter'])) {
				$data['filter_category'] = explode(',', $this->request->get['filter']);
			} else {
				$data['filter_category'] = array();
			}

			$this->load->model('catalog/product');

            $min_price = $this->model_catalog_product->getMinCategoryPrice($category_id);
            $max_price = $this->model_catalog_product->getMaxCategoryPrice($category_id);

            $data['min_price'] = $this->currency->formatMinInt($min_price['min_price']);
            $data['max_price'] = $this->currency->formatMaxInt($max_price['max_price']);

            if(isset($this->request->get['price'])){
                $price_filter = explode('-', $this->request->get['price']);
                $data['lower_price'] = $price_filter[0];
                $data['upper_price'] = $price_filter[1];
            } else {
                $data['lower_price'] = $data['min_price'];
                $data['upper_price'] = $data['max_price'];
            }

            if($this->currency->getSymbolLeft()){
                $data['symbol_left'] = $this->currency->getSymbolLeft();
            } else {
                $data['symbol_left'] = '';
            }

            if($this->currency->getSymbolRight()){
                $data['symbol_right'] = $this->currency->getSymbolRight();
            } else {
                $data['symbol_right'] = '';
            }

			$data['filter_groups'] = array();

			$filter_groups = $this->model_catalog_category->getCategoryFilters($category_id);

			if ($filter_groups) {
				foreach ($filter_groups as $filter_group) {
					$childen_data = array();

					foreach ($filter_group['filter'] as $filter) {
						$filter_data = array(
							'filter_category_id' => $category_id,
							'filter_filter'      => $filter['filter_id']
						);

						$childen_data[] = array(
							'filter_id' => $filter['filter_id'],
							'name'      => $filter['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
						);
					}

					$data['filter_groups'][] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $childen_data
					);
				}

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filter.tpl')) {
					return $this->load->view($this->config->get('config_template') . '/template/module/filter.tpl', $data);
				} else {
					return $this->load->view('default/template/module/filter.tpl', $data);
				}
			}
		}
	}
}