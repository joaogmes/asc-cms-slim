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

        $updateResult = $this->leadModel->update($leadId, $updateData);

        $offerResult = $this->checkLead($leadId);
        if ($offerResult) {
            $updateResult["proposal"] = $offerResult;
        }

        return $updateResult;
    }

    public function registerLead($leadPhone, $leadOrigin)
    {
        switch ($leadOrigin) {
            case 'adiantamento-fgts':
                $leadOrigin = "fgts";
                break;

            case 'emprestimo-conta-luz':
                $leadOrigin = "luz";
                break;

            default:
                $leadOrigin = null;
                break;
        }

        return $this->leadModel->insert($leadPhone, $leadOrigin);
    }

    private function checkLead($leadId)
    {
        $lead = $this->leadModel->getLead($leadId);
        $lead = (object) $lead[0];

        if (
            $lead->name !== null && $lead->name !== "" &&
            $lead->phone !== null && $lead->phone !== "" &&
            $lead->cpf !== null && $lead->cpf !== "" &&
            $lead->state !== null && $lead->state !== "" &&
            $lead->city !== null && $lead->city !== "" &&
            $lead->birth !== null && $lead->birth !== "" &&
            $lead->origin == "luz"
        ) {
            global $autoloader;
            $crefazController = $autoloader->load('Controller\CrefazController', 'controller');

            $birthDate = \DateTime::createFromFormat('d/m/Y', $lead->birth);
            $birth = $birthDate->format('Y-m-d');

            $clientData = [
                "nome" => $this->formatText($lead->name),
                "cpf" => preg_replace('/[^0-9]/', '', $lead->cpf),
                "nascimento" => $birth,
                "telefone" => preg_replace('/[^0-9]/', '', $lead->phone),
                "ocupacaoId" => 1,
                "cidadeId" => /* $lead->city */ 1,
                "urlNotificacaoParceiro" => "https://homologacao.facillitasf.com.br/retorno/" . $lead->id,
                // // "cep" => "",
                // "bairro" => $lead->city,
                // "logradouro" => $lead->city,
            ];

            $offer = $crefazController->generateOffer($clientData);
            if ($offer->success) {
                $updateData = ["integrationId" => $offer->data->propostaId, "integrationResult" => "success", "offerResult" => !$offer->data->aprovado ? "false" : "true"];
            } else {
                $updateData = ["integrationResult" => "fail"];
            }

            $this->leadModel->update($leadId, $updateData);
            return $updateData;
        }
        return false;
    }

    private function formatText($string)
    {
        $rules = array(
            'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A',
            'Æ' => 'AE', 'Ç' => 'C',
            'È' => 'E', 'É' => 'E', 'Ê' => 'E', 'Ë' => 'E',
            'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I',
            'Ð' => 'D', 'Ñ' => 'N',
            'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'O', 'Ø' => 'O',
            'Ù' => 'U', 'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U',
            'Ý' => 'Y',
            'Þ' => 'TH', 'ß' => 'ss',
            'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a', 'ä' => 'a', 'å' => 'a',
            'æ' => 'ae', 'ç' => 'c',
            'è' => 'e', 'é' => 'e', 'ê' => 'e', 'ë' => 'e',
            'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i',
            'ð' => 'd', 'ñ' => 'n',
            'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o', 'ö' => 'o', 'ø' => 'o',
            'ù' => 'u', 'ú' => 'u', 'û' => 'u', 'ü' => 'u',
            'ý' => 'y',
            'þ' => 'th', 'ÿ' => 'y',
            'º' => 'o', 'ª' => 'a'
        );

        return strtr($string, $rules);
    }
}
