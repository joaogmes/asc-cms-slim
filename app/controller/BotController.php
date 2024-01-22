<?php

namespace Controller;

use Core\Controller;
use Model\PageModel;

class BotController extends Controller
{
    public $pageModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->pageModel = $autoloader->load('Model\PageModel', 'model');
    }

    public function indexAction($sequence) {
        $this->assign("seq", $sequence);
        $this->display("bot.tpl");
        exit;
    }

}
