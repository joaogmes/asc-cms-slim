<?php

namespace Dao;

use \Core\Dao;

class ComponentDao extends Dao
{
    public $table;

    public function __construct()
    {
        parent::__construct();
    }

    public function listComponents()
    {
        $query = "SELECT * FROM component WHERE status = 'active'";
        return $this->list($query);
    }
}
