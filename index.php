<?php

// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
// header("Access-Control-Allow-Headers: *");

use Slim\Factory\AppFactory;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

define("root", __DIR__ . '/');
define("app", root . 'app/');

require root . '/vendor/autoload.php';
require app . 'Autoloader.php';

$app = AppFactory::create();

$autoloader = new Autoloader();

require app . 'route/routes/api.php';
require app . 'route/routes/web.php';
require app . 'route/routes/exception.php';

$app->run();
