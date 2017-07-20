<?php

class ModelCatalogSeoUrl extends Model {
    public function getUrlKeyword($url) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($url) . "'");

        return '/' . $query->row['keyword'];
    }
}