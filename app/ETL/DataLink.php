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
            '  FROM tb001_uf'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionCidades()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb002_cod_cidade  AS "cod_cidade",' .
            '    tb001_sigla_uf    AS "cod_estado",' .
            '    tb002_nome_cidade AS "nome_cidade"' .
            '  FROM tb002_cidades'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionLojas()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb004_cod_loja           AS "cod_loja",' .
            '    tb004_matriz             AS "matriz",' .
            '    tb004_cnpj_loja          AS "cnpj",' .
            '    tb004_inscricao_estadual AS "inscricao_estadual"' .
            '  FROM tb004_lojas'
        )->fetchAll(PDO::FETCH_OBJ);
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
            '  FROM tb005_funcionarios'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionCategorias()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb013_cod_categoria AS "cod_categoria",' .
            '    tb013_descricao     AS "descricao"' .
            '  FROM tb013_categorias'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionProdutos()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb012_cod_produto   AS "cod_produto",' .
            '    tb013_cod_categoria AS "cod_categoria",' .
            '    tb012_descricao     AS "descricao"' .
            '  FROM tb012_produtos'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionClientes()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb010_cpf  AS "cpf",' .
            '    tb010_nome AS "nome"' .
            '  FROM tb010_clientes'
        )->fetchAll(PDO::FETCH_OBJ);
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

    public function seedDimensionFornecedores()
    {
        $resultSet = $this->stagingArea->query(
            'SELECT' .
            '    tb017_cod_fornecedor AS "cod_fornecedor",' .
            '    tb017_razao_social   AS "razao_social",' .
            '    tb017_nome_fantasia  AS "nome_fantasia"' .
            '  FROM tb017_fornecedores'
        )->fetchAll(PDO::FETCH_OBJ);
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

    private function fetchFromCompras($fornecedor, $categoria, $produto, $mes, $ano)
    {
        $sql = [
            'fornecedor' => [
                'column' => 'compras.tb017_cod_fornecedor AS "fornecedor"',
                'group'  => 'compras.tb017_cod_fornecedor',
            ],
            'categoria'  => [
                'column' => 'produtos.tb013_cod_categoria AS "categoria"',
                'group'  => 'produtos.tb013_cod_categoria',
            ],
            'produto'    => [
                'column' => 'compras.tb012_cod_produto AS "produto"',
                'group'  => 'compras.tb012_cod_produto',
            ],
            'mes'        => [
                'column' => 'YEAR(compras.tb012_017_data) AS "ano"',
                'group'  => 'YEAR(compras.tb012_017_data)',
            ],
            'ano'        => [
                'column' => 'MONTH(compras.tb012_017_data) AS "mes"',
                'group'  => 'MONTH(compras.tb012_017_data)',
            ],
        ];
        $groups = [];
        $columns = [];
        $fornecedor && array_push($columns, $sql['fornecedor']['column']) && array_push($groups, $sql['fornecedor']['group']);
        $categoria && array_push($columns, $sql['categoria']['column']) && array_push($groups, $sql['categoria']['group']);
        $produto && array_push($columns, $sql['produto']['column']) && array_push($groups, $sql['produto']['group']);
        $mes && array_push($columns, $sql['mes']['column']) && array_push($groups, $sql['mes']['group']);
        $ano && array_push($columns, $sql['ano']['column']) && array_push($groups, $sql['ano']['group']);

        return $this->stagingArea->query(
            'SELECT' .
            '        SUM(compras.tb012_017_quantidade) AS "quantidade",' .
            '        SUM(compras.tb012_017_quantidade * compras.tb012_017_valor_unitario) AS "custo"' .
            '    ' . (count($columns) ? ',' : '') .
            '    ' . join(',', $columns) .
            '    FROM' .
            '        tb012_017_compras compras' .
            '    INNER JOIN' .
            '        tb012_produtos produtos ON produtos.tb012_cod_produto = compras.tb012_cod_produto' .
            '    ' . (count($groups) ? 'GROUP BY' : '') .
            '    ' . join(',', $groups),
        )->fetchAll(PDO::FETCH_OBJ);
    }

    private function loadToFactCompras($records)
    {
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO fato_compras' .
            '        (fornecedor, categoria, produto, ano, mes, quantidade, custo)' .
            '    VALUES(?, ?, ?, ?, ?, ?, ?)'
        );

        foreach ($records as $record) {
            $stmt->bindValue(1, $record->fornecedor ?? null);
            $stmt->bindValue(2, $record->categoria ?? null);
            $stmt->bindValue(3, $record->produto ?? null);
            $stmt->bindValue(4, $record->ano ?? null);
            $stmt->bindValue(5, $record->mes ?? null);
            $stmt->bindValue(6, $record->quantidade ?? 0);
            $stmt->bindValue(7, $record->custo ?? 0);
            $stmt->execute();
        }
    }

    public function seedFactCompras()
    {
        foreach ([0, 1] as $fornecedor) {
            foreach ([0, 1] as $categoria) {
                foreach ([0, 1] as $produto) {
                    foreach ([0, 1] as $mes) {
                        foreach ([0, 1] as $ano) {
                            $resultSet = $this->fetchFromCompras($fornecedor, $categoria, $produto, $mes, $ano);
                            $this->loadToFactCompras($resultSet);
                        }
                    }
                }
            }
        }
    }

    private function fetchFromVendas($estado, $cidade, $loja, $funcionario, $cliente, $categoria, $produto, $mes, $ano)
    {
        $sql = [
            'estado'      => [
                'column'  => 'cidades.tb001_sigla_uf AS "estado"',
                'group'   => 'cidades.tb001_sigla_uf',
            ],
            'cidade'      => [
                'column'  => 'enderecos.tb002_cod_cidade AS "cidade"',
                'group'   => 'enderecos.tb002_cod_cidade',
            ],
            'loja'        => [
                'column'  => 'funcionarios.tb004_cod_loja AS "loja"',
                'group'   => 'funcionarios.tb004_cod_loja',
            ],
            'funcionario' => [
                'column'  => 'vendas.tb005_matricula AS "funcionario"',
                'group'   => 'vendas.tb005_matricula',
            ],
            'cliente'     => [
                'column'  => 'vendas.tb010_cpf AS "cliente"',
                'group'   => 'vendas.tb010_cpf',
            ],
            'categoria'   => [
                'column'  => 'produtos.tb013_cod_categoria AS "categoria"',
                'group'   => 'produtos.tb013_cod_categoria',
            ],
            'produto'     => [
                'column'  => 'vendas.tb012_cod_produto AS "produto"',
                'group'   => 'vendas.tb012_cod_produto',
            ],
            'mes'         => [
                'column'  => 'YEAR(vendas.tb010_012_data) AS "ano"',
                'group'   => 'YEAR(vendas.tb010_012_data)',
            ],
            'ano'         => [
                'column'  => 'MONTH(vendas.tb010_012_data) AS "mes"',
                'group'   => 'MONTH(vendas.tb010_012_data)',
            ],
        ];
        $groups = [];
        $columns = [];
        $funcionario && array_push($columns, $sql['funcionario']['column']) && array_push($groups, $sql['funcionario']['group']);
        $categoria && array_push($columns, $sql['categoria']['column']) && array_push($groups, $sql['categoria']['group']);
        $cliente && array_push($columns, $sql['cliente']['column']) && array_push($groups, $sql['cliente']['group']);
        $produto && array_push($columns, $sql['produto']['column']) && array_push($groups, $sql['produto']['group']);
        $estado && array_push($columns, $sql['estado']['column']) && array_push($groups, $sql['estado']['group']);
        $cidade && array_push($columns, $sql['cidade']['column']) && array_push($groups, $sql['cidade']['group']);
        $loja && array_push($columns, $sql['loja']['column']) && array_push($groups, $sql['loja']['group']);
        $mes && array_push($columns, $sql['mes']['column']) && array_push($groups, $sql['mes']['group']);
        $ano && array_push($columns, $sql['ano']['column']) && array_push($groups, $sql['ano']['group']);

        return $this->stagingArea->query(
            'SELECT' .
            '        SUM(vendas.tb010_012_quantidade) AS "quantidade",' .
            '        SUM(vendas.tb010_012_quantidade * vendas.tb010_012_valor_unitario) AS "valor"' .
            '    ' . (count($columns) ? ',' : '') .
            '    ' . join(',', $columns) .
            '    FROM' .
            '        tb010_012_vendas vendas' .
            '    INNER JOIN' .
            '        tb012_produtos produtos ON produtos.tb012_cod_produto = vendas.tb012_cod_produto' .
            '    INNER JOIN' .
            '        tb005_funcionarios funcionarios ON funcionarios.tb005_matricula = vendas.tb005_matricula' .
            '    INNER JOIN' .
            '        tb004_lojas lojas ON lojas.tb004_cod_loja = funcionarios.tb004_cod_loja' .
            '    INNER JOIN' .
            '        tb003_enderecos enderecos ON enderecos.tb003_cod_endereco = lojas.tb003_cod_endereco' .
            '    INNER JOIN' .
            '        tb002_cidades cidades ON cidades.tb002_cod_cidade = enderecos.tb002_cod_cidade' .
            '    ' . (count($groups) ? 'GROUP BY' : '') .
            '    ' . join(',', $groups)
        )->fetchAll(PDO::FETCH_OBJ);
    }

    private function loadToFactVendas($records)
    {
        $stmt = $this->dataWarehouse->prepare(
            'INSERT INTO fato_vendas' .
            '        (funcionario, categoria, produto, cliente, estado, cidade, loja, ano, mes, valor, quantidade, lucratividade)' .
            '    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
        );

        foreach ($records as $record) {
            $stmt->bindValue(1, $record->funcionario ?? null);
            $stmt->bindValue(2, $record->categoria ?? null);
            $stmt->bindValue(3, $record->produto ?? null);
            $stmt->bindValue(4, $record->cliente ?? null);
            $stmt->bindValue(5, $record->estado ?? null);
            $stmt->bindValue(6, $record->cidade ?? null);
            $stmt->bindValue(7, $record->loja ?? null);
            $stmt->bindValue(8, $record->ano ?? null);
            $stmt->bindValue(9, $record->mes ?? null);
            $stmt->bindValue(10, $record->valor ?? 0);
            $stmt->bindValue(11, $record->quantidade ?? 0);
            $stmt->bindValue(12, $record->custo ?? 0);
            $stmt->execute();
        }
    }

    public function seedFactVendas()
    {
        foreach ([0, 1] as $estado) {
            foreach ([0, 1] as $cidade) {
                foreach ([0, 1] as $loja) {
                    foreach ([0, 1] as $funcionario) {
                        foreach ([0, 1] as $cliente) {
                            foreach ([0, 1] as $categoria) {
                                foreach ([0, 1] as $produto) {
                                    foreach ([0, 1] as $mes) {
                                        foreach ([0, 1] as $ano) {
                                            $resultSet = $this->fetchFromVendas($estado, $cidade, $loja, $funcionario, $cliente, $categoria, $produto, $mes, $ano);
                                            $this->loadToFactVendas($resultSet);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
