<?php

namespace App\SqlTranslation;

abstract class SqlTranslation
{
    /**
     * Retorna um array associativo com as substituiçoes necessárias
     * Formato do array: [
     *     ...
     *     regexp => string,
     *     ...
     * ]
     */
    abstract function getSubstitutionArray(): array;

    /**
     * Recebe os comandos SQL a serem traduzidos
     */
    public function translate(string $sourceSql): string
    {
        $replacements = $this->getSubstitutionArray();
        $targetSql = $sourceSql;
        $i = 0;

        foreach ($replacements as $pattern => $target) {
            $targetSql = preg_replace($pattern, $target, $targetSql);
        }

        return $targetSql;
    }
}
