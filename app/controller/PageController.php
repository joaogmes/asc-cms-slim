<?php

namespace Controller;

use Core\Controller;
use Model\PageModel;

class PageController extends Controller
{
    public $pageModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->pageModel = $autoloader->load('Model\PageModel', 'model');
    }

    public function renderPage($routeSlug)
    {
        $page = $this->pageModel->getPage($routeSlug);
        $this->assign("page", $page);

        $components = $this->pageModel->getPageComponents($page['id']);
        $this->assign("components", $components);

        $this->display("page.tpl");
        return;
    }
    public function loadRoutes()
    {
        return $this->pageModel->listPages();
    }
    public function listPages()
    {
        return $this->pageModel->listAllPages();
    }
}
