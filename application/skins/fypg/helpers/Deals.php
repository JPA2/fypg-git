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


class Fypg_View_Helper_Deals extends System_View_Helper_Abstract
{

    public function deals ($wrapperTag = 'div', array $wrapperAttribs = array())
    {
        $useLog = false;
        $content = '';
        if(Zend_Registry::isRegistered('log')) {
            $useLog = true;
            $log = Zend_Registry::get('log');
        }
        
        try {
        	
            $element = new Zend_Form_Decorator_HtmlTag(array_merge(array('tag' => $wrapperTag), $wrapperAttribs));
            $getaways = new Getaways_Model_Getaways();
            $deals = $getaways->fetchAll(
                $getaways->select()->limit(2, 0)
            );
            $allGetaways = $getaways->fetchAll(
                //$getaways->select()->where('visibility', 'public')->order('createdDate DESC')
            );
            
            if(count($deals) < 2) {
                $mergedGetaways = array_merge($deals, $allGetaways);
            }
            else {
                $mergedPages = $deals;
            }
            
            foreach($mergedPages as $deal) {
                $content .= $element->render('<p class="hed">' . $deal->title . '</p>');
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
