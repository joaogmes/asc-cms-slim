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

    public function indexAction($sequence)
    {
        $chatSource = $this->getSource($sequence);
        $this->assign("chatSequence", $chatSource);
        $this->assign("seq", $sequence);
        $this->display("bot.tpl");
        exit;
    }

    public function getSource($sequence)
    {
        $path = app . 'config/bot/' . $sequence . '.json';
        if (file_exists($path)) {
            $fileContent = file_get_contents($path);
            return /* json_decode */($fileContent);
        } else {
            return false;
        }
    }
}
