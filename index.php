<?php

require_once './vendor/autoload.php';

use App\Config;
use App\Database\DataWarehouse;
use App\Database\StagingArea;
use App\ETL\DataLink;
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
 * Executa as queries de criação da staging area do DW (em MySQL)
 */
function setup_staging_area()
{
    $sql = file_get_contents('./resources/BD_VAREJO.mysql.sql');
    $stagingArea = new StagingArea();
    $stagingArea->execFromString($sql, true);
}

/**
 * Executa as queries de criação do data warehouse (em PostgrSQL)
 */
function setup_data_warehouse()
{
    $sql = file_get_contents('./resources/DW_VAREJO.postgres.sql');
    $dataWarehouse = new DataWarehouse();
    $dataWarehouse->execFromString($sql);
}

function execute_etl()
{
    $stagingArea = new StagingArea();
    $dataWarehouse = new DataWarehouse();
    $dataLink = new DataLink($stagingArea, $dataWarehouse);

    $dataLink->seedDimensionEstadps();
    $dataLink->seedDimensionCidades();
    $dataLink->seedDimensionLojas();
    $dataLink->seedDimensionFuncionarios();
    $dataLink->seedDimensionCategorias();
    $dataLink->seedDimensionProdutos();
    $dataLink->seedDimensionClientes();
    $dataLink->seedDimensionFornecedores();

    var_export($dataLink->getEstadosKeys());
    var_export($dataLink->getCidadesKeys());
    var_export($dataLink->getLojasKeys());
    var_export($dataLink->getFuncionariosKeys());
    var_export($dataLink->getCategoriasKeys());
    var_export($dataLink->getProdutosKeys());
    var_export($dataLink->getClientesKeys());
    var_export($dataLink->getFornecedoresKeys());
}

Config::init();

translate_sql();
setup_staging_area();
setup_data_warehouse();
execute_etl();

echo "Application finished! \n\n";
