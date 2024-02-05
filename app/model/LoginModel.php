<?php

namespace Model;

class LoginModel
{
    private $loginDao;

    public function __construct()
    {
        global $autoloader;
        // $this->loginDao = $autoloader->load('Dao\LoginDao', 'dao');
    }
}
