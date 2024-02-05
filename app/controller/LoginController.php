<?php

namespace Controller;

use Core\Controller;
use Model\LoginModel;

class LoginController extends Controller
{
    // public $leadModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        // $this->leadModel = $autoloader->load('Model\LeadModel', 'model');
    }

    public function index()
    {
        $this->display("login.tpl");
        return;
    }
}
