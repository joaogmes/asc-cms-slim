<?php
error_reporting(E_ERROR & E_NOTICE & E_WARNING);
ini_set("display_errors", 1);

define("CFG_PATH", "./app/config/");
define("ROUTER_PATH", "./app/route/");
define("MODEL_PATH", "./app/model/");
define("CONTROLLER_PATH", "./app/controller/");
define("VIEW_PATH", "./app/view/");
define("VENDOR_PATH", "./vendor/");
define("COMPONENTS_PATH", "./components/");

require VENDOR_PATH . 'autoload.php';
require CFG_PATH . "Config.php";
require ROUTER_PATH . "Router.php";

$config = new Config();
$settings = $config->getSettings();

$router = new Router();

require_once(ROUTER_PATH . 'routes/web.php');
require_once(ROUTER_PATH . 'routes/api.php');

try {
  $response = $router->handleRequest($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);
  echo $response;
} catch (Exception $e) {
  echo "Error: " . $e->getMessage();
}