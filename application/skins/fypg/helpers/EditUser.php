<?php
/**
 *
 * @author Randall
 * @version 
 */
require_once 'Zend/View/Interface.php';

/**
 * EditUser helper
 *
 * @uses viewHelper Fypg_View_Helper
 */
class Fypg_View_Helper_EditUser
{

    /**
     *
     * @var Zend_View_Interface
     */
    public $view;

    /**
     */
    public function editUser ($user)
    {
        $form = new User_Form_EditUser();
        $form->populate($user);
        return $form;
    }

    /**
     * Sets the view field
     * 
     * @param $view Zend_View_Interface            
     */
    public function setView (Zend_View_Interface $view)
    {
        $this->view = $view;
    }
}
