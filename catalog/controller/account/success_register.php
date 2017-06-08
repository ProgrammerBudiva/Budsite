<?php
/**
 * Created by PhpStorm.
 * User: Rostik
 * Date: 08.02.16
 * Time: 18:26
 */

class ControllerAccountSuccessRegister extends Controller {
    public function index() {
        $this->load->language('account/success_register');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $data['text'] = $this->language->get('text');

        $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/success_register.tpl', $data));
    }
}
?>