<?php


class ControllerCheckoutConfirm extends Controller {

  public function index() {
    $redirect = '';

    if ($this->cart->hasShipping()) {
      // Validate if shipping address has been set.

      // Validate if shipping method has been set.
    }
    else {
      unset($this->session->data['shipping_address']);
      unset($this->session->data['shipping_method']);
      unset($this->session->data['shipping_methods']);
    }

    // Validate if payment address has been set.

    // Validate cart has products and has stock.
    if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) ||
      (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))
    ) {
      $redirect = $this->url->link('checkout/cart');
    }

    // Validate minimum quantity requirements.
    $products = $this->cart->getProducts();

    foreach ($products as $product) {
      $product_total = 0;

      foreach ($products as $product_2) {
        if ($product_2['product_id'] == $product['product_id']) {
          $product_total += $product_2['quantity'];
        }
      }

      if ($product['minimum'] > $product_total) {
        $redirect = $this->url->link('checkout/cart');

        break;
      }
    }

    if (!$redirect) {
      $order_data = array();

      $order_data['totals'] = array();
      $total                = 0;
      $taxes                = $this->cart->getTaxes();

      $this->load->model('extension/extension');

      $sort_order = array();

      $results = $this->model_extension_extension->getExtensions('total');

      foreach ($results as $key => $value) {
        $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
      }

      array_multisort($sort_order, SORT_ASC, $results);

      foreach ($results as $result) {
        if ($this->config->get($result['code'] . '_status')) {
          $this->load->model('total/' . $result['code']);

          $this->{'model_total_' . $result['code']}->getTotal($order_data['totals'], $total, $taxes);
        }
      }

      $sort_order = array();

      foreach ($order_data['totals'] as $key => $value) {
        $sort_order[$key] = $value['sort_order'];
      }

      array_multisort($sort_order, SORT_ASC, $order_data['totals']);

      $this->load->language('checkout/checkout');

      $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
      $order_data['store_id']       = $this->config->get('config_store_id');
      $order_data['store_name']     = $this->config->get('config_name');

      if ($order_data['store_id']) {
        $order_data['store_url'] = $this->config->get('config_url');
      }
      else {
        $order_data['store_url'] = HTTP_SERVER;
      }
      $name     = explode(' ', $this->session->data['payment_address']['firstname']);
      $lastname = (isset($name[1])) ? $name[1] : '';
      if ($this->customer->isLogged()) {
        $this->load->model('account/customer');

        $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

        $order_data['customer_id']       = $this->customer->getId();
        $order_data['customer_group_id'] = $customer_info['customer_group_id'];
        $order_data['firstname']         = $customer_info['firstname'];
        $order_data['lastname']          = $customer_info['lastname'];
        $order_data['email']             = ($customer_info['email']) ? $customer_info['email'] : $this->session->data['guest']['email'];
        $order_data['telephone']         = ($customer_info['telephone']) ? $customer_info['telephone'] : $this->session->data['guest']['telephone'];
      }
      elseif (isset($this->session->data['guest'])) {
        $order_data['customer_id']       = 0;
        $order_data['customer_group_id'] = 1;
        $order_data['firstname']         = $name[0];
        $order_data['lastname']          = isset($this->session->data['guest']['lastname']) ? $this->session->data['guest']['lastname'] : $lastname;
        $order_data['email']             = $this->session->data['guest']['email'];
        $order_data['telephone']         = $this->session->data['guest']['telephone'];
        $order_data['city']              = $this->session->data['guest']['city'];

        $order_data['comment'] = $this->session->data['guest']['comment'];

      }

      $order_data['address_1']          = $this->session->data['guest']['address_1'];
      $order_data['payment_address_1']  = $order_data['address_1'];
//      $order_data['shipping_address_1'] = $order_data['address_1'];
      $order_data['shipping_address_1'] = $this->session->data['guest']['address_shipping'];
      $order_data['shipping_lastname'] = $this->session->data['guest']['lastname'];

      $this->load->model('localisation/country');
      $this->load->model('localisation/zone');

      $order_data['payment_firstname']  = $name[0];
      $order_data['payment_lastname']   = $lastname;
      $order_data['shipping_firstname'] = $name[0];
//      $order_data['shipping_lastname']  = $lastname;
      $order_data['payment_city']       = $this->session->data['payment_address']['city'];
      $order_data['shipping_city']      = $this->session->data['payment_address']['city'];

      $order_data['payment_zone']     = 0;
      $order_data['shipping_zone_id'] = 0;
      $order_data['payment_zone_id']  = 0;
      $order_data['shipping_zone']    = 0;

      $order_data['payment_country_id']  = 220;
      $order_data['shipping_country_id'] = 220;


      $order_data['payment_country']  = 'Украина';
      $order_data['shipping_country'] = 'Украина';
      $order_data['shipping_method']  = isset($this->session->data['guest']['shipping_method']) ? $this->session->data['guest']['shipping_method'] :
        $this->session->data['guest']['shipping_code'];
      $order_data['shipping_code']    = isset($this->session->data['guest']['shipping_method']) ? $this->session->data['guest']['shipping_method'] :
        $this->session->data['guest']['shipping_code'];
      $order_data['payment_method']   = isset($this->session->data['guest']['payment_method']) ? $this->session->data['guest']['payment_method'] :
        $this->session->data['guest']['payment_code'];
      $order_data['payment_code']     = isset($this->session->data['guest']['payment_method']) ? $this->session->data['guest']['payment_method'] :
        $this->session->data['guest']['payment_code'];

      $order_data['products'] = array();

      foreach ($this->cart->getProducts() as $product) {
        $option_data = array();

        foreach ($product['option'] as $option) {
          $option_data[] = array(
            'product_option_id'       => $option['product_option_id'],
            'product_option_value_id' => $option['product_option_value_id'],
            'option_id'               => $option['option_id'],
            'option_value_id'         => $option['option_value_id'],
            'name'                    => $option['name'],
            'value'                   => $option['value'],
            'type'                    => $option['type']
          );
        }

        $order_data['products'][] = array(
          'product_id' => $product['product_id'],
          'name'       => $product['name'],
          'model'      => $product['model'],
          'option'     => $option_data,
          'download'   => $product['download'],
          'quantity'   => $product['quantity'],
          'subtract'   => $product['subtract'],
          'price'      => $product['price'],
          'total'      => $product['total'],
          'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
          'reward'     => $product['reward']
        );
      }

      // Gift Voucher
      $order_data['vouchers'] = array();

      if (!empty($this->session->data['vouchers'])) {
        foreach ($this->session->data['vouchers'] as $voucher) {
          $order_data['vouchers'][] = array(
            'description'      => $voucher['description'],
            'code'             => substr(md5(mt_rand()), 0, 10),
            'to_name'          => $voucher['to_name'],
            'to_email'         => $voucher['to_email'],
            'from_name'        => $voucher['from_name'],
            'from_email'       => $voucher['from_email'],
            'voucher_theme_id' => $voucher['voucher_theme_id'],
            'message'          => $voucher['message'],
            'amount'           => $voucher['amount']
          );
        }
      }

      $order_data['total'] = $total;

      $order_data['language_id']    = $this->config->get('config_language_id');
      $order_data['currency_id']    = $this->currency->getId();
      $order_data['currency_code']  = $this->currency->getCode();
      $order_data['currency_value'] = $this->currency->getValue($this->currency->getCode());
      $order_data['ip']             = $this->request->server['REMOTE_ADDR'];

      if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
        $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
      }
      elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
        $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
      }
      else {
        $order_data['forwarded_ip'] = '';
      }

      if (isset($this->request->server['HTTP_USER_AGENT'])) {
        $order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
      }
      else {
        $order_data['user_agent'] = '';
      }

      if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
        $order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
      }
      else {
        $order_data['accept_language'] = '';
      }

      $this->load->model('checkout/order');

      $this->session->data['order_id'] = $this->model_checkout_order->addNewOrder($order_data);

      /*//email send to user and admin

      $text = "New order\n";
      $text .= "Name - " . $this->session->data['payment_address']['firstname'] . " " . $this->session->data['payment_address']['lastname'] . "\n";
      $text .= "Email - " . $this->session->data['payment_address']['email'] . "\n";
      $text .= "Phone - " . $this->session->data['payment_address']['telephone'] . "\n";
      $text .= "Total price - " . $this->session->data['total_cart_value'];

      $mail = new Mail($this->config->get('config_mail'));
      $mail->setTo($this->config->get('config_email'));
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
//		$mail->setContentType($email_subject);
      $mail->setSubject("Budsite");
      $mail->setText($text);
      $mail->send();

      unset($mail);

      $textMail = $this->load->controller('information/information/getInfo', '18');

      $store_name = "Budsite";
      $order_id   = $this->session->data['order_id'];
      $order_link = $_SERVER['HTTP_HOST'] . '/index.php?route=account/order/info&order_id=' . $order_id;
      $date_added = date("Y-m-d");;
      $first_name = $order_data['firstname'];
      $last_name  = $order_data['lastname'];

      $products = '';

      foreach ($order_data['products'] as $product) {
        $products .= '<span>' . $product['name'] . " (" . $product['quantity'] . ") " . $product['price'] . " грн" . '</span>';
      }

      $replaceData = [
        '{store_name}',
        '{order_link}',
        '{date_added}',
        '{order_id}',
        '{email}',
        '{payment_method}',
        '{shipping_method}',
        '{telephone}',
        '{payment_firstname}',
        '{payment_lastname}',
        '{shipping_firstname}',
        '{shipping_lastname}',
        '{products}',
        '{shipping_country}',
        '{shipping_city}',
        '{payment_country}',
        '{payment_city}',
        '{shipping_address_1}',
        '{payment_address_1}',
      ];

      $replaceWith = [
        $store_name,
        $order_link,
        $date_added,
        $order_id,
        $order_data['email'],
        $order_data['payment_method'],
        $order_data['shipping_method'],
        $order_data['telephone'],
        $first_name,
        $last_name,
        $first_name,
        $last_name,
        $products,
        $order_data['shipping_country'],
        $order_data['shipping_city'],
        $order_data['payment_country'],
        $order_data['payment_city'],
        $order_data['shipping_address_1'],
        $order_data['payment_address_1']
      ];

      $text = str_replace($replaceData, $replaceWith, $textMail);

      $mail = new Mail($this->config->get('config_mail'));
      $mail->setTo($order_data['email']);
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
//		$mail->setContentType($email_subject);
      $mail->setSubject("Budsite");
      $mail->setHtml($text);
      $mail->send();

      //end email block*/

      $this->session->data['reserve_cart'] = $this->session->data['cart'];
      if ($this->session->data['order_id']) {
        $this->load->controller('payment/' . $order_data['payment_code']);
      }
      $data['text_recurring_item']    = $this->language->get('text_recurring_item');
      $data['text_payment_recurring'] = $this->language->get('text_payment_recurring');

      $data['column_name']     = $this->language->get('column_name');
      $data['column_model']    = $this->language->get('column_model');
      $data['column_quantity'] = $this->language->get('column_quantity');
      $data['column_price']    = $this->language->get('column_price');
      $data['column_total']    = $this->language->get('column_total');

      $this->load->model('tool/upload');

      $data['products'] = array();

    }
    else {
      $data['redirect'] = $redirect;
    }

//		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/confirm.tpl')) {
//			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/checkout/confirm.tpl', $data));
//		} else {
//			$this->response->setOutput($this->load->view('default/template/checkout/confirm.tpl', $data));
//		}
  }
}