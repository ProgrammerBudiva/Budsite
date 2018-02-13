<?php
class ControllerInformationNews extends Controller {
	public function index() {
		$this->language->load('information/news');
		
		$this->load->model('extension/news');
	 
		$this->document->setTitle($this->language->get('heading_title')); 
	 
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('text_home'),
			'href' 		=> $this->url->link('common/home')
		);
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('heading_title'),
			'href' 		=> $this->url->link('information/news')
		);
		  
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$filter_data = array(
			'page' 	=> $page,
			'limit' => 9,
			'start' => 9 * ($page - 1),
		);
		
		$total = $this->model_extension_news->getTotalNews();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 9;
		$pagination->url = 'news?page={page}';

		$data['pagination'] = $pagination->render();
	 
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * 9) + 1 : 0, ((($page - 1) * 9) > ($total - 9)) ? $total : ((($page - 1) * 9) + 9), $total, ceil($total / 9));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_view'] = $this->language->get('text_view');
	 
		$all_news = $this->model_extension_news->getAllNews($filter_data);

		$data['all_news'] = array();
		
		$this->load->model('tool/image');
	 
		foreach ($all_news as $news) {
         			$data['all_news'][] = array (
         				'title' 		=> html_entity_decode($news['title'], ENT_QUOTES),
         				'image'			=> $this->model_tool_image->resize($news['image'], 400, 200),
         				'description' 	=> (strlen(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))) > 50 ?
                            mb_substr(strip_tags(htmlspecialchars_decode($news['short_description'], ENT_QUOTES)), 0, 50) . '...' :
                            strip_tags(htmlspecialchars_decode($news['short_description'], ENT_QUOTES))),
         				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
         				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added']))
         			);
         		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/news_list.tpl', $data));
		}
	}
 
	public function news() {
		$this->load->model('extension/news');

		$this->language->load('information/news');

        $this->load->model('extension/news_review');


		if (isset($this->request->get['news_id']) && !empty($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

        $reviews = $this->model_extension_news_review->getReviews($news_id);

		$news_meta = $this->model_extension_news->getNewsMeta($news_id);

        $this->document->setTitle($news_meta['meta_title']);
        $this->document->setDescription($news_meta['meta_description']);
        $this->document->setKeywords($news_meta['meta_keyword']);

		$news = $this->model_extension_news->getNews($news_id);

		$data['breadcrumbs'] = array();
	  
		$data['breadcrumbs'][] = array(
			'text' 			=> $this->language->get('text_home'),
			'href' 			=> $this->url->link('common/home')
		);
	  
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/news')
		);

		if ($news) {
			$data['breadcrumbs'][] = array(
				'text' 		=> $news['title'],
				'href' 		=> $this->url->link('information/news/news', 'news_id=' . $news_id)
			);
 
//			$this->document->setTitle($news['title']);
			
			$this->load->model('tool/image');
			
			$data['image'] = $this->model_tool_image->resize($news['image'], 400, 200);
 
			$data['heading_title'] = html_entity_decode($news['title'], ENT_QUOTES);
			$data['description'] = html_entity_decode($news['description'], ENT_QUOTES);
            $data['test'] = $reviews[0]['author'];
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
            $data['news_id'] = $news_id;

            $data['button_send'] = $this->language->get('button_send');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_email'] = $this->language->get('entry_email');
            $data['entry_review'] = $this->language->get('entry_review');

			$data['reviews'] = $reviews;

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/news.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' 		=> $this->language->get('text_error'),
				'href' 		=> $this->url->link('information/news', 'news_id=' . $news_id)
			);
	 
			$this->document->setTitle($this->language->get('text_error'));
	 
			$data['heading_title'] = $this->language->get('text_error');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

    public function addReview(){
        $this->load->language('information/news');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }


            if (!isset($json['error'])) {
                $this->load->model('extension/news_review');

                $this->model_extension_news_review->addReview($this->request->get['news_id'], $this->request->post);

                $json['success'] = $this->language->get('text_success');

                $to      = '19ofis96@gmail.com';
                $subject = 'Новый комментарий к статье от  ' . $this->request->post['name'];
                $message = 'Комментарий от: ' . $this->request->post['name'] . ' ' . "\r\n" . $this->request->post['text'] . "\r\n";

                $headers = 'From: info@budsite.ua' . "\r\n" .
                    'Reply-To: info@budsite.ua' . "\r\n" .
                    'Content-Type: text/plain;charset=UTF-8' . "\r\n";

                mail($to, $subject, $message, $headers);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}