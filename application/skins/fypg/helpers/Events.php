<?php
/**
 * System_View_Helper
 * 
 * @author
 * @version 
 */
require_once 'Zend/View/Interface.php';


/**
 * View Helper
 */


class Fypg_View_Helper_Events extends System_View_Helper_Abstract
{

    public function events ($wrapperTag = 'li', array $wrapperAttribs = array())
    {
        $useLog = false;
        $content = '';
        if(Zend_Registry::isRegistered('log')) {
            $useLog = true;
            $log = Zend_Registry::get('log');
        }
        
        try {
        	
            $element = new Zend_Form_Decorator_HtmlTag(array_merge(array('tag' => $wrapperTag), $wrapperAttribs));
            $eventsTable = new Events_Model_Events();
            $date = new Zend_Date();
            //$ts = $date->get();
            $ts = date('c', $date->get());
            $events = $eventsTable->fetchAll();
            $index = count($events);
            $content = '';
            for ($i = 0; $i < $index; $i++) {
                if ($ts <= $events[$i]->endDate) {
                    switch(true) {
                        case ($events[$i]->startDate == $events[$i]->endDate) :
                            $content .= $element->render($events[$i]['startDate'] . ': ' . $events[$i]['title']);
                            break;
                        default : 
                            $content .= $element->render(date("F j",strtotime($events[$i]['startDate'])) . ' - ' . date("F j",strtotime($events[$i]['endDate'])) . ': ' . $events[$i]['title']);
                    }
                } else {
                    //echo 'it failed';
                }
            }
            
            return $content;
            
        } catch (Zend_Exception $e) {
            if($useLog) {
                $log->crit($e);
            } else {
                
            }
            echo $e->getMessage();
        }

    }
}
