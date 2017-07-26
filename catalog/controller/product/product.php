<?php

class ControllerProductProduct extends Controller
{
    private $error = array();

    public function index() {
        $this->load->language('product/product');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $this->load->model('catalog/seo_url');

        $string_url = $_SERVER['HTTP_REFERER'];
        $exp = explode('/', $string_url);

        $query = $this->model_catalog_seo_url->GetUrlQuery(end($exp));

        $category_id = preg_replace('~[^0-9]+~','',$query);
        $result_crumbs = $this->model_catalog_seo_url->GetProductBreadcrumbs($category_id);

        foreach ($result_crumbs as $value){
            $data['breadcrumbs'][] = array(
                'text' => $value['name'],
                'href' => $value['link']
            );
        }

        $this->load->model('catalog/category');
        //banner categories
        $categories_for_banner = [
            257, 325, 507, 324, 506, 509, 508, 532, 533, 531, 530, 529,
            510, 511, 512, 255, 514, 513, 515, 516, 519, 518, 520, 521,
            542, 543, 553, 552, 551, 550, 549, 548, 544, 545, 546, 547,
            541, 540, 539, 534, 535, 536, 537, 538
        ];
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product_to_category WHERE product_id=" . $this->request->get['product_id'] );
        $res_array = [];
        foreach ($query->rows as $value){
            $res_array[] = $value['category_id'];
        }
        $banner_boolean = array_intersect($res_array, $categories_for_banner);
        if(!empty($banner_boolean)) {
            $data['banner'] = true;
        }
        if (isset($this->request->get['path'])) {
            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            $category_id = (int)array_pop($parts);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = $path_id;
                } else {
                    $path .= '_' . $path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    $data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path)
                    );
                }
            }

            // Set the last category breadcrumb
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $url = '';

                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $data['breadcrumbs'][] = array(
                    'text' => $category_info['name'],
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
                );
            }
        } else {
            $category_id = false;
        }

        $this->load->model('catalog/manufacturer');

        if (isset($this->request->get['manufacturer_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_brand'),
                'href' => $this->url->link('product/manufacturer')
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

            if ($manufacturer_info) {
                $data['breadcrumbs'][] = array(
                    'text' => $manufacturer_info['name'],
                    'href' => $this->url->link('product/manufacturer/info',
                        'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
                );
            }
        }

        if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
            $url = '';

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_search'),
                'href' => $this->url->link('product/search', $url)
            );
        }

        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['lower_price'] = $this->model_catalog_product->getProductLowerPrice($product_id);

            if($data['lower_price']) {
                $data['lower_price'] = $this->currency->format($this->tax->lowerPrice($product_info['price'], $data['lower_price']));
            }

            $data['breadcrumbs'][] = array(
                'text' => $product_info['name'],
                'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
            );

            $meta_title = empty($product_info['meta_title']) ?
              $product_info['name'] . ' | budsite.ua' :
              $product_info['meta_title'];
            $this->document->setTitle($meta_title);

            $meta_description = empty($product_info['meta_description']) ?
              '➤ ' . $product_info['name'] . ' – купить в ➦budsite по низкой цене ✈Доставка по всей Украине ☎(044) 390-20-40' :
              $product_info['meta_description'];
            $this->document->setDescription($meta_description);

            $meta_keyword = empty($product_info['meta_keyword']) ?
              $product_info['name'] :
              $product_info['meta_keyword'];
            $this->document->setKeywords($meta_keyword);

            $this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
            $this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

            $data['heading_title'] = $product_info['name'];
            $data['h1'] = $product_info['h1'];

            $data['text_select'] = $this->language->get('text_select');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_reward'] = $this->language->get('text_reward');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_stock'] = $this->language->get('text_stock');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_discount'] = $this->language->get('text_discount');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_option'] = $this->language->get('text_option');
            $data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
            $data['text_write'] = $this->language->get('text_write');
            $data['text_login'] = sprintf($this->language->get('text_login'),
                $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
            $data['text_note'] = $this->language->get('text_note');
            $data['text_tags'] = $this->language->get('text_tags');
            $data['text_related'] = $this->language->get('text_related');
            $data['text_analogs'] = $this->language->get('text_analogs');
            $data['text_loading'] = $this->language->get('text_loading');
            $data['text_sku'] = $this->language->get('text_sku');
            $data['text_share'] = $this->language->get('text_share');
            $data['text_more'] = $this->language->get('text_more');
            $data['text_choose_size'] = $this->language->get('text_choose_size');
            $data['text_old'] = $this->language->get('text_old');
            $data['text_new'] = $this->language->get('text_new');
            $data['text_all_specification'] = $this->language->get('text_all_specification');
            $data['text_delivery'] = $this->language->get('text_delivery');
            $data['text_payment'] = $this->language->get('text_payment');
            $data['text_pro_hot'] = $this->language->get('text_pro_hot');
            $data['text_pro_sale'] = $this->language->get('text_pro_sale');
            $data['text_delivery_info'] = $this->language->get('text_delivery_info');
            $data['text_buy_one_click'] = $this->language->get('text_buy_one_click');
            $data['text_callback_you'] = $this->language->get('text_callback_you');
            $data['text_thank_to_call'] = $this->language->get('text_thank_to_call');
            $data['text_waiting_btn'] = $this->language->get('text_waiting_btn');

            $data['text_next_product'] = $this->language->get('text_next_product');
            $data['text_prev_product'] = $this->language->get('text_prev_product');

            $data['text_success_oneclick_order'] = sprintf($this->language->get('text_success_oneclick_order'), $this->url->link('information/contact'));

            $data['entry_qty'] = $this->language->get('entry_qty');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_review'] = $this->language->get('entry_review');
            $data['entry_plus'] = $this->language->get('entry_plus');
            $data['entry_minus'] = $this->language->get('entry_minus');
            $data['entry_rating'] = $this->language->get('entry_rating');
            $data['entry_good'] = $this->language->get('entry_good');
            $data['entry_bad'] = $this->language->get('entry_bad');
            $data['entry_captcha'] = $this->language->get('entry_captcha');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_cart_disable'] = $this->language->get('button_cart_disable');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_make_order'] = $this->language->get('button_make_order');
            $data['button_upload'] = $this->language->get('button_upload');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_send'] = $this->language->get('button_send');

            $data['link_make_order'] = $this->url->link('information/contact');

            $data['label'] = $product_info['model'];

            $this->load->model('catalog/review');

            $data['tab_description'] = $this->language->get('tab_description');
            $data['tab_attribute'] = $this->language->get('tab_attribute');
            $data['tab_slider'] = $this->language->get('tab_slider');
            $data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

            $data['product_id'] = (int)$this->request->get['product_id'];
            $data['manufacturer'] = $product_info['manufacturer'];
            $data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
            $data['link_load_sizes'] = $this->url->link('information/information/agree&information_id=10');
            $data['model'] = $product_info['model'];
            $data['sku'] = $product_info['sku'];
            $data['reward'] = $product_info['reward'];
            $data['points'] = $product_info['points'];

            //Check if product already in cart
            $in_cart = false;
            foreach ($this->cart->getProducts() as $product) {
                if ($product['product_id'] == $product_id) {
                    $in_cart = true;
                    break;
                }
            }
            //Check if product is added to compare list
            $all_compared = !empty($this->session->data['compare']) ? $this->session->data['compare'] : [];
            $all_compared = is_array($all_compared) ? $all_compared : [];
            $in_compared = in_array($product_id, $all_compared);

            $data['in_cart'] = $in_cart;
            $data['in_compared'] = $in_compared;

            $next_id = $this->model_catalog_product->getNextProduct($data['product_id'], $category_id);
            $prev_id = $this->model_catalog_product->getPrevProduct($data['product_id'], $category_id);
            if (!$category_id) {
                $data['spec_link'] = ($next_id) ? $this->url->link('product/product',
                    '&product_id=' . $product_id . "#tab-specification") : false;
            } else {
                $data['spec_link'] = ($next_id) ? $this->url->link('product/product',
                    'path=' . $category_id . '&product_id=' . $product_id . "#tab-specification") : false;
            }

            if ($category_id) {
                $data['next_product_link'] = ($next_id) ? $this->url->link('product/product',
                    'path=' . $category_id . '&product_id=' . $next_id) : false;
                $data['prev_product_link'] = ($prev_id) ? $this->url->link('product/product',
                    'path=' . $category_id . '&product_id=' . $prev_id) : false;
            } else {
                $data['next_product_link'] = ($next_id) ? $this->url->link('product/product',
                    'product_id=' . $next_id) : false;
                $data['prev_product_link'] = ($prev_id) ? $this->url->link('product/product',
                    'product_id=' . $prev_id) : false;
            }

            if ($product_info['quantity'] <= 0) {
                $data['stock'] = $product_info['stock_status'];
            } elseif ($this->config->get('config_stock_display')) {
                $data['stock'] = $product_info['quantity'];
            } else {
                $data['stock'] = $this->language->get('text_instock');
            }

            $this->load->model('tool/image');

            if ($product_info['image']) {
                $data['popup'] = $this->model_tool_image->resize($product_info['image'],
                    $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
            } else {
                $data['popup'] = '';
            }

            if ($product_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($product_info['image'],
                    $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            } else {
                $data['thumb'] = '';
            }

            $data['images'] = array();
            $data['images_slider'] = array();

            $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
            $result_slider = $this->model_catalog_product->getProductImages($this->request->get['product_id'], 'slider');

            foreach ($results as $result) {
                $data['images'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_popup_width'),
                        $this->config->get('config_image_popup_height')),
                    'thumb' => $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_additional_width'),
                        $this->config->get('config_image_additional_height'))
                );
            }

            foreach ($result_slider as $result) {
                $data['images_slider'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_popup_width'),
                        $this->config->get('config_image_popup_height')),
                    'thumb' => $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_additional_width'),
                        $this->config->get('config_image_additional_height'))
                );
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'],
                    $product_info['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $data['price'] = false;
            }

            if ((float)$product_info['special']) {
                $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'],
                    $product_info['tax_class_id'], $this->config->get('config_tax')));
                $data['discount_percent'] = sprintf($this->language->get('text_discount_percent'),
                    round((1 - $product_info['special'] / $product_info['price']), 2) * 100);
            } else {
                $data['special'] = false;
            }

            if ($this->config->get('config_tax')) {
                $data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
            } else {
                $data['tax'] = false;
            }

            //Если производитель INTERTOOL и цена меньше 280 грн, выводим определенную надпись
            if(strtolower($data['manufacturer']) == 'intertool' && $product_info['price'] < 280) {
                $data['text_minimal_price'] = 'Минимальный заказ на продукцию INTERTOOL составляет 280 грн.';
            } else {
                $data['text_minimal_price'] = false;
            }


            $discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

            $data['discounts'] = array();

            foreach ($discounts as $discount) {
                $data['discounts'][] = array(
                    'quantity' => $discount['quantity'],
                    'price' => $this->currency->format($this->tax->calculate($discount['price'],
                        $product_info['tax_class_id'], $this->config->get('config_tax')))
                );
            }

            $data['options'] = array();

            $latest_products = $this->model_catalog_product->getLatestProductsIDs(false,
                $this->config->get('latest_limit_days'));

            $latest_ids = array();
            foreach ($latest_products as $id) {
                $latest_ids[] = $id['product_id'];
            }

            $latest_products = $this->model_catalog_product->getProductSpecialsIDs(false,
                $this->config->get('latest_limit_days'));

            $special_ids = array();
            foreach ($latest_products as $id) {
                $special_ids[] = $id['product_id'];
            }

            foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
                $product_option_value_data = array();

                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'],
                                $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
                        } else {
                            $price = false;
                        }

                        $product_option_value_data[] = array(
                            'product_option_value_id' => $option_value['product_option_value_id'],
                            'option_value_id' => $option_value['option_value_id'],
                            'name' => $option_value['name'],
                            'image' => $this->model_tool_image->resize($option_value['image'], 50, 50),
                            'price' => $price,
                            'price_prefix' => $option_value['price_prefix']
                        );
                    }
                }

                $data['options'][] = array(
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value' => $product_option_value_data,
                    'option_id' => $option['option_id'],
                    'name' => $option['name'],
                    'type' => $option['type'],
                    'value' => $option['value'],
                    'required' => $option['required']
                );
            }

            if ($product_info['minimum']) {
                $data['minimum'] = $product_info['minimum'];
            } else {
                $data['minimum'] = 1;
            }

            $data['review_status'] = $this->config->get('config_review_status');

            if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
                $data['review_guest'] = true;
            } else {
                $data['review_guest'] = false;
            }

            if ($this->customer->isLogged()) {
                $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
            } else {
                $data['customer_name'] = '';
            }

            $data['reviews'] = $this->language->get('text_reviews') . " (" . (int)$product_info['reviews'] . ")";
            $data['rating'] = (int)$product_info['rating'];
            /*$product_desc = preg_replace('/<\/?a(.|\s)*?>/', '', $product_info['description']);*/
            $data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            $attribute_groups = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
            $data['attribute_groups'] = $attribute_groups;
            $attributes_id = '';
            $attributes_text = array();
            // unit of product (is taken from attributes)
            $data['unit'] = '';
            foreach ($attribute_groups as $attribute_group) {
                foreach ($attribute_group['attribute'] as $attribute) {
                    $attributes_id .= $attribute['attribute_id'] . ",";
                    $attributes_text[] = $attribute['text'];

                    if ($attribute['attribute_id'] == ATTR_UNIT_ID) {
                      $data['unit'] = $attribute['text'];
                    }
                }
            }

            $attributes_id = substr($attributes_id, 0, -1);
            $analogs_id = array();
            if ($attributes_id) {
                $analogs_id = $this->model_catalog_product->getAnalogProducts($attributes_id, $attributes_text,
                    $product_id);
            }
            $data['products'] = array();
            $data['analogs'] = array();

            /* Сопутствующие */
            $results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
            // получим сопутствующие для категории
            $last_category_id = $this->model_catalog_product->getProductLastCategoryId($this->request->get['product_id']);
            $categoryRelated = $this->model_catalog_category->getRelated($last_category_id);
            if ($categoryRelated && (count($results) < $categoryRelated['limit'])) {
              // заданные товары
              if ($categoryRelated['products']){
                foreach ($categoryRelated['products'] as $r_product_id) {
                  $r_product = $this->model_catalog_product->getProduct($r_product_id);
                  // будем добавлять только тот товар, которого еще нет в списке сопутствующих
                  $isInRelated = !!array_filter($results, function($product) use($r_product){
                    return ($product['product_id'] == $r_product['product_id']);
                  });
                  if (!$isInRelated){
                    $results[] = $this->model_catalog_product->getProduct($r_product_id);
                  }
                }
              }

              // заданные категории
              if ($categoryRelated['categories'] && (count($results) < $categoryRelated['limit'])){
                $requiredProductCount = (int)$categoryRelated['limit'] - count($results);
                $results += $this->model_catalog_product->getRandomProductsByCategory($categoryRelated['categories'], $requiredProductCount);
              }

              // из случайных товаров категории могли быть добавлены дублирующиеся позиции, отфильтруем их
              $results = array_unique($results, SORT_REGULAR);
            }

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_related_width'),
                        $this->config->get('config_image_related_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png',
                        $this->config->get('config_image_related_width'),
                        $this->config->get('config_image_related_height'));
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'],
                        $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'],
                        $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int)$result['rating'];
                } else {
                    $rating = false;
                }

                if (in_array($result['product_id'], $latest_ids)) {
                    $latest_label = true;
                } else {
                    $latest_label = false;
                }

                if (in_array($result['product_id'], $special_ids)) {
                    $special_label = true;
                } else {
                    $special_label = false;
                }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'latest_label' => $latest_label,
                    'specials_label' => $special_label,
                    /*'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES,
                            'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'rating' => $rating,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'brand'       => $this->model_catalog_product->getBrandFromAttributes($result['product_id']),
                    'category'    => $this->model_catalog_product->getMainCategoryName($result['product_id']),
                );
            }

            foreach ($analogs_id as $analog_id) {

                $result = $this->model_catalog_product->getProduct($analog_id['product_id']);

                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_related_width'),
                        $this->config->get('config_image_related_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png',
                        $this->config->get('config_image_related_width'),
                        $this->config->get('config_image_related_height'));
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'],
                        $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'],
                        $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int)$result['rating'];
                } else {
                    $rating = false;
                }

                if (in_array($result['product_id'], $latest_ids)) {
                    $latest_label = true;
                } else {
                    $latest_label = false;
                }

                if (in_array($result['product_id'], $special_ids)) {
                    $special_label = true;
                } else {
                    $special_label = false;
                }

                $data['analogs'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'label' => $result['name'],
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES,
                            'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'price' => $price,
                    'special' => $special,
                    'latest_label' => $latest_label,
                    'specials_label' => $special_label,
                    'tax' => $tax,
                    'rating' => $rating,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'brand'       => $this->model_catalog_product->getBrandFromAttributes($result['product_id']),
                    'category'    => $this->model_catalog_product->getMainCategoryName($result['product_id']),
                );
            }


            $data['tags'] = array();

            if ($product_info['tag']) {
                $tags = explode(',', $product_info['tag']);

                foreach ($tags as $tag) {
                    $data['tags'][] = array(
                        'tag' => trim($tag),
                        'href' => $this->url->link('product/search', 'tag=' . trim($tag))
                    );
                }
            }

            $data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
            $data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

            $this->model_catalog_product->updateViewed($this->request->get['product_id']);

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            $data['catapulta'] = $this->load->controller('module/catapulta');

            //cookies for visited products
            if (isset($this->request->cookie['visited_products'])) {
                $visited_products = explode(',', $this->request->cookie['visited_products']);
                $visited_products = array_reverse($visited_products);
                $visited_products = array_slice($visited_products, 0, 10);
                $visited_products = array_reverse($visited_products);
                $visited_products[] = $this->request->get['product_id'];

                $visited_products = implode(',', $visited_products);
                setcookie('visited_products', $visited_products, time() + 60 * 60 * 24 * 30);
            } else {
                $visited_products = array();
                $visited_products[] = $this->request->get['product_id'];
                array_reverse($visited_products);
                $visited_products = array_unique($visited_products);
                $visited_products = implode(',', $visited_products);
                setcookie('visited_products', $visited_products, time() + 60 * 60 * 24 * 30);
            }

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/product.tpl',
                    $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/product/product.tpl', $data));
            }
        } else {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }


            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            $data['catapulta'] = $this->load->controller('module/catapulta');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl',
                    $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
            }
        }
    }

    public function review()
    {
        $this->load->language('product/product');

        $this->load->model('catalog/review');

        $data['text_no_reviews'] = $this->language->get('text_no_reviews');
        $data['entry_review'] = $this->language->get('entry_review');
        $data['entry_plus'] = $this->language->get('entry_plus');
        $data['entry_minus'] = $this->language->get('entry_minus');
        $data['entry_general'] = $this->language->get('entry_general');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['reviews'] = array();

        $review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

        $results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'],
            ($page - 1) * 5, 5);

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'author' => $result['author'],
                'plus' => $result['plus'],
                'minus' => $result['minus'],
                'text' => nl2br($result['text']),
                'rating' => (int)$result['rating'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('product/product/review',
            'product_id=' . $this->request->get['product_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0,
            ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total,
            ceil($review_total / 5));

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/review.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/review.tpl',
                $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/product/review.tpl', $data));
        }
    }

    public function getRecurringDescription()
    {
        $this->language->load('product/product');
        $this->load->model('catalog/product');

        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        if (isset($this->request->post['recurring_id'])) {
            $recurring_id = $this->request->post['recurring_id'];
        } else {
            $recurring_id = 0;
        }

        if (isset($this->request->post['quantity'])) {
            $quantity = $this->request->post['quantity'];
        } else {
            $quantity = 1;
        }

        $product_info = $this->model_catalog_product->getProduct($product_id);
        $recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

        $json = array();

        if ($product_info && $recurring_info) {
            if (!$json) {
                $frequencies = array(
                    'day' => $this->language->get('text_day'),
                    'week' => $this->language->get('text_week'),
                    'semi_month' => $this->language->get('text_semi_month'),
                    'month' => $this->language->get('text_month'),
                    'year' => $this->language->get('text_year'),
                );

                if ($recurring_info['trial_status'] == 1) {
                    $price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity,
                        $product_info['tax_class_id'], $this->config->get('config_tax')));
                    $trial_text = sprintf($this->language->get('text_trial_description'), $price,
                            $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']],
                            $recurring_info['trial_duration']) . ' ';
                } else {
                    $trial_text = '';
                }

                $price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity,
                    $product_info['tax_class_id'], $this->config->get('config_tax')));

                if ($recurring_info['duration']) {
                    $text = $trial_text . sprintf($this->language->get('text_payment_description'), $price,
                            $recurring_info['cycle'], $frequencies[$recurring_info['frequency']],
                            $recurring_info['duration']);
                } else {
                    $text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price,
                            $recurring_info['cycle'], $frequencies[$recurring_info['frequency']],
                            $recurring_info['duration']);
                }

                $json['success'] = $text;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function write()
    {
        $this->load->language('product/product');
//echo "<pre>"; print_r($this->request); echo "</pre>";die;
        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }

            if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
                echo "<pre>"; print_r($this->request); echo "</pre>";die;
                $json['error'] = $this->language->get('error_rating');
            }

            if (empty($this->request->post['email'])){
                $json['error'] = $this->language->get('error_email');
            }
//            if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
//                $json['error'] = $this->language->get('error_captcha');
//            }

            unset($this->session->data['captcha']);

            if (!isset($json['error'])) {
                $this->load->model('catalog/review');

                $this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

                $json['success'] = $this->language->get('text_success');
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
