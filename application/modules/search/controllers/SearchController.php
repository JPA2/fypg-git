<?php

/**
 * SearchController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';

class Search_SearchController extends System_Controller_Action
{
    public $index;
    public $searchQuery;
    public function init(){
        parent::init();
        
    }

    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
        
        
        
    }
    public function resultsAction()
    {
        $jsonData = new System_Model_Data();
        switch( $this->isAjax() ) {
            case true :
                
                break;
            case false :
            	//TODO: Needs try catch
                if($this->_request->isPost()) {
                    
                    $index = Search_Service_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search');
                    
                    $post = $this->_request->getPost();
                    //Zend_Debug::dump($post);
                    if($post['searchState'] !== null && !empty($post['searchState']))
                    {
                        $searchState = $jsonData->getAbbreviation($post['searchState']);
                    }
                    
                    if($post['searchCat'] !== null && !empty($post['searchCat']))
                    {
                        $searchCat = $post['searchCat'];
                    }
                    
                    //multi term search
                    if(isset($searchCat) && isset( $searchState)) {
                        $hits = $index->find('"'.$searchState.'"^4 "'.$searchCat.'"');
                    }
                    elseif(isset($searchState) && !isset($searchCat)) {
                        $hits  = $index->find($searchState);
                    }
                    elseif(!isset($searchState) && isset($searchCat)) {
                        // single term search by category
                        $hits  = $index->find($searchCat);
                    }

    				
                    $this->view->totalHits = count($hits);
                    $filteredHits = array();
                    $resultsArray = array();
                    foreach($hits as $i => $hit) {
                        $resultsArray[$i] = new stdClass();
                        $doc = $hit->getDocument();
                        foreach($doc->getFieldNames() as $field) {
                        	
                            $resultsArray[$i]->{$field} = $hit->{$field};
                        }
                    }
                    
                    $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Array($resultsArray));
                    
                    //TODO: Add a app setting to control the number of results per page
                    $paginator->setItemCountPerPage(10);
                    $paginator->setCurrentPageNumber($this->_request->page);
                    
                    $this->view->paginator = $paginator;
                    
                }
                else {
                    
                }
                break;
        }
    
    }
//     public function resultsAction()
//     {
//         try {
//             $page = $this->_request->getQuery('page', 1);
//             $term = (!empty($this->_request->term)) ? $this->_request->term : $this->_request->getQuery('term', '');
            
//             $term = 'Al';
            
//             $form = new Search_Form_QuickSearch();
//             $this->view->term = $term;
//             //Zend_Debug::dump($this->_request->term);
            
//             if(isset($term) && !empty($term) && $term !== '') {
//                 //$post = $this->_request->getPost();
//                 //$data = $form->getValues($this->_request->getPost());
            
//                 $query = new Zend_Search_Lucene_Search_Query_MultiTerm();
//                 $query->addTerm(new Zend_Search_Lucene_Index_Term($term, 'title'), null);
//                 $query->addTerm(new Zend_Search_Lucene_Index_Term($term, 'contents'), null);
                
//                 $query->addTerm(new Zend_Search_Lucene_Index_Term($term, 'addrState'), null);
            
//                 $index = Search_Service_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search');
            
//                 $hits = $index->find($term);
            
//                 if(count($hits) == 0) {
//                     // the below is required to search the content of a page!!!!
//                     $subquery = Zend_Search_Lucene_Search_QueryParser::parse($term);
//                     $hits = $index->find($subquery);
//                 }
//                 // get total hit count for use in view
//                 $this->view->totalHits = count($hits);
//                 $filteredHits = array();
//                 foreach($hits as $i => $hit) {
//                     $resultsArray[$i] = new stdClass();
//                     $doc = $hit->getDocument();
//                     foreach($doc->getFieldNames() as $field) {
//                         $resultsArray[$i]->{$field} = $hit->{$field};
//                     }
//                 }
            
//                 $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Array($resultsArray));
                
//                 //TODO: Add a app setting to control the number of results per page
//                 $paginator->setItemCountPerPage(3);
//                 $paginator->setCurrentPageNumber($this->_request->page);
                
//                 $this->view->paginator = $paginator;
//             } else {
//                 throw new Zend_Controller_Action_Exception('You must enter a search term!', 500);
//             }
//         } catch (Exception $e) {
//             echo $e->getMessage();
//         }
        
//     }
    public function optimizeAction()
    {
        
    }
}