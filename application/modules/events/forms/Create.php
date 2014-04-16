<?php
class Events_Form_Create extends Zend_Dojo_Form
{
	public function init()
	{
		parent::init();
		
		$model = new User_Model_User();
		
		$this->setAttribs ( array (
				'id' => 'wSFO',
				'name' => 'wSFO',
				'action' => '/admin/events/create',
				'method' => 'post',
		        'style' => 'overflow: scroll;',
				'enctype' => Zend_Form::ENCTYPE_MULTIPART 
		) );
		
		$formContainer = new Zend_Dojo_Form_SubForm('mainForm');
		
		$formContainer->setDecorators(array(
		        'FormElements',
		        array('TabContainer', array(
		                'id' => 'tabContainer',
		                'style' => 'width: 1000px; height: 500px;',
		                'data-dojo-props' => array(
		                        'tabPosition' => 'top'
		                ),
		        )),
		        'DijitForm',
		));
		
		$content = new Zend_Dojo_Form_SubForm();
		//$content->setAttrib('id', 'contentOptions');
		$content->setAttribs(array(
		        'name'   => 'textboxtab',
		        'legend' => 'Content',
		));
		$content->setDecorators(array(
		        'FormElements',
		        array('HtmlTag', array('tag' => 'dl')),
		        'ContentPane',
		));
		
		$this->setAttribs ( array (
		        'id' => 'wSFO',
		        'name' => 'wSFO',
		        'action' => '/admin/events/create',
		        'method' => 'post',
		        'enctype' => Zend_Form::ENCTYPE_MULTIPART
		) );
		
		$eventId = new Zend_Form_Element_Hidden('id');
		$userId = new Zend_Form_Element_Hidden('userId');
		$step = new Zend_Form_Element_Hidden('step');
		$step->setValue(1);

		$eventId = new Zend_Form_Element_Hidden('eventId');
		
		$title = new Zend_Dojo_Form_Element_TextBox('title');
		$title->setLabel('Title');
		
		$start = new Zend_Dojo_Form_Element_DateTextBox('startDate');
		$start->setLabel('Start Date');
		$end = new Zend_Dojo_Form_Element_DateTextBox('endDate');
		$end->setLabel('End Date');
		
		
		$city = new Zend_Form_Element_Hidden('addrCity');
		//$city->setLabel('City:')
		$city->setOptions(array('size' => '20'));
		
		$zipcode = new Zend_Form_Element_Hidden('addrZip');
		//$zipcode->setLabel('Zip Code:')
		$zipcode->setOptions(array('size' => '10'));
		
		$state = new Zend_Form_Element_Hidden('addrState');
		//$state->setLabel('State:')->setMultiOptions(
		    //array('1' => 'Alabama', '2' => 'Alaska', '3' => 'Arizona'));
		
		$shipAddOne = new Zend_Form_Element_Hidden('addrStreetOne');
		//$shipAddOne->setLabel('Address 1:');
		$shipAddOne->setOptions(array('size' => '100'))
		//->setRequired(true)
		->addFilter('StringTrim');
		 
		$shipAddTwo = new Zend_Form_Element_Hidden('addrStreetTwo');
		//$shipAddTwo->setLabel('Address 2:');
		$shipAddTwo->setOptions(array('size' => '100'));
		
		
		
		$editor = new Zend_Form_Element_Textarea('eventContent');
		$editor->setAttrib('class', 'ckeditor');
		$editor->setAttrib('COLS', '100');
		
		$content->addElement($shipAddOne)
		->addElement($shipAddTwo)
		->addElement($city)
		->addElement($state)
		->addElement($zipcode);
		
		$this->addElement($step);
		
		$content->addElements(array($eventId, $userId, $title, $start, $end, $editor));
		
		$formContainer->addSubForm($content, 'contentTab');
		$this->addSubForm($formContainer, 'wSoObj');
		
		$submit = new Zend_Dojo_Form_Element_SubmitButton('submit_wSO', array('ignore' => true, 'label' => 'Save'));
		$this->addElement($submit);
	}
}

