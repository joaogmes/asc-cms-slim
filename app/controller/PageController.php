<?php

require_once(CONTROLLER_PATH . "Controller.php");
require_once(MODEL_PATH . "PageModel.php");
class PageController extends Controller
{
    protected $model;

    public function __construct(){
        parent::__construct();
        $this->model = new PageModel();
    }
    public function renderPage($routeSlug)
    {
        $page = $this->model->getPage($routeSlug);
        $this->assign("page", $page);

        $components = $this->model->getPageComponents($page['id']);
        $this->assign("components", $components);

        $this->display("page.tpl");
        return;
    }
}