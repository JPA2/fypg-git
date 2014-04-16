<?php
class User_Form_PostLocation extends Zend_Dojo_Form
{
	public function init()
	{
		$element = new Zend_Form_Element_Hidden('step');
		$element->setValue('1');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('userId');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('addrStreetOne');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('addrStreetTwo');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('addrCity');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('addrState');
		$this->addElement($element);
		
		$element = new Zend_Form_Element_Hidden('addrZip');
		$this->addElement($element);
		
		$submit = new Zend_Dojo_Form_Element_SubmitButton('postLocation');
		$this->addElement($submit);
	}
}