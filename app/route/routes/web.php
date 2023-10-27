<?php
$router->addRoute('GET', '/login', function () {
    require_once(CONTROLLER_PATH . "LoginController.php");
    $loginController = new LoginController();
    $loginController->index();
});


$router->addRoute('GET', '/manager', function () {
    require_once(CONTROLLER_PATH . "ManagerController.php");
    $managerController = new ManagerController();
    $managerController->index();
});

$dynamicRoutes = $router->loadRoutesFromDatabase();
foreach ($dynamicRoutes as $newRoute) {
    $title = $newRoute;
    $router->addRoute('GET', '/' . $newRoute, function () {
        global $title;
        require_once(CONTROLLER_PATH . 'PageController.php');
        $pageController = new PageController();
        $pageController->renderPage($title);
    });
}