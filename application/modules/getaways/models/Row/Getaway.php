<?php
class Getaways_Model_Row_Getaway extends System_Model_Row_Searchable
{
    protected $_categories;
    protected $_tableClass = 'Getaways_Model_Getaways';
    /* (non-PHPdoc)
     * @see System_Model_Row_Searchable::getSearchIndexFields()
     */
    public function init(){
       parent::init();
    }
    /**
     * Set row field value
     *
     * @param  string $columnName The column key.
     * @param  mixed  $value      The value for the property.
     * @return void
     * @throws Zend_Db_Table_Row_Exception
     */
    public function __set($columnName, $value)
    {
        $columnName = $this->_transformColumn($columnName);
        
        if($columnName === 'categories') {
            $this->_categories = $value;
            return;
        }
        elseif (!array_key_exists($columnName, $this->_data)) {
            require_once 'Zend/Db/Table/Row/Exception.php';
            throw new Zend_Db_Table_Row_Exception("Specified column \"$columnName\" is not in the row");
        }
        
        $this->_data[$columnName] = $value;
        $this->_modifiedFields[$columnName] = true;
    }
    public function getSearchIndexFields(Zend_Db_Table_Abstract $related = null) 
    {        
        
        $fields['class'] = __CLASS__;
        $fields['key'] = $this->_data['id'];
        $fields['docRef'] = $fields['class'].':'.$fields['key'];
        $fields['url'] = '/getaways/details/'.$this->_data['id'];
        $fields['title'] = $this->_data['title'];
        $fields['content'] = $this->tagFilter->filter($this->_data['content']);
        $fields['summary'] = substr($fields['content'], 0, 300);
        $fields['createdBy'] = $this->_data['userId'];
        $fields['startDate'] = $this->_data['startDate'];
        $fields['endDate'] = $this->_data['endDate'];
        $fields['getawayUrl'] = $this->_data['getawayUrl'];
        $fields['addrStreetOne'] = $this->_data['addrStreetOne'];
        $fields['addrStreetTwo'] = $this->_data['addrStreetTwo'];
        $fields['addrState'] = $this->_data['addrState'];
        $fields['addrCity'] = $this->_data['addrCity'];
        $fields['addrZip'] = $this->_data['addrZip'];

        $fields['categories'] = $this->_categories;
        
        return $fields;
    }
}