<?php

namespace Model;

class PageModel
{
    private $pageDao;

    public function __construct()
    {
        global $autoloader;
        $this->pageDao = $autoloader->load('Dao\PageDao', 'dao');
    }

    public function getPage($slug)
    {
        return $this->pageDao->getPage($slug);
        $query = "SELECT * FROM `page` WHERE slug = '{$slug}'";
        $page = $this->pdo->prepare($query);
        $page->execute();
        return $page->fetch(\PDO::FETCH_ASSOC);
    }

    public function listPages()
    {
        return $this->pageDao->listRoutes();
    }

    public function getPageComponents($pageId)
    {
        $componentList = $this->pageDao->listPageComponents($pageId);
        $decodedComponents = [];
        foreach ($componentList as $component) {
            $decodedComponents[] = [
                "template" => $component['path'],
                "data" => $this->decode($component['data']) 
            ];
        }
        return $decodedComponents;
    }

    private function decode($field)
    {
        return json_decode(base64_decode($field));
    }
}
