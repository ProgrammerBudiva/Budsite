<?php
class ModelModuleOneclick extends Model
{
    public function getOrders(){
        $arr = $this->db->query("SELECT * FROM " . DB_PREFIX. "oneclick");
       return $arr->rows;
    }
}