<?php
class Events_Form_Search extends Zend_Dojo_Form
{
	public function init()
	{
		$this->setMethod('post');
		$this->setAction('/events/search');
		$this->addElement(
				'DateTextBox',
				'startDate',
				array(
						'label'          => 'Start Date:',
						'required'       => true,
						'invalidMessage' => 'Invalid date specified.',
						'formatLength'   => 'long',
				)
		);
		
		$this->addElement(
				'DateTextBox',
				'endDate',
				array(
						'label'          => 'End Date:',
						'required'       => true,
						'invalidMessage' => 'Invalid date specified.',
						'formatLength'   => 'long',
				)
		);
		
		$submit = new Zend_Dojo_Form_Element_SubmitButton('search', array('ignore' => true));
		$submit->setLabel('Go');
		$this->addElement($submit);
	}
}