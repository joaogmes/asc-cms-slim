<?php

namespace Core;

class Dao
{
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
        } catch (\PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function list($query)
    {
        $pdo = $this->connect();
        $stmt = $pdo->prepare($query);
        $stmt->execute();
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        if ($result) {
            return $result;
        } else {
            return false;
        }
    }

    public function search($query, $field, $table)
    {
        $pdo = $this->connect();

        $query = "SELECT * FROM $table WHERE $field LIKE :query";
        $stmt = $pdo->prepare($query);
        $stmt->execute(['query' => "%$query%"]);

        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        if ($result) {
            return $result;
        } else {
            return false;
        }
    }

    public function run($query)
    {
        $pdo = $this->connect();
        try {
            $stmt = $pdo->prepare($query);
            $stmt->execute();
            return ["status" => "success"];
        } catch (\PDOException $e) {
            throw new \Exception($e->getMessage());
        }
    }

    public function insert($query)
    {
        $pdo = $this->connect();
        try {
            $stmt = $pdo->prepare($query);
            $stmt->execute();
            return ["status" => "success", "insertedId" => $pdo->lastInsertId()];
        } catch (\PDOException $e) {
            throw new \Exception($e->getMessage());
        }
    }
}
