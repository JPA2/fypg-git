<?php
class Getaways_Bootstrap extends System_Application_Module_Bootstrap
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
        $this->getRouter();
        
        $route = new Zend_Controller_Router_Route(
                'getaways/details/:id/:format',
                array(
                        'module'     => 'getaways',
                        'controller' => 'index',
                        'action'     => 'details',
                        //'companyUri'    => '',
                        'id'        => 0,
                        'format'     => 'html'
                ),
                array(
                        //'companyUri'    => '[a-zA-Z0-9_-]+', // normalized companyName
                        'id'       => '\d+', // getaway id
                        'format'     => '[a-z]+' // add ajax support
                )
        );
        $this->router->addRoute('getaways_details', $route);
        
        $route = new Zend_Controller_Router_Route(
	            'getaways/:page/:format',
	            array(
	                    'module'     => 'getaways',
	                    'controller' => 'index',
	                    'action'     => 'index',
	                    'page'       => '1',
	                    'format'     => 'html'
	            ),
	            array(
	                    'page'       => '\d+',
	                    'format'     => '[a-z]+'
	            )
	    );
	    $this->router->addRoute('getaways_index', $route);
        

    }
}