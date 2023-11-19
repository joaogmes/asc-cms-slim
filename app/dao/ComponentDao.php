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

    public function editPageComponent($pageComponentId, $data)
    {
        $setValues = "";
        foreach ($data as $key => $value) {
            $setValues .= " `$key` = '$value',";
        }
        $setValues = substr($setValues, 0, -1);
        $query = "UPDATE pagecomponent SET $setValues WHERE id = '$pageComponentId'";
        return $this->run($query);
    }
}
