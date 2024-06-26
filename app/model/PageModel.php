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

    public function listAllPages()
    {
        return $this->pageDao->listAllPages();
    }

    public function getPageComponents($pageId)
    {
        $componentList = $this->pageDao->listPageComponents($pageId);
        $decodedComponents = [];
        foreach ($componentList as $component) {
            $templatePath = './app/view/templates/components/' . $component['path'] . '/' . $component['path'] . '.tpl';
            $stylePath = './app/view/templates/components/' . $component['path'] . '/' . $component['path'] . '.css';
            $scriptPath = './app/view/templates/components/' . $component['path'] . '/' . $component['path'] . '.js';

            $decodedComponents[] = [
                "template" => 'components/' . $component['path'] . '/' . $component['path'] . '.tpl',
                "style" => file_exists($stylePath) ? $stylePath : false,
                "script" => file_exists($scriptPath) ? $scriptPath : false,
                "data" => $this->decode($component['data'])
            ];
        }
        return $decodedComponents;
    }

    public function getPageComponentsList($pageId)
    {
        $componentList = $this->pageDao->listPageComponents($pageId);
        $decodedComponents = [];
        foreach ($componentList as $component) {
            $data = $this->decode($component['data']);
            unset($component['data']);
            $decodedComponents[] = [
                "component" => $component,
                "data" => $data
            ];
        }
        return $decodedComponents;
    }

    private function decode($field)
    {
        return json_decode($field);
/*         $decodedBase64 = base64_decode($field);

        if ($decodedBase64 === false) {
            return null;
        }

        return $decodedBase64;

        mb_internal_encoding('UTF-8');
        $decodedString = mb_convert_encoding($decodedBase64, 'UTF-8');

        $decodedArray = json_decode($decodedString, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return null;
        }

        return $decodedArray; */
    }
}
