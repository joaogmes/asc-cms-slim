<?php

namespace Service;

use Core\Service;

class LeadService extends Service
{
    protected $controller;
    protected $controllerInstance;

    public function __construct($controller)
    {
        parent::__construct($controller);
        $this->controllerInstance = $this->autoloader->load($this->controller, 'controller');
    }

    public function registerLead($phone, $origin)
    {
        return $this->controllerInstance->registerLead($phone, $origin);
    }

    public function updateLead($bodyRequest)
    {
        return $this->controllerInstance->updateLead($bodyRequest);
    }
}
