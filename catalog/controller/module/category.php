<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');
        $data['see_all'] = $this->language->get('see_all');
        $data['text_min_price'] = $this->language->get('text_min_price');


    if (isset($this->request->get['category_id'])) {
      $parts = explode('_', (string) $this->request->get['category_id']);
    }
    else {
      $parts = array();
    }

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}



		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

			if ($category['category_id'] == $data['category_id']) {
				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach($children as $child) {
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                    $filter_groups = $this->model_catalog_category->getCategoryFilters($child['category_id']);
                    $filters = array();
                    if ($filter_groups) {
                        foreach ($filter_groups as $filter_group) {
                            $childen_data = array();
                            if($filter_group['filter_group_id'] == 4){
                                foreach ($filter_group['filter'] as $filter) {
                                    $filter_data = array(
                                        'filter_category_id' => $child['category_id'],
                                        'filter_filter'      => $filter['filter_id']
                                    );

                                    $childen_data[] = array(
                                        'filter_id' => $filter['filter_id'],
                                        'name'      => $filter['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
                                    );
                                }

                                $filters[] = array(
                                    'filter_group_id' => $filter_group['filter_group_id'],
                                    'name'            => $filter_group['name'],
                                    'filter'          => $childen_data
                                );
                            }
                        }
                    }

                    if($child['image']){
                        $image = $this->model_tool_image->resize($child['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    } else {
                        $image = false;
                    }
                    $filters = array_slice($filters, 0, 5);

                    $min_price = $this->model_catalog_product->getMinCategoryPrice($child['category_id']);

                    if((int)$min_price['min_price']){
                        $price = $this->currency->format($min_price['min_price']);
                    } else {
                        $price = false;
                    }

					$children_data[] = array(
						'category_id' => $child['category_id'],
                        'filters' => $filters,
                        'min_price' => $price,
                        'image'  => $image,
						'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}