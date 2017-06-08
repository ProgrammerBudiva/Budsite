<?php  
class ControllerModuleNews extends Controller {
	public function index() {
		$this->language->load('module/news');
		$this->load->model('extension/news');
		
		$filter_data = array(
			'page' => 1,
			'limit' => 3,
			'start' => 0,
		);
	 
		$data['heading_title'] = $this->language->get('heading_title');
		$data['link'] = $this->url->link('information/news');
	 
		$all_news = $this->model_extension_news->getAllNews($filter_data);
	 
		$data['all_news'] = array();

        $this->load->model('tool/image');

        foreach ($all_news as $news) {
            if($news['image']){
                $image = $this->model_tool_image->resize($news['image'], $this->config->get('news_image_width'), $this->config->get('news_image_height'));
            } else {
                $image = false;
            }
			$data['all_news'][] = array (
				'title' 		=> html_entity_decode($news['title'], ENT_QUOTES),
				'description' 	=> (strlen(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))) > 50 ? substr(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES)), 0, 100) . '...' : strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added'])),
                'image'         => $image,
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/news.tpl', $data);
		} else {
			return $this->load->view('default/template/module/news.tpl', $data);
		}
	}
}