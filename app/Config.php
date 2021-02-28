<?php

namespace App;

use Dotenv\Dotenv;

abstract class Config
{
    public static function init()
    {
        static::initEnvironmentVariables();
    }

    private static function initEnvironmentVariables()
    {
        $root = __DIR__ . DIRECTORY_SEPARATOR . '..';

        Dotenv::createImmutable($root)->load();
    }
}
