<?php

use Dotenv\Dotenv;

define('ROOT', __DIR__ . DIRECTORY_SEPARATOR . '..');

Dotenv::createImmutable(ROOT)->load();
