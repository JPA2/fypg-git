<?php

/**
 * AdminController
 * 
 * @author
 * @version 
 */
require_once 'System/Controller/AdminAction.php';
class Events_AdminController extends System_Controller_AdminAction {
    
	public function init() {
		parent::init();
		$ajax = $this->_helper->getHelper('AjaxContext');
		//$ajax->setAutoJsonSerialization(false);
		$ajax->addActionContext('create', 'html')
		->initContext();
	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);

		switch(true) {
			case ($this->isAjax()) :
				
				break;
		}
	}
	public function manageAction() {
	    $table = new Events_Model_Events();
	    $this->data = $table->fetchEventsByUser(true, $this->_request->page, 5, false, $this->_request->userId);
	    $this->view->data = $this->data;
	}
	public function createAction()
	{
	    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
	    $form = new Events_Form_Create();
	    $table = new Events_Model_Events();
	    
	    if($this->_request->isPost()) {
	        $data = $this->_request->getPost();
	        //Zend_Debug::dump($data);
	        $formValues = $form->getValues($this->_request->getPost());
	    }
// 	    Zend_Debug::dump($formValues);
// 	    die('edit event');

	    if(isset($data['step']) && $data['step'] === '1') {
	        $data['step'] = (int) ++$data['step'];
	    
	    
	        $form->populate($data);
	    
	    }
	    elseif ($data['step'] === '2') {
	        $row = $table->fetchNew();
	        
	        $row->setFromArray($data);
	        
	        $wSoObj = $form->getSubForm('wSoObj');
	        foreach ($wSoObj as $subForm) {
	            
	            if (array_key_exists($subForm->getName(), $data[$wSoObj->getName()])) {
	                if ($subForm->isValid($data[$wSoObj->getName()][$subForm->getName()])) {
	                    $valid = $subForm->getValues();
	                    $section = $valid[$subForm->getName()];
	                    //Zend_Debug::dump($section);
	                    $row->setFromArray($section);
	                } else {
	                    // TODO:: Add validation handling
	                }
	            }
	            continue;
	        }
	        
	        try {
	            $result = $row->save();
	            if($result >= 1) {
// 	                $this->redirect('/admin/events/manage/' . $row->userId );
	                $this->redirect('/admin/user/');
	            }
	        } catch (Zend_Exception $e) {
	            echo $e->getMessage();
	        }
	    
	    
	    }
	     
	    $this->view->form = $form;
	}
	public function editAction()
	{
	    // this must be called or your dojo dijit will not parse when ajaxed in
	    Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
	    $form = new Events_Form_Edit();
	    $table = new Zend_Db_Table('events');
	    $form->setAction('/admin/events/edit/' . $this->_request->id);
	    
	    $row = $table->fetchRow($table->select(true)->where('id = ?', $this->_request->id));
	    
	    switch (true) {
	        case (! $this->isAjax() && $this->_request->isPost()):
	            try {
	                $data = $this->_request->getPost();
	                $wSoObj = $form->getSubForm('wSoObj');
	                foreach ($wSoObj as $subForm) {
	                    if (array_key_exists($subForm->getName(), $data[$wSoObj->getName()])) {
	                        if ($subForm->isValid($data[$wSoObj->getName()][$subForm->getName()])) {
	                            $valid = $subForm->getValues();
	                            $section = $valid[$subForm->getName()];
	                            $row->setFromArray($section);
	                        }
	                    }
	                    continue;
	                }
	                $data = $form->getValues($this->_request->getPost());
	                $row->setFromArray($data);
	                
	                $result = $row->save();
	                if($result) {
// 	                    $this->redirect('/admin/events/manage/' . $row->userId);
	                    $this->redirect('/admin/user/');
	                }
	    
	            } catch (Zend_Exception $e) {
	                $this->log->crit($e);
	                echo $e->getMessage();
	            }
	    
	            break;
	        case (! $this->isAjax() && $this->_request->isGet()): // pre populate the form with the requested page data
	    
	            $data = array();
	    
	            $data['userId'] = $row->userId;
	            $popdata = array_merge($data, $row->toArray());
	            $form->populate($popdata);
	            $this->view->data = $popdata;
	            break;
	    }
	    
	    $this->view->form = $form;
	}
	public function deleteAction()
	{
	    try {
	         
	        switch (isset($this->_request->id)) {
	            case true:
	                $table = new Events_Model_Events();
	                $row = $table->fetchRow($table->select(true)->where('id = ?', $this->_request->id));
	                $row->setReadOnly(false);
	                $delete = (int) $row->delete();
	                if ($delete > 0) {
// 	                    $this->redirect('/admin/events/manage/' . $row->userId);
	                    $this->redirect('/admin/user/');
	                } else {
	                    throw new Zend_Db_Exception('Unknown error trying to process request');
	                }
	                break;
	                 
	            case false:
	                break;
	        }
	         
	    } catch (Exception $e) {
	        $this->log->crit($e);
	        echo $e->getMessage();
	    }
	}

}
