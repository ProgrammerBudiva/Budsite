<?php

class ModelCatalogSeoUrl extends Model {
    public function getUrlKeyword($url) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($url) . "'");

        if($query->num_rows !== 0 & $query->row['keyword'] != NULL) {

            return '/' . $query->row['keyword'];

        }else{
            return NULL;
        }
    }

    public function getUrlQuery($keyword)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($keyword) . "'");

        if($query->num_rows !== 0) {
            return  $query->row['query'];
        }else{
            return NULL;
        }
    }

    public function GetCategoryBreadcrumbs($category_id)
    {

        $parent_category[] = $this->GetCategoryQuery($category_id);
        $parent_category[0]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[0]['parent_id']);

            if ($parent_category[0]['parent_id'] != 0){
                $parent_category[] = $this->GetCategoryQuery($parent_category[0]['parent_id']);
                $parent_category[1]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[1]['parent_id']);

            }else{
                unset($parent_category);
            }

            if ($parent_category[1]['parent_id'] != 0){
                $parent_category[] = $this->GetCategoryQuery($parent_category[1]['parent_id']);
                $parent_category[2]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[2]['parent_id']);

                if($parent_category[2]['parent_id'] == 0){
                    unset($parent_category[2]);
                }
            }else{
                unset($parent_category[1]);
            }

            return array_reverse($parent_category);

    }


    public function GetCategoryQuery($category_id)
    {

        $query = $this->db->query("SELECT c.parent_id, cd.name FROM ". DB_PREFIX ."category c
        LEFT JOIN ". DB_PREFIX ."category_description cd
        ON cd.category_id = c.parent_id

        WHERE c.category_id = '" . $category_id . "'");

        return $query->row;
    }


    public function GetProductBreadcrumbs($category_id)
    {

        $category[] = $this->GetProductQuery($category_id);
        $category[0]['link'] = $this->getUrlKeyword('category_id=' . $category[0]['category_id']);

        if ($category[0]['parent_id'] != 0 ){
            $category[] = $this->GetProductQuery($category[0]['parent_id']);
            $category[1]['link'] = $this->getUrlKeyword('category_id=' . $category[1]['category_id']);

        }

        if ($category[1]['parent_id'] != 0){
            $category[] = $this->GetProductQuery($category[1]['parent_id']);
            $category[2]['link'] = $this->getUrlKeyword('category_id=' . $category[2]['category_id']);

        }

        if ($category[2]['parent_id'] != 0){
            $category[] = $this->GetProductQuery($category[2]['parent_id']);
            $category[3]['link'] = $this->getUrlKeyword('category_id=' . $category[3]['category_id']);

        }
        if($category[0]['link'] == NULL){
            unset($category[0]);
        }

        return array_reverse($category);

    }

    public function GetProductQuery($category_id)
    {
        $query = $this->db->query("SELECT cd.category_id, c.parent_id, cd.name FROM ". DB_PREFIX ."category c
        LEFT JOIN ". DB_PREFIX ."category_description cd
        ON cd.category_id = c.category_id

        WHERE c.category_id = '" . $category_id . "'");

        return $query->row;
    }
}