<?php

namespace Service;

use Core\Service;

class LeadService extends Service
{
    protected $controller;
    public function __construct($controller)
    {
        parent::__construct($controller);
    }
}
