<?php
class ControllerCatalogCatapulta extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/catapulta');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/catapulta');

		$this->getList();
	}

	public function delete() {
		$this->load->language('catalog/catapulta');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/catapulta');

		if ((isset($this->request->post['selected']) || isset($this->request->get['order_id'])) && ($this->validateDelete())) {
			if (isset($this->request->get['order_id'])) {
				$this->model_catalog_catapulta->deleteOrder($this->request->get['order_id']);
			} else {
				foreach ($this->request->post['selected'] as $order_id) {
					$this->model_catalog_catapulta->deleteOrder($order_id);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->response->redirect($this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		$data['heading_title'] = $this->language->get('heading_title');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_contact'])) {
			$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_product_name'])) {
			$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];

		$data['module_install'] = $this->model_catalog_catapulta->tableExists();

		if ($data['module_install']) {
			if (isset($this->request->get['filter_order_id'])) {
				$filter_order_id = $this->request->get['filter_order_id'];
			} else {
				$filter_order_id = null;
			}

			if (isset($this->request->get['filter_contact'])) {
				$filter_contact = $this->request->get['filter_contact'];
			} else {
				$filter_contact = null;
			}

			if (isset($this->request->get['filter_product_name'])) {
				$filter_product_name = $this->request->get['filter_product_name'];
			} else {
				$filter_product_name = null;
			}

			if (isset($this->request->get['filter_total'])) {
				$filter_total = $this->request->get['filter_total'];
			} else {
				$filter_total = null;
			}

			if (isset($this->request->get['filter_date_added'])) {
				$filter_date_added = $this->request->get['filter_date_added'];
			} else {
				$filter_date_added = null;
			}

			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'order_id';
			}

			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
			} else {
				$order = 'DESC';
			}

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			$data['delete'] = $this->url->link('catalog/catapulta/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

			$data['orders'] = array();

			$data = array(
				'filter_order_id' => $filter_order_id,
				'filter_contact' => $filter_contact,
				'filter_product_name' => $filter_product_name,
				'filter_total' => $filter_total,
				'filter_date_added' => $filter_date_added,
				'sort' => $sort,
				'order' => $order,
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
			);

			$order_total = $this->model_catalog_catapulta->getTotalOrders($data);

			$results = $this->model_catalog_catapulta->getOrders($data);

			foreach ($results as $result) {
				$action = array();

				$url .= '&order_id=' . $result['order_id'];

				$action[] = array(
					'text' => $this->language->get('button_delete'),
					'href' => $this->url->link('catalog/catapulta/delete', 'token=' . $this->session->data['token'] . $url, 'SSL')
				);

				$data['orders'][] = array(
					'order_id' => $result['order_id'],
					'contact' => $result['contact'],
					'product_name' => $result['product_name'],
					'product_href' => $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, 'SSL'),
					'total' => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
					'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'selected' => isset($this->request->post['selected']) && in_array($result['order_id'], $this->request->post['selected']),
					'action' => $action
				);
			}

			$data['text_no_results'] = $this->language->get('text_no_results');

			$data['column_order_id'] = $this->language->get('column_order_id');
			$data['column_contact'] = $this->language->get('column_contact');
			$data['column_product_name'] = $this->language->get('column_product_name');
			$data['column_total'] = $this->language->get('column_total');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_action'] = $this->language->get('column_action');

			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_filter'] = $this->language->get('button_filter');

			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if ($order == 'ASC') {
				$url .= '&order=DESC';
			} else {
				$url .= '&order=ASC';
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$data['sort_order'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . '&sort=order_id' . $url, 'SSL');
			$data['sort_contact'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . '&sort=contact' . $url, 'SSL');
			$data['sort_product_name'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . '&sort=product_name' . $url, 'SSL');
			$data['sort_total'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . '&sort=total' . $url, 'SSL');
			$data['sort_date_added'] = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$pagination = new Pagination();
			$pagination->total = $order_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_admin_limit');
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('catalog/catapulta', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

			$data['pagination'] = $pagination->render();

			$data['filter_order_id'] = $filter_order_id;
			$data['filter_contact'] = $filter_contact;
			$data['filter_product_name'] = $filter_product_name;
			$data['filter_total'] = $filter_total;
			$data['filter_date_added'] = $filter_date_added;

			$data['sort'] = $sort;
			$data['order'] = $order;
		} else {
			$data['text_module_not_exists'] = $this->language->get('text_module_not_exists');
		}

		$this->template = 'catalog/catapulta_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_product_name'])) {
			$this->load->model('catalog/product');

			if (isset($this->request->get['filter_product_name'])) {
				$filter_name = $this->request->get['filter_product_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}			

			$data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/catapulta')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}

?>
