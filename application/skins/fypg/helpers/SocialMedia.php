<?php
/**
 *
 * @author Randall
 * @version 
 */
require_once 'System/View/Helper/Abstract.php';

/**
 * 
 *
 * @uses viewHelper System_View_Helper_Abstract
 */
class Fypg_View_Helper_SocialMedia extends System_View_Helper_Abstract
{
    public function socialMedia($wrapperTag = 'ul', $itemTag = 'li', array $wrapperAttribs = array( 'class' => 'social-icons' ), $itemAttribs = array( 'class' => 'social' ))
    {
        $element = new Zend_Form_Decorator_HtmlTag(array_merge(array('tag' => $wrapperTag), $wrapperAttribs));
        $item = new Zend_Form_Decorator_HtmlTag(array_merge(array('tag' => $itemTag), $itemAttribs));
        $social = '';
        if (!empty($this->appSettings->twitterUrl)) {
            $twitter = $item->render('<a class="" href="' . $this->appSettings->twitterUrl . '">Twitter</a>');
        } else {
            $twitter = null;
        }
        if (!empty($this->appSettings->facebookUrl)) {
            $facebook = $item->render('<a class="" href="' . $this->appSettings->facebookUrl . '">Facebook</a>');
        } else {
            $facebook = null;
        }
        $search = $item->render('<a class="" href="#">Search</a>');
        $social = $search . $twitter . $facebook;
        return $element->render($social);
    }
}