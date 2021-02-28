<?php

namespace App;

class SqlServerToMySqlTranslation extends SqlTranslation
{
    public function getSubstitutionArray(): array
    {
        return [
            '/[\n\r]+go([\n\r])+/i'                                     => ';$1$1',
            '/--.*[\n\r]+/i'                                            => '',
            '/ADS\.dbo\./i'                                             => '',
            '/USE\s+ADS;[\n\r]*/i'                                      => '',
            '/BEGIN\s+TRANSACTION[^;]*;[\n\r]*/i'                       => '',
            '/ALTER\s+TABLE.*[\n\r]*\s*ADD\s+CONSTRAINT[^;]*;[\n\r]*/i' => '',
            '/([\n\r])*DROP\s+TABLE/i'                                  => '$1DROP TABLE IF EXISTS',
            '/NUMERIC\s*\([\s\d,]*\)\s+IDENTITY\s*\([\s\d,]*\)\s*/i'    => 'INTEGER AUTO_INCREMENT PRIMARY KEY',
            '/NULL[\n\r\s]+CONSTRAINT NULL_.*[\n\r]\s*DEFAULT\s+NULL/i' => 'NULL',
            '/(\d{1,2})\/(\d{1,2})\/(\d{4})/i'                          => '$3-$1-$2',
            '/(INSERT\s+INTO\s+\w+\s+VALUES\()([^\n]*\))/i'             => '$1NULL, $2;',
            '/(INSERT\s+INTO\s+\w+_uf\s+VALUES\()NULL, (.*\);)/i'       => '$1$2',
            '/(INSERT\s+INTO\s+\w+_logins\s+VALUES\()NULL, (.*\);)/i'   => '$1$2',
            '/(INSERT\s+INTO\s+\w+_produtos\s+VALUES\()NULL, (.*\);)/i' => '$1$2',
            '/(INSERT\s+INTO\s+\w+_clientes\s+VALUES\()NULL, (.*\);)/i' => '$1$2',
            '/(INSERT\s+INTO\s+\w+_clientes_antigos\s+VALUES\()NULL, (.*\);)/i' => '$1$2',
            '/(INSERT\s+INTO\s+\w+_funcionarios_cargos\s+VALUES\()NULL, (.*\);)/i' => '$1$2',
        ];

    }
}
