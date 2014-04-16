<?php
class Getaways_Model_GetawaysCategories extends System_Model_Core
{
    protected $_name = 'getaways_by_categories';
    protected $_primary = 'recordId';
    protected $_sequence = true;
    
    protected $_referenceMap = array(
            'GetawayByCategories' => array(
                    'columns' => array('getawayId'),
                    'refTableClass' => 'Getaways_Model_Getaways',
                    'refColumns' => array('id'),
                    'onDelete'   => self::CASCADE
            )
            // 	        'ByCategory' => array(
                    // 	                'columns' => array('id'),
                    // 	                'refTableClass' => 'Getaways_Model_GetawaysCategories',
                    // 	                'refColumns' => array('getawayId'),
                    // 	                'onDelete'   => self::CASCADE
                    // 	        )
    	    
    );
    
    public function fetchAllByCatId($categoryId) 
    {
        $q = $this->select()->from($this->_name, array('getawayId'))->where('categoryId = ?', $categoryId);
        
        
        return $this->fetchAll($q);
    }
    
    public function setGetawaysByCategories($section) {
        
         if (isset($section)) {
         $array = array();
         foreach ($section as $key => $value) {
             if ($value == true) {
                 $getawayCatsRow = $this->fetchNew();
                 $getawayCatsRow->categoryId = $key;
             }
             continue;
         }
         
         }
         
    }
    public function fetchSearchIndexData($getawayId) {
        $cats = new Getaways_Model_Categories();
        
        $q = $this->select()->from($this->_name, array('*'))->where('getawayId = ?', $getawayId);
        
        $ids = $this->fetchAll($q);
        
        
        //Zend_Debug::dump($ids->toArray(), ' ids from lookup table');
        $catArray = array();
        
        foreach($ids as $row) {
            $catArray[] = $cats->fetchCatNameById($row->categoryId);
            continue;
        }
        
        //Zend_Debug::dump($catArray, ' array of names');
        //die(__FILE__ . '::'. __LINE__);
        $searchString = implode(',', $catArray);
        //Zend_Registry::set('categorySearchString', $searchString);
        //die($searchString);
        return $searchString;
    }
    public function fetchCategoriesByGetaway($getawayId) {
        $q = $this->select()->from($this->_name, array('*'))->where('getawayId = ?', $getawayId);
        
        return $this->fetchAll($q);
        
    }
    
}