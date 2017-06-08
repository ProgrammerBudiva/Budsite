<?php
####################################################################################
#  Any Feed for Opencart 2.0.x From HostJars http://opencart.hostjars.com  		   #
####################################################################################
class ControllerFeedAnyFeed extends Controller {

	private $error = array();

	public function install() {
		$this->load->model('feed/any_feed');
		$this->model_feed_any_feed->createTable();

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('any_feed', array('any_feed_status'=>1));
	}

	public function uninstall() {
		$this->load->model('feed/any_feed');
		$this->model_feed_any_feed->deleteTable();

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('any_feed', array('any_feed_status'=>0));
	}

	public function index() {
		//LOAD LANGUAGE
		$this->load->language('feed/any_feed');

		//SET TITLE
		$this->document->setTitle($this->language->get('heading_title'));

		//LOAD SETTINGS
		$this->load->model('setting/setting');
		$this->load->model('feed/any_feed');

		//SAVE SETTINGS (when form submitted)
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_feed_any_feed->save($this->request->post);
			$this->model_setting_setting->editSetting('any_feed', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('feed/any_feed', 'token=' . $this->session->data['token'], 'SSL'));
		}

		//include jquery links if earlier than 1.5.1
		$data['jquery'] = '
			<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/smoothness/jquery-ui.css" />
			<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
			<script type="text/javascript" src="view/javascript/jquery/superfish/superfish.js"></script>
		';

		$source_fields = array(
			'Product ID' => array(
				'prefix' => 'product_id',
			),
			'URL' => array(
				'prefix' => 'url',
			),
			'Name' => array(
				'prefix' => 'name',
			),
			'Meta Tag Description' => array(
				'prefix' => 'meta_tag_description',
			),
			'Meta Tag Keywords' => array(
				'prefix' => 'meta_tag_keywords',
			),
			'Description' => array(
				'prefix' => 'description',
				'Strip HTML' => array(
					'type'=>'checkbox',
					'name'=>'description_strip_html',
					'value'=>'1',
				)
			),
			'Product Tags' => array(
				'prefix' => 'product_tags',
			),
			'Model' => array(
				'prefix' => 'model',
			),
			'SKU' => array(
				'prefix' => 'sku',
			),
			'UPC' => array(
				'prefix' => 'upc',
			),
			'EAN' => array(
				'prefix' => 'ean',
			),
			'JAN' => array(
				'prefix' => 'jan',
			),
			'ISBN' => array(
				'prefix' => 'isbn',
			),
			'MPN' => array(
				'prefix' => 'mpn',
			),
			'Location' => array(
				'prefix' => 'location',
			),
			'Price' => array(
				'prefix' => 'price',
			),
			'Quantity' => array(
				'prefix' => 'quantity',
			),
			'SEO Keyword' => array(
				'prefix' => 'name',
			),
			'Image' => array(
				'prefix' => 'image',
			),
			'Additional Images' => array(
				'prefix' => 'additional_images',
			),
			'Length' => array(
				'prefix' => 'length',
			),
			'Width' => array(
				'prefix' => 'width',
			),
			'Height' => array(
				'prefix' => 'height',
			),
			'Weight' => array(
				'prefix' => 'weight',
			),
			'Manufacturer' => array(
				'prefix' => 'manufacturer',
			),
			'Categories' => array(
				'prefix' => 'categories',
			),
            'Filters'    => array(
                'prefix' => 'filters',
            ),
			'Attributes' => array(
				'prefix' => 'attributes',
			),
			'Options' => array(
				'prefix' => 'options',
			),
			'Special Price' => array(
				'prefix' => 'special_price',
			),
      'Price ISO 4217'       => array(
        'prefix' => 'Price',
      ),
      'Item subtitle'   => array(
        'prefix' => 'Item subtitle',
      ),
		);

		//for common operations/fields like field name etc
		$common_settings = array (
			'Field Name' => array(
				'type'=>'text',
				'name'=>'name',
			),
		);

		ksort($source_fields);
		$data['source_fields'] = $source_fields;
		$data['common_field_settings'] = $common_settings;

		$profiles = $this->model_feed_any_feed->getProfiles();

		$profile_list = array();
		foreach($profiles as $profile) {
			foreach($profile as $name=>$value) {
				if($name == 'name') {
					$profile_list[$value] = $this->model_feed_any_feed->makeNiceName($value);
				}
			}
		}

		$presets = $this->model_feed_any_feed->getPresets();
		$preset_list = array();
		foreach($presets as $preset) {
			foreach($preset as $name=>$value) {
				if($name == 'name') {
					$preset_list[$value] = $this->model_feed_any_feed->makeNiceName($value);
				}
			}
		}


		$data['preset_feeds'] = $profile_list;
		$data['profiles'] = $preset_list;
		$data['token'] = $this->session->data['token'];


		//LANGUAGE
		$text_strings = array(
			'heading_title',
			'entry_add_feed',
			'entry_exclude_fields',
			'button_save',
			'button_cancel',
			'button_add_module',
			'button_remove',
			'text_select_name',
			'text_feed_name',
			'text_feed_profile',
		);

		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}
		//END LANGUAGE

		//ERROR
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		//SUCCESS
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		//BREADCRUMB TRAIL
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
		);

		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_feed'),
			'href'      => $this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('feed/any_feed', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
		);

		$data['action'] = $this->url->link('feed/any_feed', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL');

        $data['header'] = $this->load->controller('common/header');
        $data['menu'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

		//Send the output.
		$this->response->setOutput($this->load->view('feed/any_feed.tpl', $data));
	}


	private function validate() {
		if (!$this->user->hasPermission('modify', 'feed/any_feed')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function getProfile($profile_name='custom') {
		$this->load->model('feed/any_feed');
		if(isset($this->request->get['feed'])){
			$profile_name = $this->request->get['feed'];
		}
		if(isset($this->request->get['preset'])){
			$preset = $this->request->get['preset'];
		}
		$profile = json_encode($this->model_feed_any_feed->getProfile($profile_name, $preset));
		echo $profile;
		return;
	}

	public function deleteProfile() {
		$this->load->model('feed/any_feed');
		if(isset($this->request->get['feed'])){
			$profile_name = $this->request->get['feed'];
			$profile_name = $this->model_feed_any_feed->makeStandardName($profile_name);
			$this->model_feed_any_feed->deleteProfile($profile_name);
		}
		return;
	}
}
?>