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

    public function execFromString(string $sql, bool $prepared = false): int|false|PDOStatement
    {
        if ($prepared) {
            $stmt = $this->connection->prepare($sql);
            $stmt->execute();

            return $stmt;
        }

        return $this->connection->exec($sql);
    }
}
