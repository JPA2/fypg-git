<?php
class Events_Bootstrap extends System_Application_Module_Bootstrap
{
    
	/*
	 * @var boolean flag to include front end navigation to be overridden in class childern
	*/
	protected $hasFrontEndNav = true;
	/*
	 * @var boolean flag to include admin navigation to be overridden in class childern
	*/
	protected $hasAdminNav = true;
	protected function _initRoutes()
	{
	    //$this->getRouter();
	    
// 	    $route = new Zend_Controller_Router_Route(
// 	            'events/display/:id/:format',
// 	            array(
// 	                    'module'     => 'events',
// 	                    'controller' => 'index',
// 	                    'action'     => 'display',
// 	                    'id'        => '',
// 	                    'format'     => 'html'
// 	            ),
// 	            array(
// 	                    'id'       => '\d+', // getaway id
// 	                    'format'     => '[a-z]+' // add ajax support
// 	            )
// 	    );
// 	    $this->router->addRoute('display_event', $route);
	}
}