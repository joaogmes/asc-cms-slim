<?php

namespace Model;

class LeadModel
{
    private $leadDao;

    public function __construct()
    {
        global $autoloader;
        $this->leadDao = $autoloader->load('Dao\LeadDao', 'dao');
    }

    public function listLeads($status)
    {
        return $this->leadDao->listLeads($status);
    }

    public function update($id, $updateData) {
        return $this->leadDao->edit($id, $updateData);
    }

    public function insert($phone) {
        return $this->leadDao->insert($phone);
    }

    private function decode($field)
    {
        return json_decode(base64_decode($field));
    }
}
