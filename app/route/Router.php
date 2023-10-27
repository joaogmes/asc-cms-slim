<?php
require_once(MODEL_PATH . "/Model.php");
require_once(MODEL_PATH . "/LoginModel.php");
class Router
{
    private $routes = [];
    private $appEnv;

    public function __construct()
    {
        $this->appEnv = APP_ENV;
    }

    public function addRoute($method, $path, $handler)
    {
        $this->routes[] = [
            'method' => $method,
            'path' => $path,
            'handler' => $handler
        ];
    }

    public function handleRequest($method, $path)
    {
        if ($this->requiresAuthentication($path) && !$this->isAuthenticated()) {
            header("Location: login");
            return;
        }
        foreach ($this->routes as $route) {
            if ($route['method'] === $method && $this->getPath($route['path']) === $path) {
                $handler = $route['handler'];
                $handler();
                return;
            }
        }
        echo 'Page not found!';
    }

    private function getPath($path)
    {
        if ($this->appEnv === 'local') {
            $path = $path;
        }

        return $path;
    }

    public function loadRoutesFromDatabase()
    {
        try {
            $model = new Model();
            $pdo = $model->connect();
            $stmt = $pdo->query("SELECT slug FROM page WHERE status = 'active'");

            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
            echo "Error fetching routes: " . $e->getMessage();
        }
    }

    private function requiresAuthentication($path)
    {
        switch ($this->appEnv) {
            case "local":
                return strpos($path, '/manager') === 0;
                break;
            case "live":
                return strpos($path, '/manager') === 0;
                break;
        }
    }

    private function isAuthenticated()
    {
        $session = !isset($_SESSION) ? session_start() : true;
        return $_SESSION['user'] ?? false;
    }
}