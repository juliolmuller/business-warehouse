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
    $dataLink->seedFactCompras();
    $dataLink->seedFactVendas();
}

Config::init();

echo "     => Traduzindo SQL de backup...";
translate_sql();
echo "\r  BW => SQL traduzido                                    (etapa 1 de 4) \n";

echo "     => Recuperando backup em MySQL...";
setup_staging_area();
echo "\r  BW => Esquemas de Staging Area criados em MySQL        (etapa 2 de 4) \n";

echo "     => Executando DDL de Data Warehouse...";
setup_data_warehouse();
echo "\r  BW => Esquemas de Data Waregouse criados em PostgreSQL (etapa 3 de 4) \n";

echo "     => Carregando dados em Data Waregouse...";
execute_etl();
echo "\r  BW => Dados carregados em Data Waregouse               (etapa 4 de 4) \n";

echo "\n     Processo de ETL concluido \n\n";
