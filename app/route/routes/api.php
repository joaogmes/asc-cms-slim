<?php

use Slim\Routing\RouteCollectorProxy;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

$app->post('/api/pages', function (Request $request, Response $response) {
    global $autoloader;

    $body = $request->getBody()->getContents();
    $parsedBody = json_decode($body, true);
    $clientToken = $parsedBody['client_token'] ?? null;

    $pagesService = $autoloader->load('Service\PageService', 'service', "Controller\PageController");
    $pages = $pagesService->forwardCall('listPages', $clientToken);

    $response->getBody()->write(json_encode($pages));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
});
