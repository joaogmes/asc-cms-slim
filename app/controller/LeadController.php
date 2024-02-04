<?php

namespace Controller;

use Core\Controller;
use Model\LeadModel;

class LeadController extends Controller
{
    public $leadModel;

    public function __construct()
    {
        parent::__construct();
        global $autoloader;
        $this->leadModel = $autoloader->load('Model\LeadModel', 'model');
    }

    public function listLeads($bodyRequest)
    {
        $data = (object) $bodyRequest;
        $status = isset($bodyRequest->status) ? $bodyRequest->status : null;
        return $this->leadModel->listLeads($status);
    }

    public function getLead($bodyRequest)
    {
        $data = (object) $bodyRequest;

        $leadId = $data->leadId ? $data->leadId : false;
        if (!$leadId) {
            return ["error" => "pageComponent not found"];
        }

        return $this->leadModel->getLead($leadId);
    }

    public function updateLead($bodyRequest)
    {
        $data = (object) $bodyRequest;

        $leadId = $data->leadId ? $data->leadId : false;
        if (!$leadId) {
            return ["error" => "pageComponent not found"];
        }

        $updateData = $data->updateData ? $data->updateData : false;
        if (!$updateData) {
            return ["error" => "updateData not found"];
        }

        return $this->leadModel->update($leadId, $updateData);
    }

    public function registerLead($leadPhone)
    {
        return $this->leadModel->insert($leadPhone);
    }
}
