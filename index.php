<?php

require_once './vendor/autoload.php';

use App\Config;
use App\SqlServerToMySqlTranslation;
use App\SqlTranslator;

Config::init();

$translation = new SqlServerToMySqlTranslation();
$translator = new SqlTranslator(
    sourceFilePath: './resources/BD_VAREJO.sql',
    targetFilePath: './resources/BD_VAREJO.mysql.sql',
);

$translator->translate($translation);

echo "Application finished! \n\n";
