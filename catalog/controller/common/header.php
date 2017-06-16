<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

        $data['robots'] = $this->document->getRobots();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();

		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
    $data['headScripts'] = $this->document->getHeadScripts();
		/*$data['scripts'] = $this->document->getScripts();*/
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		/*$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');*/
		$data['name'] = $this->config->get('config_name');

        $this->language->load('common/header');
        //Top menu list
        $data['text_about_us'] = $this->language->get('text_about_us');
        $data['store_description'] = $this->language->get('text_description');
        $data['alt_logo'] = $this->language->get('alt_logo');
        $data['title_logo'] = $this->language->get('title_logo');
        $data['text_authorization'] = $this->language->get('text_authorization');
        $data['text_registration'] = $this->language->get('text_registration');
        $data['text_contacts'] = $this->language->get('text_contacts');
        $data['text_payment'] = $this->language->get('text_payment');
        $data['text_shipping'] = $this->language->get('text_shipping');
        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_garanthy'] = $this->language->get('text_garanthy');
        $data['text_cooperation'] = $this->language->get('text_cooperation');
        $data['text_statement'] = $this->language->get('text_statement');
        $data['link_about_us'] = $this->url->link('information/information', 'information_id=4');
        $data['link_contacts'] = $this->url->link('information/contact');
        $data['link_payment'] = $this->url->link('information/information', 'information_id=7');
        $data['link_shipping'] = $this->url->link('information/information', 'information_id=6');
        $data['link_garanthy'] = $this->url->link('information/information', 'information_id=13');
        $data['link_blog'] = $this->url->link('information/news');
        $data['link_cooperation'] = $this->url->link('information/information', 'information_id=11');
        $data['link_statement'] = $this->url->link('information/information', 'information_id=10');

        $data['text_latest'] = $this->language->get('text_latest');
        $data['link_latest'] = $this->url->link('product/latest');
        $data['text_specials'] = $this->language->get('text_specials');
        $data['link_specials'] = $this->url->link('product/special');

        $data['text_catalog'] = $this->language->get('text_catalog');
        $data['text_all_category'] = $this->language->get('text_all_category');


		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_new_collection'] = $this->language->get('text_new_collection');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['callback'] = $this->language->get('callback');
		$data['callback_text'] = $this->language->get('callback-text');
		$data['callback_button'] = $this->language->get('callback-button');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['compare'] = $this->url->link('product/compare', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['all_category'] = $this->url->link('product/all_category');
		$telephones = explode(';',$this->config->get('config_telephone'));
    $data['telephones'] = array();
    foreach($telephones as $telephone){
        $operator = '';
        if((strpos($telephone, '(096)') !== false)
            || (strpos($telephone, '(067)') !== false)
            || (strpos($telephone, '(098)') !== false)
            || (strpos($telephone, '(068)') !== false)
            || (strpos($telephone, '(097)') !== false))
        {
            $operator = 'kyivstar';
        } else if((strpos($telephone, '(073)') !== false)
            || (strpos($telephone, '(063)') !== false)
            || (strpos($telephone, '(093)') !== false)){
            $operator = 'life';
        } else if((strpos($telephone, '(050)') !== false)
            || (strpos($telephone, '(099)') !== false)
            || (strpos($telephone, '(095)') !== false)) {
            $operator = 'mts';
        }

        $data['telephones'][] = array(
            'number' => $telephone,
            'operator' => $operator,
        );
    }

		$data['lookbook'] = $this->url->link('product/lookbook');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);
				$detailInfo = $this->model_catalog_category->getCategoryDetail($category['category_id']);

				foreach ($children as $child) {
          // Level 3
          $children_data_l3 = array();

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$childDetailInfo = $this->model_catalog_category->getCategoryDetail($child['category_id']);

          $children_l3 = $this->model_catalog_category->getCategories($child['category_id']);
          foreach ($children_l3 as $child_l3) {
            $childL3DetailInfo = $this->model_catalog_category->getCategoryDetail($child_l3['category_id']);

            $children_data_l3[] = array(
              'name'  => $child_l3['name'],
              'href'  => isset($childL3DetailInfo['keyword']) ? $childL3DetailInfo['keyword'] : $this->url->link('product/category', 'path=' . $child_l3['category_id']),
					  );
          }

					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => isset($childDetailInfo['keyword']) ? $childDetailInfo['keyword'] : $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
            'children' => $children_data_l3
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => isset($detailInfo['keyword']) ? $detailInfo['keyword'] : $this->url->link('product/category', 'path=' . $category['category_id']),
				);
			}
		}

        //latest dropdown list
        $this->load->model('catalog/product');

        $latets_ids = $this->model_catalog_product->getLatestProductsIDs(false, $this->config->get('latest_limit_days'));
        $latets_cats = array();
        if($latets_ids){
            foreach($latets_ids as $id){
                $cats = $this->model_catalog_product->getCategories($id['product_id']);
                foreach($cats as $category){
                    $latets_cats[] = $category['category_id'];
                }
            }
        }

        $latets_cats = array_unique($latets_cats);

        if ($latets_cats) {
          foreach ($latets_cats as $category) {

            $result = $this->model_catalog_category->getCategory($category);
            if ($result) {

              $data['latest_categories'][] = array(
                'name'   => $result['name'],
                'column' => $result['column'] ? $result['column'] : 1,
                'href'   => $this->url->link('product/latest', 'latest_id=' . $result['category_id']),
              );
            }
          }
        }
        else {
          $data['latest_categories'] = FALSE;
        }

        $specials_ids = $this->model_catalog_product->getProductSpecialsIDs();

        $specials_cats = array();
        if($specials_ids){
            foreach($specials_ids as $id){
                $cats = $this->model_catalog_product->getCategories($id['product_id']);
                foreach($cats as $category){
                    $specials_cats[] = $category['category_id'];
                }
            }
        }

        $specials_cats = array_unique($specials_cats);
        if($specials_cats){
            foreach ($specials_cats as $category) {

                $result = $this->model_catalog_category->getCategory($category);

                $data['specials_categories'][] = array(
                    'name'     => $result['name'],
                    'column'   => $result['column'] ? $result['column'] : 1,
                    'href'     => $this->url->link('product/special', 'special_id=' . $result['category_id'])
                );
            }
        } else {
            $data['specials_categories'] = false;
        }

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}

	public function callback(){
    if (empty($this->request->post['callback_phone'])){
      echo json_encode(['error'=>'empty_phone']);
    }
		$mail = new Mail($this->config->get('config_mail'));
		$mail->setTo($this->config->get('config_email'));
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject('Обратная связь');
		$mail->setText('Перезвоните мне. ' . $this->request->post['callback_phone']);
		$mail->send();
		echo json_encode('ok');
	}
}