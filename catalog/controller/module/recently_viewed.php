<?php
class ControllerModuleRecentlyViewed extends Controller {
    public function index() {
        $this->load->language('module/recently_viewed'); // loads the language file of recently_viewed

        $data['heading_title'] = $this->language->get('heading_title'); // set the heading_title of the module

        $product_limit = (int)$this->config->get('recently_viewed_count');
        $this->language->load('module/featured');
        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_cart_disable'] = $this->language->get('button_cart_disable');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['text_tax'] = $this->language->get('text_tax');
        $data['text_more'] = $this->language->get('text_more');
        $data['text_old'] = $this->language->get('text_old');
        $data['text_new'] = $this->language->get('text_new');
        $data['text_pro_sale'] = $this->language->get('text_pro_sale');
        $data['text_pro_hot'] = $this->language->get('text_pro_hot');


        $this->load->model('catalog/product');

        $this->load->model('tool/image');

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

        if(isset($this->request->cookie['visited_products'])){
            $visited_products = explode(',', $this->request->cookie['visited_products']);
            $visited_products = array_reverse($visited_products);
            $visited_products = array_unique($visited_products);
            if(count($visited_products) > $product_limit){
                $visited_products = array_slice($visited_products, 0, $product_limit);
            }
            $data['products'] = array();
            foreach($visited_products as $product_id){
                $result = $this->model_catalog_product->getProduct($product_id);
                if($result){
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], $this->config->get('recently_viewed_image_width'), $this->config->get('recently_viewed_image_height'));
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('recently_viewed_image_width'), $this->config->get('recently_viewed_image_height'));
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
                        $rating = (int)$result['rating'];
                    } else {
                        $rating = false;
                    }

                    if(in_array($product_id, $latest_ids)){
                        $latest_label = true;
                    } else {
                        $latest_label = false;
                    }

                    if(in_array($product_id, $special_ids)) {
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
                        'special'     => $special,
                        'latest_label'=> $latest_label,
                        'specials_label'=> $special_label,
                        'tax'         => $tax,
                        'rating'      => $rating,
                        'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id']),
                        'brand'       => $this->model_catalog_product->getBrandFromAttributes($product_id),
                        'category'    => $this->model_catalog_product->getMainCategoryName($product_id),
                    );
                }
            }
        } else {
            $data['products'] = false;
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/recently_viewed.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/recently_viewed.tpl', $data);
        } else {
            return $this->load->view('default/template/module/recently_viewed.tpl', $data);
        }
    }
}