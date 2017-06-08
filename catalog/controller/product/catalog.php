<?php

class ControllerProductCatalog extends Controller
{
    public function index() {
        $this->load->language('product/category');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');
        $data['text_old'] = $this->language->get('text_old');
        $data['text_new'] = $this->language->get('text_new');
        $data['text_bestseller'] = $this->language->get('text_bestseller');
        $data['text_pro_sale'] = $this->language->get('text_pro_sale');
        $data['text_pro_hot'] = $this->language->get('text_pro_hot');

        if (isset($this->request->get['category_id'])) {
            $path = $this->request->get['category_id'];

            $category_info = $this->model_catalog_category->getCategory($path);

            if ($category_info) {
                $data['breadcrumbs'][] = array(
                    'text' => $category_info['name'],
                    'href' => $this->url->link('product/catalog', 'category_id=' . $path)
                );

                if ($category_info['image']) {
                    $image = $this->model_tool_image->resize($category_info['image'], 874, 487);
                } else {
                    $image = false;
                }

                $data['description'] = htmlspecialchars_decode($category_info['description']);
                $data['image'] = $image;

            }
        } else {
            $path = false;
        }

        $category_info = $this->model_catalog_category->getCategory($path);

        if ($category_info) {

            $this->document->setTitle($category_info['meta_title']);
            $this->document->setDescription($category_info['meta_description']);
            $this->document->setKeywords($category_info['meta_keyword']);
            $this->document->addLink($this->url->link('product/catalog'), 'canonical');

            $data['heading_title'] = $category_info['name'];

            $data['text_refine'] = $this->language->get('text_refine');
            $data['text_empty'] = $this->language->get('text_empty');


            if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }

            $limit = $this->config->get('config_product_limit');

            $start = ($page - 1) * $limit;

            $products = $this->model_catalog_product->getBestSellerCategoryProducts($limit, $path, $start);

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
            $data['products'] = array();
            foreach ($products as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'],
                        $this->config->get('config_image_product_width'),
                        $this->config->get('config_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png',
                        $this->config->get('config_image_product_width'),
                        $this->config->get('config_image_product_height'));
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
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES,
                            'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'price' => $price,
                    'special' => $special,
                    'latest_label' => $latest_label,
                    'specials_label' => $special_label,
                    'tax' => $tax,
                    'rating' => $rating,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            $product_total = count($products);

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/category',
                'path=' . $this->request->get['category_id'] . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'),
                ($product_total) ? (($page - 1) * $limit) + 1 : 0,
                ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit),
                $product_total, ceil($product_total / $limit));


            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/catalog.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/catalog.tpl',
                    $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/product/catalog.tpl', $data));
            }
        } else {

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/category')
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

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl',
                    $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
            }
        }
    }
}