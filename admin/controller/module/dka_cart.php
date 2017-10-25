<?php
class ControllerModuleDkaCart extends Controller {

//-------------------------------------- CONSTANTS -----------------------------------------//
private $dkaModuleName = "DKA Cart";
private $dkaModuleNameUID = "dka_cart";
private $dkaModuleMajorVersion = "1";
private $dkaModuleMinorVersion = "0";
private $dkaModuleBuildVersion = "0";
private $dkaModuleDateRelease = "20.03.2016";
private $dkaModuleAddressUpdate = 'http://dreamclever.ru/updates/dka_update.xml';
//private $dkaModuleAddressUpdate = 'localhost/dka_update.xml';
private $dkaAddressSupport = 'support@dreamclever.ru';
//******************************************************************************************//

//--------------------------------- DKA VERSION RETURN ------------------------------------------//
public function dkaVersion() {
	// PARAMS MODULE
	$data['dkaModuleName'] 				  = $this->dkaModuleName;
	$data['dkaModuleNameUID'] 		  = $this->dkaModuleNameUID;
  $data['dkaModuleMajorVersion']  = $this->dkaModuleMajorVersion;
  $data['dkaModuleMinorVersion']  = $this->dkaModuleMinorVersion;
  $data['dkaModuleBuildVersion']  = $this->dkaModuleBuildVersion;
  $data['dkaModuleDateRelease']   = $this->dkaModuleDateRelease;
  $data['dkaModuleAddressUpdate'] = $this->dkaModuleAddressUpdate;

	$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	$this->response->setOutput(json_encode($data));
}

//--------------------------------- LOAD INDEX PAGE ------------------------------------------//
public function index() {
	// PARAMS MODULE
	$data['dkaModuleName'] 				  = $this->dkaModuleName;
	$data['dkaModuleNameUID'] 		  = $this->dkaModuleNameUID;
  $data['dkaModuleMajorVersion']  = $this->dkaModuleMajorVersion;
  $data['dkaModuleMinorVersion']  = $this->dkaModuleMinorVersion;
  $data['dkaModuleBuildVersion']  = $this->dkaModuleBuildVersion;
  $data['dkaModuleDateRelease']   = $this->dkaModuleDateRelease;
  $data['dkaAddressSupport'] 			= $this->dkaAddressSupport;

	$data['dkaModuleAddressUpdate'] = $this->dkaModuleAddressUpdate;
  // CREATE LINK UPDATE MODULE
  $data['dkaModuleUpdate'] = $this->url->link('module/dka_cart/check_dka_update', 'token=' . $this->session->data['token'] . '&dkaModuleAddressUpdate=' . $data['dkaModuleAddressUpdate'], 'SSL');

  // LOAD LANGUAGE
	$this->language->load('module/dka_cart');
  // TITLE PAGE
	$this->document->setTitle($this->language->get('heading_title'));
	// MODEL SETTINGS
	$this->load->model('setting/setting');
  // EDIT SETTINGS
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		$this->model_setting_setting->editSetting('dka_cart', $this->request->post);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('module/dka_cart', 'token=' . $this->session->data['token'], 'SSL'));
	}

	// LOAD DATA
	$data['urlCartLoadData'] = $this->url->link('module/dka_cart/dkaCartLoadData', 'token=' . $this->session->data['token'], 'SSL');
	// DELETE DATA
	$data['urlCartDelete'] = $this->url->link('module/dka_cart/dkaCartDelete', 'token=' . $this->session->data['token'], 'SSL');
	// EXPORT EXCEL
	$data['urlExportCart'] = $this->url->link('module/dka_export_import/dkaExportCart', 'token=' . $this->session->data['token'], 'SSL');
	// ZIP URL
	$data['filesToZip'] = $this->url->link('module/dka_export_import/getFilesToZip', 'token=' . $this->session->data['token'], 'SSL');
	// SEND MAIL EMAIL
	$data['urlMailSend'] = $this->url->link('module/dka_cart/dkaMailSend', 'token=' . $this->session->data['token'], 'SSL');
	// STARTUP NO SHOW
	$data['urlNoShow'] = $this->url->link('module/dka_cart/dkaNoShow', 'token=' . $this->session->data['token'], 'SSL');

	$data['heading_title']   		 = $this->language->get('heading_title');
  $data['text_default'] 	 		 = $this->language->get('text_default');
	$data['text_table_cart'] 		 = $this->language->get('text_table_cart');
	$data['text_save'] 					 = $this->language->get('text_save');
	$data['text_enabled'] 			 = $this->language->get('text_enabled');
	$data['text_disabled'] 			 = $this->language->get('text_disabled');
	$data['text_error'] 				 = $this->language->get('text_error');
	$data['entry_settings_info'] = $this->language->get('entry_settings_info');
	$data['text_export'] 				 = $this->language->get('text_export');
	$data['text_arhive_process'] = $this->language->get('text_arhive_process');
	$data['text_download'] 			 = $this->language->get('text_download');
	$data['text_input_search']   = $this->language->get('text_input_search');
	$data['text_clear']  				 = $this->language->get('text_clear');
	$data['text_confirm']  			 = $this->language->get('text_confirm');
	$data['text_back']  			 	 = $this->language->get('text_back');
	$data['text_forward']  			 = $this->language->get('text_forward');
	$data['text_loading'] 			 = $this->language->get('text_loading');
	$data['text_empty'] 				 = $this->language->get('text_empty');
	$data['text_close'] 				 = $this->language->get('text_close');
	$data['text_noshow'] 				 = $this->language->get('text_noshow');
	// STARTUP
	$data['text_startup_header'] 		 = $this->language->get('text_startup_header');
	$data['text_startup_free'] 			 = $this->language->get('text_startup_free');
	$data['text_startup_free_p'] 		 = $this->language->get('text_startup_free_p');
	$data['text_startup_addition'] 	 = $this->language->get('text_startup_addition');
	$data['text_startup_addition_p'] = $this->language->get('text_startup_addition_p');

	$data['text_startup_contact'] 	 = $this->language->get('text_startup_contact');
	$data['text_startup_sale'] 			 = $this->language->get('text_startup_sale');
	$data['text_startup_sale_of'] 	 = $this->language->get('text_startup_sale_of');
	$data['text_startup_develop'] 	 = $this->language->get('text_startup_develop');
	$data['text_startup_support'] 	 = $this->language->get('text_startup_support');

	$data['text_noshow_herror'] = $this->language->get('text_noshow_herror');
	$data['text_noshow_perror'] = $this->language->get('text_noshow_perror');
	// DEFAULT
	$data['tooltip_user'] 			= $this->language->get('tooltip_user');
	$data['tooltip_product'] 		= $this->language->get('tooltip_product');
	$data['tooltip_delete'] 		= $this->language->get('tooltip_delete');
	$data['tooltip_delete_all'] = $this->language->get('tooltip_delete_all');

	$data['text_pagi_view'] = $this->language->get('text_pagi_view');
	$data['text_pagi_by'] 	= $this->language->get('text_pagi_by');
	$data['text_pagi_from'] = $this->language->get('text_pagi_from');
	$data['text_pagi_page'] = $this->language->get('text_pagi_page');

	$data['text_data_null'] = $this->language->get('text_data_null');

	$data['text_search_hinfo_p'] = $this->language->get('text_search_hinfo_p');
	$data['text_search_pinfo_p'] = $this->language->get('text_search_pinfo_p');

	$data['text_del_data_hinfo'] = $this->language->get('text_del_data_hinfo');
	$data['text_del_data_pinfo'] = $this->language->get('text_del_data_pinfo');

	$data['text_load_data_hinfo'] = $this->language->get('text_load_data_hinfo');
	$data['text_load_data_pinfo'] = $this->language->get('text_load_data_pinfo');
	// TABLE CART
	$data['text_th_image']  = $this->language->get('text_th_image');
	$data['text_th_name'] 	= $this->language->get('text_th_name');
	$data['text_th_fio'] 	  = $this->language->get('text_th_fio');
	$data['text_th_email']  = $this->language->get('text_th_email');
	$data['text_th_phone']  = $this->language->get('text_th_phone');
	$data['text_th_date']   = $this->language->get('text_th_date');
	$data['text_th_action'] = $this->language->get('text_th_action');
	// EXPORT
	$data['tooltip_export_carts'] 	 = $this->language->get('tooltip_export_carts');
	$data['text_export_h_base'] 		 = $this->language->get('text_export_h_base');
	$data['text_finished'] 			 		 = $this->language->get('text_finished');
	$data['text_export_t_files'] 		 = $this->language->get('text_export_t_files');
	$data['text_export_t_all_load']  = $this->language->get('text_export_t_all_load');

	$data['text_export_th_name']     = $this->language->get('text_export_th_name');
	$data['text_export_th_count']    = $this->language->get('text_export_th_count');
	$data['text_export_th_size']     = $this->language->get('text_export_th_size');
	$data['text_export_th_download'] = $this->language->get('text_export_th_download');

	$data['text_export_t_atbase']    		 = $this->language->get('text_export_t_atbase');

	$data['text_export_herror'] = $this->language->get('text_export_herror');
	$data['text_export_perror']  = $this->language->get('text_export_perror');

	$data['text_export_zip_herror']  	 = $this->language->get('text_export_zip_herror');
	$data['text_export_zip_perror']    = $this->language->get('text_export_zip_perror');
  // FOOTER
	$data['text_footer_site'] 	 = $this->language->get('text_footer_site');
	$data['text_footer_twitter'] = $this->language->get('text_footer_twitter');
	$data['text_footer_youtube'] = $this->language->get('text_footer_youtube');
	$data['text_footer_vk'] 		 = $this->language->get('text_footer_vk');

	$data['text_footer_support'] = $this->language->get('text_footer_support');
	// SUPPORT
	$data['tooltip_mail_user'] 				= $this->language->get('tooltip_mail_user');
	$data['text_mail_header'] 				= $this->language->get('text_mail_header');
	$data['text_mail_support_header'] = $this->language->get('text_mail_support_header');
	$data['text_mail_modal_send'] 	  = $this->language->get('text_mail_modal_send');
	$data['text_mail_modal_close'] 	  = $this->language->get('text_mail_modal_close');
	$data['text_mail_modal_address']  = $this->language->get('text_mail_modal_address');
	$data['text_mail_modal_answer']   = $this->language->get('text_mail_modal_answer');
	$data['text_mail_modal_copy'] 	  = $this->language->get('text_mail_modal_copy');
	$data['text_mail_modal_subject']  = $this->language->get('text_mail_modal_subject');
	$data['text_mail_modal_message']  = $this->language->get('text_mail_modal_message');

	$data['text_mail_modal_header'] 				= $this->language->get('text_mail_modal_header');
	$data['text_mail_support_subject_send'] = $this->language->get('text_mail_support_subject_send');
	$data['text_mail_subject_send'] 				= $this->language->get('text_mail_subject_send');
	$data['text_mail_modal_message_url'] 		= $this->language->get('text_mail_modal_message_url');

	$data['text_mail_modal_header_forward'] = $this->language->get('text_mail_modal_header_forward');
	$data['text_mail_modal_header_send'] 		= $this->language->get('text_mail_modal_header_send');
	$data['text_mail_modal_header_error'] 	= $this->language->get('text_mail_modal_header_error');

	$data['text_mail_herror'] = $this->language->get('text_mail_herror');
	$data['text_mail_perror'] = $this->language->get('text_mail_perror');

	$data['mail_answer'] = $this->config->get('config_email');
	$data['support_url'] = HTTP_SERVER;
	// ALERT
	$data['tooltip_alert_mail_send'] = $this->language->get('tooltip_alert_mail_send');
	$data['text_alert_mail_send'] 	 = $this->language->get('text_alert_mail_send');
	// SETTINGS
	$data['text_settings_save_hinfo_p'] = $this->language->get('text_settings_save_hinfo_p');
	$data['text_settings_save_pinfo_p'] = $this->language->get('text_settings_save_pinfo_p');

	$data['text_settings_modal_h'] = $this->language->get('text_settings_modal_h');

	$data['text_settings_update_copyright']  = $this->language->get('text_settings_update_copyright');
	$data['text_settings_update_check'] 		 = $this->language->get('text_settings_update_check');
	$data['text_settings_update_show_modal'] = $this->language->get('text_settings_update_show_modal');
	// UPDATE
	$data['text_update_check'] 					= $this->language->get('text_update_check');
	$data['text_update_header_new'] 		= $this->language->get('text_update_header_new');
	$data['text_update_subheader_new']  = $this->language->get('text_update_subheader_new');
	$data['text_update_subheader_date'] = $this->language->get('text_update_subheader_date');
	$data['text_update_header_info']    = $this->language->get('text_update_header_info');
	$data['text_update_header_change']  = $this->language->get('text_update_header_change');
	$data['text_update_forward_load']   = $this->language->get('text_update_forward_load');
	$data['text_update_no'] 					  = $this->language->get('text_update_no');
	$data['text_update_mr_client'] 			= $this->language->get('text_update_mr_client');

	$data['text_update_herror'] = $this->language->get('text_update_herror');
	$data['text_update_perror'] = $this->language->get('text_update_perror');
	// OTHER
	$data['limit_load'] = $this->config->get('config_limit_admin');

	// PAY EXPORT
	switch (is_file(dirname(__FILE__) . '/dka_export_import.php')) {
		case true:
			$data['is_export'] = true;
			break;
		case false:
			$data['is_export'] = false;
			break;
	}

	$this->config->get('dka_export_limit') == true
	? $data['dka_export_limit'] = $this->config->get('dka_export_limit')
	: $data['dka_export_limit'] = 500 ;

	isset($this->request->post['dka_cart_startup_noshow'])
	?	$data['dka_cart_startup_noshow'] = $this->request->post['dka_cart_startup_noshow']
	:	$data['dka_cart_startup_noshow'] = $this->config->get('dka_cart_startup_noshow');

	isset($this->request->post['dka_cart_update'])
	?	$data['dka_cart_update'] = $this->request->post['dka_cart_update']
	:	$data['dka_cart_update'] = $this->config->get('dka_cart_update');

	isset($this->request->post['dka_cart_update_modal'])
	?	$data['dka_cart_update_modal'] = $this->request->post['dka_cart_update_modal']
	:	$data['dka_cart_update_modal'] = $this->config->get('dka_cart_update_modal');

  // BREADCRUMBS
  $data['breadcrumbs'] = array();

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_home'),
		'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
	);

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_module'),
		'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
	);

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('heading_title'),
		'href' => $this->url->link('module/dka_cart', 'token=' . $this->session->data['token'], 'SSL')
	);

  $data['action'] = $this->url->link('module/dka_cart', 'token=' . $this->session->data['token'], 'SSL');

  $data['header'] = $this->load->controller('common/header');
  $data['column_left'] = $this->load->controller('common/column_left');
  $data['footer'] = $this->load->controller('common/footer');

  $this->response->setOutput($this->load->view('module/dka_cart.tpl', $data));
}

/* ------------------------  STARTUP NO SHOW SAVE   ------------------------------- */
public function dkaNoShow(){
	// MODEL SETTINGS
	$this->load->model('setting/setting');
  // EDIT SETTINGS
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		$this->model_setting_setting->editSetting('dka_cart', $this->request->post);
		$this->session->data['success'] = $this->language->get('text_success');
	}

	isset($this->request->post['dka_cart_startup_noshow'])
	?	$data['dka_cart_startup_noshow'] = $this->request->post['dka_cart_startup_noshow']
	:	$data['dka_cart_startup_noshow'] = $this->config->get('dka_cart_startup_noshow');

	isset($this->request->post['dka_cart_update'])
	?	$data['dka_cart_update'] = $this->request->post['dka_cart_update']
	:	$data['dka_cart_update'] = $this->config->get('dka_cart_update');

	isset($this->request->post['dka_cart_update_modal'])
	?	$data['dka_cart_update_modal'] = $this->request->post['dka_cart_update_modal']
	:	$data['dka_cart_update_modal'] = $this->config->get('dka_cart_update_modal');

	$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	$this->response->setOutput(json_encode($data));
}

/* ------------------------  VALIDATE SAVE   ------------------------------- */
protected function validate() {
	if (!$this->user->hasPermission('modify', 'module/dka_cart')) {
		$this->error['warning'] = $this->language->get('error_permission');
		return false;
	}

	if (!$this->error) { return true; } else { return false; }
}

/* ------------------------  CURL   ------------------------------- */
public function get_dkaCurl($url,$headers) {
		$handle=curl_init();
    curl_setopt($handle, CURLOPT_URL, $url);
    curl_setopt($handle, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
    $response=curl_exec($handle);
    $code=curl_getinfo($handle, CURLINFO_HTTP_CODE);
    return array("code"=>$code,"response"=>$response);
}

/* ------------------------  CHECK UPDATE   ------------------------------- */
public function check_dka_update(){
  if (isset($this->request->get['dkaModuleAddressUpdate'])) {
		// LOAD LANGUAGE
		$this->language->load('module/dka_cart');

		$data['dkaModuleAddressUpdate'] = $this->request->get['dkaModuleAddressUpdate'];
    $dka_name = $this->request->get['dka_name'];
		$dka_version = $this->request->get['dka_version'];

    $result = $this->get_dkaCurl($data['dkaModuleAddressUpdate'] . "?dka_name=" . $dka_name . "&dka_version=" . $dka_version, array());
		$xml = null;
		try{
			$xml=new SimpleXMLElement($result['response']);
		}catch(Exception $e){
			$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	    $this->response->setOutput(json_encode($e->getMessage()));
		}
		if($xml){
	    $searchUpdates = $xml->xpath('update');
	    $data['update_info'] = array();

			foreach($searchUpdates as $searchUpdate){
				if($dka_name == (string)$searchUpdate->attributes()->id){
					$data['update_info'] = array(
						'id'           => (string)$searchUpdate->attributes()->id,
						'nameAttr'     => (string)$searchUpdate->attributes()->name,
						'date'         => (string)$searchUpdate->date,
						'name'         => (string)$searchUpdate->name,
						'majorVersion' => (string)$searchUpdate->MajorVersion,
						'minorVersion' => (string)$searchUpdate->MinorVersion,
						'buildVersion' => (string)$searchUpdate->BuildVersion,
						'fullVersion'  => (string)$searchUpdate->MajorVersion . (string)$searchUpdate->MinorVersion . (string)$searchUpdate->BuildVersion,
						'news'         => (string)$searchUpdate->news,
	          'logo'         => (string)$searchUpdate->logo,
	          'img'          => (string)$searchUpdate->img,
						'updateUrl'    => (string)$searchUpdate->updateUrl,
						'downloadUrl'  => (string)$searchUpdate->downloadUrl,
						'info'         => (string)$searchUpdate->info,
						'changelog'    => (string)$searchUpdate->changelog,
						'addinginfo'   => (string)$searchUpdate->addinginfo,
					);
				}
			}
	    $this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	    $this->response->setOutput(json_encode($data['update_info']));
		}
	}
}

/* ------------------------  GET LANG STORE DEFAULT   ------------------------------- */
protected function getLangStore($store = false){
	//SETTINGS
	$this->load->model('setting/setting');
	//LANGUAGE
	$this->load->model('localisation/language');
	$languages = $this->model_localisation_language->getLanguages();

	if ($this->config->get('dka_cart_language') || strlen(trim($this->config->get('dka_cart_language'))) > 1) {
		$language_id = $this->config->get('dka_cart_language');
	}else{
		foreach ($languages as $language) {
			$language['code'] == 'ru' ? $language_id = $language['language_id'] : null ;
		}
	}
	//STORES
	if($store){
		// LOAD LANGUAGE
		$this->language->load('module/dka_cart_import');
		$this->load->model('setting/store');
		$stores = $this->model_setting_store->getStores();
		$stores[] = array( "store_id" => 0, "name" => $this->language->get('text_general_store') );
		sort($stores);

		$this->config->get('dka_cart_store') || strlen(trim($this->config->get('dka_cart_store'))) > 1
		? $store_id = $this->config->get('dka_cart_store')
		: $store_id = 0;
	}else{
		$store_id = 0;
	}
	$data['language_id'] = $language_id;
	$data['store_id'] = $store_id;

	return $data;
}

/* ------------------------  MAIN GET DATA SYSTEM MODULE  ------------------------------- */
public function dkaCartLoadData(){
	isset($this->request->get['start'])  ? $start = $this->request->get['start']   : $start = 0;
	isset($this->request->get['limit'])  ? $limit = $this->request->get['limit']   : $limit = $this->config->get('config_limit_admin');
	isset($this->request->get['string']) ? $string = $this->request->get['string'] : $string = null;

	// LOAD LANGUAGE
	$this->language->load('module/dka_cart');

	$this->load->model('dka/dka_cart');
	strlen($string) > 0
	? $data = $this->model_dka_dka_cart->dkaGetSearchCarts($start, $limit, $string)
	: $data = $this->model_dka_dka_cart->dkaGetCarts($start, $limit) ;

	$this->load->model('tool/image');

	if(isset($data['carts'])){
		for($i = 0; $i < count($data['carts']); $i++){
			is_file(DIR_IMAGE . $data['carts'][$i]['image']) == true
			?	$data['carts'][$i]['image'] = $this->model_tool_image->resize($data['carts'][$i]['image'], 80, 80)
			:	$data['carts'][$i]['image'] = $this->model_tool_image->resize('no_image.png', 80, 80) ;

			$data_fio = $data['carts'][$i]['lastname'] . " " . $data['carts'][$i]['firstname'];
			strlen($data_fio) > 1
			?	$data['carts'][$i]['fio'] = $data_fio
			:	$data['carts'][$i]['fio'] = $this->language->get('text_empty');

			$data_email = $data['carts'][$i]['email'];
			strlen($data_email) > 1
			?	$data['carts'][$i]['email'] = $data_email
			:	$data['carts'][$i]['email'] = $this->language->get('text_empty');

			$data['carts'][$i]['product_url'] = $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $data['carts'][$i]['product_id'], 'SSL');
			$data['carts'][$i]['customer_url'] = $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $data['carts'][$i]['customer_id'], 'SSL');
		}
	}else{
		$data['carts'] = 0;
	}

	$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	$this->response->setOutput(json_encode($data));
}

/* ------------------------  MAIN GET DATA SYSTEM MODULE  ------------------------------- */
public function dkaCartDelete(){
	isset($this->request->get['cart_id']) ? $cart_id = $this->request->get['cart_id'] : $cart_id = 0;
	isset($this->request->get['clear_is']) ? $clear_is = $this->request->get['clear_is'] : $clear_is= false;

	$this->load->model('dka/dka_cart');
	$clear_is == false
	? $data = $this->model_dka_dka_cart->dkaCartDelete($cart_id)
	: $data = $this->model_dka_dka_cart->dkaCartsDelete() ;

	$data == true
	? $data = array( 'result' => true )
	: $data = array( 'result' => false ) ;

	$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
	$this->response->setOutput(json_encode($data));
}

public function dkaMailSend(){
	$this->load->language('module/dka_cart');

	$json = array();

	if ($this->request->server['REQUEST_METHOD'] == 'POST') {
		if (!$this->user->hasPermission('modify', 'module/dka_cart')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['subject']) {
			$json['error']['subject'] = $this->language->get('error_subject');
		}

		if (!$this->request->post['message']) {
			$json['error']['message'] = $this->language->get('error_message');
		}

		if (!$this->request->post['answer']) {
			$json['error']['answer'] = $this->language->get('error_message');
		}


		if (!$json) {
			$this->load->model('setting/store');

			$langStore = $this->getLangStore(true);
			$store_id = $langStore['store_id'];

			$store_info = $this->model_setting_store->getStore($store_id);

			if ($store_info) {
				$store_name = $store_info['name'];
			} else {
				$store_name = $this->config->get('config_name');
			}

			if ($this->request->post['email_send']) {
				$emails[] =  $this->request->post['email_send'];
			}

			$emails[] =  $this->request->post['answer_copy'];
			if ($emails) {
				foreach ($emails as $email) {
					$message  = '<html dir="ltr" lang="en">' . "\n";
					$message .= '  <head>' . "\n";
					$message .= '    <title>' . $this->request->post['subject'] . '</title>' . "\n";
					$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
					$message .= '  </head>' . "\n";
					$message .= '  <body>Адрес ответа: ' . $this->request->post['answer'] . '<br />' . html_entity_decode($this->request->post['message'], ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
					$message .= '</html>' . "\n";

					if (preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
						$mail = new Mail();
						$mail->protocol = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
						$mail->smtp_username = $this->config->get('config_mail_smtp_username');
						$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
						$mail->smtp_port = $this->config->get('config_mail_smtp_port');
						$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

						$mail->setTo($email);
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender(html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
						$mail->setSubject(html_entity_decode($this->request->post['subject'], ENT_QUOTES, 'UTF-8'));
						$mail->setHtml($message);
						$mail->send() == null ? $json['success'] = $this->language->get('text_success') : $json['error'] = $this->language->get('text_error') ;
					}
				}
			}
		}
	}

	$this->response->addHeader('Content-Type: application/json');
	$this->response->setOutput(json_encode($json));
}

}
?>
