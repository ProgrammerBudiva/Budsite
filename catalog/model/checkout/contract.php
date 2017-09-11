<?php
class ModelCheckoutContract extends Model{
    public function addRow($order_id, $data){
//        echo "<pre>"; print_r($order_id); echo "</pre>";
        /**
         * Если физическое лицо
         */
        if($data['way'] == 1) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "order_contract SET order_id= '" . $order_id . "', ur_lico= '" . $data['ur_lico'] . "',
            fio_ukr= '" . $data['fio_ukr'] . "', inn= '" . $data['inn'] . "', way='" . $data['way'] . "', contract='" . $data['want_contract'] . "'");
        }
        /**
         * Без оформления договора
         */
        elseif($data['way'] == 2){
            $this->db->query("INSERT INTO " . DB_PREFIX . "order_contract SET order_id= '" . $order_id . "', ur_lico= '" . $data['ur_lico'] . "',
             nds='" . $data['nds'] . "', company_name='" . $data['company-name'] . "', edrpou='" . $data['edrpou'] . "',
             way='" . $data['way'] . "', contract='" . $data['want_contract'] . "', inn= '" . $data['inn'] . "'");
        }
        /**
         * С оформлением договора
         */
        elseif($data['way'] == 3){
            $this->db->query("INSERT INTO " . DB_PREFIX . "order_contract SET order_id= '" . $order_id . "', ur_lico= '" . $data['ur_lico'] . "',
             nds='" . $data['nds'] . "', company_name='" . $data['company-name'] . "', edrpou='" . $data['edrpou'] . "',
             way='" . $data['way'] . "', ur_addr='" . $data['ur-addr'] . "', fiz_addr='" . $data['post-addr'] . "',
             company_phone='" . $data['phone-company'] . "', payment='" . $data['payment-list'] . "',
             mfo='" . $data['mfo'] . "', fio_boss='" . $data['fio-boss'] . "', boss_position='" . $data['boss-position'] . "',
             osnovanie='" . $data['ustav'] . "', contract='" . $data['want_contract'] . "', inn= '" . $data['inn'] . "'");
        }
    }
}