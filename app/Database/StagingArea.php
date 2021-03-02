<?php

namespace App\Database;

use PDO;

class StagingArea extends Connector
{
    public function __construct()
    {
        parent::__construct(
            dbDriver: $_ENV['DB_SOURCE_CONNECTION'],
            dbHost: "{$_ENV['DB_SOURCE_HOST']}:{$_ENV['DB_SOURCE_PORT']}",
            dbName: $_ENV['DB_SOURCE_DATABASE'],
            dbUsername: $_ENV['DB_SOURCE_USERNAME'],
            dbPassword: $_ENV['DB_SOURCE_PASSWORD'],
        );
    }
}
