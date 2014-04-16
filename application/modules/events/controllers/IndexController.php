<?php

/**
 * IndexController
 * 
 * @author
 * @version 
 */
require_once 'System/Controller/Action.php';
class Events_IndexController extends System_Controller_Action {
	public function init() {
		parent::init();
		$userArg = $this->_request->user;
		//$this->table = new Zend_Db_Table('events');
		$this->table = new Events_Model_Events();
		$userModel = new User_Model_User();
	   //$this->userArgId = $userModel->fetchRow($userModel->select()->where('companyName =?', $userArg));
		if($this->isMobile) {
			$ajaxContext = $this->_helper->getHelper('AjaxContext');
        	$ajaxContext->addActionContext('index', 'html')
                    	->addActionContext('display', 'html')
                    	->addActionContext('search', 'html')
                    	->initContext();
		}
	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		// TODO Auto-generated IndexController::indexAction() default action
		
		
		$data = $this->table->fetchAllEvents($paginated = true, $page = $this->_request->page, $countPerPage = 3, $asArray = false);
		$this->view->data = $data;
		
		$this->view->form = new Events_Form_Search();
	}
	public function displayAction()
	{
	    $event = $this->table->fetch($this->_request->id);
	    $this->view->event = $event;
	    //Zend_Debug::dump($event->toArray());
	}
	public function searchAction()
	{
		$form = new Events_Form_Search();
		if($this->_request->isPost()) 
		{
			if($form->isValid($this->_request->getPost()))
			{
				$post = $this->_request->getPost();
				$start = $post['startDate'];
				$end = $post['endDate'];
				$from = new Zend_Search_Lucene_Index_Term($start, 'startDate');
				$to   = new Zend_Search_Lucene_Index_Term($end, 'startDate');
				$query = new Zend_Search_Lucene_Search_Query_Range($from, $to, true);
				$index = Search_Service_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search');
				$hits = $index->find($query);
				//Zend_Debug::dump($hits);
				$this->view->totalHits = count($hits);
				$filteredHits = array();
				$resultsArray = array();
				foreach($hits as $i => $hit) {
					$resultsArray[$i] = new stdClass();
					$doc = $hit->getDocument();
					foreach($doc->getFieldNames() as $field) {
						$resultsArray[$i]->{$field} = $hit->{$field};
					}
				}
				$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Array($resultsArray));
				//TODO: Add a app setting to control the number of results per page
				$paginator->setItemCountPerPage(10);
				$paginator->setCurrentPageNumber($this->_request->page);
				$this->view->paginator = $paginator;
			}
			
		}
		else {
			
		}
	}
}
