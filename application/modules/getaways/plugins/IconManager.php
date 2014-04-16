<?php

require_once 'Zend/Loader/PluginLoader.php';
require_once 'Zend/Controller/Action/Helper/Abstract.php';

/**
 * Icons Action Helper
 *
 * @uses actionHelper Getaways_Plugin
 */
class Getaways_Plugin_IconManager extends Zend_Controller_Action_Helper_Abstract {
    /**
     *
     * @var Zend_Loader_PluginLoader
     */
    public $pluginLoader;

    protected $table;

    protected $controller;

    protected $action;

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

        if($this->controller->isAdmin && $this->controller->module === 'getaways' &&  $this->controller->action === 'create') {

               $getawayCats = new Getaways_Model_Categories();
               Zend_Debug::dump($getawayCats->icons());
            
            
//             $model = new Icons_Model_Categories();
//             $modelRowset = $model->fetchAll();
            
//             foreach ($modelRowset as $modelRow) {
//                 $categories = $modelRow->findDependentRowset('Getaways_Model_Categories', 'GetawayCats', $modelRow->select()->where('categoryId = ?', $modelRow['categoryId']))->toArray();
//                 $icons = $modelRow->findDependentRowset('Icons_Model_Icon', 'Icons', $modelRow->select()->where('type = ?', 'category'))->toArray();
//                 $categoryIcons = array_merge($modelRow->toArray(), $categories['0'], $icons['0']);
//                 Zend_Debug::dump($categoryIcons);
//                 $this->view->categoryIcons = $categoryIcons;
//             }
            	
        }
    }

    /**
     * Strategy pattern: call helper as broker method
     */
    public function direct() {
        // TODO Auto-generated 'direct' method
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
}
