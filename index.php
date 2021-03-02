<?php

require_once './vendor/autoload.php';

use App\Config;
use App\Database\StagingArea;
use App\SqlTranslation\SqlServerToMySqlTranslation;
use App\SqlTranslation\SqlTranslator;

/**
 * Executa a tradução do script do SQL Server para o MySQL
 */
function translate_sql()
{
    $translation = new SqlServerToMySqlTranslation();
    $translator = new SqlTranslator(
        sourceFilePath: './resources/BD_VAREJO.sql',
        targetFilePath: './resources/BD_VAREJO.mysql.sql',
    );

    $translator->translate($translation);
}

/**
 * Executa a query de criação da staging area do DW (em MySQL)
 */
function setup_staging_area()
{
    $sql = file_get_contents('./resources/BD_VAREJO.mysql.sql');
    $stagingArea = new StagingArea();
    $stagingArea->execFromString($sql);
}

Config::init();

translate_sql();
setup_staging_area();

echo "Application finished! \n\n";
