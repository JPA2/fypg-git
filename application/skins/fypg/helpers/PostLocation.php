<?php
/**
 *
 * @author jsmith
 * @version 
 */
require_once 'Zend/View/Interface.php';

/**
 * PostLocation helper
 *
 * @uses viewHelper Fypg_View_Helper
 */
class Fypg_View_Helper_PostLocation extends System_View_Helper_Abstract {
	
	/**
	 *
	 * @var Zend_View_Interface
	 */
	public $view;
	
	/**
	 */
	public function postLocation($userId, $formId = null, $step = '1', $action, $label, $method = 'POST',  Zend_Db_Table_Row_Abstract $location) {
		
	    $this->html = '';

		 $this->html .= '<form';

		 if(null !== $formId && is_string($formId) && ( 0 !== ($l = strlen($formId) ) ) ) {
		     //die('has length');
		 }
		  
		  $this->html .= ' action="'.$action.'"'.'method="'. $method.'">
                                        <input name="step" type="hidden" value="'. $step .'">
                                        <input name="userId" type="hidden" value="'. $userId .'">
                                        <input name="addrStreetOne" type="hidden" value="' . $location->addrStreetOne . '">
                                        <input name="addrStreetTwo" type="hidden" value="' . $location->addrStreetTwo . '">
                                        <input name="addrCity" type="hidden" value="' . $location->addrCity . '">
                                        <input name="addrState" type="hidden" value="' . $location->addrState . '">
                                        <input name="addrZip" type="hidden" value="' . $location->addrZip . '">
                                        <input type="submit" value="'.$label.'">
                                    </form>';
		 
		 
		 
		 
		return $this->html;
	}
	
	/**
	 * Sets the view field
	 * 
	 * @param $view Zend_View_Interface        	
	 */
	public function setView(Zend_View_Interface $view) {
		$this->view = $view;
	}
}
