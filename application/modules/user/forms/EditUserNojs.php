<?php
class User_Form_EditUserNojs extends Zend_Form
{
	public function init(){
		
	$ident = Zend_Auth::getInstance()->getIdentity();
	$this->setMethod('post');
	$this->setAttrib('class', 'ajaxForm');
	
	
	$page = new Zend_Form_Element_Hidden('page');
	
	$cmd= new Zend_Form_Element_Hidden('cmd');
	$cmd->setValue('editUser');
	
	$userid = new Zend_Form_Element_Hidden('userId');
	
	
	
	$roles = new User_Model_Roles();
	$role = new Zend_Form_Element_Select('role');
	//$role->setRequired(true);
	$role->setLabel('User Role');
	//$customRoles = array("6" => 'Bronze', "7" => 'Silver', "8" => 'Gold');
	$role->setMultiOptions($roles->fetchAllRoles());
	
	 
	$username = new Zend_Form_Element_Text('userName');
	$username->setLabel('User Name (Used for login):')
	->setOptions(array('size' => '30'))
	->setRequired(true)
	//->addValidator('Alnum')
	//->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	
	$firstname = new Zend_Form_Element_Text('firstName');
	$firstname->setLabel('First Name:')
	->setOptions(array('size' => '30'))
	//->setRequired(true)
	//->addValidator('Alnum')
	//->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	$lastname = new Zend_Form_Element_Text('lastName');
	$lastname->setLabel('Last Name:')
	->setOptions(array('size' => '30'))
	//->setRequired(true)
	//->addValidator('Alnum')
	//->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	
	$company = new Zend_Form_Element_Text('companyName');
	$company->setLabel('Company Name:')
	->setOptions(array('size' => '100'))
	->setRequired(true)
	//->addValidator('Alnum')
	//->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	

	
	$email = new Zend_Form_Element_Text('email');
	$email->setLabel('Email Address:');
	$email->setOptions(array('size' => '50'))
	//->setRequired(true)
	->addValidator('NotEmpty', true)
	->addValidator('EmailAddress', true)
	//->addFilter('HTMLEntities')
	->addFilter('StringToLower')
	->addFilter('StringTrim');
	
	$city = new Zend_Form_Element_Text('addrCity');
	$city->setLabel('City:')
	->setOptions(array('size' => '20'))
	//->setRequired(true)
	->addValidator('Alnum')
	->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	
	$zipcode = new Zend_Form_Element_Text('addrZip');
	$zipcode->setLabel('Zip Code:')
	->setOptions(array('size' => '10'))
	//->setRequired(true)
	//->addValidator('Alnum')
	->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	
	$state = new Zend_Form_Element_Select('addrState');
	$state->setLabel('State:')->setMultiOptions(
			array('1' => 'Alabama', '2' => 'Alaska', '3' => 'Arizona'));
	
	$status = new Zend_Form_Element_Select('uStatus');
	$status->setLabel('Status:')->setMultiOptions(array('disabled' => 'Disabled', 'enabled' => 'Enabled'));
	
	$shipAddOne = new Zend_Form_Element_Text('addrStreetOne');
	$shipAddOne->setLabel('Address 1:');
	$shipAddOne->setOptions(array('size' => '100'))
	//->setRequired(true)
	->addValidator('NotEmpty', true)
	->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	 
	$shipAddTwo = new Zend_Form_Element_Text('addrStreetTwo');
	$shipAddTwo->setLabel('Address 2:');
	$shipAddTwo->setOptions(array('size' => '100'))
	//->setRequired(true)
	//->addValidator('NotEmpty', true)
	->addFilter('HtmlEntities')
	->addFilter('StringTrim');
	/*$password = $this->createElement('password', 'password');
	 $password->setLabel('Password:');
	$password->setRequired(true);
	$password->addValidator(new Zend_Validate_StringLength(6, 12));
	$password->setAttrib('class', 'txt');
	$confirmPassword = $this->createElement('password', 'confirm_password');
	$confirmPassword->setLabel('Confirm Password:');
	$confirmPassword->setRequired(true);
	$confirmPassword->addValidator(new Zend_Validate_StringLength(6, 12));
	$confirmPassword->addValidator(
			new Zend_Validate_Identical(
					Zend_Controller_Front::getInstance()->getRequest()
					->getParam('password')));*/
	// create submit button
	$submit = new Zend_Form_Element_Submit('save');
	$submit->setLabel('Submit')->setOptions(array('class' => 'submit'));
	// attach elements to form
	//$this->addElement($groupid)
	$this->addElement($userid)
	->addElement($cmd)
	->addElement($page)
	->addElement($role)
	->addElement($company)
	//->addElement($companyUri)
	// ->addElement($hiddengroupid)
	->addElement($status)
	->addElement($username)
	->addElement($firstname)
	->addElement($lastname)
	->addElement($email)
	//->addElement($shipAddOne)
	//->addElement($shipAddTwo)
	//->addElement($city)
	//->addElement($state)
	//->addElement($zipcode)
	//->addElement($password)
	//->addElement($confirmPassword)
	->addElement($submit);
	}
}