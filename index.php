<?php

require_once './vendor/autoload.php';

use App\Config;
use App\SqlTranslation\SqlServerToMySqlTranslation;
use App\SqlTranslation\SqlTranslator;

Config::init();

$translation = new SqlServerToMySqlTranslation();
$translator = new SqlTranslator(
    sourceFilePath: './resources/BD_VAREJO.sql',
    targetFilePath: './resources/BD_VAREJO.mysql.sql',
);

$translator->translate($translation);

echo "Application finished! \n\n";
