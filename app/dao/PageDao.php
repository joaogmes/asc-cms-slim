<?php

namespace Dao;

use \Core\Dao;

class PageDao extends Dao
{
    public $table;

    public function __construct()
    {
        parent::__construct();
        // global $autoloader;
        // $config = $autoloader->load('Config\Config', 'config');
        // $this->settings = $config->getSettings();
        $this->table = "page";
    }

    public function listPageComponents($pageId)
    {
        $query = "SELECT c.path, c.name, pc.*
          FROM component c
          INNER JOIN pagecomponent pc ON c.id = pc.componentId
          INNER JOIN page p ON pc.pageId = p.id
          WHERE p.id = $pageId
          AND c.status = 'active'
          AND p.status = 'active'
          ORDER BY pc.order, pc.id";

        return $this->list($query);
    }

    public function listRoutes()
    {
        return $this->list("SELECT slug FROM page WHERE status = 'active'");
    }
    
    public function listAllPages()
    {
        return $this->list("SELECT * FROM page");
    }

    public function getPage($slug)
    {
        $query = "SELECT * FROM `page` WHERE slug = '{$slug}'";
        $pages = $this->list($query);
        return $pages[0];
    }
}
