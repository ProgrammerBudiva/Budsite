<?php
class ControllerModuleCurrencyPlus extends Controller {
    private $error = array();
    private $type = 'module';
    private $name = 'currency_plus';

    public function install() {
        $this->load->model('localisation/currency');

        $this->model_localisation_currency->create_fields();
    }

    public function index() {
        $this->load->language($this->type . '/' . $this->name);

        $data['name'] = $this->name;

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('localisation/currency');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_localisation_currency->create_fields();

            $this->model_setting_setting->editSetting($this->name, $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/'.$this->type, 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
      
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/'.$this->type, 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link($this->type . '/'.$this->name, 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );


        $data['action'] = $this->url->link($this->type.'/'.$this->name, 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/'.$this->type, 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post[$this->name.'_show_base_price'])) {
            $data[$this->name.'_show_base_price'] = $this->request->post[$this->name.'_show_base_price'];
        } else {
            $data[$this->name.'_show_base_price'] = $this->config->get($this->name.'_show_base_price');
        }

        if (isset($this->request->post[$this->name.'_show_base_price_cat'])) {
            $data[$this->name.'_show_base_price_cat'] = $this->request->post[$this->name.'_show_base_price_cat'];
        } else {
            $data[$this->name.'_show_base_price_cat'] = $this->config->get($this->name.'_show_base_price_cat');
        }

        if (isset($this->request->post[$this->name.'_show_base_price_search'])) {
            $data[$this->name.'_show_base_price_search'] = $this->request->post[$this->name.'_show_base_price_search'];
        } else {
            $data[$this->name.'_show_base_price_search'] = $this->config->get($this->name.'_show_base_price_search');
        }

        if (isset($this->request->post[$this->name.'_show_base_price_brand'])) {
            $data[$this->name.'_show_base_price_brand'] = $this->request->post[$this->name.'_show_base_price_brand'];
        } else {
            $data[$this->name.'_show_base_price_brand'] = $this->config->get($this->name.'_show_base_price_brand');
        }

        if (isset($this->request->post[$this->name.'_show_base_price_special'])) {
            $data[$this->name.'_show_base_price_special'] = $this->request->post[$this->name.'_show_base_price_special'];
        } else {
            $data[$this->name.'_show_base_price_special'] = $this->config->get($this->name.'_show_base_price_special');
        }

        if (isset($this->request->post[$this->name.'_round'])) {
            $data[$this->name.'_round'] = $this->request->post[$this->name.'_round'];
        } else {
            $data[$this->name.'_round'] = $this->config->get($this->name.'_round');
        }

        if (isset($this->request->post[$this->name.'_charcode'])) {
            $data[$this->name.'_charcode'] = $this->request->post[$this->name.'_charcode'];
        } else {
            $data[$this->name.'_charcode'] = $this->config->get($this->name.'_charcode');
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        
        $template = $this->type . '/'.$this->name.'.tpl';

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view($template, $data));

    }

    private function validate() {
        if (!$this->user->hasPermission('modify', $this->type . '/' . $this->name)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }  
    }
}
?>