<?php

require '../../../vendor/autoload.php';
class ControllerCheckoutCheckout extends Controller {

  private $error = array();

  public function index() {
    // Validate cart has products and has stock.
    if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) ||
      (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))
    ) {
      $this->response->redirect($this->url->link('checkout/cart'));
    }

      $data['delivery_cities'] = json_decode(file_get_contents('http://www.delivery-auto.com/api/v4/Public/GetAreasList?culture=ru-RU&fl_all=false&country=1'), true);


    $this->load->model('catalog/product');

    $this->load->model('extension/extension');


    $this->load->model('tool/image');
    $this->load->model('tool/upload');

    $total_data = array();
    $total = 0;
//    header("Content-Security-Policy: default-src 'none'");
//    header("Content-Security-Policy: script-src 'self' http://www.delivery-auto.com");
    unset($this->session->data['privat_html']);

    $taxes = $this->cart->getTaxes();

    // Display prices
    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
      $sort_order = array();

      $results = $this->model_extension_extension->getExtensions('total');

      foreach ($results as $key => $value) {
        $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
      }

      array_multisort($sort_order, SORT_ASC, $results);

      foreach ($results as $result) {
        if ($this->config->get($result['code'] . '_status')) {
          $this->load->model('total/' . $result['code']);

          $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
        }
      }

      $sort_order = array();

      foreach ($total_data as $key => $value) {
        $sort_order[$key] = $value['sort_order'];
      }

      array_multisort($sort_order, SORT_ASC, $total_data);
    }

    unset($total_data[0]);
    foreach ($total_data as $result) {
      $data['totals'][] = array(
        'title' => $result['title'],
        'text'  => $this->currency->format($result['value']),
        'code'  => $result['code'],
      );
    }
    // Validate minimum quantity requirements.
    $products = $this->cart->getProducts();

    $latest_products = $this->model_catalog_product->getLatestProductsIDs(FALSE, $this->config->get('latest_limit_days'));

    $latest_ids = array();
    foreach ($latest_products as $id) {
      $latest_ids[] = $id['product_id'];
    }

    $latest_products = $this->model_catalog_product->getProductSpecialsIDs(FALSE, $this->config->get('latest_limit_days'));

    $special_ids = array();
    foreach ($latest_products as $id) {
      $special_ids[] = $id['product_id'];
    }

    $total_discount = 0;

    foreach ($products as $product) {
      $product_total = 0;

      foreach ($products as $product_2) {
        if ($product_2['product_id'] == $product['product_id']) {
          $product_total += $product_2['quantity'];
        }
      }

      $option_data = array();

      foreach ($product['option'] as $option) {
        if ($option['type'] != 'file') {
          $value = $option['value'];
        }
        else {
          $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

          if ($upload_info) {
            $value = $upload_info['name'];
          }
          else {
            $value = '';
          }
        }

        $option_data[] = array(
          'name'  => $option['name'],
          'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
          'type'  => $option['type'],
        );
      }

      if ($product['image']) {
        $image = $this->model_tool_image->resize($product['image'], 110, 110);
      } else {
        $image = $this->model_tool_image->resize('placeholder.png', 110, 110);
      }

      if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
      }
      else {
        $price = FALSE;
      }

      if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) &&
        $product['special_price']
      ) {
        $special =
          $this->currency->format($this->tax->calculate($product['special_price'], $product['tax_class_id'], $this->config->get('config_tax')));
      }
      else {
        $special = FALSE;
      }

      if ($product['special_price']) {
        $total_price = $product['special_price'];
        $total_discount += ($product['price'] - $product['special_price']) * $product['quantity'];
      }
      else {
        $total_price = $product['price'];
      }

      // Display prices
      if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        $total = $this->currency->format(
          $this->tax->calculate($total_price, $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']
        );
      }
      else {
        $total = FALSE;
      }

      if (in_array($product['product_id'], $latest_ids)) {
        $label = 'orange-new';
      }
      else if (in_array($product['product_id'], $special_ids)) {
        $label = 'orange-procent';
      }
      else {
        $label = FALSE;
      }

      $data['products'][] = array(
        'product_id' => $product['product_id'],
        'key'        => $product['key'],
        'image'      => $image,
        'name'       => $product['name'],
        'price'      => ($special) ? $special : $price,
        'total'      => $total,
        'quantity'   => $product['quantity'],
        'option'     => $option_data,
        'label'      => $label,
        'discount'   => $this->currency->format(
          $this->tax->calculate(round($product['price_discount'], 2), $product['tax_class_id'], $this->config->get('config_tax'))
        ),
        'href'       => $this->url->link('product/product', '&product_id=' . $product['product_id']),
      );

      if ($product['minimum'] > $product_total) {
        $this->response->redirect($this->url->link('checkout/cart'));
      }
    }
    if ($total_discount) {
      $total_discount = $this->currency->format($total_discount);
    }
    else {
      $total_discount = FALSE;
    }

    $data['total_discount'] = $total_discount;

    $this->load->language('checkout/checkout');
    $data['text_total_discount'] = $this->language->get('text_total_discount');

    $this->document->setTitle($this->language->get('heading_title'));

    $this->document->addScript('catalog/view/javascript/cart-utils.js?v=1.02');
    $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
    $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
    $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

    // Required by klarna
    if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
      $this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
    }

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/home'),
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_cart'),
      'href' => $this->url->link('checkout/cart'),
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('checkout/checkout', '', 'SSL'),
    );

    $data['link_forgotten'] = $this->url->link('account/forgotten');
    $data['action_step_2'] = $this->url->link('checkout/checkout/step_2');
    $data['cart'] = $this->url->link('checkout/cart');

    $data['heading_title'] = $this->language->get('heading_title');
    $data['entry_firstname'] = $this->language->get('entry_firstname');
    $data['entry_lastname'] = $this->language->get('entry_lastname');
    $data['text_new_customer'] = $this->language->get('text_new_customer');
    $data['text_customer'] = $this->language->get('text_i_am_returning_customer');
    $data['entry_city'] = $this->language->get('entry_city');
    $data['entry_point'] = $this->language->get('entry_point');
    $data['entry_price'] = $this->language->get('entry_price');
    $data['entry_discount'] = $this->language->get('entry_discount');
    $data['entry_password'] = $this->language->get('entry_password');
    $data['entry_email'] = $this->language->get('entry_email');
    $data['entry_forgotten'] = $this->language->get('entry_forgotten');
    $data['entry_order'] = $this->language->get('entry_order');
    $data['entry_flat'] = $this->language->get('entry_flat');
    $data['entry_house'] = $this->language->get('entry_house');
    $data['entry_address'] = $this->language->get('entry_address');
    $data['entry_payment'] = $this->language->get('entry_payment');
    $data['entry_street'] = $this->language->get('entry_street');
    $data['entry_new_post'] = $this->language->get('entry_new_post');
    $data['entry_self'] = $this->language->get('entry_self');
    $data['entry_courier'] = $this->language->get('entry_courier');
    $data['entry_register'] = $this->language->get('entry_register');

    $data['countries'] = $this->getCountriesData();
    $data['entry_points'] = $this->country(1);
    $data['entry_corp'] = $this->language->get('entry_corp');

    $data['entry_delivery_address'] = $this->language->get('entry_delivery_address');
    $data['entry_choose'] = $this->language->get('entry_choose');
    $data['entry_quantity'] = $this->language->get('entry_quantity');
    $data['entry_telephone'] = $this->language->get('entry_telephone');
    $data['entry_contacts'] = $this->language->get('entry_contacts');
    $data['entry_payment_method'] = $this->language->get('entry_payment_method');
    $data['button_continue'] = $this->language->get('button_continue');
    $data['button_edit_order'] = $this->language->get('button_edit');
    $data['button_login'] = $this->language->get('button_login');

    $data['text_checkout_option'] = $this->language->get('text_checkout_option');
    $data['text_checkout_account'] = $this->language->get('text_checkout_account');
    $data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
    $data['text_checkout_shipping_address'] = $this->language->get('text_checkout_shipping_address');
    $data['text_checkout_shipping_method'] = $this->language->get('text_checkout_shipping_method');
    $data['text_checkout_payment_method'] = $this->language->get('text_checkout_payment_method');
    $data['text_checkout_confirm'] = $this->language->get('text_checkout_confirm');
    $data['country_action'] = $this->url->link('checkout/checkout/getCountries');
    $data['action_step_3'] = $this->url->link('checkout/checkout/success');

    $data['entry_comment'] = $this->language->get('entry_comment');
    $data['register_action'] = $this->url->link('account/register/ajax_register', '', 'SSL');

    $quote_data = array();

    $this->load->model('extension/extension');

    $results = $this->model_extension_extension->getExtensions('shipping');

    foreach ($results as $result) {
      if ($this->config->get($result['code'] . '_status')) {
        $this->load->model('shipping/' . $result['code']);

        $quote = $this->{'model_shipping_' . $result['code']}->getQuote();

        if ($quote) {
          $quote_data[$result['code']] = array(
            'title'      => $quote['title'],
            'quote'      => $quote['quote'],
            'sort_order' => $quote['sort_order'],
            'error'      => $quote['error'],
          );
        }

        //$_SESSION['total_cart_value'] = $total;
      }
    }

    $sort_order = array();

    foreach ($quote_data as $key => $value) {
      $sort_order[$key] = $value['sort_order'];
    }

    array_multisort($sort_order, SORT_ASC, $quote_data);

    $this->session->data['shipping_methods'] = $quote_data;
    $this->session->data['total_cart_value'] = $total;
    $data['shipping_methods'] = $quote_data;

    if (isset($this->session->data['error'])) {
      $data['error_warning'] = $this->session->data['error'];
      unset($this->session->data['error']);
    }
    else {
      $data['error_warning'] = '';
    }

    if (isset($this->session->data['guest']['customer_group_id'])) {
      $data['customer_group_id'] = $this->session->data['shipping_address']['customer_group_id'];
    }
    else {
      $data['customer_group_id'] = $this->config->get('config_customer_group_id');
    }

    if (isset($this->request->post['firstname'])) {
      $data['firstname'] = $this->request->post['firstname'];
    }
    else if (isset($this->session->data['shipping_address']['firstname'])) {
      if (isset($this->session->data['shipping_address']['lastname'])) {
        $lastname = $this->session->data['shipping_address']['lastname'];
      }
      else {
        $lastname = '';
      }
      $data['firstname'] = $this->session->data['shipping_address']['firstname'] . ' ' . $lastname;
    }
    else {
      $data['firstname'] = '';
    }

    if (isset($this->request->post['lastname'])) {
      $data['lastname'] = $this->request->post['lastname'];
    }
    else if (isset($this->session->data['shipping_address']['lastname'])) {
      if (isset($this->session->data['shipping_address']['lastname'])) {
        $lastname = $this->session->data['shipping_address']['lastname'];
      }
      else {
        $lastname = '';
      }
      $data['lastname'] = $this->session->data['shipping_address']['lastname'] . ' ' . $lastname;
    }
    else {
      $data['lastname'] = '';
    }

    if (isset($this->request->post['telephone'])) {
      $data['telephone'] = $this->request->post['telephone'];
    }
    else if (isset($this->session->data['telephone'])) {
      $data['telephone'] = $this->session->data['telephone'];
    }
    else {
      $data['telephone'] = '';
    }

    if (isset($this->request->post['email'])) {
      $data['email'] = $this->request->post['email'];
    }
    else if (isset($this->session->data['email'])) {
      $data['email'] = $this->session->data['email'];
    }
    else {
      $data['email'] = '';
    }

    if (isset($this->request->post['city'])) {
      $data['city'] = $this->request->post['city'];
    }
    else if (isset($this->session->data['shipping_address']['city'])) {
      $data['city'] = $this->session->data['shipping_address']['city'];
    }
    else {
      $data['city'] = '';
    }

    if (isset($this->request->post['address'])) {
      $data['address'] = $this->request->post['address'];
    }
    else if (isset($this->session->data['shipping_address']['address_1'])) {
      $data['address'] = $this->session->data['shipping_address']['address_1'];
    }
    else {
      $data['address'] = '';
    }

    $data['logged'] = $this->customer->isLogged();

    if (isset($this->session->data['account'])) {
      $data['account'] = $this->session->data['account'];
    }
    else {
      $data['account'] = '';
    }

    $total_data = array();
    $total = 0;
    $taxes = $this->cart->getTaxes();

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

        $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
      }
    }

    // Payment Methods
    $method_data = array();

    $this->load->model('extension/extension');

    $results = $this->model_extension_extension->getExtensions('payment');

    $recurring = $this->cart->hasRecurringProducts();

    foreach ($results as $result) {
      if ($this->config->get($result['code'] . '_status')) {
        $this->load->model('payment/' . $result['code']);

        $method = $this->{'model_payment_' . $result['code']}->getMethod($total);

        if ($method) {
          if ($recurring) {
            if (method_exists($this->{'model_payment_' . $result['code']}, 'recurringPayments') &&
              $this->{'model_payment_' . $result['code']}->recurringPayments()
            ) {
              $method_data[$result['code']] = $method;
            }
          }
          else {
            $method_data[$result['code']] = $method;
          }
        }
      }
    }

    $sort_order = array();

    foreach ($method_data as $key => $value) {
      $sort_order[$key] = $value['sort_order'];
    }

    array_multisort($sort_order, SORT_ASC, $method_data);

    $this->session->data['payment_methods'] = $method_data;
    $data['payment_methods'] = $method_data;

    $this->load->model('localisation/country');

    $data['shipping_required'] = $this->cart->hasShipping();

    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');

    $textPay = $this->load->controller('information/information/getInfo', '16');
    $textDelivery = $this->load->controller('information/information/getInfo', '17');
    $exp2 = ".";

    $clearTextPay = preg_replace("/\n\s+/", "\n", rtrim(html_entity_decode(strip_tags($textPay))));
    $clearTextDelivery = preg_replace("/\n\s+/", "\n", rtrim(html_entity_decode(strip_tags($textDelivery))));

    $data['payment_methods_custom'] = explode($exp2, trim($clearTextPay));
    $data['delivery_methods_custom'] = explode($exp2, trim($clearTextDelivery));
    $data['exp'] = ["."];

    $data['full_user_info'] = [];

    // Totals
    $this->load->model('extension/extension');

    $total_data = array();
    $total = 0;
    $taxes = $this->cart->getTaxes();
    if ($total_discount) {
      $total_discount = $this->currency->format($total_discount);
    }

    // Display prices
    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
      $sort_order = array();

      $results = $this->model_extension_extension->getExtensions('total');

      foreach ($results as $key => $value) {
        $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
      }

      array_multisort($sort_order, SORT_ASC, $results);

      foreach ($results as $result) {
        if ($this->config->get($result['code'] . '_status')) {
          $this->load->model('total/' . $result['code']);

          $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
        }
      }

      $sort_order = array();

      foreach ($total_data as $key => $value) {
        $sort_order[$key] = $value['sort_order'];
      }

      array_multisort($sort_order, SORT_ASC, $total_data);
    }

    $data['totals'] = array();

    foreach ($total_data as $total) {
      $data['totals'][] = array(
        'title' => $total['title'],
        'text'  => $this->currency->format($total['value']),
        'code'  => $total['code'],
      );
    }

    if ($total_discount) {
      $data['totals'][] = array(
        'title' => $this->language->get('text_total_discount'),
        'text'  => $total_discount,
        'code'  => 'discount',
      );
    }

    if (isset($this->session->data['customer_id'])) {
      $this->load->model('account/customer');
      $data['full_user_info'] = $this->model_account_customer->getCustomer($this->session->data['customer_id']);
    }

    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/checkout.tpl')) {
      $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/checkout/checkout.tpl', $data));
    }
    else {
      $this->response->setOutput($this->load->view('default/template/checkout/checkout.tpl', $data));
    }
  }

  public function getCountriesData($country_id = NULL) {
    if ($country_id) {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '" . (int) $country_id . "' AND status = '1'");

      return $query->row;
    }
    else {
      $country_data = $this->cache->get('country.status');

      if (!$country_data) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

        $country_data = $query->rows;

        $this->cache->set('country.status', $country_data);
      }

      return $country_data;
    }
  }

  public function getCountries() {
    $json = array();

    $this->load->model('localisation/country');
    $name = $this->request->post['name'];

    $countries = $this->model_localisation_country->getCountriesByName($name);
    $text = '';
    foreach ($countries as $country) {

      $text .= '<option value="' . $country['country_id'] . '" data-name="' . $country['name'] . '">' . $country['name'] . '</option>';
    }

    echo $text;

  }

  public function customfield() {
    $json = array();

    $this->load->model('account/custom_field');

    // Customer Group
    if (isset($this->request->get['customer_group_id']) &&
      is_array($this->config->get('config_customer_group_display')) &&
      in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))
    ) {
      $customer_group_id = $this->request->get['customer_group_id'];
    }
    else {
      $customer_group_id = $this->config->get('config_customer_group_id');
    }

    $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

    foreach ($custom_fields as $custom_field) {
      $json[] = array(
        'custom_field_id' => $custom_field['custom_field_id'],
        'required'        => $custom_field['required'],
      );
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function step_2() {
    $this->load->model('account/customer');
    $this->load->model('account/customer_group');
    $this->load->model('localisation/zone');


    $this->load->language('checkout/checkout');
    $json = array();
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->step1_validate()) {
      $this->session->data['guest']['firstname'] = $this->request->post['firstname'];
      $this->session->data['guest']['lastname'] = $this->request->post['lastname'];
      $this->session->data['guest']['email'] = $this->request->post['email'];
      $this->session->data['guest']['telephone'] = $this->request->post['telephone'];
      //$this->session->data['guest']['address_1'] = $this->request->post['address'];
      $this->session->data['guest']['address_1'] = 'Default';
      $this->session->data['guest']['city'] = $this->request->post['city'];
      $this->session->data['guest']['zone_id'] = $this->request->post['city'];
      $this->session->data['guest']['country_id'] = '220';

      $this->session->data['payment_address']['firstname'] = $this->request->post['firstname'];
      $this->session->data['payment_address']['lastname'] = $this->request->post['lastname'];
      $this->session->data['payment_address']['email'] = $this->request->post['email'];
      //$this->session->data['payment_address']['address_1'] = $this->request->post['address'];
      $this->session->data['payment_address']['address_1'] = 'Default';
      $this->session->data['payment_address']['telephone'] = $this->request->post['telephone'];
      $this->session->data['payment_address']['city'] = $this->request->post['city'];
      $this->session->data['payment_address']['country_id'] = '220';
      $this->session->data['payment_address']['zone_id'] = 0;

      $json[] = array("success" => TRUE);
    }
    else {
      foreach ($this->error as $error_key => $error_value) {
        $json[] = array($error_key => $error_value);
      }
    }

    echo json_encode($json);

  }

  public function getPoints() {
    $city_id = $this->request->post['id'];

    $result = $this->country($city_id);
    //$result = $result['zone'];
    echo json_encode($result);
  }

  public function country($id) {
    $json = array();

    $this->load->model('localisation/country');

    $country_info = $this->model_localisation_country->getCountry($id);

    if ($country_info) {
      $this->load->model('localisation/zone');

      /* $json = array(
           'country_id'        => $country_info['country_id'],
           'name'              => $country_info['name'],
           'iso_code_2'        => $country_info['iso_code_2'],
           'iso_code_3'        => $country_info['iso_code_3'],
           'address_format'    => $country_info['address_format'],
           'postcode_required' => $country_info['postcode_required'],
           'zone'              => $this->getZonesByCountryId($id),
           'status'            => $country_info['status']
       );*/

      $json = $this->getZonesByCountryId($id);
    }
    return $json;
  }

  public function getZonesByCountryId($country_id) {
    $zone_data = $this->cache->get('zone.' . (int) $country_id);

    if (!$zone_data) {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int) $country_id . "' AND status = '1' ORDER BY name");

      $zone_data = $query->rows;

      $this->cache->set('zone.' . (int) $country_id, $zone_data);
    }

    return $zone_data;
  }

  public function success() {
    $this->load->model('account/customer');
    $this->load->model('account/customer_group');
    $this->load->model('localisation/zone');

    $checkNumber = $this->model_account_customer->checkCustomerNumber($this->request->post['telephone']);

    if($checkNumber === NULL){
        $registerCustomer = $this->model_account_customer->addNewCustomerByPhone($this->request->post);
        if($registerCustomer !== NULL){
            $this->emailAfterRegister($registerCustomer);
        }
    }



    $this->load->language('checkout/checkout');
    $json = array();
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->step2_validate()) {
      $this->session->data['guest']['comment'] = empty($this->request->post['comment']) ? '' : $this->request->post['comment'];

      $this->session->data['guest']['payment_code'] = $this->request->post['payment_method'];

      $this->session->data['guest']['payment_method'] =
        isset($this->session->data['payment_methods'][$this->request->post['payment_method']]['title'])
          ? $this->session->data['payment_methods'][$this->request->post['payment_method']]['title']
          : $this->request->post['payment_method'];

      $method = explode('.', $this->request->post['method']);


      if($this->request->post['shipping'] === 'Самовывоз'){

          $this->session->data['guest']['shipping_method'] = $this->request->post['shipping'] . ' ' . $this->request->post['self-shipping'];
          $this->session->data['guest']['address_shipping'] = $this->request->post['self-shipping'];
          $this->session->data['payment_address']['city'] = $this->request->post['self-shipping'];

      }else {

          $this->session->data['guest']['address_shipping'] = $this->request->post['city'] . ' ' . $this->request->post['point'];

      }

      if ($this->session->data['payment_address']['isNewPost'] == TRUE) {
        $this->session->data['payment_address']['city'] = $this->request->post['city'];
        $this->session->data['payment_address']['address_1'] = $this->request->post['point'];
        $this->session->data['guest']['address_1'] = $this->request->post['point'];
        $this->session->data['guest']['city'] = $this->request->post['point'];
        $this->session->data['guest']['zone_id'] = $this->request->post['point'];
      }


      $this->load->controller('checkout/confirm');
      $this->load->controller('checkout/success');

      if ($this->request->post['payment_method'] == 'privat24gs') {
        $this->load->controller('payment/privat24gs');
        //echo(json_encode($this->session->data['privat_html']));
      }
        $order_id = $this->session->data['order_id'];

      if ($this->session->data['order_id']) {
//          echo "<pre>"; print_r($this->session->data['order_id']); echo "</pre>";
      if ($this->request->post['payment'] == "Безналичный рассчет") {
          $sort_array = $this->sortData();
          $this->load->model('checkout/contract');
          $this->model_checkout_contract->addRow($order_id, $sort_array);
      }
        $json['success'] = $this->url->link('checkout/success/success_popup');


      }
    }
    else {
      foreach ($this->error as $error_key => $error_value) {
        $json[$error_key] = $error_value;
      }
    }

    echo json_encode($json);
  }

  public function step1_validate() {
    $this->load->language('checkout/checkout');

    if (!$this->request->post['firstname'] || strlen($this->request->post['firstname']) < 4 || strlen($this->request->post['firstname']) > 64) {
      $this->error['error_firstname'] = $this->language->get('error_firstname');
    }

    if (!$this->request->post['lastname'] || strlen($this->request->post['lastname']) < 3 || strlen($this->request->post['lastname']) > 64) {
      $this->error['error_lastname'] = $this->language->get('error_lastname');
    }

    if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
      $this->error['error_email'] = $this->language->get('error_email');
    }

    if ((utf8_strlen($this->request->post['telephone']) != 18)) {
      $this->error['error_telephone'] = $this->language->get('error_telephone');
    }

    if (!$this->request->post['city'] || strlen($this->request->post['city']) < 2) {
      $this->error['error_city'] = $this->language->get('error_city');
    }

    /*if (!$this->request->post['address'] || strlen($this->request->post['address']) < 5) {
        $this->error['error_address'] = $this->language->get('error_address');
    }*/

    return !$this->error;

  }

  public function step2_validate() {
    $this->load->language('checkout/checkout');
    $this->session->data['payment_address']['isNewPost'] = FALSE;

    if ($this->request->post['isNewPost'] == "true") {
      $this->session->data['payment_address']['isNewPost'] = TRUE;
    }

    if (isset($this->request->post['method']) && $this->request->post['method'] == 'courier') {
      if (!$this->request->post['street'] || strlen($this->request->post['street']) < 5) {
        $this->error['error_street'] = $this->language->get('error_street');
      }

      if (!$this->request->post['house'] || !is_int($this->request->post['house']) < 1) {
        $this->error['error_house'] = $this->language->get('error_house');
      }

    }
    else {
      $this->error = FALSE;
    }

    return !$this->error;
  }

    /**
     * @param $id
     * Отправка email письма после регистрации пользователя
     */
  public function emailAfterRegister($id){
      $this->load->model('account/customer');
      $textMail = $this->load->controller('information/information/getInfo', '14');

      $data = $this->model_account_customer->getCustomer($id);

      $replaceData = ['%%login%%', '%%passwd%%', '%%username%%'];
      $replaceTo = [$data['email'], 'budsite', $data['firstname'] . ' ' . $data['lastname']];


      $text = str_replace($replaceData, $replaceTo, $textMail);
      $mail = new Mail($this->config->get('config_mail'));
      $mail->setTo($data['email']);
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
//		$mail->setContentType($email_subject);
      $mail->setSubject("Регистрация в интернет-магазине budsite.ua");
      $mail->setHtml($text);
      $mail->send();

  }

    /**
     * Функция обработки покупки в один клик из корзины
     * с записью заказа в бд и отправкой письма администратору
     */
  public function buy1clickCustom(){
      $this->load->model('catalog/seo_url');
      $this->load->model('checkout/oneclick');


      //Get user location by IP
      $gi = geoip_open('../../../vendor/geoip/GeoLiteCity.dat',GEOIP_STANDARD);
      $record = geoip_record_by_addr($gi, $this->request->server['REMOTE_ADDR']);




      $products = $this->cart->getProducts();
      $prod_arr =[];
      $total = 0;
      foreach ($products as $product){
          $query = $this->model_catalog_seo_url->getUrlKeyword('product_id='.$product['product_id']);
          $total += $product['total'];
          $prod_arr[] = [
              'link' => 'budsite.ua/' .$query,
              'name' => $product['name'],
              'quantity' => $product['quantity'],
              'price' => $product['total']
          ];
      }

      $this->load->language('module/catapulta');
      $email_subject = sprintf($this->language->get('text_subject'), $this->language->get('heading_title'), $this->config->get('config_name'));
      $email_text = sprintf($this->language->get('text_order'), 13 . '<br>') . "\n\n";
      $email_text .= sprintf($this->language->get('text_contact'), $this->request->post['telephone'] . '<br>', ENT_QUOTES, 'UTF-8') . "\n";
      $email_text .= sprintf($this->language->get('text_ip'), $this->request->server['REMOTE_ADDR']  . '<br><br>', ENT_QUOTES, 'UTF-8') . "\n\n";
      $email_text .= sprintf($this->language->get('text_ip'), $record->city  . '<br><br>', ENT_QUOTES, 'UTF-8') . "\n\n";
      $products_str = '';
      foreach ($prod_arr as $product) {
          $email_text .= sprintf($this->language->get('text_product'), $product['name'] . '<br>', ENT_QUOTES, 'UTF-8') . "\n";
          $email_text .= sprintf($this->language->get('text_product_link'), $product['link'] . '<br>', ENT_QUOTES, 'UTF-8') . "\n";
          $email_text .= sprintf($this->language->get('text_product_quantity'), $product['quantity'] . '<br>', ENT_QUOTES, 'UTF-8') . "\n";
          $email_text .= sprintf($this->language->get('text_price'), $product['price'] . '<br><br>', ENT_QUOTES, 'UTF-8') . "\n\n";
      }
      $email_text .= sprintf($this->language->get('total_text_price') . '<br>', $total, ENT_QUOTES, 'UTF-8') . "\n\n";
      $email_text .= sprintf($this->language->get('text_date_order'), date('d.m.Y H:i'), ENT_QUOTES, 'UTF-8') . "\n\n";

      $one_click_order = $this->model_checkout_oneclick->add($this->request->post['telephone'], $email_text);
      $mail = new Mail($this->config->get('config_mail'));
      $mail->setTo('19ofis96@gmail.com');
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
      $mail->setSubject($email_subject);
//      $mail->setText($email_text);
      $mail->setHtml($email_text);
      $mail->send();

      $this->cart->clear();
  }

    /**
     * Сортировка массива для заполнения таблицы order_contract
     */
  public function sortData(){
      $data_contract = [];
      if($this->request->post['face'] == 2){
          $data_contract = [
              'ur_lico' => 2,
              'fio_ukr' => $this->request->post['fio-ukr'],
              'inn' => $this->request->post['inn'],
              'way' => 1,
              'contract' => 0
          ];
      }elseif($this->request->post['face'] == 1){
          $data_contract = [
              'ur_lico' => 1,
              'nds' => $this->request->post['nds'],
              'company-name' => $this->request->post['company-name'],
              'edrpou' => $this->request->post['edrpou'],
              'inn' => $this->request->post['inn-company'],
              'contract' => 0
          ];
          if ($this->request->post['contract'] == 1){
              $data_contract += [
                  'ur-addr' => $this->request->post['ur-addr'],
                  'post-addr' => $this->request->post['post-addr'],
                  'phone-company' => $this->request->post['phone-company'],
                  'payment-list' => $this->request->post['payment-list'],
                  'mfo' => $this->request->post['mfo'],
                  'fio-boss' => $this->request->post['fio-boss'],
                  'boss-position' => $this->request->post['boss-position'],
                  'ustav' => $this->request->post['ustav'],
                  'want_contract' => $this->request->post['contract'],
                  'inn' => $this->request->post['inn-company'],
                  'way' => 3
              ];

          }else{
              $data_contract += ['way' => 2];
          }
      }

      return $data_contract;
  }

  public function sendE(){
      $mail = new Mail($this->config->get('config_mail'));
      $mail->setTo('19ofis96@gmail.com');
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
      $mail->setSubject('test mail');
//      $mail->setText($email_text);
      $mail->setHtml('test mail');
//      $mail->send();echo "<pre>"; print_r($mail); echo "</pre>";

      mail('19ofis96@mail.ru', 'test-message', 'test message text');
  }

  public function getPointDelivery(){
      $tets = file_get_contents('http://www.delivery-auto.com/api/v4/Public/GetWarehousesListInDetail?culture=ru-RU&CityId=' . $this->request->get['id'] .  '&onlyWarehouses=true&country=1');
      echo $tets;
  }
}