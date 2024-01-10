<?php

namespace Dao;

use \Core\Dao;

class LeadDao extends Dao
{
    public $table;

    public function __construct()
    {
        parent::__construct();
    }

    public function listLeads($status)
    {
        if (is_null($status)) {
            $query = "SELECT * FROM lead";
        } else {
            $query = "SELECT * FROM lead WHERE status = '$status'";
        }
        return $this->list($query);
    }

    public function edit($id, $updateData)
    {
        $updateData = is_array($updateData) ? (object) $updateData : $updateData;
        $dataSets = [];

        if (isset($updateData->name)) {
            $dataSets[] = "SET `name` = '$updateData->name'";
        }
        if (isset($updateData->phone)) {
            $dataSets[] = "SET `phone` = '$updateData->phone'";
        }
        if (isset($updateData->cpf)) {
            $dataSets[] = "SET `cpf` = '$updateData->cpf'";
        }
        if (isset($updateData->state)) {
            $dataSets[] = "SET `state` = '$updateData->state'";
        }
        if (isset($updateData->city)) {
            $dataSets[] = "SET `city` = '$updateData->city'";
        }
        if (isset($updateData->birth)) {
            $dataSets[] = "SET `birth` = '$updateData->birth'";
        }
        if (isset($updateData->energyProvider)) {
            $dataSets[] = "SET `energyProvider` = '$updateData->energyProvider'";
        }
        if (isset($updateData->status)) {
            $dataSets[] = "SET `status` = '$updateData->status'";
        }
        if (isset($updateData->integrationId)) {
            $dataSets[] = "SET `integrationId` = '$updateData->integrationId'";
        }
        if (isset($updateData->integrationResult)) {
            $dataSets[] = "SET `integrationResult` = '$updateData->integrationResult'";
        }

        $updateQuery = "UPDATE lead " . implode(", ", $dataSets) . " WHERE id = " . $id;
        return $this->run($updateQuery);
    }

    public function insert($phone)
    {
        $insertSql = "INSERT INTO `lead` (phone) VALUES ('$phone')";
        return parent::insert($insertSql);
    }
}
