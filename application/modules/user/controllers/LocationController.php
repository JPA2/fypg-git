<?php

/**
 * LocationController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';

class User_LocationController extends System_Controller_AdminAction
{
    
    public function init() {
        parent::init();
        
        $this->user = new User_Model_User();
        $this->locations = new User_Model_Locations();

    }
    /**
     * The default action - show the home page
     */
    public function indexAction () { /* Not used only stubbed for api consistency */ }
    public function getAction()
    {
        //echo 'running';
        $this->_helper->layout()->disableLayout();
        
        if(isset($this->_request->locationId)) {
            $this->view->location = $this->locations->fetch($this->_request->locationId, null, false);
        }
        $this->view->page = $this->_request->page;
        
    }
    public function listAction()
    {
        // param userId
        $user = $this->user->fetch($this->_request->userId);
        
        $select = new Zend_Db_Table_Select($user);
        $select->order('primary DESC');
        
        $locations = $user->findDependentRowset('User_Model_Locations', 'Locations', $select);
        $primary = $locations->getPrimary();
        $this->view->locations = $locations;
        $this->view->userId = $this->_request->userId;
        
    }
    public function updateAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        if($this->_request->isPost()) {
            $this->location = $this->locations->fetch($this->_request->locationId, null, false);
            $this->location->setFromArray($this->_request->getPost());
            try {
                $result = $this->location->save();
                
                    $this->redirect('/admin/user/'. $this->_request->page . '/' . $this->location->userId . '/' .$this->location->id);
                
            } catch (Zend_Exception $e) {
                echo $e->getMessage();
            }
            
        }
        // update a user location based on supplied post data
        // params userId, location fields
        
        // view should return only markup needed for the current location, ie may only reset the accordian content and header...
    }
    public function addAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        if($this->_request->isPost()) {
            $this->location = $this->locations->fetchNew();
            $this->location->setFromArray($this->_request->getPost());
            try {
                $result = $this->location->save();
       
                if($result >= 1) {
                    $this->redirect('/admin/user/'. $this->_request->page . '/' . $this->location->userId . '/' .$result);
                }
                
            } catch (Zend_Exception $e) {
                echo $e->getMessage();
            }
        
        }
        
    }
    public function deleteAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
    }
}
