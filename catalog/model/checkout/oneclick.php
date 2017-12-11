<?php
class ModelCheckoutOneclick extends Model {
    function add($phone, $order){
        $date = date('Y-m-d h:i:s', time());
        $test = $this->db->query("INSERT INTO " . DB_PREFIX . "oneclick SET phone = '" . $phone . "', `date` = '". $date ."' , `order` = '" . $order . "'");
    }

    function getlastId(){
        $order_id = $this->db->query("SELECT MAX(id) FROM " . DB_PREFIX ."oneclick");
        return $order_id->row['MAX(id)'];
    }
}