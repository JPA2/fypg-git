<?php
class Search_Service_SearchIndexer
{
	public $indexDirectory = null;
	
	public function __construct($path = null){
		if($path !== null) {
			$this->setIndexDirectory($path);
		}
	}
    public function setIndexDirectory($path = null)
    {
    	if($path === null) {
    		$this->indexDirectory = APPLICATION_PATH . DIRECTORY_SEPARATOR . 'data' . DIRECTORY_SEPARATOR . 'search';
    	} else {
    		$this->indexDirectory = $path;
    	}
    }
    public function getIndexDirectory()
    {
        if($this->indexDirectory === null)
        {
            $this->setIndexDirectory();
        }
        return $this->indexDirectory;
    }
    public function _addToIndex($event) 
    {
         $data = $event->getParams();
         $index = Search_Service_Lucene::open($this->getIndexDirectory());
         $eventName = $event->getName();
         switch(true) {
         	case ($eventName === '_postInsert') :
         		$index->addDocument(new Search_Lucene_Document($data));
         		break;
         	case ( ($eventName === '_postDelete') || ($eventName === '_postUpdate') )  :
         			// Term to ident this document in the index
	         		$term = new Zend_Search_Lucene_Index_Term($data['docRef'], 'docRef');
	         		// get the document(s) id
	         		$docIds  = $index->termDocs($term);
	         		// loop the return so they / it can be removed from the index
	         		foreach($docIds as $id) {
	         			$index->delete($id);
	         		}
		         	if($eventName === '_postUpdate') {
		         		$index->addDocument(new Search_Lucene_Document($data));
		         	}
         		break;
         }
         $index->commit();
    }
    public function _optimizeIndex()
    {
        $index = Search_Service_Lucene::open($this->getIndexDirectory());
        $index->optimize();
    }
}