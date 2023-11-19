<?php

namespace Core;

class Service
{
    protected $controller;
    protected $autoloader;

    public function __construct($controller)
    {
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
        if (!$this->authenticate($auth)) {
            return ["status" => "error", "error" => "Unauthorized access!"];
        }

        if ($this->controller !== null) {
            try {
                $controllerInstance = $this->autoloader->load($this->controller, 'controller');
            } catch (\Throwable $e) {
                return ["status" => "error", "error" => "Failed to instantiate controller. " . $e->getMessage()];
            }

            if (method_exists($controllerInstance, $methodName)) {
                return $controllerInstance->{$methodName}($parameters);
            } else {
                return ["status" => "error", "error" => "Method '$methodName' does not exist in the controller $this->controller."];
            }
        } else {
            return ["status" => "error", "error" => "Controller not defined. Set the controller using setController before calling methods on the controller."];
        }
    }
}
