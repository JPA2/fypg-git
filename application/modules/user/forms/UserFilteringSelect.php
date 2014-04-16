<?php
class User_Form_UserFilteringSelect extends System_Form_Form
{
    public function init() {
        $model = new User_Model_User();
        
        $list = new Zend_Dojo_Form_Element_FilteringSelect('userId');
        $list->setLabel('Select Company');
        $list->setMultiOptions($model->fetchUserDropDownList());
        
        $this->addElement($list);
    }
}