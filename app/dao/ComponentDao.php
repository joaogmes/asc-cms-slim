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

    public function edit($id, $updateData)
    {
        $updateData = is_array($updateData) ? (object) $updateData : $updateData;
        $dataSets = [];

        if (isset($updateData->order)) {
            $dataSets[] = "SET `order` = '$updateData->order'";
        }
        if (isset($updateData->data)) {
            $dataSets[] = "SET `data` = '$updateData->data'";
        }

        $updateQuery = "UPDATE pagecomponent " . implode(", ", $dataSets) . " WHERE id = " . $id;
        return $this->run($updateQuery);
    }
}
