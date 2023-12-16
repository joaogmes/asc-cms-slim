<?php

namespace Model;

class ComponentModel
{
    private $componentDao;

    public function __construct()
    {
        global $autoloader;
        $this->componentDao = $autoloader->load('Dao\ComponentDao', 'dao');
    }

    public function listComponents()
    {
        return $this->componentDao->listComponents();
    }

    public function edit($id, $updateData) {
        return $this->componentDao->edit($id, $updateData);
    }

    public function insert($pageId, $componentId) {
        return $this->componentDao->insert($pageId, $componentId);
    }

    private function decode($field)
    {
        return json_decode(base64_decode($field));
    }
}
