<?php


class ControllerCommonFooter extends Controller {

  public function index() {
    $this->load->language('common/footer');

    $data['text_information'] = $this->language->get('text_information');
    $data['text_service'] = $this->language->get('text_service');
    $data['text_extra'] = $this->language->get('text_extra');
    $data['text_contact'] = $this->language->get('text_contact');
    $data['text_return'] = $this->language->get('text_return');
    $data['text_sitemap'] = $this->language->get('text_sitemap');
    $data['text_manufacturer'] = $this->language->get('text_manufacturer');
    $data['text_voucher'] = $this->language->get('text_voucher');
    /*$data['styles'] = $this->document->getStyles();*/
    $data['scripts'] = $this->document->getScripts();

    $data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');

    $data['text_affiliate'] = $this->language->get('text_affiliate');
    $data['text_special'] = $this->language->get('text_special');
    $data['text_account'] = $this->language->get('text_account');
    $telephone = explode(';', $this->config->get('config_telephone'));
    $data['telephone'] = $telephone[0];
    $data['text_create'] = $this->language->get('text_create');
    $data['text_create_href'] = $this->language->get('text_create_href');

    $data['text_socials'] = $this->language->get('text_socials');

    $data['news'] = $this->url->link('information/news');
    $data['text_news'] = $this->language->get('text_news');

    $data['text_order'] = $this->language->get('text_order');
    $data['text_wishlist'] = $this->language->get('text_wishlist');
    $data['text_newsletter'] = $this->language->get('text_newsletter');

    $this->load->model('catalog/information');

    $data['informations'] = array();

    foreach ($this->model_catalog_information->getInformations() as $result) {
      if ($result['bottom']) {
        $data['informations'][] = array(
          'title' => $result['title'],
          'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id']),
        );
      }
    }

    $data['contact'] = $this->url->link('information/contact');
    $data['return'] = $this->url->link('account/return/add', '', 'SSL');
    $data['sitemap'] = $this->url->link('information/sitemap');
    $data['manufacturer'] = $this->url->link('product/manufacturer');
    $data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
    $data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
    $data['special'] = $this->url->link('product/special');
    $data['account'] = $this->url->link('account/account', '', 'SSL');
    $data['order'] = $this->url->link('account/order', '', 'SSL');
    $data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
    $data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

    //footer navigation
    $data['text_about_us'] = $this->language->get('text_about_us');
    $data['text_contacts'] = $this->language->get('text_contacts');
    $data['text_blog'] = $this->language->get('text_blog');
    $data['text_cooperation'] = $this->language->get('text_cooperation');
    $data['text_statement'] = $this->language->get('text_statement');
    $data['text_shipping'] = $this->language->get('text_shipping');
    $data['text_payment'] = $this->language->get('text_payment');
    $data['text_franchise'] = $this->language->get('text_franchise');
    $data['text_help'] = $this->language->get('text_help');

    $data['link_about_us'] = $this->url->link('information/information', 'information_id=4');
    $data['link_contacts'] = $this->url->link('information/contact');
    $data['link_cooperation'] = $this->url->link('information/information', 'information_id=11');
    $data['link_statement'] = $this->url->link('information/information', 'information_id=10');
    $data['link_payment'] = $this->url->link('information/information', 'information_id=7');
    $data['link_shipping'] = $this->url->link('information/information', 'information_id=6');
    $data['link_blog'] = $this->url->link('information/news');
    $data['link_help'] = $this->url->link('information/information', 'information_id=8');
    $data['link_franchise'] = $this->url->link('information/information', 'information_id=9');

    //social links
    $data['link_vk'] = $this->config->get('config_vk');
    $data['link_fb'] = $this->config->get('config_fb');
    $data['link_gp'] = $this->config->get('config_gp');
    $data['link_twitter'] = $this->config->get('config_twitter');


    $data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), '2016');

    // Whos Online
    if ($this->config->get('config_customer_online')) {
      $this->load->model('tool/online');

      if (isset($this->request->server['REMOTE_ADDR'])) {
        $ip = $this->request->server['REMOTE_ADDR'];
      }
      else {
        $ip = '';
      }

      if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
        $url = 'https://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
      }
      else {
        $url = '';
      }

      if (isset($this->request->server['HTTP_REFERER'])) {
        $referer = $this->request->server['HTTP_REFERER'];
      }
      else {
        $referer = '';
      }

      $this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
    }

    $data['newsletter_subscribe'] = $this->load->controller('module/newslettersubscribe');


    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
      return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
    }
    else {
      return $this->load->view('default/template/common/footer.tpl', $data);
    }
  }
}