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
            $query = "SELECT * FROM `lead`";
        } else {
            $query = "SELECT * FROM `lead` WHERE status = '$status'";
        }
        return $this->list($query);
    }

    public function get($id)
    {
        $getLeadQuery = "SELECT * FROM  `lead` WHERE id = " . $id;
        return $this->list($getLeadQuery);
    }

    public function edit($id, $updateData)
    {
        $updateData = is_array($updateData) ? (object) $updateData : $updateData;
        $dataSets = [];

        if (isset($updateData->name)) {
            $dataSets[] = "`name` = '$updateData->name'";
        }
        if (isset($updateData->phone)) {
            $dataSets[] = "`phone` = '$updateData->phone'";
        }
        if (isset($updateData->cpf)) {
            $dataSets[] = "`cpf` = '$updateData->cpf'";
        }
        if (isset($updateData->state)) {
            $dataSets[] = "`state` = '$updateData->state'";
        }
        if (isset($updateData->city)) {
            $dataSets[] = "`city` = '$updateData->city'";
        }
        if (isset($updateData->birth)) {
            $dataSets[] = "`birth` = '$updateData->birth'";
        }
        if (isset($updateData->energyProvider)) {
            $dataSets[] = "`energyProvider` = '$updateData->energyProvider'";
        }
        if (isset($updateData->status)) {
            $dataSets[] = "`status` = '$updateData->status'";
        }
        if (isset($updateData->integrationId)) {
            $dataSets[] = "`integrationId` = '$updateData->integrationId'";
        }
        if (isset($updateData->integrationResult)) {
            $dataSets[] = "`integrationResult` = '$updateData->integrationResult'";
        }
        if (isset($updateData->integrationResult)) {
            $dataSets[] = "`offerResult` = '$updateData->offerResult'";
        }
        if (isset($updateData->cepSearch)) {
            $jsonCep = json_encode($updateData->cepSearch);
            $dataSets[] = "`city` = '". $updateData->cepSearch['localidade'] . "'";
            $dataSets[] = "`state` = '". $updateData->cepSearch['uf'] . "'";
            $dataSets[] = "`cepData` = '$jsonCep'";
        }
        if (isset($updateData->cityId)) {
            $dataSets[] = "`cityId` = '$updateData->cityId'";
        }

        
        $updateQuery = "UPDATE `lead` SET " . implode(", ", $dataSets) . " WHERE id = " . $id;
        return $this->run($updateQuery);
    }

    public function insert($phone, $origin)
    {
        $insertSql = "INSERT INTO `lead` (phone, origin) VALUES ('$phone', '$origin')";
        return parent::daoInsert($insertSql);
    }
}
