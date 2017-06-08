<?php
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_pro_sale'] = $this->language->get('text_pro_sale');
		$data['text_pro_hot'] = $this->language->get('text_pro_hot');

		$data['button_cart_disable'] = $this->language->get('button_cart_disable');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
        $data['text_more'] = $this->language->get('text_more');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$category_id = null;

		if(isset($this->request->get['path'])){
			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);
		}

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit'], $category_id);

        $latest_products = $this->model_catalog_product->getLatestProductsIDs(false, $this->config->get('latest_limit_days'));

        $latest_ids = array();
        foreach($latest_products as $id){
            $latest_ids[] = $id['product_id'];
        }

        $latest_products = $this->model_catalog_product->getProductSpecialsIDs(false, $this->config->get('latest_limit_days'));

        $special_ids = array();
        foreach($latest_products as $id){
            $special_ids[] = $id['product_id'];
        }

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

                if(in_array($result['product_id'], $latest_ids)){
                    $latest_label = true;
                } else {
                    $latest_label = false;
                }

                if(in_array($result['product_id'], $special_ids)) {
                    $special_label = true;
                } else {
                    $special_label = false;
                }

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
					'quantity'    => $result['quantity'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'price'       => $price,
                    'latest_label'=> $latest_label,
                    'specials_label'=> $special_label,
                    'special'     => $special,
                    'tax'         => $tax,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                );
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bestseller.tpl', $data);
			}
		}
	}
}