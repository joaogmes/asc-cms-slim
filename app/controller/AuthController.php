<?php

namespace Controller;

use Core\Controller;
use Model\AuthModel;

class AuthController extends Controller
{
    public $authModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->authModel = $autoloader->load('Model\AuthModel', 'model');
    }

    public function authUser($login, $password)
    {
        return $this->authModel->login(filter_var($login, FILTER_SANITIZE_STRING), filter_var($password), FILTER_SANITIZE_STRING);
    }

    public function checkToken($token)
    {
        return $this->authModel->checkToken(filter_var($token, FILTER_SANITIZE_STRING));
    }
}
