<?php
class User_Acl_Resource_Admin implements Zend_Acl_Resource_Interface
{

    protected $_resourceId;

    public function __construct($resourceId = 'admin')
    {
        $this->_resourceId = (string) $resourceId;
    }
 
    public function getResourceId()
    {
        return $this->_resourceId;
    }

    public function __toString()
    {
        return $this->getResourceId();
    }
}