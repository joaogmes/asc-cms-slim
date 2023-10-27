<?php

require_once(CONTROLLER_PATH . "Controller.php");
require_once(MODEL_PATH . "PageModel.php");
class ManagerController extends Controller
{
    public function index()
    {
        $this->display("manager.tpl");
        return true;
    }

    public function test(){
        return "teste";
    }
}

