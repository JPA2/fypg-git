<?php
class Events_Model_Row_Event extends System_Model_Row_Searchable
{
	protected $_tableClass = 'Events_Model_Events';
	
	public function init()
	{
		parent::init();
	}

	public function getSearchIndexFields(Zend_Db_Table_Abstract $related = null) {
		// TODO Auto-generated method stub
		$trim = new Zend_Filter_StringTrim();
		$newLines = new Zend_Filter_StripNewlines();
		$content = $newLines->filter($this->_data['eventContent']);
		$content = $trim->filter($this->_data['eventContent']);
		$fields['class'] = __CLASS__; 
		$fields['key'] = $this->_data['id'];
		$fields['docRef'] = $fields['class'].':'.$fields['key'];
		$fields['title'] = $this->_data['title'];
		$fields['eventContent'] = $content;
		//Zend_Debug::dump($this->_data);
		//die();
		$fields['content'] = $content;
		$fields['startDate'] = $this->_data['startDate'];
		$fields['endDate'] = $this->_data['endDate'];
		$fields['url'] = '/events/display/'.$this->_data['id'];
		$fields['addrStreetOne'] = $this->_data['addrStreetOne'];
		$fields['addrStreetTwo'] = $this->_data['addrStreetTwo'];
		$fields['addrState'] = $this->_data['addrState'];
		$fields['addrCity'] = $this->_data['addrCity'];
		$fields['addrZip'] = $this->_data['addrZip'];
		
		//$fields['categories'] = $this->_categories;
		
		return $fields;
	}

}