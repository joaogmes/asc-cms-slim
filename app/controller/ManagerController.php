<?php

namespace Controller;

use Core\Controller;
// use Model\PageModel;

class ManagerController extends Controller
{
    public $pageModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        // $this->pageModel = $autoloader->load('Model\PageModel', 'model');
    }

    public function index($data)
    {
        $formatedData = $this->decodeData($data);
        $this->assign("data", $formatedData);
        $this->display("manager.tpl");
        return;
    }

    protected function decodeData($data)
    {
        return /* json_decode */(base64_decode($data));
    }
}
