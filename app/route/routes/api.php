<?php

use Slim\Routing\RouteCollectorProxy;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

$app->post('/login', function (Request $request, Response $response) {
    $parsedBody = $request->getParsedBody();
    $login = $parsedBody['login'] ?? null;
    $password = $parsedBody['password'] ?? null;

    if ($login === null || $password === null) {
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(400)
            ->withJson(["error" => "missing parameters"]);
    }

    require_once CONTROLLER_PATH . "LoginController.php";
    $loginController = new Controller\LoginController();

    $result = $loginController->login($login, $password);

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withJson($result);
});

$app->post('/api/data', function (Request $request, Response $response) {
    $data = ['key' => 'value'];

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withJson($data);
});
