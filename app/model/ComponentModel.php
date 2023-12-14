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

    private function decode($field)
    {
        return json_decode(base64_decode($field));
    }
}
