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

$app->post('/api/lead/register', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);

    $leadPhone = $parsedBody['phone'] ?? null;

    if (is_null($leadPhone)) {
        $response->getBody()->write(json_encode(["error" => "Lead phone number cannot be null"]));

        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400);
    }
   
    $leadService = $autoloader->load('Service\LeadService', 'service', "Controller\LeadController");
    $auth = $leadService->registerLead($leadPhone);

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

