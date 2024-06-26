<?php

use Slim\Routing\RouteCollectorProxy;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

$app->post('/api/pages', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $clientToken = $parsedBody['client_token'] ?? null;
    $method = $parsedBody['method'] ?? false;

    if (!$method) {
        $response->getBody()->write(json_encode(["error" => "No method found in the request"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $pagesService = $autoloader->load('Service\PageService', 'service', "Controller\PageController");
    $pages = $pagesService->forwardCall($method, $clientToken, $parsedBody);

    $response->getBody()->write(json_encode($pages));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/component', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $clientToken = $parsedBody['client_token'] ?? null;
    $method = $parsedBody['method'] ?? false;

    if (!$method) {
        $response->getBody()->write(json_encode(["error" => "No method found in the request"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $componentService = $autoloader->load('Service\ComponentService', 'service', "Controller\ComponentController");
    $components = $componentService->forwardCall($method, $clientToken, $parsedBody);

    $response->getBody()->write(json_encode($components));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/auth', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $clientLogin = $parsedBody['client_login'] ?? null;
    $clientPass = $parsedBody['client_password'] ?? null;

    if (is_null($clientLogin) || is_null($clientPass)) {
        $response->getBody()->write(json_encode(["error" => "Login and password cannot be null"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }


    $authService = $autoloader->load('Service\AuthService', 'service', "Controller\AuthController");
    $auth = $authService->authUser($clientLogin, $clientPass);

    $response->getBody()->write(json_encode($auth));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/auth/check', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $token = $parsedBody['token'] ?? null;

    if (is_null($token) || is_null($token)) {
        $response->getBody()->write(json_encode(["error" => "token cannot be null"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }


    $authService = $autoloader->load('Service\AuthService', 'service', "Controller\AuthController");
    $auth = $authService->checkToken($token);

    $response->getBody()->write(json_encode($auth));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/lead/register', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $leadPhone = $parsedBody['phone'] ?? null;
    $leadOrigin = $parsedBody['origin'] ?? null;

    if (is_null($leadPhone)) {
        $response->getBody()->write(json_encode(["error" => "Lead phone number cannot be null"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    if (is_null($leadOrigin)) {
        $response->getBody()->write(json_encode(["error" => "Lead origin number cannot be null"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $leadService = $autoloader->load('Service\LeadService', 'service', "Controller\LeadController");
    $auth = $leadService->registerLead($leadPhone, $leadOrigin);

    $response->getBody()->write(json_encode($auth));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/lead/update', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $leadId = $parsedBody['leadId'] ?? null;

    if (is_null($leadId)) {
        $response->getBody()->write(json_encode(["error" => "Missing leadId"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $leadService = $autoloader->load('Service\LeadService', 'service', "Controller\LeadController");
    $auth = $leadService->updateLead($parsedBody);

    $response->getBody()->write(json_encode($auth));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});
$app->post('/api/lead/list', function (Request $request, Response $response) {
    global $autoloader;


    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $clientToken = $parsedBody['client_token'] ?? null;
    $method = $parsedBody['method'] ?? false;

    if (!$method) {
        $response->getBody()->write(json_encode(["error" => "No method found in the request"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $componentService = $autoloader->load('Service\LeadService', 'service', "Controller\LeadController");
    $components = $componentService->forwardCall($method, $clientToken, $parsedBody);

    $response->getBody()->write(json_encode($components));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/lead/get', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $clientToken = $parsedBody['client_token'] ?? null;
    $method = $parsedBody['method'] ?? false;
    $leadId = $parsedBody['leadId'] ?? null;

    if (is_null($leadId)) {
        $response->getBody()->write(json_encode(["error" => "Missing leadId"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    if (!$method) {
        $response->getBody()->write(json_encode(["error" => "No method found in the request"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }

    $componentService = $autoloader->load('Service\LeadService', 'service', "Controller\LeadController");
    $components = $componentService->forwardCall($method, $clientToken, $parsedBody);

    $response->getBody()->write(json_encode($components));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/whatsapp/services', function (Request $request, Response $response) {
    global $autoloader;

    $controller = $autoloader->load('Controller\WhatsAppController', 'controller');
    $services = $controller->listServices();
    $response->getBody()->write(json_encode($services));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/whatsapp/contacts', function (Request $request, Response $response) {
    global $autoloader;

    $controller = $autoloader->load('Controller\WhatsAppController', 'controller');
    $contacts = $controller->listContacts();
    $response->getBody()->write(json_encode($contacts));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/whatsapp/getContact', function (Request $request, Response $response) {
    global $autoloader;

    $controller = $autoloader->load('Controller\WhatsAppController', 'controller');
    $contact = $controller->getContactByNumber("5517996476427");
    $response->getBody()->write(json_encode($contact));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/whatsapp/insertContact', function (Request $request, Response $response) {
    global $autoloader;

    $controller = $autoloader->load('Controller\WhatsAppController', 'controller');
    $contactData = ["name" => "João Gomes", "phone" => "5517996476427"];
    $contact = $controller->insertContact($contactData);
    $response->getBody()->write(json_encode($contact));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});

$app->post('/api/whatsapp/message', function (Request $request, Response $response) {
    global $autoloader;

    $controller = $autoloader->load('Controller\WhatsAppController', 'controller');
    $contactData = ["name" => "João Gomes", "phone" => "5517996476427"];
    $contact = $controller->manageMessage($contactData);
    $response->getBody()->write(json_encode($contact));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});
