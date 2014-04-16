<?php
class Getaways_Model_Getaways extends System_Model_Core
{
	protected $_name = 'getaways';
	protected $_primary ='id'; 
	protected $_sequence = true;
	protected $_rowClass = 'Getaways_Model_Row_Getaway';
	protected $_cats = array();
	protected $_interest = array();
	
	protected $_referenceMap = array(
	        'Getaways' => array(
	                'columns' => array('userId'),
	                'refTableClass' => 'User_Model_User',
	                'refColumns' => array('userId'),
	                'onDelete'   => self::CASCADE
	        )
// 	        'ByCategory' => array(
// 	                'columns' => array('id'),
// 	                'refTableClass' => 'Getaways_Model_GetawaysCategories',
// 	                'refColumns' => array('getawayId'),
// 	                'onDelete'   => self::CASCADE
// 	        )
	        
	);
	
	protected $_dependentTables = array('Getaways_Model_Categories', 'Getaways_Model_GetawaysCategories');
	
	public function fetchOne($companyUri = null, $id) {
	    $q = $this->select(true)
	    //->where('companyUri = ?', $companyUri)
	    ->where('id = ?', $id);
	    return $this->fetchRow($q);
	}
	public function fetchSortedBy($categoryId = '0')
	{
	    $categoryLookup = new Getaways_Model_GetawaysCategories();
	    
	    $lookupResult = $categoryLookup->fetchAllByCatId($categoryId);
	    //Zend_Debug::dump($lookupResult->toArray());
	    //$q = $this->select()->from($this->_name, array('*'))->where('id = ?');
	    
	    
	    //return $this->fetchAll($q);
	}
	public function fetchAllGetaways($paginated = true, $page = 1, $countPerPage = 10, $asArray = false) {
	
	    $q = $this->select()->from($this->_name);
	
	    switch($paginated) {
	        case true :
	            $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));
	            $paginator->setItemCountPerPage($countPerPage);
	            $paginator->setCurrentPageNumber($page);
	            return $paginator;
	            break;
	        case false :
	            if(!$asArray) {
	                return $this->fetchAll($q);
	            }
	            else {
	                return $this->fetchAll($q)->toArray();
	            }
	            break;
	    }
	
	}
	public function fetchGetawaysByUser($paginated = true, $page = 1, $countPerPage = 10, $asArray = false, $userId) {
	
	    $q = $this->select()->from($this->_name)->where('userId = ?', $userId);
	
	    switch($paginated) {
	        case true :
	            $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));
	            $paginator->setItemCountPerPage($countPerPage);
	            $paginator->setCurrentPageNumber($page);
	            return $paginator;
	            break;
	        case false :
	            if(!$asArray) {
	                return $this->fetchAll($q);
	            }
	            else {
	                return $this->fetchAll($q)->toArray();
	            }
	            break;
	    }
	
	}
	
	public function fetchRecentGetaways($userId) {
	    $q = $this->select()->from($this->_name)->where('userId = ?', $userId)->order('id DESC')->limit(4, 0);
	    return $this->fetchAll($q);
    }

}