<?php
class Getaways_Model_Categories extends System_Db_Categories
{
   public function init() {
       parent::init();
       //$this->setDependentTables(array('Icons_Model_Categories'));
   }
    
   protected $_name = 'categories';
   protected $_primary = 'categoryId';
   protected $_sequence = true;
   
   //protected $_dependentTables = array('Getaways_Model_CategoryIcons');
   
   public function fetchGetawayCategoriesIcons($categoryId) 
   {
       $q = $this->select()->from($this->_name, array('categoryId', 'categoryName', 'parentId', 'icon'))->where('categoryId = ?', $categoryId);
       return $this->fetchAll($q);
   }
   public function fetchAllForMultiCheckbox()
   {
       $data = null;
       $cats = $this->fetchAll();
       
       $icons = array();
       
       foreach($cats as $row) {
           
           Zend_Debug::dump($row->findDependentRowset('Getaways_Model_CategoryIcons', 'CatIcons')->toArray());
           
       }
       //Zend_Debug::dump($icons->toArray());
       
       //Zend_Debug::dump($cats);
       
       return $data;
   }
   public function fetchCatNameById($id) 
   {
       $q = $this->select()->from($this->_name, array ('categoryId','categoryName'))->where('categoryId = ?', $id);
       
       $result = $this->fetchRow($q);
       
       return $result->categoryName;
   }
   public function fetchAllCatsForDropDown() {
       $q = $this->select()->from($this->_name, array ('key' => 'categoryId', 'value' => 'categoryName'))->where('parentId = ?', '7')->orWhere('parentId = ?', '4');
       return $this->fetchAll($q);
   }
   public function fetchAllByType($type, $categoryRootId = '7', $interestRootId = '4') {
       
       switch ($type) {
           case 'Categories' :
               $q = $this->select()->from($this->_name, array ('key' => 'categoryId', 'value' => 'categoryName'))->where('parentId = ?', $categoryRootId);
               return $this->fetchAll($q);
           break;
           
           case 'Interest' :
               $q = $this->select()->from($this->_name, array ('key' => 'categoryId', 'value' => 'categoryName'))->where('parentId = ?', $interestRootId);
               return $this->fetchAll($q);
           break;
       }
   }

}