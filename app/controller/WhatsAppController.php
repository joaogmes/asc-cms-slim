<?php

namespace Controller;

use Core\Controller;
use Exception;

class WhatsAppController extends Controller
{
    private $token;
    private $endpoint;
    private $serviceId;
    private $userId;

    public function __construct()
    {
        parent::__construct();
        $this->token = "a07db95dc4ac184c2f925df00ab7c7534fec6acd"; /* Bearer token */
        $this->endpoint = "https://facillitasf.digisac.app/api/v1";
        $this->serviceId = "9059b14e-d61c-478f-a8b1-79fb0c844038"; /* WhatsApp business service id on digisac */
        $this->userId = "5fce84b6-ccdf-4fa6-a0dc-f93520359052"; /* Vinicius' id on digisac */
    }

    /*  public function auth($login, $senha)
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
    } */

    public function sendMessage($message, $contactId)
    {
        $curl = curl_init();

        $headers = array(
            'Authorization: Bearer ' . $this->token,
            'Content-Type: application/json'
        );

        $data = array(
            "text" => $message,
            "type" => "chat",
            "contactId" => $contactId,
            "userId" => $this->userId,
            "origin" => "bot"
        );

        $data_string = json_encode($data);

        curl_setopt_array($curl, array(
            CURLOPT_URL => $this->endpoint . '/messages',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $data_string,
            CURLOPT_HTTPHEADER => $headers,
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        echo $response;
    }

    public function listContacts()
    {
        $curl = curl_init();

        $headers = array(
            'Authorization: Bearer ' . $this->token,
            'Content-Type: application/json'
        );

        curl_setopt_array($curl, array(
            CURLOPT_URL => $this->endpoint . '/contacts?where%5BserviceId%5D=' . $this->serviceId,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => $headers,
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        // return $response;
        return json_decode($response, true);
    }

    public function getContactByNumber($number)
    {
        $contacts = $this->listContacts();

        foreach ($contacts['data'] as $contact) {
            if (isset($contact['data']['number']) && $contact['data']['number'] == $number) {
                return $contact;
            }
        }

        return [];
    }

    public function listServices()
    {
        $curl = curl_init();

        $headers = array(
            'Authorization: Bearer ' . $this->token,
            'Content-Type: application/json'
        );

        curl_setopt_array($curl, array(
            CURLOPT_URL => $this->endpoint . '/services',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => $headers,
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return $response;
    }

    public function insertContact($contactData)
    {
        // $contactData = (object) $contactData;
        $curl = curl_init();

        $headers = array(
            'Authorization: Bearer ' . $this->token,
            'Content-Type: application/json'
        );

        $data = array(
            "unsubscribed" => false,
            "note" => "Contato via website",
            "serviceId" => $this->serviceId,
            "name" => $contactData->name,
            "internalName" => $contactData->name,
            "alternativeName" => $contactData->name,
            "number" => $contactData->phone
        );

        $data_string = json_encode($data);

        curl_setopt_array($curl, array(
            CURLOPT_URL => $this->endpoint . '/contacts',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $data_string,
            CURLOPT_HTTPHEADER => $headers,
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return json_decode($response, true);
    }

    public function manageMessage($data)
    {
        $data = (object) $data;

        $existingContact = $this->getContactByNumber($data->phone);

        if (empty($existingContact)) {
            $contact = $this->insertContact($data);
        } else {
            $contact = $existingContact;
        }

        $this->sendMessage("teste", $contact['id']);
    }
}
