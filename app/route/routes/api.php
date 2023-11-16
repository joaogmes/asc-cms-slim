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
