<?php

namespace Service;

use Core\Service;

class AuthService extends Service
{
    protected $controller;
    protected $controllerInstance;

    public function __construct($controller)
    {
        parent::__construct($controller);
        $this->controllerInstance = $this->autoloader->load($this->controller, 'controller');
    }
    
    public function authUser($userLogin, $userPassword) {
        return $this->controllerInstance->authUser($userLogin, $userPassword);
    }
}
