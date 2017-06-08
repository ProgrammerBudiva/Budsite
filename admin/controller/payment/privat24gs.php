<?php 
class ControllerPaymentPrivat24gs extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/privat24gs');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('privat24gs', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_pay'] = $this->language->get('text_pay');
		$data['text_card'] = $this->language->get('text_card');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_edit'] = $this->language->get('text_edit');


        $data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_signature'] = $this->language->get('entry_signature');
		$data['entry_type'] = $this->language->get('entry_type');				
		$data['entry_total'] = $this->language->get('entry_total');	
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchant'])) { 
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}
		
		if (isset($this->error['signature'])) { 
			$data['error_signature'] = $this->error['signature'];
		} else {
			$data['error_signature'] = '';
		}
		
		if (isset($this->error['type'])) { 
			$data['error_type'] = $this->error['type'];
		} else {
			$data['error_type'] = '';
		}

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/privat24gs', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => ' :: '
   		);
				
		$data['action'] = $this->url->link('payment/privat24gs', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['privat24gs_merchant'])) {
			$data['privat24gs_merchant'] = $this->request->post['privat24gs_merchant'];
		} else {
			$data['privat24gs_merchant'] = $this->config->get('privat24gs_merchant');
		}

		if (isset($this->request->post['privat24gs_signature'])) {
			$data['privat24gs_signature'] = $this->request->post['privat24gs_signature'];
		} else {
			$data['privat24gs_signature'] = $this->config->get('privat24gs_signature');
		}

		if (isset($this->request->post['privat24gs_type'])) {
			$data['privat24gs_type'] = $this->request->post['privat24gs_type'];
		} else {
			$data['privat24gs_type'] = $this->config->get('privat24gs_type');
		}
		
		if (isset($this->request->post['privat24gs_total'])) {
			$data['privat24gs_total'] = $this->request->post['privat24gs_total'];
		} else {
			$data['privat24gs_total'] = $this->config->get('privat24gs_total'); 
		} 
				
		if (isset($this->request->post['privat24gs_order_status_id'])) {
			$data['privat24gs_order_status_id'] = $this->request->post['privat24gs_order_status_id'];
		} else {
			$data['privat24gs_order_status_id'] = $this->config->get('privat24gs_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['privat24gs_geo_zone_id'])) {
			$data['privat24gs_geo_zone_id'] = $this->request->post['privat24gs_geo_zone_id'];
		} else {
			$data['privat24gs_geo_zone_id'] = $this->config->get('privat24gs_geo_zone_id'); 
		} 		
		
		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['privat24gs_status'])) {
			$data['privat24gs_status'] = $this->request->post['privat24gs_status'];
		} else {
			$data['privat24gs_status'] = $this->config->get('privat24gs_status');
		}
		
		if (isset($this->request->post['privat24gs_sort_order'])) {
			$data['privat24gs_sort_order'] = $this->request->post['privat24gs_sort_order'];
		} else {
			$data['privat24gs_sort_order'] = $this->config->get('privat24gs_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/privat24gs.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/privat24gs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['privat24gs_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}

		if (!$this->request->post['privat24gs_signature']) {
			$this->error['signature'] = $this->language->get('error_signature');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>