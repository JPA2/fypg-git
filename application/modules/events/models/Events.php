<?php
class Events_Model_Events extends System_Model_Core
{
	protected $_name = 'events';
	protected $_primary ='id'; 
	protected $_sequence = true;
	protected $_rowClass = 'Events_Model_Row_Event';
	
	protected $_referenceMap = array(
	        'Events' => array(
	                'columns' => array('userId'),
	                'refTableClass' => 'User_Model_User',
	                'refColumns' => array('userId'),
	                'onDelete'   => self::CASCADE
	        )
	);
	
	public function fetch($id) {
	    $sql = $this->select()->from($this->_name)->where('id = ?', $id);
	    return $this->fetchRow($sql);
	}
	public function fetchByUser($userId) {
	    $sql = $this->select()->from($this->_name)->where('userId = ?', $userId);
	    return $this->fetchAll();
	}
	
	public function fetchAllEvents($paginated = true, $page = 1, $countPerPage = 10, $asArray = false) {
	
	    $q = $this->select()->from($this->_name);
	
	    switch($paginated) {
	        case true :
	            $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($q));
	            
	            if(Zend_Registry::get('isMobile')) {
	            	$totalItems = $paginator->getTotalItemCount();
	            	$paginator->setItemCountPerPage($totalItems);
	            }
	            else {
	            	$paginator->setItemCountPerPage($countPerPage);
	            }
	            
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
	
	public function fetchEventsByUser($paginated = true, $page = 1, $countPerPage = 10, $asArray = false, $userId) {
	
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
}