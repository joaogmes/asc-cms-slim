<?php

use Slim\Routing\RouteCollectorProxy;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

use Controller\TestController;
use Controller\PageController;

/* $app->get('/login', function (Request $request, Response $response) {
    require_once CONTROLLER_PATH . "LoginController.php";
    $loginController = new Controller\LoginController();
    return $loginController->index($request, $response);
});

$app->get('/manager', function (Request $request, Response $response) {
    require_once CONTROLLER_PATH . "ManagerController.php";
    $managerController = new Controller\ManagerController();
    return $managerController->index($request, $response);
}); */
$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write("Olá, esta é a página inicial!");
    return $response;
});

$pageController = $autoloader->load('Controller\PageController', 'controller');
$dynamicRoutes = $pageController->loadRoutes();
foreach ($dynamicRoutes as $newRoute) {
    $title = $newRoute;
    $app->get('/' . $newRoute, function (Request $request, Response $response) use ($title) {
        global $pageController;
        return $pageController->renderPage($title);
    });
}
// die('teste');
