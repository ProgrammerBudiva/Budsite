<?php
class ModelShippingNewpost2 extends Model {
	function getQuote() {
		$this->load->language('shipping/newpost2');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone");

		if (!$this->config->get('newpost2_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$quote_data = array();
			
			$cost = $this->cart->getSubTotal();//0.00;

			$quote_data['newpost2'] = array(
				'code'         => 'newpost2.newpost2',
				'title'        => $this->language->get('text_description'),
				'cost'         => ($this->config->get('newpost2_cost')),
				'tax_class_id' => $this->config->get('newpost2_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate(($this->config->get('newpost2_cost')), $this->config->get('newpost2_tax_class_id'), $this->config->get('config_tax')))
			);

			$method_data = array(
				'code'       => 'newpost2',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('newpost2_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}