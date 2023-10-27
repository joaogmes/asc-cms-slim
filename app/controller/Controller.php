<?php
use Smarty\Smarty;

class Controller
{
    protected $smarty;

    public function __construct()
    {
        $this->initializeSmarty();
    }

    private function initializeSmarty()
    {
        require_once(VENDOR_PATH . 'autoload.php');

        $this->smarty = new \Smarty();
        $this->smarty->setTemplateDir(VIEW_PATH . 'templates');
        $this->smarty->setCompileDir(VIEW_PATH . 'templates_c');
        $this->smarty->setCacheDir(VIEW_PATH . 'cache');
        $this->assign("includePath", VIEW_PATH);
    }

    public function assign($name, $value)
    {
        $this->smarty->assign($name, $value);
    }

    public function display($template)
    {
        $this->smarty->display($template);
    }
}