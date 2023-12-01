<?php

namespace Controller;

use Core\Controller;
use Model\ComponentModel;

class ComponentController extends Controller
{
    public $componentModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->componentModel = $autoloader->load('Model\ComponentModel', 'model');
    }

    public function listComponents() {
        return $this->componentModel->listComponents();
    }
}
