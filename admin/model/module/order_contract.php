<?php

class ModelModuleOrderContract extends Model
{
    public function getRows(){
        $contracts = $this->db->query("SELECT * FROM ". DB_PREFIX ."order_contract");
        return $contracts->rows;
    }

}