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

    public function editPageComponent($pageComponent, $data)
    {
        return $this->componentDao->editPageComponent($pageComponent, $data);
        $query = "SELECT * FROM `page` WHERE slug = '{$slug}'";
        $page = $this->pdo->prepare($query);
        $page->execute();
        return $page->fetch(\PDO::FETCH_ASSOC);
    }

    private function decode($field)
    {
        return json_decode(base64_decode($field));
    }
}
