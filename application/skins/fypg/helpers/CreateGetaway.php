<?php
/**
 *
 * @author Randall
 * @version 
 */
require_once 'Zend/View/Interface.php';

/**
 * CreateGetaway helper
 *
 * @uses viewHelper Fypg_View_Helper
 */
class Fypg_View_Helper_CreateGetaway extends System_View_Helper_Abstract
{

    /**
     *
     * @var Zend_View_Interface
     */
    public $view;

    /**
     */
    public function createGetaway ($userId, $formId = null, $step = '1', $action, $method = 'POST')
    {
        
        $icons = new Icons_Model_Icons();
        
        $iconsByCategory = $icons->fetchIconsbyCategory();
        
        $type = 'category';
        
        $this->html = '
                <div class="create-getaway" data-dojo-type="dijit/form/Form" id=\'' . $formId . '\' data-dojo-props="action: \'' . $action . '\', method: \''. $method. '\'">
                           <div data-dojo-type="dijit/layout/TabContainer" style="width: 1000px; height: 500px;">
                               <div name="contentTab" data-dojo-type="dijit/layout/ContentPane" title="Content" data-dojo-props="selected:true">
                                   <label for="addrStreetOne">Address 1:</label><input name="addrStreetOne" data-dojo-type="dijit/form/TextBox">
                                   <label for="addrStreetTwo">Address 2:</label><input name="addrStreetTwo" data-dojo-type="dijit/form/TextBox">
                                   <label for="addrCity">City:</label><input name="addrCity" data-dojo-type="dijit/form/TextBox">
                                   <label for="addrZip">Zip Code:</label><input name="addrZip" data-dojo-type="dijit/form/TextBox">
                                   <label for="title">Title:</label><input name="title" data-dojo-type="dijit/form/TextBox">
                                   <label for="getawayUrl">Getaway Link:</label><input name="getawayUrl" data-dojo-type="dijit/form/TextBox">
                                   <label for="startDate">Start Date:</label><input name="startDate" data-dojo-type="dijit/form/TextBox">
                                   <label for="endDate">End Date:</label><input name="endDate" data-dojo-type="dijit/form/TextBox">
                               </div>
                               <div name="categoriesTab" data-dojo-type="dijit/layout/ContentPane" title="Categories" data-dojo-props="selected:true">';
       
        foreach ($iconsByCategory as $icon) {
            $this->html .= '<label for="category"><img src="' . $this->view->baseUrl('/') . 'skins/' . Zend_Registry::get('skinName') . '/icons/' . $type . '/' . $icon['fileName'] . '" />' . $icon['fileName'] . '</label><input name="category" data-dojo-type="dijit/form/CheckBox">';
        }
       
       $this->html .=  '        </div>
                           </div>
                      <input data-dojo-type="dijit/form/Button" label="Save" type="submit">
                      </div>';
        
        return $this->html;
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
