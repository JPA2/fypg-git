<?php
/**
 * UserAdminController
 *
 * @author
 * @version
 */
require_once 'Zend/Controller/Action.php';
class User_AdminController extends System_Controller_AdminAction
{
    public $context = array('rolestore' => array('json'));
    /**
     * The default action - show the home page
     */

	public function init()
	{
	    
		// Call the parent init to make sure we have the parents properties.
		parent::init();
		
		$ajax = $this->_helper->getHelper('AjaxContext');
		$ajax
		->addActionContext('list', 'html')
		->addActionContext('edit', 'html')
		->addActionContext('create', 'html')
		->initContext();
		
// 		if($this->_request->isXmlHttpRequest())
// 		{
// 		    if(isset($this->context[$this->_request->action]))
// 		    {
// 		        $this->_helper->contextSwitch()->initContext();
// 		        $this->_helper->layout->disableLayout();
// 		        $this->getHelper('viewRenderer')->setNoRender(true);
// 		    }
// 		}

		$this->date = new Zend_Date(Zend_Date::now(), Zend_Date::TIMESTAMP);
		$this->emailValidator = new Zend_Validate_EmailAddress(array(
		        'allow' => Zend_Validate_Hostname::ALLOW_DNS,
		        'mx'    => true
		));
		$this->user = new User_Model_User();
		$this->newUser = $this->user->fetchNew();
	
		$this->validator = new Zend_Validate_Db_NoRecordExists($options = array(
		        'adapter' => Zend_Db_Table::getDefaultAdapter(),
		        'table' => $this->user->getTableName(),
		        'field' => 'userName'
		));
	}
    public function indexAction ()
    {
        Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);

        if($this->isAjax()) {
            
            if($this->_request->isPost()) {
                $this->_helper->layout()->disableLayout();
                //$this->_helper->viewRenderer->setNoRender(true);
                
                $post = $this->_request->getPost();
                /**
                 * @uses User_Plugin_LocationManager
                 */
                if($post['cmd']) {
                    $cmdHandler = $this->_helper->getHelper('LocationManager');
                    //Zend_Debug::dump($cmdHandler->{$post['cmd']});
                    
                    $cmdHandler->{$post['cmd']}($post);
                }
            }
            
        }
       
        $this->view->activeUserId = $this->_request->userId;
        $this->view->activeLocationId = $this->_request->locationId;
        Zend_Registry::set('activeUserId', $this->_request->userId);
        Zend_Registry::set('activeLocationId', $this->_request->locationId);
        
            $page = $this->_request->getParam('page', 1);
            Zend_Registry::set('userListPage', $page);
            $this->view->page = $page;
            $table = new User_Model_User();
            $select = new Zend_Db_Table_Select($table);
            
            $select->order('primary DESC');
            
            $this->view->select = $select;
            $paginator = $table->getOnePage($page);
            $paginator->setItemCountPerPage($this->appSettings->adminUserCountPerPage);
            $this->view->paginator = $paginator;
            
            $userEdit = new User_Form_EditUserNojs();
            Zend_Registry::set('editUser', $userEdit);
            
        
        
    }

    public function editAction ()
    {
        
        if (Zend_Auth::getInstance()->hasIdentity())
        {
            
            $ident = Zend_Auth::getInstance()->getIdentity();
            
            $form = new User_Form_EditUser();
            $form->setAction('/admin/user/edit/' . $this->_request->id . '/' . $this->_request->page);
            $table = new User_Model_User();
            $row = $table->fetch($this->_request->id);
            $locations = new User_Model_Locations();
            $uriFilter = new Zend_Filter_Word_SeparatorToDash();

            if ($this->getRequest()->isPost())
            {
                $postData = $this->getRequest()->getPost();
                if ($form->isValid($postData))
                {
                    $values = $form->getValues();
                    $row->setFromArray($values);
                    
                    $row->companyUri = $uriFilter->filter($values['companyName']);

                    $id = (int) $row->save();

                    if($id > 0) {
                    	$this->_redirect('/admin/user/'. $postData['page']);
                    }
                }
             }
             else
             {
                 //Zend_Debug::dump($singleLocation);
                    // pre-populate form
                   
                    $form->populate( array_merge($row->toArray(), array('page' => $this->_request->page)) );
                        
             }
             $this->view->form = $form;
        }
    }
    public function quickeditAction()
    {
        //$this->_helper->layout()->disableLayout();
        //$this->_helper->viewRenderer->setNoRender(true);
        if (Zend_Auth::getInstance()->hasIdentity())
        {
        
            $ident = Zend_Auth::getInstance()->getIdentity();
        
            $form = new User_Form_EditUser();

            $table = new User_Model_User();
            
            $locations = new User_Model_Locations();
            $uriFilter = new Zend_Filter_Word_SeparatorToDash();
        
            if ($this->getRequest()->isPost())
            {
                $postData = $this->getRequest()->getPost();

                    $values = $form->getValues();
                    $row = $table->fetch($postData['userId']);
                    //Zend_Debug::dump($row->toArray());
                    $row->setFromArray($postData);
        
                    $id = (int) $row->save();
        
                    if($id > 0) {
                        $this->_redirect($this->view->url(array('page' => $this->_request->page, 'userId' => $row->userId), 'admin_user_index'));
                    }

            }
            else
            {
                //Zend_Debug::dump($singleLocation);
                // pre-populate form
                 
                $form->populate( array_merge($row->toArray(), array('page' => $this->_request->page)) );
        
            }
            $this->view->form = $form;
        }
    }
    public function createAction()
    {
        Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
        // this is called here cause we need it for post as well
        $form = new User_Form_AdminCreateUser();
//         $model = new User_Model_User();
//         $modelRow = $model->fetchNew();
        $profile = new User_Model_Locations();
        $profileRow = $profile->fetchNew();
        
        //Zend_Debug::dump($profile->fetchProfileRoles());
        
        switch(true) {
        	case (!$this->isAjax() && $this->_request->isPost()) :
            	    //Zend_Debug::dump($this->_request->getPost());
            	    if($form->isValid($this->_request->getPost())) {
            	        $post = $form->getValues();
            	        //Zend_Debug::dump($post);
            	        $uriFilter = new Zend_Filter_Word_SeparatorToDash();
            	        if (isset($post['userName']))
            	        {
            	           if($this->validator->isValid($post['userName'])) {
            	                
            	               $this->newUser->role = $post['role'];
            	               $this->newUser->companyName = $post['companyName'];
            	               $this->newUser->uStatus = $post['uStatus'];
            	               $this->newUser->userName = $post['userName'];
            	               $this->newUser->firstName = $post['firstName'];
            	               $this->newUser->lastName = $post['lastName'];
            	               $this->newUser->email    = $post['email'];
            	               $this->newUser->companyUri = $uriFilter->filter($post['companyName']);
            	               $id = $this->newUser->save();
            	               //Zend_Debug::dump($id);
            	               
            	               $profileRow->userId = $id;
            	               //$profileRow->company = $post['company'];
            	               
            	               $profileRow->addrStreetOne = $post['addrStreetOne'];
            	               $profileRow->addrStreetTwo = $post['addrStreetTwo'];
            	               $profileRow->addrCity = $post['addrCity'];
            	               $profileRow->addrState = $post['addrState'];
            	               $profileRow->addrZip = $post['addrZip'];
            	               $profileResult = $profileRow->save();
            	               
            	               if (($id > 0) && ($profileResult > 0)) {
            	                   //echo 'saved';
            	                   $this->redirect('/admin/user');
            	               }
            	            
            	           } else {
                		      // we need to notify them they need to choose another userName since that one is in use
                		      $this->messenger->addMessage('UserName already in use!!');
                		      unset($post['userName']);
                		      //$this->form->populate($post);
                	       }
            	        }
                        
            	    }
            	    else {
            	        echo $form->getErrorMessages();
            	    }
        	    break;
        	case (!$this->isAjax() && $this->_request->isGet()) :
        	    
        	    break;
        	case ($this->isAjax() && $this->_request->isPost()) :
        	    
        	    break;
    	    case ($this->isAjax() && $this->_request->isGet()) :
    	         
    	        break;
        }
        $this->view->form = $form;
    }
    public function deleteAction()
    {
    	try {

    		$this->_helper->viewRenderer->setNoRender(true);
    		//Zend_Debug::dump(Zend_Auth::getInstance());
    		//die();
    		$model = new User_Model_User();
    		//$locations = new User_Model_Locations();
    		switch(isset($this->_request->id)) {
    			case true :
    				$row = $model->fetch($this->_request->id);
    				//$singleLocation = $locations->fetch($row->userId);
    				$result = $row->delete();
    				//$locationResult = $singleLocation->delete();
    				if($result > 0) {
    					$this->log->addUserEvent(Zend_Auth::getInstance(), null, null);
    					$this->log->info('Deleted User');
    					$this->_redirect('/admin/user/'. $this->request->page);
    				}
    				break;
    			case false :

    				break;
    		}
    	} catch (Zend_Exception $e) {
    		$this->log->crit($e);
    	}

    }
    public function rolestoreAction()
    {
        if($this->_request->isXmlHttpRequest())
        {
	        $roles = new Zend_Db_Table('roles');
	        foreach( $roles->fetchAll( $roles->select( array('role')))->toArray() as $role)
	        {
	        	foreach($role as $r)
	        	{
	        	    $name[] = array('rName' => $r);
	        	}
	        }
	        $data = new Zend_Dojo_Data('rName', $name);
	        echo $data->toJson();
        } else {
            exit;
        }
    }
}
