<?php

namespace Controller;

use Core\Controller;
use Exception;

class CrefazController extends Controller
{
    private $apiKey;
    private $token;
    private $userAuthUrl;
    private $users;
    private $api;

    public function __construct()
    {
        parent::__construct();
        $this->api = (object) [
            "staging" => "https://app-crefaz-api-external-stag.azurewebsites.net/api",
            "production" => "https://api-externo.crefazon.com.br/api"
        ];
        $this->userAuthUrl =  $this->api->production . "/Usuario/login";

        $this->users = [
            [
                "login" => "CC030125378",
                "senha" => "FACILLITA22",
                "name" => "BEATRIZ CRESCENCIO DA SILVA SP17-42565",
                "production" => "02b2b9b4-0552-4be8-b9da-09c556af274d",
                "staging" => "ef8ecdde-4d61-48fd-bb99-05e2999f2d6f"
            ],
            [
                "login" => "CC03019479",
                "senha" => "365972",
                "name" => "VINICIUS GAZETTA ALVES",
                "production" => "44d53f0c-bd41-4b76-8bc1-8efabfc4179d",
                "staging" => "8cc9f64a-44a1-4a84-b6d4-393c36dc1667"
            ]
        ];

        $user = (object) $this->users[0];


        $this->apiKey = $user->staging;
        $this->auth($user->login, $user->senha);
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
        $clientData = json_encode($clientData);
        $offerEndpoint = $this->api->production . "/Proposta";
        try {
            $offer = $this->doPost($offerEndpoint, $clientData);
            return $offer;
        } catch (Exception $e) {
            throw $e->getMessage();
        }
    }

    public function getCityId($cityName, $uf)
    {
        $clientData = json_encode(["nomeCidade" => $cityName, "uf" => $uf]);
        $cityEndpoint = $this->api->production . "/Endereco/Cidade";
        try {
            $cityId = $this->doPost($cityEndpoint, $clientData);
            return $cityId;
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
            return ["status" => "error", "httpCode" => $httpCode];
            // throw new Exception("Erro na requisição: HTTP $httpCode");
        }

        $responseData = json_decode($response);
        curl_close($ch);

        return $responseData;
    }
}
