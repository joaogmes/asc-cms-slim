<?php

namespace Controller;

use Core\Controller;
use Exception;

class CrefazController extends Controller
{
    private $login;
    private $pass;

    private $apiKey;
    private $validationKey;
    private $productionKey;

    private $token;

    private $userAuthUrl;

    public function __construct()
    {
        parent::__construct();

        $this->validationKey = "ef8ecdde-4d61-48fd-bb99-05e2999f2d6f";
        $this->productionKey = "02b2b9b4-0552-4be8-b9da-09c556af274d";
        $this->apiKey = $this->validationKey;

        $this->userAuthUrl = "https://app-crefaz-api-external-stag.azurewebsites.net/api/Usuario/login";

        $this->auth(null, null);
    }

    public function auth($login, $senha)
    {
        $postData = json_encode(array(
            'login' => $login,
            'senha' => $senha,
            'apiKey' => $this->apiKey
        ));

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $this->userAuthUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Accept: application/json',
            'Content-Type: application/json'
        ));
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if ($httpCode != 200) {
            throw new Exception("Erro na requisição: HTTP $httpCode");
        }

        $responseData = json_decode($response, true);

        if (!$responseData['success']) {
            throw new Exception("Erro de autenticação: " . $responseData['errors']);
        }

        $this->token = $responseData['data']['token'];

        curl_close($ch);

        return $responseData;
    }

    public function generateOffer($clientData)
    {
        $clientData = (object) $clientData;
        $offerEndpoint = "https://app-crefaz-api-external-stag.azurewebsites.net/api/Proposta";
        try {
            $offer = $this->doPost($offerEndpoint, $clientData);
            return $offer;
        } catch (Exception $e) {
            throw $e->getMessage();
        }
    }

    public function doPost($endpoint, $data)
    {
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $endpoint);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Accept: application/json',
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->token
        ));
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if ($httpCode != 200) {
            throw new Exception("Erro na requisição: HTTP $httpCode");
        }

        $responseData = json_decode($response, true);

        curl_close($ch);

        return $responseData;
    }
}
