<?php

class Autoloader
{
    public function __construct()
    {
        require_once(app . 'config/Config.php');
        require_once(app . 'core/Dao.php');
        require_once(app . 'core/Model.php');
        require_once(app . 'core/Controller.php');
    }

    public function load($className, $type)
    {
        $classFile = $this->getClassFilePath($className, $type);

        if (file_exists($classFile)) {
            require_once $classFile;

            if (class_exists($className)) {
                return new $className();
            } else {
                throw new \Exception("Classe não encontrada após o require: $className");
            }
        } else {
            throw new \Exception("Arquivo da classe não encontrado: $classFile");
        }
    }

    private function getClassFilePath($className, $type)
    {
        $shortClassName = explode("\\", $className);
        $classFileName = end($shortClassName) . '.php';

        return app . $type . '/' . $classFileName;
    }
}
