<?php

require DIR_VENDOR .'autoload.php';
class ControllerModuleCatapulta extends Controller {

	public function index() {
		if ($this->config->get('catapulta_status')) {
			$this->load->language('module/catapulta');

			$this->document->addScript('catalog/view/javascript/jquery/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.maskedinput.min.js');
			$this->document->addScript('catalog/view/javascript/catapulta.js');

			$data['heading_title'] = $this->language->get('heading_title');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/catapulta.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/catapulta.tpl', $data);
			} else {
				return $this->load->view('default/template/module/catapulta.tpl');
			}
		}
	}

	public function write($settings = array()) {
		$this->load->language('module/catapulta');

		$this->load->model('catalog/catapulta');
		$this->load->model('setting/setting');

		$json = array();

		if ($settings) {
			$contact = $settings['contact'];
			$product_id = $settings['product'];
			$price = $settings['new-price'];
		} elseif ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$contact = $this->request->post['phone'];
			$product_id = $this->request->post['product_id'];
			$product = $this->request->post['product'];
			$price = $this->request->post['new-price'];
		} else {
			$product_id = 0;
		}

		if ($product_id) {
			if ((utf8_strlen($contact) < 3) || (utf8_strlen($contact) > 50)) {
				if ($this->config->get('catapulta_phone_mask_status')) {
					$json['error']['contact'] = $this->language->get('error_mask');
				} else {
					$json['error']['contact'] = $this->language->get('error_contact');
				}
			}

			if (!isset($json['error'])) {
				if ($this->config->get('catapulta_phone_text')) {
					$phone_text = $this->config->get('catapulta_phone_text');

					$contact = $phone_text[$this->config->get('config_language_id')] . $contact;
				}

				$this->load->model('catalog/product');

				$product_info = $this->model_catalog_product->getProduct($product_id);

				$price = isset($product_info['special']) ? $product_info['special'] : $product_info['price'];
				$price = $this->cart->priceForRoll($product_id, $price);
				$total = $this->currency->format($price);


                //Get user location by IP
                $gi = geoip_open(DIR_VENDOR .'geoip/GeoLiteCity.dat',GEOIP_STANDARD);
                $record = geoip_record_by_addr($gi, $this->request->server['REMOTE_ADDR']);
                $addr = $record->country_code . ' ' . $GLOBALS['GEOIP_REGION_NAME'][$record->country_code][$record->region] . ' ' . $record->city;
                geoip_close($gi);
                //End of GeoiP


				$data = array(
					'contact' => $contact,
					'product_id' => $product_id,
					'product_name' => $product_info['name'],
					'total' => $price,
					'currency_id' => $this->currency->getId(),
					'currency_code' => $this->currency->getCode(),
					'currency_value' => $this->currency->getValue($this->currency->getCode())
				);

				$order_id = $this->model_catalog_catapulta->addOrder($data);


				$email_subject = sprintf($this->language->get('text_subject'), $this->language->get('heading_title'), $this->config->get('config_name'), $order_id);
				$email_text = sprintf($this->language->get('text_order'), $order_id) . "\n\n";
				$email_text .= sprintf($this->language->get('text_contact'), html_entity_decode($contact), ENT_QUOTES, 'UTF-8') . "\n";
				$email_text .= sprintf($this->language->get('text_ip'), $this->request->server['REMOTE_ADDR'], ENT_QUOTES, 'UTF-8') . "\n\n";
				$email_text .= sprintf($this->language->get('location'), $addr, ENT_QUOTES, 'UTF-8') . "\n\n";
				$email_text .= sprintf($this->language->get('text_product'), $product, ENT_QUOTES, 'UTF-8') . "\n";
				$email_text .= sprintf($this->language->get('text_date_order'), date('d.m.Y H:i'), ENT_QUOTES, 'UTF-8') . "\n\n";
				$email_text .= sprintf($this->language->get('text_price'), $price, ENT_QUOTES, 'UTF-8');

				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject($email_subject);
				$mail->setText($email_text);
				$mail->send();

				// Send to additional alert emails
				$emails = explode(',', $this->config->get('config_alert_emails'));

				foreach ($emails as $email) {
					if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
						$mail->setTo($email);
						$mail->send();
					}
				}


			$json['success'] = $this->language->get('text_success');
				$json['link'] = $this->url->link('checkout/success/success_popup');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

}

?>
