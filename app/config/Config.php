<?php

class Config
{
    public function getSettings()
    {
        $appEnv = $this->isLocalHost() ? 'local' : 'live';
        define("APP_ENV", $appEnv);
        $settings = $this->loadSettingsFromFile($appEnv);
        return $settings;
    }

    private function isLocalHost()
    {
        $localhostKeywords = ['localhost', '127.0.0.1', '10.0.0.1'];
        $host = $_SERVER['HTTP_HOST'];
        foreach ($localhostKeywords as $keyword) {
            if (strpos($host, $keyword) !== false) {
                return true;
            }
        }
        return false;
    }

    private function loadSettingsFromFile($appEnv)
    {
        $file = CFG_PATH . 'defaults/settings.json';
        $settingsData = file_get_contents($file);
        $settings = json_decode($settingsData, true);
        return $settings[$appEnv] ?? null;
    }
}