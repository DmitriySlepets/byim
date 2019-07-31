<?php
class ControllerModuleQuestion extends Controller {
	public function index() {
		if ($this->config->get('question_installed') && $this->config->get('config_page_product_status')) {
			
			$data['question_status'] = $this->config->get('config_page_product_status');
			
			$data['page_product_customer_status'] = $this->config->get('config_page_product_customer_status');
			
			if (!$this->customer->isLogged() && $this->config->get('config_page_product_customer_logged_status') == 0) {
				$data['page_product_customer_logged_status'] = false;
			} else {
				$data['page_product_customer_logged_status'] = true;
			}
			
			$this->load->language('information/question');
			
			$this->language_info = array(
				'button_add',
			);
			
			foreach ($this->language_info as $language) {
				$data[$language] = $this->language->get($language);
			}
			
			$data['text_question_logged'] = sprintf($this->language->get('text_question_logged'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			
			$data['product_id'] = (int)$this->request->get['product_id'];
			
			$data['questions'] = $this->getTotalQuestionsByProductId($this->request->get['product_id']);
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/question.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/question.tpl', $data);
			} else {
				return $this->load->view('default/template/module/question.tpl', $data);
			}
		}
	}
	
	public function info() {
			$this->load->language('information/question');
			
			$this->language_info = array(
				'text_category',
				'text_all',
				'text_no_category',
				'text_subject',
				'text_questioner',
				'text_date_added',
				'text_question_category',
				'text_question_subject',
				'text_no_question',
				'text_author',
				'text_answer',
				'text_new_question',
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
			
			if ( $this->config->get('config_page_product_limit')) {
				$limit = $this->config->get('config_page_product_limit');
			} else {
				$limit = 5;
			}

			$data['questions'] = array();
			
			$question_total = $this->getTotalQuestionsByProductId($this->request->get['product_id']);

			$results = $this->getQuestionsByProductId($this->request->get['product_id'], ($page - 1) * $limit, $limit);

			foreach ($results as $result) {
				$category_id = $result['question_category'];
			
				if ($category_id) {
					$category_name = $this->getPath($result['question_category']);
				} else {
					$category_name = $this->language->get('text_no_category');
				}
				
				$data['questions'][] = array(
					'questioner'    => $result['questioner'],
					'date_added' 	=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'category' 		=> $category_name,
					'subject' 	   	=> $result['subject'],
					'text_question'	=> html_entity_decode($result['text_question'], ENT_QUOTES, 'UTF-8'),
					'text_answer'	=> html_entity_decode($result['text_answer'], ENT_QUOTES, 'UTF-8')
				);
			}

			$pagination = new Pagination();
			$pagination->total = $question_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('module/question/info', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($question_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($question_total - $limit)) ? $question_total : ((($page - 1) * $limit) + $limit), $question_total, ceil($question_total / $limit));
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/question_info.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/question_info.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/question_info.tpl', $data));
			}
	}
	
	public function getQuestionsByProductId($product_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "question WHERE product_id = '" . (int)$product_id . "' AND status = '1' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}
	
	public function getTotalQuestionsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "question WHERE product_id = '" . (int)$product_id . "' AND status = '1'");
		
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