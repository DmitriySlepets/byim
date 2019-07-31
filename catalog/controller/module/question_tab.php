<?php
class ControllerModuleQuestionTab extends Controller {
	public function index() {
		if ($this->config->get('question_installed') && $this->config->get('config_page_product_status')) {
			$this->load->language('information/question');
			
			if (isset($this->request->get['product_id'])) {
				$product_id = (int)$this->request->get['product_id'];
			} else {
				$product_id = 0;
			}
			
			$data['question_status'] = $this->config->get('config_page_product_status');
			
			$data['tab_question'] = sprintf($this->language->get('tab_question'), $this->getTotalQuestionsByProductId($product_id));

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/question_tab.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/question_tab.tpl', $data);
			} else {
				return $this->load->view('default/template/module/question_tab.tpl', $data);
			}
		}
	}
	
	public function getTotalQuestionsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "question WHERE product_id = '" . (int)$product_id . "' AND status = '1'");
		
		return $query->row['total'];
	}
}