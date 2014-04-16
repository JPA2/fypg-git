 <?php
class Getaways_Form_Create extends Zend_Dojo_Form
{
	public function init()
	{
	    // accomodations.png
		parent::init();
		
		$model = new User_Model_User();
		
		$settings = Zend_Registry::get('appSettings');
		
		$this->setAttrib('enctype', 'multipart/form-data');
		$this->setMethod('post');
		
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
		
		$categories = new Zend_Dojo_Form_SubForm();
		$categories->setAttribs(array(
		        'name'   => 'textboxtab',
		        'legend' => 'Categories',
		));
		$categories->setDecorators(array(
		        'FormElements',
		        array('HtmlTag', array('tag' => 'dl')),
		        'ContentPane',
		));
		
		$interests = new Zend_Dojo_Form_SubForm();
		$interests->setAttribs(array(
		        'name'   => 'textboxtab',
		        'legend' => 'Interests',
		));
		$interests->setDecorators(array(
		        'FormElements',
		        array('HtmlTag', array('tag' => 'dl')),
		        'ContentPane',
		));
		
		$this->setAttribs ( array (
				'id' => 'wSFO',
				'name' => 'wSFO',
				'action' => '/admin/getaways/create',
				'method' => 'post',
				'enctype' => Zend_Form::ENCTYPE_MULTIPART 
		) );
		
// 		$list = new Zend_Dojo_Form_Element_FilteringSelect('userId');
// 		$list->setLabel('Select Company');
// 		$list->setMultiOptions($model->fetchUserDropDownList());
		
// 		$content->addElement($list);

		$eventId = new Zend_Form_Element_Hidden('id');
		$eventId->setValue(null);
		
		
		$userId = new Zend_Form_Element_Hidden('userId');
		$step = new Zend_Form_Element_Hidden('step');
		
		$title = new Zend_Dojo_Form_Element_TextBox('title');
		$title->setLabel('Title');
		
		$getawayUrl = new Zend_Dojo_Form_Element_TextBox('getawayUrl');
		$getawayUrl->setLabel('Getaway Link');
		
		$start = new Zend_Dojo_Form_Element_DateTextBox('startDate');
		$start->setLabel('Start Date');
		
		$end = new Zend_Dojo_Form_Element_DateTextBox('endDate');
		$end->setLabel('End Date');		
		
		$city = new Zend_Form_Element_Hidden('addrCity');
		//$city->setLabel('City:')
		$city->setOptions(array('size' => '20'))
		//->setRequired(true)
		//->addValidator('Alnum')
		->addFilter('HtmlEntities')
		->addFilter('StringTrim');
		
		$zipcode = new Zend_Form_Element_Hidden('addrZip');
		//$zipcode->setLabel('Zip Code:')
		$zipcode->setOptions(array('size' => '10'))
		//->setRequired(true)
		//->addValidator('Alnum')
		//->addFilter('HtmlEntities')
		//->addFilter('StringTrim')
		;
		
		$state = new Zend_Form_Element_Hidden('addrState');
		//$state->setLabel('State:');
		
		$shipAddOne = new Zend_Form_Element_Hidden('addrStreetOne');
		//$shipAddOne->setLabel('Address 1:');
		$shipAddOne->setOptions(array('size' => '100'))
		// ->setRequired(true)
		//->addValidator('NotEmpty', true)
		//->addFilter('HtmlEntities')
		//->addFilter('StringTrim')
		;
		 
		$shipAddTwo = new Zend_Form_Element_Hidden('addrStreetTwo');
		//$shipAddTwo->setLabel('Address 2:');
		$shipAddTwo->setOptions(array('size' => '100'))
		//->setRequired(true)
		//->addValidator('NotEmpty', true)
		->addFilter('HtmlEntities')
		->addFilter('StringTrim');
		
		$top = new Zend_Form_Element_File('topImage');
		$top->setLabel('Top Image');
		$top->setDestination($_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'getaways');
		$top->addValidator('Count', false, 1);
		$top->addValidator('Size', false, 1002400);
		$top->addValidator('Extension', false, 'jpg,png,gif');
		//$top->setOptions(array('thumbMaxHeight' => $settings->topImageHeight, 'thumbMaxWidth' => $settings->topImageWidth, 'thumbNamePrefix' => 'resized_'));
		
		$right = new Zend_Form_Element_File('rightImage');
		$right->setLabel('Right Image');
		$right->setDestination($_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'getaways');
		$right->addValidator('Count', false, 1);
		$right->addValidator('Size', false, 1002400);
		$right->addValidator('Extension', false, 'jpg,png,gif');
		//$right->setOptions(array('thumbMaxHeight' => $settings->bottomImageHeight, 'thumbMaxWidth' => $settings->bottomImageWidth, 'thumbNamePrefix' => 'resized_'));
		
		$bottom = new Zend_Form_Element_File('bottomImage');
		$bottom->setLabel('Bottom Image');
		$bottom->setDestination($_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'getaways');
		$bottom->addValidator('Count', false, 1);
		$bottom->addValidator('Size', false, 1002400);
		$bottom->addValidator('Extension', false, 'jpg,png,gif');
		//$bottom->setOptions(array('thumbMaxHeight' => $settings->bottomImageHeight, 'thumbMaxWidth' => $settings->bottomImageWidth, 'thumbNamePrefix' => 'resized_'));
		
		$left = new Zend_Form_Element_File('leftImage');
		$left->setLabel('Left Image');
		$left->setDestination($_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'getaways');
		$left->addValidator('Count', false, 1);
		$left->addValidator('Size', false, 1002400);
		$left->addValidator('Extension', false, 'jpg,png,gif');
		//$left->setOptions(array('thumbMaxHeight' => $settings->leftImageHeight, 'thumbMaxWidth' => $settings->leftImageWidth, 'thumbNamePrefix' => 'resized_'));
		
		$editor = new Zend_Form_Element_Textarea('content');
		$editor->setAttrib('class', 'ckeditor');
		$editor->setAttrib('COLS', '100');
		
		$template = new Zend_Dojo_Form_Element_FilteringSelect('templateId');
		$template->setLabel('Template');
		$template->setMultiOptions(
		        array(
		              'templateOne' => 'Template One',
		              'templateTwo' => 'Template Two',
		              'templateThree' => 'Template Three'   
		        )
		             );
		
		$templateColor = new Zend_Dojo_Form_Element_FilteringSelect('templateColor');
		$templateColor->setLabel('Template Color');
		$templateColor->setMultiOptions(
		        array(
		                'Green' => 'Green',
		                'Yellow' => 'Yellow',
		                'Blue' => 'Blue'
		        )
		);
		
		$this->addElements(array($step, 
		        //$top, $right, $bottom, $left
		        ));
		$content->addElements(
		        array(
		                //$eventId, 
		                $title,
		                $userId, 
		                $getawayUrl, 
		                $start, 
		                $end, 
		                $template,
		                $templateColor, 
		                $top, 
		                $right, 
		                $bottom, 
		                $left, 
		                $editor));
		
		$content->addElement($shipAddOne)
		->addElement($shipAddTwo)
		->addElement($city)
		->addElement($state)
		->addElement($zipcode);
		
		$formContainer->addSubForm($content, 'contentTab');
		
		
		
		
		$formContainer->addSubForm($this->categories($categories), 'categoriesTab');
		$formContainer->addSubForm($this->interests($interests), 'interestsTab');
		$this->addSubForm($formContainer, 'wSoObj');
		
 		$submit = new Zend_Dojo_Form_Element_SubmitButton('submit_wSO', array('ignore' => true, 'label' => 'Save'));
 		$this->addElement($submit);
	}
	public function categories(Zend_Dojo_Form_SubForm $subForm) {
	    
	    ////// start code
	    
	    $model = new Getaways_Model_Categories();
	    
	    $categoryData = $model->fetchAllByType('Categories');
	    $index = count($categoryData);
	    
	    for ($i = 0; $i < $index; $i++) {
	        $subForm->addElement(
	                'CheckBox',
	                $categoryData[$i]->key,
	                array(
	                'label' => $categoryData[$i]->value,
	                'value' => $categoryData[$i]->value,
	                'key'   => $categoryData[$i]->key        
	                )
	        );
	    }
	    
	    ///// end code
	    
	    return $subForm;
	}
	
	public function interests(Zend_Dojo_Form_SubForm $subForm) {
	     
	    ////// start code
	     
	    $model = new Getaways_Model_Categories();
	     
	    $interestData = $model->fetchAllByType('Interest');
	    
	    $index = count($interestData);
	     
	    for ($i = 0; $i < $index; $i++) {
	        $subForm->addElement(
	                'CheckBox',
	                $interestData[$i]->key,
	                array(
	                        'label' => $interestData[$i]->value,
	                        'value' => $interestData[$i]->key
	                )
	        );
	    }
	    
	     
	    ///// end code
	     
	    return $subForm;
	}
	
}