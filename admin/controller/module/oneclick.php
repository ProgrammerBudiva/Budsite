<?php
class ControllerModuleOneclick extends Controller
{
    private $error = array();
    /**
     * @var array
     */
    private $data = array();
    public function index()
    {
        $this->load->language('module/oneclick');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
        $this->data['column_phone'] = $this->language->get('column_phone');
        $this->data['column_id'] = $this->language->get('column_id');
        $this->data['column_order'] = $this->language->get('column_order');
        $this->data['column_date'] = $this->language->get('column_date');


        $this->load->model('module/oneclick');
        $this->data['orders'] = $this->model_module_oneclick->getOrders();
//        echo "<pre>"; print_r($orders); echo "</pre>";
        $this->initBreadcrumbs();
        $this->initActions();
        $this->response->setOutput($this->load->view('module/oneclick.tpl', $this->data));
    }
    public function install()
    {
        $this->load->model('setting/setting');
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_setting_setting->editSetting('oneclick', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $data['success'] = $this->session->data['success'];
        }
    }

    public function uninstall(){

        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('oneclick');
    }

    protected function initBreadcrumbs() {
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->link('common/dashboard', '', true)
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->link('extension/' . (version_compare(VERSION, '2.3.0.0', '<') ? 'module' : 'extension'), '', true)
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->data['heading_title'],
            'href' => $this->link($this->getRouteName(), '', true)
        );
    }

    /**
     * @return void
     */
    protected function initActions() {
        $this->data['action_cancel'] = $this->link('extension/' . (version_compare(VERSION, '2.3.0.0', '<') ? 'module' : 'extension'));
        $this->data['action_add'] = $this->link($this->getRouteName() . '/add');
        $this->data['action_save'] = $this->link($this->getRouteName() . '/save');
        $this->data['action_delete'] = $this->link($this->getRouteName() . '/delete');
        $this->data['action_search'] = $this->url->link('', '');
        $this->data['action_not_show_again'] = $this->link($this->getRouteName() . '/warning_disable');
        $this->data['action_warning_action'] = $this->link($this->getRouteName() . '/warning_action');
    }

    protected function link($route, $args = '', $secure = false) {
        if (is_array($args))
            $args['token'] = $this->session->data['token'];
        else
            $args .= '&token=' . $this->session->data['token'];

        return $this->url->link($route, $args, $secure);
    }
    protected function getRouteName($name = 'oneclick') {
        return (version_compare(VERSION, '2.3.0.0', '<') ? '' : 'extension/') . 'module/' . $name;
    }


}