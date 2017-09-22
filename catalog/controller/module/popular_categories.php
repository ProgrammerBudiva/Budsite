<?php
class ControllerModulePopularCategories extends Controller {
    public function index() {
        $this->load->language('module/popular_categories');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['see_all'] = $this->language->get('see_all');
        $data['heading_link'] = $this->url->link('product/catalog');


        if (isset($this->request->get['category_id'])) {
            $parts = explode('_', (string)$this->request->get['category_id']);
        } else {
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

        $categories = $this->model_catalog_category->getPopularCategories(0);
        foreach ($categories as $category) {
            $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);
                $detailInfo = $this->model_catalog_category->getCategoryDetail($category['category_id']);


            $children = array_slice($children, 0, 5);

                foreach($children as $child) {
                    $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                    if($child['image']){
                        $image = $this->model_tool_image->resize($child['image'], $this->config->get('popular_categories_image_width'), $this->config->get('popular_categories_image_height'));
                    } else {
                        $image = false;
                    }

                    $childDetailInfo = $this->model_catalog_category->getCategoryDetail($child['category_id']);

                    $children_data[] = array(
                        'category_id' => $child['category_id'],
                        'image' => $image,
                        'name' => $child['name'],
                        'href'  => isset($childDetailInfo['keyword']) ? $childDetailInfo['keyword'] : $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

            $filter_data = array(
                'filter_category_id'  => $category['category_id'],
                'filter_sub_category' => true
            );

            if($category['image']){
                $image = '/image/' . $category['image'];
            } else {
                $image = false;
            }

            $data['categories'][] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'],
                'children'    => $children_data,
                'href'     => isset($detailInfo['keyword']) ? $detailInfo['keyword'] : $this->url->link('product/category', 'path=' . $category['category_id']),
                'image'       => $image,
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/popular_categories.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/popular_categories.tpl', $data);
        } else {
            return $this->load->view('default/template/module/popular_categories.tpl', $data);
        }
    }
}