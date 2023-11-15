<?php

namespace Core;

class Service
{
    protected $controller;
    protected $autoloader;

    public function __construct($controller) {
        global $autoloader;
        $this->autoloader = $autoloader;
        $this->controller = $controller;
    }

    public function authenticate($clientToken)
    {
        if ($clientToken === '123') {
            return true;
        } else {
            return false;
        }
    }

    public function forwardCall($methodName, $auth, $parameters = null)
    {
        if(!$this->authenticate($auth)) {
            return json_encode(["error" => "Unauthorized access!"]);
        }

        if ($this->controller !== null) {
            $controllerInstance = $this->autoloader->load($this->controller, 'controller');
            return $controllerInstance->{$methodName}($parameters);
        } else {
            throw new \Exception("Controller não definida. Defina a controller usando setController antes de chamar métodos na controller.");
        }
    }
}
