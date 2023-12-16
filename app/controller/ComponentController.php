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

    public function listComponents()
    {
        return $this->componentModel->listComponents();
    }

    public function editPageComponent($bodyRequest)
    {
        $data = (object) $bodyRequest;

        $componentId = $data->pageComponent ? $data->pageComponent : false;
        if (!$componentId) {
            return ["error" => "pageComponent not found"];
        }

        $updateData = $data->updateData ? $data->updateData : false;
        if (!$updateData) {
            return ["error" => "updateData not found"];
        }

        return $this->componentModel->edit($componentId, $updateData);
    }

    public function insertPageComponent($bodyRequest)
    {
        $data = (object) $bodyRequest;

        $pageId = $data->pageId ? $data->pageId : false;
        if (!$pageId) {
            return ["error" => "componentId not found"];
        }

        $componentId = $data->componentId ? $data->componentId : false;
        if (!$componentId) {
            return ["error" => "componentId not found"];
        }
        
        return $this->componentModel->insert($pageId, $componentId);
    }
}
