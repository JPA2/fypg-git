<?php

/**
 * AdminController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';

class Getaways_AdminController extends System_Controller_AdminAction
{
    
    /*
     * (non-PHPdoc) @see System_Controller_AdminAction::init()
     */
    public function init()
    {
        parent::init();
//         $ajax = $this->_helper->getHelper('AjaxContext');
//         $ajax->addActionContext('index', 'html')
//             ->addActionContext('create', 'html')
//             ->addActionContext('edit', 'html')
//             ->addActionContext('manage', 'html')
//             ->initContext();
    }

    /**
     * The default action - show the home page
     */
    public function indexAction()
    {
        // TODO Auto-generated AdminController::indexAction() default action
        //echo 'admin index action';
    }
    public function manageAction() 
    {
        $table = new Getaways_Model_Getaways();
        $this->data = $table->fetchGetawaysByUser(true, $this->_request->page, 5, false, $this->_request->userId);
        $this->view->data = $this->data;
    }
    public function createAction()
    {
            
        Zend_Dojo_View_Helper_Dojo::setUseDeclarative(true);
        $form = new Getaways_Form_Create();
        $table = new Getaways_Model_Getaways();
        $getawayCats = new Getaways_Model_GetawaysCategories();
        $data['step'] = '1';
        
        if($this->_request->isPost()) {
            $data = $this->_request->getPost();
            $formValues = $form->getValues($this->_request->getPost());
            //Zend_Debug::dump($data);
           // Zend_Debug::dump($this->_request->getPost());
        }
        
        if(isset($data['step']) && $data['step'] === '1') {
            $data['step'] = (int) ++$data['step'];
            //Zend_Debug::dump($data['step']);
            
            
            $form->populate($data);
            
        }
        elseif ($data['step'] === '2') {
           $row = $table->fetchNew();
           
           
	           $wSoObj = $form->getSubForm('wSoObj');
	           $contentSub = $wSoObj->getSubForm('contentTab');
	           $catsSub = $wSoObj->getSubForm('categoriesTab');
	           $interestsSub = $wSoObj->getSubForm('interestsTab');
	           
	           if (array_key_exists($contentSub->getName(), $data[$wSoObj->getName()])) {
	               if ($contentSub->isValid($data['wSoObj']['contentTab'])) {
	                   $contentValues = $contentSub->getValues();
	                   $row->setFromArray($contentValues['contentTab']);
	               }
	           }
	           if (array_key_exists($catsSub->getName(), $data[$wSoObj->getName()])) {
	               if ($catsSub->isValid($data['wSoObj']['categoriesTab'])) {
	                   $catsValues = $catsSub->getValues();
	                   $cats = $catsValues['categoriesTab'];
	               }
	           }
	           if (array_key_exists($interestsSub->getName(), $data[$wSoObj->getName()])) {
	               if ($interestsSub->isValid($data['wSoObj']['interestsTab'])) {
	                   $interestsValues = $interestsSub->getValues();
	                   $interests = $interestsValues['interestsTab'];
	               }
	           }

	           try {
	               
	               $searchableCats = array();
// 	               Zend_Debug::dump($cats);
// 	               die();
	               $categoryTable = new Getaways_Model_Categories();
	               foreach ($cats as $key => $value) {
	                   if ($value == true) {
	                       $catName = $categoryTable->fetchCatNameById($key);
	                       $searchableCats[] = $catName;
	                   }
	               }
	               foreach ($interests as $key => $value) {
	               if ($value == true) {
	                       $catName = $categoryTable->fetchCatNameById($key);
	                       $searchableCats[] = $catName;
	                   }
	               }
	               
	               $row->categories = implode(',', $searchableCats);
	               
  	               $resultId = $row->save();
  	               
	               if($resultId) {
	           	       foreach ($cats as $key => $value) {
	           	           if ($value == true) {
	           	               $getawayCatsRow = $getawayCats->fetchNew();
	                           $getawayCatsRow->categoryId = $key;
	                           $getawayCatsRow->getawayId = $resultId;
	                           $getawayCatsRow->save();
	           	           }
	                   }
	                   foreach ($interests as $key => $value) {
	                       if ($value == true) {
	                           $getawayCatsRow = $getawayCats->fetchNew();
	                           $getawayCatsRow->categoryId = $key;
	                           $getawayCatsRow->getawayId = $resultId;
	                           $getawayCatsRow->save();
	                       }
	                   }
	                  // lets try calling this again so we can rebuild the search index with categories and interest
	                  //$row->save();
	                  // 
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
        $form = new Getaways_Form_Edit();
        $table = new Getaways_Model_Getaways();
        $form->setAction('/admin/getaways/edit/' . $this->_request->id);
        
        $row = $table->fetchRow($table->select(true)->where('id = ?', $this->_request->id));
        //Zend_Debug::dump($row);
        //die();
        
        $getawayCats = new Getaways_Model_GetawaysCategories();
        $getawayCatsRow = $getawayCats->fetchRow($table->select(true)->where('id = ?', $this->_request->id));
        $getawayCatsByGetaway = $getawayCats->fetchCategoriesByGetaway($this->_request->id);

        switch (true) {
            case (! $this->isAjax() && $this->_request->isPost()):
                try {
                    $data = $this->_request->getPost();
                    //Zend_Debug::dump($data);
                    //die('data');

                    $wSoObj = $form->getSubForm('wSoObj');
                    $contentSub = $wSoObj->getSubForm('contentTab');
                    $catsSub = $wSoObj->getSubForm('categoriesTab');
                    $interestsSub = $wSoObj->getSubForm('interestsTab');
                    
                    if (array_key_exists($contentSub->getName(), $data[$wSoObj->getName()])) {
                        if ($contentSub->isValid($data['wSoObj']['contentTab'])) {
                            $contentValues = $contentSub->getValues();
                            $row->setFromArray($contentValues['contentTab']);
                        }
                    }
                    if (array_key_exists($catsSub->getName(), $data[$wSoObj->getName()])) {
                        if ($catsSub->isValid($data['wSoObj']['categoriesTab'])) {
                            $catsValues = $catsSub->getValues();
                            $cats = $catsValues['categoriesTab'];
                        }
                    }
                    if (array_key_exists($interestsSub->getName(), $data[$wSoObj->getName()])) {
                        if ($interestsSub->isValid($data['wSoObj']['interestsTab'])) {
                            $interestsValues = $interestsSub->getValues();
                            $interests = $interestsValues['interestsTab'];
                        }
                    }
                    
                    $lookup = $getawayCats->fetchCategoriesByGetaway($this->_request->id);
                    foreach($lookup as $catRow) {
                        $catRow->delete();
                    }
                    
                    
                    try {
                        // start make cats searchable
                    	$searchableCats = array();
                    	// 	               Zend_Debug::dump($cats);
                    	// 	               die();
                    	$categoryTable = new Getaways_Model_Categories();
                    	foreach ($cats as $key => $value) {
                    		if ($value == true) {
                    			$catName = $categoryTable->fetchCatNameById($key);
                    			$searchableCats[] = $catName;
                    		}
                    	}
                    	foreach ($interests as $key => $value) {
                    		if ($value == true) {
                    			$catName = $categoryTable->fetchCatNameById($key);
                    			$searchableCats[] = $catName;
                    		}
                    	}
                    	
                    	$row->categories = implode(',', $searchableCats);
                    	// end make cats searchable
                            foreach ($cats as $key => $value) {
                                if ((bool)$value == true) {
                                    $getawayCatsRow = $getawayCats->fetchNew();
                                    $getawayCatsRow->categoryId = $key;
                                    $getawayCatsRow->getawayId = $this->_request->id;
                                    $getawayCatsRow->save();
                                }
                            }
                            foreach ($interests as $key => $value) {
                                if ((bool)$value == true) {
                                    $getawayCatsRow = $getawayCats->fetchNew();
                                    $getawayCatsRow->categoryId = $key;
                                    $getawayCatsRow->getawayId = $this->_request->id;
                                    $getawayCatsRow->save();
                                }
                            }
                            //$this->redirect('/admin/user/');
                        
                    } catch (Zend_Exception $e) {
                        echo $e->getMessage();
                    }
                    
                    //$data = $form->getValues($this->_request->getPost());
	                //Zend_Debug::dump($data);
	               // $row->setFromArray($data);
                    if ($row->topImage == null) {
                        unset($row->topImage);
                    }
                    if ($row->rightImage == null) {
                        unset($row->rightImage);
                    }
                    if ($row->bottomImage == null) {
                        unset($row->bottomImage);
                    }
                    if ($row->leftImage == null) {
                        unset($row->leftImage);
                    }

                    $result = $row->save();
                    if($result) {
                        $this->redirect('/admin/user');
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
        	    foreach ($getawayCatsByGetaway as $cat) {
        	        $catInt = intval($cat->categoryId);
        	        $popdata[$catInt] = '1';
        	    }
        	    //Zend_Debug::dump($popdata);
                $form->populate($popdata);
                //Zend_Debug::dump($row->toArray());
                //Zend_Debug::dump($form->getValues($popdata));
                $this->view->data = $popdata;
                //Zend_Debug::dump($popdata);
                break;
        }
        
        $this->view->form = $form;
        
    }
    public function deleteAction()
    {
     try {
         $this->_helper->viewRenderer->setNoRender(true);
         switch (isset($this->_request->id)) {
             case true:
                 $table = new Getaways_Model_Getaways();
                // $row = $table->fetchRow($table->select(true)->where('id = ?', $this->_request->id));
                $row = $table->fetchOne(null, $this->_request->id);
                 //$row->setReadOnly(false);
                 $delete = (int) $row->delete();
                 if ($delete > 0) {
//                      $this->redirect('/admin/getaways/manage/' . $row->userId);
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
