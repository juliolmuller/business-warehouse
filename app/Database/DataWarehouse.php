<?php

namespace App\Database;

class DataWarehouse extends Connector
{
    public function __construct()
    {
        parent::__construct(
            dbDriver: $_ENV['DB_TARGET_CONNECTION'],
            dbHost: "{$_ENV['DB_TARGET_HOST']}",
            dbName: $_ENV['DB_TARGET_DATABASE'],
            dbUsername: $_ENV['DB_TARGET_USERNAME'],
            dbPassword: $_ENV['DB_TARGET_PASSWORD'],
        );
    }
}
