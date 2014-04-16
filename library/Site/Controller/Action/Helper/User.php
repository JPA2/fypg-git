<?php
/**
 *
 * @author Joey
 * @version 
 */
require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

/**
 * User Action Helper
 *
 * @uses actionHelper Site_Controller_Action_Helper
 */
class Site_Controller_Action_Helper_User extends Zend_Controller_Action_Helper_Abstract
{

    public $users;
    public $locations;
    public $profiles;
    /**
     *
     * @var Zend_Loader_PluginLoader
     */
    public $pluginLoader;

    /**
     * Constructor: initialize plugin loader
     *
     * @return void
     */
    public function __construct ()
    {
        // TODO Auto-generated Constructor
        $this->pluginLoader = new Zend_Loader_PluginLoader();
        //die('running');
    }
    public function preDispatch()
    {
        //Zend_Debug::dump($this->getActionController());
    }
    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct ()
    {
        // TODO Auto-generated 'direct' method
    }
}
