<?php

namespace App;

use App\SqlTranslation;
use RuntimeException;


class SqlTranslator
{
    private $sourceFile;
    private $targetFile;

    function __construct(string $sourceFilePath, string $targetFilePath)
    {
        if ($sourceFilePath === $targetFilePath) {
            throw new RuntimeException('Cannot read and write to the same file.');
        }

        $this->setSourceFile($sourceFilePath);
        $this->setTargetFile($targetFilePath);
    }

    function __destruct()
    {
        fclose($this->sourceFile);
        fclose($this->targetFile);
    }

    public function setSourceFile(string $filePath)
    {
        $this->sourceFile = fopen($filePath, 'r');

        if (!$this->sourceFile) {
            throw new RuntimeException("Unable to open resource in \"{$filePath}\".");
        }
    }

    public function setTargetFile(string $filePath)
    {
        $this->targetFile = fopen($filePath, 'w+');

        if (!$this->targetFile) {
            throw new RuntimeException("Unable to create resource in \"{$filePath}\".");
        }
    }

    public function translate(SqlTranslation $translation): string
    {
        $fileRows = [];

        while ($row = fgets($this->sourceFile)) {
            $fileRows[] = $row;
        }

        $oldSql = join('', $fileRows);
        $newSql = $translation->translate($oldSql);

        fwrite($this->targetFile, $newSql);

        return $newSql;
    }
}
