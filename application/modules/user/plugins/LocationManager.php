<?php
/**
 *
 * @author jsmith
 * @version 
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

/**
 * AddLocation Action Helper
 *
 * @uses actionHelper User_Plugin
 */
class User_Plugin_LocationManager extends Zend_Controller_Action_Helper_Abstract {
	/**
	 *
	 * @var Zend_Loader_PluginLoader
	 */
	public $pluginLoader;
	
	protected $table;
	
	protected $controller;
	
	protected $action;
	
	protected $cmd;
	
	protected $request;
	

	/**
	 * Constructor: initialize plugin loader
	 *
	 * @return void
	 */
	public function __construct() {
		// TODO Auto-generated Constructor
		$this->pluginLoader = new Zend_Loader_PluginLoader ();
		
	}
	public function preDispatch() {
		
		$this->setController($this->getActionController());

	}
	public function editUser($post) {
	    
	    $this->setTable(new User_Model_User());
	    
	    $user = $this->table->fetch($post['userId']);
	    $user->setFromArray($post);
	    $user->save();
	    
	}
	public function addLoc($post) 
	{
	    try {
	        $this->setTable(new User_Model_Locations());
	        $row = $this->table->fetchNew();
	        $row->setFromArray($post);
	        $row->save();
	    } catch (Zend_Exception $e) {
	        $this->controller->log->crit($e);
	    }
	   
	    
	}
	public function editLoc($post) 
	{
	    try {
	        //Zend_Debug::dump($post);
	        $this->setTable(new User_Model_Locations());
	        $row = $this->table->fetch($post['locationId'], $post['userId']);
	        $row->setFromArray($post);
	        $row->save();
	    } catch (Zend_Exception $e) {
	        $this->controller->log->crit($e);
	    }
	    
	}
	public function deleteLoc($post)
	{
	    
	}
	/**
	 * Strategy pattern: call helper as broker method
	 */
	public function direct() {
		// TODO Auto-generated 'direct' method
	    //call_user_func_array(array($this, $this->controller->post['cmd']), $this->controller->getPost());
	}
	public function __call($method, $args)
	{
	    $method = strtolower($method);
	    if ('addLoc' == $method) {
	        return call_user_func_array(array($this, 'addLoc'), $args);
	    }
	    if ('editLoc' == $method) {
	        return call_user_func_array(array($this, 'editLoc'), $args);
	    }
	    if ('editUser' == $method) {
	        return call_user_func_array(array($this, 'editUser'), $args);
	    }
	    
	
	    require_once 'Zend/Controller/Action/Exception.php';
	    throw new Zend_Controller_Action_Exception(sprintf('Invalid method "%s" called on '. get_class($this), $method));
	}
	/**
	 * @return the $table
	 */
	public function getTable() {
		return $this->table;
	}

	/**
	 * @param field_type $table
	 */
	public function setTable($table) {
		$this->table = $table;
	}

	/**
	 * @return the $controller
	 */
	public function getController() {
		return $this->controller;
	}

	/**
	 * @param field_type $controller
	 */
	public function setController($controller) {
		$this->controller = $controller;
	}

	/**
	 * @return the $action
	 */
	public function getAction() {
		return $this->action;
	}

	/**
	 * @param field_type $action
	 */
	public function setAction($action) {
		$this->action = $action;
	}

	/**
	 * @return the $cmd
	 */
	public function getCmd() {
		return $this->cmd;
	}

	/**
	 * @param field_type $cmd
	 */
	public function setCmd($cmd) {
		$this->cmd = $cmd;
	}
}
