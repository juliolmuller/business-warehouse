<?php

namespace App\ETL;

use App\Database\DataWarehouse;
use App\Database\StagingArea;
use PDO;

class DataLink
{
    private PDO $stagingArea;
    private PDO $dataWarehouse;

    public function __construct(StagingArea $stagingArea, DataWarehouse $dataWarehouse)
    {
        $this->stagingArea = $stagingArea->getConnection();
        $this->dataWarehouse = $dataWarehouse->getConnection();
    }

    public function seedDimensionEstadps()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb001_sigla_uf    AS "sigla_uf",' .
            '    tb001_nome_estado AS "nome_estado"' .
            '  FROM tb001_uf',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO estados' .
            '    (sigla_uf, nome_estado)' .
            '  VALUES (?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->sigla_uf);
            $stmt->bindParam(2, $record->nome_estado);
            $stmt->execute();
        }
    }

    public function getEstadosKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT sigla_uf FROM estados',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionCidades()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb002_cod_cidade  AS "cod_cidade",' .
            '    tb001_sigla_uf    AS "cod_estado",' .
            '    tb002_nome_cidade AS "nome_cidade"' .
            '  FROM tb002_cidades',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO cidades' .
            '    (cod_cidade, cod_estado, nome_cidade)' .
            '  VALUES (?, ?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cod_cidade);
            $stmt->bindParam(2, $record->cod_estado);
            $stmt->bindParam(3, $record->nome_cidade);
            $stmt->execute();
        }
    }

    public function getCidadesKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cod_cidade FROM cidades',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionLojas()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb004_cod_loja           AS "cod_loja",' .
            '    tb004_matriz             AS "matriz",' .
            '    tb004_cnpj_loja          AS "cnpj",' .
            '    tb004_inscricao_estadual AS "inscricao_estadual"' .
            '  FROM tb004_lojas',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO lojas' .
            '    (cod_loja, matriz, cnpj, inscricao_estadual)' .
            '  VALUES (?, ?, ?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cod_loja);
            $stmt->bindParam(2, $record->matriz);
            $stmt->bindParam(3, $record->cnpj);
            $stmt->bindParam(4, $record->inscricao_estadual);
            $stmt->execute();
        }
    }

    public function getLojasKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cod_loja FROM lojas',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionFuncionarios()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb005_matricula        AS "matricula",' .
            '    tb004_cod_loja         AS "cod_loja",' .
            '    tb005_nome_completo    AS "nome_completo",' .
            '    tb005_status           AS "status",' .
            '    tb005_data_contratacao AS "data_contratacao",' .
            '    tb005_data_demissao    AS "data_demissao"' .
            '  FROM tb005_funcionarios',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO funcionarios' .
            '    (matricula, cod_loja, nome_completo, status, data_contratacao, data_demissao)' .
            '  VALUES (?, ?, ?, ?, ?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->matricula);
            $stmt->bindParam(2, $record->cod_loja);
            $stmt->bindParam(3, $record->nome_completo);
            $stmt->bindParam(4, $record->status);
            $stmt->bindParam(5, $record->data_contratacao);
            $stmt->bindParam(6, $record->data_demissao);
            $stmt->execute();
        }
    }

    public function getFuncionariosKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT matricula FROM funcionarios',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionCategorias()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb013_cod_categoria AS "cod_categoria",' .
            '    tb013_descricao     AS "descricao"' .
            '  FROM tb013_categorias',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO categorias' .
            '    (cod_categoria, descricao)' .
            '  VALUES (?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cod_categoria);
            $stmt->bindParam(2, $record->descricao);
            $stmt->execute();
        }
    }

    public function getCategoriasKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cod_categoria FROM categorias',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionProdutos()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb012_cod_produto   AS "cod_produto",' .
            '    tb013_cod_categoria AS "cod_categoria",' .
            '    tb012_descricao     AS "descricao"' .
            '  FROM tb012_produtos',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO produtos' .
            '    (cod_produto, cod_categoria, descricao)' .
            '  VALUES (?, ?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cod_produto);
            $stmt->bindParam(2, $record->cod_categoria);
            $stmt->bindParam(3, $record->descricao);
            $stmt->execute();
        }
    }

    public function getProdutosKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cod_produto FROM produtos',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionClientes()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb010_cpf  AS "cpf",' .
            '    tb010_nome AS "nome"' .
            '  FROM tb010_clientes',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO clientes' .
            '    (cpf, nome)' .
            '  VALUES (?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cpf);
            $stmt->bindParam(2, $record->nome);
            $stmt->execute();
        }
    }

    public function getClientesKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cpf FROM clientes',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }

    public function seedDimensionFornecedores()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb017_cod_fornecedor AS "cod_fornecedor",' .
            '    tb017_razao_social   AS "razao_social",' .
            '    tb017_nome_fantasia  AS "nome_fantasia"' .
            '  FROM tb017_fornecedores',
            PDO::FETCH_OBJ,
        );
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO fornecedores' .
            '    (cod_fornecedor, razao_social, nome_fantasia)' .
            '  VALUES (?, ?, ?)'
        );

        foreach ($resultSet as $record) {
            $stmt->bindParam(1, $record->cod_fornecedor);
            $stmt->bindParam(2, $record->razao_social);
            $stmt->bindParam(3, $record->nome_fantasia);
            $stmt->execute();
        }
    }

    public function getFornecedoresKeys(): array
    {
        $keys = $this->dataWarehouse->query(
            'SELECT cod_fornecedor FROM fornecedores',
        )->fetchAll(PDO::FETCH_COLUMN);

        return $keys;
    }
}
