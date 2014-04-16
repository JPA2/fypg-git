<?php

/**
 * IndexController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';

class Getaways_IndexController extends System_Controller_Action
{
    public $whereto = null;
    
    public $cat = null;
    
    public $interest = null;
    
    public $page;
    
    public $data = null;
    
    public $table = null;
    /*
     * (non-PHPdoc) @see System_Controller_Action::init()
     */
    public function init()
    {
        // TODO Auto-generated method stub
        parent::init();
        
        $this->table = new Getaways_Model_Getaways();
        $this->cats = new Getaways_Model_Categories();
        
        switch($this->_request->isPost()) {
            
            case true :
                
                $this->post = $this->_request->getPost();
                
                if(isset($this->post['whereto'])) {
                    $this->whereto = $this->post['whereto'];
                }
                if(isset($this->post['cat'])) {
                    $this->cat = $this->post['cat'];
                }
                if(isset($this->post['interest'])) {
                    $this->interest = $this->post['interest'];
                }
                
                break;
        }
        
        $this->stateData = file_get_contents(APPLICATION_PATH . '/data/json/stateStore.json');
    }

    /**
     * The default action - show the home page
     */
    public function indexAction()
    {
        switch($this->_request->isPost()) {
            case true :
                //Zend_Debug::dump($this->_request->getPost());
                //TODO:: Load search results from search index
                //Zend_Debug::dump($this->_request->getPost());
                
                $post = $this->_request->getPost();
                //$this->data = $this->table->fetchSortedBy($post['cat']);
                
                
                //$term = 'Zebra';
               // $this->forward('index', 'index', 'search', $post);
                //$this->data = $this->_helper->searchWidget->search($term);
                break;
            case false :
                 
                $this->data = $this->table->fetchAllGetaways($paginated = true, $page = $this->_request->page, $countPerPage = 3, $asArray = false);
                
                //$data = $getawaysTable->fetchAll();
                break;
        }
        
        $this->view->stateStore = $this->stateData;
        $this->view->data = $this->data;
        $this->view->catDropDownData = Zend_Json::encode($this->cats->fetchAllCatsForDropDown()->toArray());
        //Zend_Debug::dump(Zend_Json::encode($this->cats->fetchAllCatsForDropDown()->toArray()));
        
    }
    public function listAction()
    {
        
    }
    public function detailsAction()
    {
        
        switch(isset($this->_request->id)) {
            case true :
                //Zend_Debug::dump($this->table->fetchOne($this->_request->companyUri, $this->_request->id)->toArray());
                $data = $this->table->fetchOne($this->_request->companyUri, $this->_request->id);
                //Zend_Debug::dump($data->toArray());
                $address = '';
                $address .= $data->addrStreetOne . ', ';
                if(!empty($data->addrStreetTwo))
                {
                    $address .= $data->addrStreetTwo . ', ';
                }
                $address .= $data->addrCity . ', ';
                $address .= strtoupper($data->addrState) . ' ';
                $address .= $data->addrZip;
                //$address = '2025 Kentucky Avenue, Suite A, Birmingham, AL 35126';
                Zend_Registry::set('getawayAddress', $address);
                $this->view->data = $data;
                break;
        }

    }
    public function searchAction()
    {
    	$jsonData = new System_Model_Data();
    	if($this->_request->isPost()) {
    	
    		$index = Search_Service_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search');
    	
    		$post = $this->_request->getPost();
    		//Zend_Debug::dump($post);
    		if($post['searchState'] !== null && !empty($post['searchState']))
    		{
    			$searchState = $jsonData->getAbbreviation($post['searchState']);
    		}
    	
    		if($post['searchCat'] !== null && !empty($post['searchCat']))
    		{
    			$searchCat = $post['searchCat'];
    		}
    	
    		//multi term search
    		if(isset($searchCat) && isset( $searchState)) {
    			$hits = $index->find('"'.$searchState.'"^4 "'.$searchCat.'"');
    		}
    		elseif(isset($searchState) && !isset($searchCat)) {
    			$hits  = $index->find($searchState);
    		}
    		elseif(!isset($searchState) && isset($searchCat)) {
    			// single term search by category
    			$hits  = $index->find($searchCat);
    		}
    	
    	
    		$this->view->totalHits = count($hits);
    		$filteredHits = array();
    		$resultsArray = array();
    		foreach($hits as $i => $hit) {
    			$resultsArray[$i] = new stdClass();
    			$doc = $hit->getDocument();
    			//$fields = $doc->getFieldNames();
    			//Zend_Debug::dump($doc);
    			//die();
    			//if($fields['class']['value'] === 'Getaways_Model_Row_Getaway') {
    			foreach($doc->getFieldNames() as $field) {
    				//Zend_Debug::dump($field);
    				$resultsArray[$i]->{$field} = $hit->{$field};
    			}
    			//}
    		}
    	
    		$paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Array($resultsArray));
    	
    		//TODO: Add a app setting to control the number of results per page
    		$paginator->setItemCountPerPage(10);
    		$paginator->setCurrentPageNumber($this->_request->page);
    	
    		$this->view->paginator = $paginator;
    	
    	}
    	else {
    	
    	}
    }
}
