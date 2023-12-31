<?php

namespace Dao;

use \Core\Dao;

class AuthDao extends Dao
{
    public $table;

    public function __construct()
    {
        parent::__construct();
    }

    public function authUser($login, $password)
    {
        $query = "SELECT * FROM user WHERE `login` = '$login' AND `password` = '$password'";
        return $this->list($query);
    }

    public function storeToken($token, $userId, $expiration) {
        $insertSql = "INSERT INTO auth (userId, token, expiration) VALUES ($userId, '$token', '$expiration')";
        return $this->run($insertSql);
    }
}
