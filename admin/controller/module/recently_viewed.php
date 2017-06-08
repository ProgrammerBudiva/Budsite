<?php
class ControllerModuleRecentlyViewed extends Controller {
    private $error = array(); // This is used to set the errors, if any.
 
    public function index() {
        // Loading the language file of recently_viewed
        $this->load->language('module/recently_viewed');

        // Set the title of the page to the heading title in the Language file i.e., Hello World
        $this->document->setTitle($this->language->get('heading_title'));

        // Load the Setting Model  (All of the OpenCart Module & General Settings are saved using this Model )
        $this->load->model('setting/setting');

        // Start If: Validates and check if data is coming by save (POST) method
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            // Parse all the coming data to Setting Model to save it in database.
            $this->model_setting_setting->editSetting('recently_viewed', $this->request->post);

            // To display the success text on data save
            $this->session->data['success'] = $this->language->get('text_success');

            // Redirect to the Module Listing
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        // Assign the language data for parsing it to view
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit']    = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_content_top'] = $this->language->get('text_content_top');
        $data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $data['text_column_left'] = $this->language->get('text_column_left');
        $data['text_column_right'] = $this->language->get('text_column_right');
        $data['text_image_dimension'] = $this->language->get('text_image_dimension');
        $data['placeholder_height'] = $this->language->get('placeholder_height');
        $data['placeholder_width'] = $this->language->get('placeholder_width');

        $data['entry_code'] = $this->language->get('entry_code');
        $data['entry_layout'] = $this->language->get('entry_layout');
        $data['entry_position'] = $this->language->get('entry_position');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add_module'] = $this->language->get('button_add_module');
        $data['button_remove'] = $this->language->get('button_remove');

        // This Block returns the warning if any
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['error_image_dimension'])) {
            $data['error_image_dimension'] = $this->error['error_image_dimension'];
        } else {
            $data['error_image_dimension'] = '';
        }

        // This Block returns the error code if any
        if (isset($this->error['error_count'])) {
            $data['error_count'] = $this->error['error_count'];
        } else {
            $data['error_count'] = '';
        }

        if (isset($this->error['error_image_dimension'])) {
            $data['error_image_dimension'] = $this->error['error_image_dimension'];
        } else {
            $data['error_image_dimension'] = '';
        }

        // Making of Breadcrumbs to be displayed on site
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/recently_viewed', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('module/recently_viewed', 'token=' . $this->session->data['token'], 'SSL'); // URL to be directed when the save button is pressed

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'); // URL to be redirected when cancel button is pressed

        // This block checks, if the hello world text field is set it parses it to view otherwise get the default
        // hello world text field from the database and parse it
        if (isset($this->request->post['recently_viewed_count'])) {
            $data['recently_viewed_count'] = $this->request->post['recently_viewed_count'];
        } else {
            $data['recently_viewed_count'] = $this->config->get('recently_viewed_count');
        }
        if (isset($this->request->post['recently_viewed_image_height'])) {
            $data['recently_viewed_image_height'] = $this->request->post['recently_viewed_image_height'];
        } else {
            $data['recently_viewed_image_height'] = $this->config->get('recently_viewed_image_height');
        }if (isset($this->request->post['recently_viewed_image_width'])) {
            $data['recently_viewed_image_width'] = $this->request->post['recently_viewed_image_width'];
        } else {
            $data['recently_viewed_image_width'] = $this->config->get('recently_viewed_image_width');
        }
        // This block parses the status (enabled / disabled)
        if (isset($this->request->post['recently_viewed_status'])) {
            $data['recently_viewed_status'] = $this->request->post['recently_viewed_status'];
        } else {
            $data['recently_viewed_status'] = $this->config->get('recently_viewed_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/recently_viewed.tpl', $data));

    }

    /* Function that validates the data when Save Button is pressed */
    protected function validate() {
 
        // Block to check the user permission to manipulate the module
        if (!$this->user->hasPermission('modify', 'module/recently_viewed')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
 
        // Block to check if the recently_viewed_text_field is properly set to save into database,
        // otherwise the error is returned
        if (!$this->request->post['recently_viewed_count'] || (int)$this->request->post['recently_viewed_count'] <= 0) {
            $this->error['error_count'] = $this->language->get('error_code');
        }
        /* End Block*/
 
        // Block returns true if no error is found, else false if any error detected
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
