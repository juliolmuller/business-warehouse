<?php

namespace App\Database;

use PDO;
use PDOStatement;

class Connector
{
    protected $connection;

    public function __construct($dbDriver, $dbHost, $dbName, $dbUsername, $dbPassword)
    {
        $this->connection = new PDO(
            "{$dbDriver}: " .
            "host={$dbHost};" .
            "dbname={$dbName};" .
            "user={$dbUsername};" .
            "password={$dbPassword};"
        );
    }

    public function getConnection(): PDO
    {
        return $this->connection;
    }

    public function execFromString(string $sql): PDOStatement
    {
        $commands = explode(';', $sql);
        $stmt = null;

        foreach ($commands as $command) {
            if (!empty(trim($command))) {
                $stmt = $this->connection->prepare($command);
                $stmt->execute();
            }
        }

        return $stmt;
    }
}
