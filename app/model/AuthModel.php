<?php

namespace Model;

use Exception;
use DateTime;
use DateInterval;

class AuthModel
{
    private $authDao;

    public function __construct()
    {
        global $autoloader;
        $this->authDao = $autoloader->load('Dao\AuthDao', 'dao');
    }

    public function login($login, $password)
    {
        $users = $this->authDao->authUser($login, $password);
        
        if(count($users) == 0) {
            return ["error" => "User not found"];
        } else if (count($users) > 1) {
            return ["error" => "Multiple users found with those credentials"];
        } else {
            return $this->createToken((object) $users[0]);
        }

    }

    private function createToken($user) {
        $tokenExpiration = (new DateTime())->add(new DateInterval('PT1H'))->format('Y-m-d H:i:s');
        $tokenData = $user->id . $user->email . strtotime($tokenExpiration);
        $token = md5($tokenData);

        try {
            $this->authDao->storeToken($token, $user->id, $tokenExpiration);
            return ["token" => $token, "expiration" => $tokenExpiration];
        } catch (\Throwable $th) {
            throw $th;
        }
    }

}
