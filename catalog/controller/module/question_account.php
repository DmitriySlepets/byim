<?php
class ControllerModuleQuestionAccount extends Controller {
	public function index() {
		if ($this->config->get('question_installed') && $this->config->get('config_page_account_status')) {			
			$data['question_status_account'] = $this->config->get('config_page_account_status');
			
			$this->load->language('information/question');
			
			$this->language_info = array(
				'text_support',
				'text_my_question',
			);
			
			foreach ($this->language_info as $language) {
				$data[$language] = $this->language->get($language);
			}
			
			$data['my_question'] = $this->url->link('module/question_account/my_question', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/question_account.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/question_account.tpl', $data);
			} else {
				return $this->load->view('default/template/module/question_account.tpl', $data);
			}
		}
	}
	
	public function my_question() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('module/question_account/my_question', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		
		$this->document->addStyle('catalog/view/javascript/summernote/question.css');
		
		$this->load->language('information/question');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_my_question'),
			'href'      => $this->url->link('module/question_account/my_question', '', 'SSL')
		);
		
		$this->language_info = array(
			'text_my_question',
			'text_empty',
			'text_answer',
			'entry_question',
			'column_date_added',
			'column_category',
			'column_subject',
			'column_product',
			'button_back',
			'button_add',
		);
			
		foreach ($this->language_info as $language) {
			$data[$language] = $this->language->get($language);
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if ($this->config->get('config_page_account_limit')) {
			$limit = $this->config->get('config_page_account_limit');
		} else {
			$limit = 5;
		}
		
		$customer_id = $this->customer->getId();
		
		$data['questions'] = array();
			
		$question_total = $this->getTotalQuestionsByCustomerId($customer_id);

		$results = $this->getQuestionsByCustomerId($customer_id, ($page - 1) * $limit, $limit);
		
		foreach ($results as $result) {
			$category_id = $result['question_category'];
			
			if ($category_id) {
				$category_name = $this->getPath($result['question_category']);
			} else {
				$category_name = $this->language->get('text_no_category');
			}
			
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			
			if ($result['product_id']) {
				$product_info = $this->model_catalog_product->getProduct($result['product_id']);
				$product_href = $this->url->link('product/product', 'product_id=' . $result['product_id']);
				$product_image = $this->model_tool_image->resize($product_info['image'], 30, 30);
				$product_name = $product_info['name'];
			} else {
				$product_info = false;
				$product_name = $this->language->get('text_no_product');
				$product_href = '';
				$product_image = '';
			}
				
			$data['questions'][] = array(
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'category' 		=> $category_name,
				'subject' 	   	=> $result['subject'],
				'product_id' 	=> $result['product_id'],
				'product_href'  => $product_href,
				'product_image' => $product_image,
				'product' 		=> $product_name,
				'text_question'	=> html_entity_decode($result['text_question'], ENT_QUOTES, 'UTF-8'),
				'text_answer'	=> html_entity_decode($result['text_answer'], ENT_QUOTES, 'UTF-8')
			);
		}

		$pagination = new Pagination();
		$pagination->total = $question_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('module/question_account/my_question', 'customer_id=' . $customer_id . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($question_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($question_total - $limit)) ? $question_total : ((($page - 1) * $limit) + $limit), $question_total, ceil($question_total / $limit));
		
		$data['back'] = $this->url->link('account/account', '', 'SSL');
		
		$data['page_account_customer_status'] = $this->config->get('config_page_account_customer_status');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/my_question.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/my_question.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/my_question.tpl', $data));
		}
	}
	
	public function getQuestionsByCustomerId($customer_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "question WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}
	
	public function getTotalQuestionsByCustomerId($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "question WHERE customer_id = '" . (int)$customer_id . "'");
		
		return $query->row['total'];
	}
	
	public function getCategories($parent_id = 0) {
		$category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "question_category WHERE parent_id = '" . (int)$parent_id . "' ORDER BY sort_order, name ASC");
		
		foreach ($query->rows as $result) {
			$category_data[] = array(
				'category_id' => $result['category_id'],
				'name'        => $this->getPath($result['category_id']),
				'status'  	  => $result['status'],
				'sort_order'  => $result['sort_order']
			);
			
			$category_data = array_merge($category_data, $this->getCategories($result['category_id']));
		}	
		
		return $category_data;
	}
		
	public function getPath($category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "question_category WHERE category_id = '" . (int)$category_id . "' ORDER BY sort_order, name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getPath($query->row['parent_id']) . '&nbsp;&nbsp;&gt;&nbsp;&nbsp;' . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}	
}