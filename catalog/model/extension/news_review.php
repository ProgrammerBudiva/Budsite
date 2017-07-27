<?php

class ModelExtensionNewsReview extends Model
{
    public function getReviews($news_id){

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review WHERE news_id='" . (int)$news_id . "' ");
        if($query->num_rows !== NULL) {
            return $query->rows;
        }else
            return NULL;
    }

    public function addReview($news_id, $data) {
        $this->event->trigger('pre.review.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) .
            "', email = '".$this->db->escape($data['email'])."', news_id = '" . (int)$news_id .
            "', text = '" . $this->db->escape($data['text']) . "', date_added = NOW()");

    }
}