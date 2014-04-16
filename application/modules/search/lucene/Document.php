<?php
class Search_Lucene_Document extends Zend_Search_Lucene_Document 
{
    public function __construct($fields)
    {
        foreach($fields as $key => $value) {
            switch($key) {
                case 'docRef' : // DO NOT MODIFY
                    $this->addField(Zend_Search_Lucene_Field::keyword($key, $value));
                    break;
                    case 'url' : // DO NOT MODIFY
                    	$this->addField(Zend_Search_Lucene_Field::keyword($key, $value));
                    	break;
                case 'class' :
                    $this->addField(Zend_Search_Lucene_Field::unIndexed($key, $value));
                    break;
                case 'key' :
                    $this->addField(Zend_Search_Lucene_Field::unIndexed($key, $value));
                    break;
                case 'summary' :
                    $this->addField(Zend_Search_Lucene_Field::unIndexed($key, $value));
                    break;
                case 'title' :
                    $this->addField( Zend_Search_Lucene_Field::text($key, $value));
                    break;
                case 'content' :
                	$this->addField( Zend_Search_Lucene_Field::unStored($key, $value));
                	break;
                case 'contents' :
                	$this->addField( Zend_Search_Lucene_Field::unStored($key, $value));
                	break;
                case 'eventContent' :
                    $this->addField( Zend_Search_Lucene_Field::text($key, $value));
                    break;
                case 'categories' :
                    $this->addField( Zend_Search_Lucene_Field::text($key, $value));
                    break;
                case 'addrState' :
                    $this->addField( Zend_Search_Lucene_Field::text($key, $value));
                    break;
                case 'startDate' :
                    	$this->addField( Zend_Search_Lucene_Field::keyword($key, $value));
                    break;
                case 'endDate' :
                    	$this->addField( Zend_Search_Lucene_Field::keyword($key, $value));
                    break;
                default :
                    $this->addField(Zend_Search_Lucene_Field::unStored($key, $value));
                    break;
            }
        }
    }
}