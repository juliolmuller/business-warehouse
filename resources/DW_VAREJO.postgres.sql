
DROP TABLE IF EXISTS fato_compras;
DROP TABLE IF EXISTS fato_vendas;
DROP TABLE IF EXISTS fornecedores;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS lojas;
DROP TABLE IF EXISTS cidades;
DROP TABLE IF EXISTS estados;

CREATE TABLE estados
(
	sigla_uf      CHAR(2) PRIMARY KEY,
	nome_estado   VARCHAR NOT NULL
);

CREATE TABLE cidades
(
  cod_cidade    INTEGER PRIMARY KEY,
  cod_estado    CHAR(2) NOT NULL REFERENCES estados(sigla_uf),
  nome_cidade   VARCHAR NOT NULL
);

CREATE TABLE lojas
(
	cod_loja             INTEGER PRIMARY KEY,
	matriz               INTEGER,
	cnpj                 VARCHAR(20) NOT NULL,
	inscricao_estadual   VARCHAR(20)
);

CREATE TABLE funcionarios
(
	matricula          INTEGER PRIMARY KEY,
	cod_loja           INTEGER NOT NULL REFERENCES lojas(cod_loja),
	nome_completo      VARCHAR NOT NULL,
	status             VARCHAR(20) NOT NULL,
	data_contratacao   DATE NOT NULL,
	data_demissao      DATE
);

CREATE TABLE categorias
(
	cod_categoria   INTEGER PRIMARY KEY,
	descricao       VARCHAR NOT NULL
);

CREATE TABLE produtos
(
	cod_produto     INTEGER PRIMARY KEY,
	cod_categoria   INTEGER NOT NULL REFERENCES categorias(cod_categoria),
	descricao       VARCHAR NOT NULL
);

CREATE TABLE clientes
(
	cpf    NUMERIC(15) PRIMARY KEY,
	nome   VARCHAR NOT NULL
);

CREATE TABLE fornecedores
(
	cod_fornecedor   INTEGER PRIMARY KEY,
	razao_social     VARCHAR,
	nome_fantasia    VARCHAR
);

CREATE TABLE fato_vendas
(
  estado          CHAR(2)     REFERENCES estados(sigla_uf),
  cidade          INTEGER     REFERENCES cidades(cod_cidade),
  loja            INTEGER     REFERENCES lojas(cod_loja),
  funcionario     INTEGER     REFERENCES funcionarios(matricula),
  categoria       INTEGER     REFERENCES categorias(cod_categoria),
  produto         INTEGER     REFERENCES produtos(cod_produto),
  cliente         NUMERIC(15) REFERENCES clientes(cpf),
  ano             INTEGER,
  mes             INTEGER,
  quantidade      NUMERIC NOT NULL,
  valor           MONEY NOT NULL,
  lucratividade   MONEY NOT NULL
);

CREATE TABLE fato_compras
(
  categoria    INTEGER REFERENCES categorias(cod_categoria),
  produto      INTEGER REFERENCES produtos(cod_produto),
  fornecedor   INTEGER REFERENCES fornecedores(cod_fornecedor),
  ano          INTEGER,
  mes          INTEGER,
  quantidade   NUMERIC NOT NULL,
  custo        MONEY NOT NULL
);
