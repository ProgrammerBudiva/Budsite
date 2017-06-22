<?php

class ControllerProductCategory extends Controller
{
    public function index() {
        $this->load->language('product/category');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        if (isset($this->request->get['filter'])) {
            $filter = $this->request->get['filter'];
        } else {
            $filter = '';
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
            $data['no_follow'] = true;
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
            $data['no_follow'] = true;
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
            $data['no_follow'] = true;
        } else {
            $limit = $this->config->get('config_product_limit');
        }

        if($data['no_follow'] == 1){
            $this->document->setRobots('noindex,follow');
        }
        //banner categories
        $categories_for_banner = [
            257, 325, 507, 324, 506, 509, 508, 532, 533, 531, 530, 529,
            510, 511, 512, 255, 514, 513, 515, 516, 519, 518, 520, 521,
            542, 543, 553, 552, 551, 550, 549, 548, 544, 545, 546, 547,
            541, 540, 539, 534, 535, 536, 537, 538
        ];

        $banner_boolean = array_search($this->request->get['path'], $categories_for_banner);
        if($banner_boolean !== false) {
            $data['banner'] = true;
        }
        // end banner categories
        if (isset($this->request->get['price'])) {
            $price_filter = explode('-', $this->request->get['price']);
            $price_from = (int)($price_filter[0] / $this->currency->getValue());
            $price_to = (int)($price_filter[1] / $this->currency->getValue());
        } else {
            $price_from = false;
            $price_to = false;
        }
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if (isset($this->request->get['path'])) {
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

            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = (int)$path_id;
                } else {
                    $path .= '_' . (int)$path_id;
                }
                $category_info = $this->model_catalog_category->getCategory($path_id);

                if (empty($category_info)) {
                  continue; // hack
                }

                $data['breadcrumbs'][] = array(
                  'text' => $category_info['name'],
                  'href' => $this->url->link('product/category', 'path=' . $path_id)
                );
            }
            $category_info = null;
            $category_id = (int)array_pop($parts);

        } else {
            $category_id = 0;
        }

        $category_info = $this->model_catalog_category->getCategory($category_id);

        if ($category_info) {

//            print_r($category_info['name']);die;
            ////////////////////////////meta title generator
            $title_array[] = [
                'по отличной цене',
                'по низким ценам',
                'по специальной цене',
                'с хорошей скидкой ',
                'с ценой от склада',
                'по оптовой цене',
            ];

            $title_array[] = [
              'с доставкой на дом',
              'в любой город Украины',
              'по Украине',
              'с бесплатной доставкой',
              'без оплаты за доставку',
              'курьером и почтой',
            ];

            $title_array[] = [
                'BudSite',
                'БудСайт',
            ];

            $key = array_rand($title_array['0'], 1);
            $part1 = $title_array['0'][$key];

            $key = array_rand($title_array['1'], 1);
            $part2 = $title_array['1'][$key];

            $key = array_rand($title_array['2'], 1);
            $part3 = $title_array['2'][$key];

            $meta_title = $category_info['name'] . ' ' . $part1 . ' ' . $part2 .' | ' . $part3 . ' ᐊ';

            $this->document->setTitle($meta_title);
            ///////////////////////////end of meta title generator

            ////////////////////////////meta description generator
            $description_array[] = [
              'Ищете ' . $category_info['name'] .'? | На',
              'Выбираете ' . $category_info['name'] .'? | На',
              'Подбираете ' . $category_info['name'] .'? | На',
              'Купить ' . $category_info['name'] .'? | На',
              'Заказать ' . $category_info['name'] .'? | На',
            ];

            $description_array[] = [
              ' budsite.ua',
              ' Budsite',
              ' Будсайт.юа',
              ' БудСайт',
            ];

            $description_array[] = [
                ' ✔ Приятные цены',
                ' ✔ Низкие цены',
                ' ✔ Лучшие цены',
                ' ✔ Доступные цены',
            ];

            $description_array[] = [
                ' ✉️ Сжатые сроки доставки',
                ' ✉️ Быстрая доставка',
                ' ✉️ Доставка в Ваш город',
                ' ✉️ Доставка по всей Украине',
                ' ✉️ Курьерская доставка',
                ' ✉️ Быстрая отправка',
                ' ✉️ Моментальная отправка',
            ];

            $description_array[] = [
                ' ➔ Большой выбор материалов.',
                ' ➔ Широкий ассортимент.',
                ' ➔ Огромный выбор.',
                ' ➔ Скидки до -30%!',
                ' ➔ В наличии!',
            ];

            $description_array[] = [
                ' ✪ Сделайте заказ прямо сейчас! ☏  (044) 390-20-40',
                ' ✪ Делайте заказ сейчас! ☏  (044) 390-20-40',
                ' ✪ Заказывайте уже сейчас! ☏  (044) 390-20-40',
                ' ✪ Успейте купить! ☏  (044) 390-20-40',
                ' ✪ Торопитесь! ☏  (044) 390-20-40',
                ' ✪ Не пропустите! ☏  (044) 390-20-40',
                ' ✪ Закажите онлайн ☏  (044) 390-20-40',
                ' ✪ Купить в один клик ☏  (044) 390-20-40',
            ];

            $meta_description = '';

            foreach ($description_array as $value){

                $key = array_rand($value, 1);
                $part = $value[$key];
                $meta_description .= $part;
            }

            $this->document->setDescription($meta_description);
            //////////////////////////// end of meta description generator


            //////////////////////////// meta keyword generator

            $meta_keyword = $category_info['name'] . ', Budsite, купить';
            $this->document->setKeywords($meta_keyword);
            //////////////////////////// end of meta keyword generator

            ////////////////////////////meta h1 generator

            $h1_meta = 'Купить ' . mb_strtolower($category_info['name']) . ' для дома и дачи';

            //////////////////////////// end of meta h1 generator


            $this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path']), 'canonical');

            $data['heading_title'] = $category_info['name'];
            $data['h1'] = $h1_meta;
            $data['text_more'] = $this->language->get('text_more');

            $data['text_refine'] = $this->language->get('text_refine');
            $data['text_empty'] = $this->language->get('text_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_instore'] = $this->language->get('text_instore');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_limit'] = $this->language->get('text_limit');
            $data['text_brand'] = $this->language->get('text_brand');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_cart_disable'] = $this->language->get('button_cart_disable');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');
            $data['text_old'] = $this->language->get('text_old');
            $data['text_new'] = $this->language->get('text_new');
            $data['text_pro_hot'] = $this->language->get('text_pro_hot');
            $data['text_pro_sale'] = $this->language->get('text_pro_sale');

            if ($category_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
            } else {
                $data['thumb'] = '';
            }

            $data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
            $data['compare'] = $this->url->link('product/compare');

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['categories'] = array();

            $results = $this->model_catalog_category->getCategories($category_id);

            foreach ($results as $result) {
                $filter_data = array(
                    'filter_category_id' => $result['category_id'],
                    'filter_sub_category' => true
                );

                $data['categories'][] = array(
                    'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
                );
            }

            $data['products'] = array();

            if (isset($this->request->get['in_store']) && $this->request->get['in_store'] == 'on') {
                $store_status = 7;
            } else {
                $store_status = false;
            }

            if (isset($this->request->get['in_store'])) {
                $data['in_store'] = $this->request->get['in_store'];
            } else {
                $data['in_store'] = false;
            }

            $filter_data = array(
                'filter_category_id' => $category_id,
                'filter_filter' => $filter,
                'sort' => $sort,
                'stock_status' => $store_status,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit,
                'price_from' => $price_from,
                'price_to' => $price_to,
            );


            if (isset($this->request->get['section']) && $this->request->get['section'] == 'latest') {

                if ($this->config->get('latest_limit_days')) {
                    $limit_days = $this->config->get('latest_limit_days');
                } else {
                    $limit_days = 4;
                }

                $filter_data = array(
                    'filter_category_id' => $category_id,
                    'filter_filter' => $filter,
                    'limit_days' => $limit_days,
                    'sort' => $sort,
                    'stock_status' => $store_status,
                    'order' => $order,
                    'start' => ($page - 1) * $limit,
                    'limit' => $limit,
                    'price_from' => $price_from,
                    'price_to' => $price_to,
                );

                $product_total = $this->model_catalog_product->getTotalLatestProducts($filter_data);

                $results = $this->model_catalog_product->getProductsLatest($filter_data);

            } else if (isset($this->request->get['section']) && $this->request->get['section'] == 'special') {

                $product_total = $this->model_catalog_product->getTotalSpecialsWithAttributes($filter_data);

                $results = $this->model_catalog_product->getProductSpecialsWithFilter($filter_data);
            } else {
                $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

                $results = $this->model_catalog_product->getProducts($filter_data);
            }

            $latest_products = $this->model_catalog_product->getLatestProductsIDs(false, $this->config->get('latest_limit_days'));

            $latest_ids = array();
            foreach ($latest_products as $id) {
                $latest_ids[] = $id['product_id'];
            }

            $latest_products = $this->model_catalog_product->getProductSpecialsIDs(false, $this->config->get('latest_limit_days'));

            $special_ids = array();
            foreach ($latest_products as $id) {
                $special_ids[] = $id['product_id'];
            }


            foreach ($results as $result) {

                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                    $lower_price = $result['lower_price'] ? $this->currency->format($this->tax->lowerPrice($result['price'], $result['lower_price'])) : "";
                } else {
                    $price = false;
                    $lower_price = false;
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

                $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);

                // получение значений из атрибутов товара
                $unitText = '';
                $brandName = '';
                foreach ($attribute_groups as $attribute_group) {
                  foreach ($attribute_group['attribute'] as $attribute) {
                    // единица измерения
                    if ($attribute['attribute_id'] == ATTR_UNIT_ID) {
                      $unitText = '/'.$attribute['text'];
                    }

                    if ($attribute['attribute_id'] == ATTR_BRAND_ID) {
                      $brandName = $attribute['text'];
                    }
                  }
                }

                //Check if product already in cart
                $in_cart = false;
                foreach ($this->cart->getProducts() as $product) {
                    if ($product['product_id'] == $result['product_id']) {
                        $in_cart = true;
                        break;
                    }
                }
                //Check if product is added to compare list
                $all_compared = !empty($this->session->data['compare']) ? $this->session->data['compare'] : [];
                $all_compared = is_array($all_compared) ? $all_compared : [];
                $in_compared = in_array($result['product_id'], $all_compared);

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'manufacturer' => $result['manufacturer'],
                    /*'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/
                    'price' => $price,
                    'lower_price' => $lower_price,
                    'quantity' => $result['quantity'],
                    'unit' => $unitText,
                    'special' => $special,
                    'latest_label' => $latest_label,
                    'specials_label' => $special_label,
                    'tax' => $tax,
                    'in_cart' => $in_cart,
                    'in_compared' => $in_compared,
                    //'attribute_groups' => $attribute_groups,
                    'rating' => $result['rating'],
                    'href' => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id']),
                    'brand' => $brandName,
                );
            }

            if ($category_id == 494) {
              $this->document->setNoindex(TRUE);
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

           /* $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
            );*/

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
                );

//                $data['sorts'][] = array(
//                    'text' => $this->language->get('text_rating_asc'),
//                    'value' => 'rating-ASC',
//                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
//                );
            }

            /*$data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
            );*/

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text' => $value,
                    'value' => $value,
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
                );
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            /* Теговые категории */
            $tagged_related_categories = [];
            if (!empty($category_info['tagged_related'])) {
              $tagged_related_categories = explode(',', $category_info['tagged_related']);
            }

            /* @var array $ids Array of category id
             * @return array
             */
            $prepareCategoriesList = function($ids){
              $result = [];
              foreach ($ids as $category_id) {
                $category = $this->model_catalog_category->getCategory($category_id);

                     $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category_id . "'");
                     $seo_url_query_for_tag_categories = $query->row['keyword'];

                $result[] = [
                  'category_id' => $category_id,
                  'name' => $category['name'],
//                  'href' => $this->url->link('product/category', 'category_id=' . $category_id),
                  'href' => '/' . $seo_url_query_for_tag_categories,
                ];
              }
              return $result;
            };

            $data['tagged_related_categories'] = !empty($tagged_related_categories) ? $prepareCategoriesList($tagged_related_categories) : [];
            /* END Теговые категории */

            /* E-commerce tracking */
            // Идентификаторы разновидностей страницы категории для трекинга в аналитике
            // Есть 3 варианта: теговая, фильтрация, комбинированная
            $trackType = '';
            if (!$this->request->isLocalReferer()){
              $is_tagged_page = FALSE;
              if ($category_info['sort_order'] > 10000) {
                $trackType = 'TagPageTransition';
                $is_tagged_page = TRUE;
              }
              if (!empty($filter_title)){
                $trackType = 'FilterPageTransition';
                if (!$this->document->isNoindex() && $is_tagged_page) {
                  $trackType = 'TagFilterPageTransition';
                }
              }
            }
            $data['trackType'] = $trackType;
            /* END E-commerce tracking */

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
            }
        } else {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
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

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
            }
        }
    }
}