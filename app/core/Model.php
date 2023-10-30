<?php
namespace Core;

class Model
{
    private $table;
    private $settings;

    public function __construct()
    {
        global $autoloader;
        $config = $autoloader->load('Config\Config', 'config');
        $this->settings = $config->getSettings();
    }
    public function connect()
    {

        $host = $this->settings['database']['DB_HOST'];
        $dbName = $this->settings['database']['DB_NAME'];
        $username = $this->settings['database']['DB_USER'];
        $password = $this->settings['database']['DB_PASS'];

        try {
            $dsn = "mysql:host=$host;dbname=$dbName;charset=utf8mb4";
            $pdo = new \PDO($dsn, $username, $password);

            $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

            return $pdo;
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }
}