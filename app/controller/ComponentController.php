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


    public function editPageComponent($data)
    {
        $data = (object) $data;
        $pageComponent = $data->pageComponent ? $data->pageComponent : false;

        if (!$pageComponent) {
            return ["error" => "pageComponent not found"];
        }
        $updateData = $data->updateData ? $data->updateData : false;
        if (!$updateData) {
            return ["error" => "updateData not found"];
        }
        return $this->componentModel->editPageComponent($pageComponent, $updateData);
    }
}
