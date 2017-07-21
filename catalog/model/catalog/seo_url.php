<?php

class ModelCatalogSeoUrl extends Model {
    public function getUrlKeyword($url) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($url) . "'");

        if($query->num_rows !== 0) {
            return '/' . $query->row['keyword'];
        }else{
            return NULL;
        }
    }

    public function getUrlQuery($keyword)
    {
        $category_string = 'category_id=';
        $category = 214;
        $query = $this->db->query("SELECT c.parent_id, cd.name, ua.keyword  FROM ". DB_PREFIX ."category c
        LEFT JOIN ". DB_PREFIX ."category_description cd
        ON cd.category_id = c.category_id
        LEFT JOIN ". DB_PREFIX ."url_alias ua
        ON ua.query='".$category_string . $category."'
        WHERE c.category_id = '" . $category . "'");
    }

    public function GetCategoryBreadcrumbs($category_id)
    {

        $parent_category[] = $this->GetCategoryQuery($category_id);
        $parent_category[0]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[0]['parent_id']);

            if ($parent_category[0]['parent_id'] != 0){
                $parent_category[] = $this->GetCategoryQuery($parent_category[0]['parent_id']);
                $parent_category[1]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[1]['parent_id']);
            }

            if ($parent_category[1]['parent_id'] != 0){
                $parent_category[] = $this->GetCategoryQuery($parent_category[1]['parent_id']);
                $parent_category[2]['link'] = $this->getUrlKeyword('category_id=' . $parent_category[2]['parent_id']);
            }
            
            return array_reverse($parent_category);

    }

    public function GetCategoryQuery($category_id)
    {
        $category_string = 'category_id=';

        $query = $this->db->query("SELECT c.parent_id, cd.name FROM ". DB_PREFIX ."category c
        LEFT JOIN ". DB_PREFIX ."category_description cd
        ON cd.category_id = c.parent_id

        WHERE c.category_id = '" . $category_id . "'");

        return $query->row;
    }
}