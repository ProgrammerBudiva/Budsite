<?php
class ControllerModuleCatapulta extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/catapulta');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('catapulta', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_phone_mask'] = $this->language->get('text_phone_mask');
		$data['text_catapulta'] = $this->language->get('text_catapulta');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_phone_mask_status'] = $this->language->get('entry_phone_mask_status');
		$data['entry_phone_text'] = $this->language->get('entry_phone_text');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/catapulta', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['catapulta'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'], 'SSL');

		$data['action'] = $this->url->link('module/catapulta', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['catapulta_email_status'])) {
			$data['email_status'] = $this->request->post['catapulta_email_status'];
		} else {
			$data['email_status'] = $this->config->get('catapulta_email_status');
		}

		if (isset($this->request->post['catapulta_status'])) {
			$data['module_status'] = $this->request->post['catapulta_status'];
		} else {
			$data['module_status'] = $this->config->get('catapulta_status');
		}

		if (isset($this->request->post['catapulta_phone_mask_status'])) {
			$data['phone_mask_status'] = $this->request->post['catapulta_phone_mask_status'];
		} else {
			$data['phone_mask_status'] = $this->config->get('catapulta_phone_mask_status');
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['catapulta_phone_text'])) {
			$data['phone_text'] = $this->request->post['catapulta_phone_text'];
		} else {
			$data['phone_text'] = $this->config->get('catapulta_phone_text');
		}

		if (isset($this->request->post['catapulta_phone_mask'])) {
			$data['phone_mask'] = $this->request->post['catapulta_phone_mask'];
		} else {
			$data['phone_mask'] = $this->config->get('catapulta_phone_mask');
		}

		if (isset($this->error['phone_text'])) {
			$data['error_phone_text'] = $this->error['phone_text'];
		} else {
			$data['error_phone_text'] = array();
		}

		if (isset($this->error['phone_mask'])) {
			$data['error_phone_mask'] = $this->error['phone_mask'];
		} else {
			$data['error_phone_mask'] = array();
		}

		$this->template = 'module/catapulta.tpl';

		$this->children = array(
			'common/header',
			'common/footer'
		);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		$this->response->setOutput($this->load->view('module/catapulta.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/catapulta')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ($this->request->post['catapulta_phone_mask_status']) {
			if (isset($this->request->post['catapulta_phone_mask']) && !preg_match('/^[9\+\(\)\s\-]{3,50}$/', $this->request->post['catapulta_phone_mask'])) {
				$this->error['phone_mask'] = $this->language->get('error_phone_mask');
			}
		}

		foreach ($this->request->post['catapulta_phone_text'] as $language_id => $value) {
			if (utf8_strlen($value) > 1000) {
				$this->error['phone_text'][$language_id] = $this->language->get('error_phone_text');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function install() {
		$this->load->model('catalog/catapulta');
		$this->load->model('setting/setting');

		$this->model_catalog_catapulta->install();

		$data = array(
			'catapulta_email_status' => 1,
			'catapulta_status' => 1,
			'catapulta_phone_mask_status' => 0,
			'catapulta_phone_mask' => '+9 (999) 999-99-99'
		);

		$this->model_setting_setting->editSetting('catapulta', $data);

		$this->load->model('user/user_group');

		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/catapulta');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/catapulta');
	}

	public function uninstall() {
		$this->load->model('catalog/catapulta');
		$this->load->model('setting/setting');

		$this->model_catalog_catapulta->unistall();

		$this->model_setting_setting->deleteSetting('catapulta');
	}

}

?>
