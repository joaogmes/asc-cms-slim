<?php

use Slim\Routing\RouteCollectorProxy;
use Slim\Exception\HttpNotFoundException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

$app->get('/manager', function (Request $request, Response $response) {
    $data = $request->getQueryParams()['data'] ?? null;
    global $autoloader;
    $managerController = $autoloader->load('Controller\ManagerController', 'controller');
    $managerIndex = $managerController->index($data);
    $response->getBody()->write($managerIndex . "");
    return $response;
});

$app->get('/test', function (Request $request, Response $response) {
    $response->getBody()->write("Olá, esta é a página inicial!");
    return $response;
});

$pageController = $autoloader->load('Controller\PageController', 'controller');
$dynamicRoutes = $pageController->loadRoutes();
foreach ($dynamicRoutes as $newRoute) {
    $title = $newRoute['slug'];
    $app->get('/' . $title, function (Request $request, Response $response) use ($title) {
        global $pageController;
        return $pageController->renderPage($title);
    });
}

