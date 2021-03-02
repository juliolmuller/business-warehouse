DROP TABLE IF EXISTS tb010_clientes_antigos;
DROP TABLE IF EXISTS tb016_prd_vestuarios;
DROP TABLE IF EXISTS tb011_logins;
DROP TABLE IF EXISTS tb015_prd_eletros;
DROP TABLE IF EXISTS tb014_prd_alimentos;
DROP TABLE IF EXISTS tb005_006_funcionarios_cargos;
DROP TABLE IF EXISTS tb006_cargos;
DROP TABLE IF EXISTS tb010_012_vendas;
DROP TABLE IF EXISTS tb010_clientes;
DROP TABLE IF EXISTS tb005_funcionarios;
DROP TABLE IF EXISTS tb004_lojas;
DROP TABLE IF EXISTS tb999_log;
DROP TABLE IF EXISTS tb012_017_compras;
DROP TABLE IF EXISTS tb017_fornecedores;
DROP TABLE IF EXISTS tb003_enderecos;
DROP TABLE IF EXISTS tb002_cidades;
DROP TABLE IF EXISTS tb001_uf;
DROP TABLE IF EXISTS tb012_produtos;
DROP TABLE IF EXISTS tb013_categorias;

CREATE TABLE tb001_uf
( 
	tb001_sigla_uf       VARCHAR(2)  NOT NULL ,
	tb001_nome_estado    VARCHAR(255)  NOT NULL 
);

CREATE TABLE tb002_cidades
( 
	tb002_cod_cidade     INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb001_sigla_uf       VARCHAR(2)  NOT NULL ,
	tb002_nome_cidade    VARCHAR(255)  NOT NULL 
);

CREATE TABLE tb003_enderecos
( 
	tb003_cod_endereco   INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb001_sigla_uf       VARCHAR(2)  NOT NULL ,
	tb002_cod_cidade     NUMERIC(10)  NOT NULL ,
	tb003_nome_rua       VARCHAR(255)  NOT NULL ,
	tb003_numero_rua     VARCHAR(10)  NOT NULL ,
	tb003_complemento    VARCHAR(255)  NULL ,
	tb003_ponto_referencia VARCHAR(255)  NULL ,
	tb003_bairro         VARCHAR(255)  NOT NULL ,
	tb003_CEP            VARCHAR(15)  NOT NULL 
);

CREATE TABLE tb004_lojas
( 
	tb004_cod_loja       INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb003_cod_endereco   NUMERIC(10)  NULL ,
	tb004_matriz         NUMERIC(10)  NULL ,
	tb004_cnpj_loja      VARCHAR(20)  NOT NULL ,
	tb004_inscricao_estadual VARCHAR(20)  NULL 
);

CREATE TABLE tb005_006_funcionarios_cargos
( 
	tb005_matricula      NUMERIC(10)  NOT NULL ,
	tb006_cod_cargo      NUMERIC(10)  NOT NULL ,
	tb005_006_valor_cargo NUMERIC(10,2)  NOT NULL ,
	tb005_006_perc_comissao_cargo NUMERIC(5,2)  NOT NULL ,
	tb005_006_data_promocao datetime  NOT NULL 
);

CREATE TABLE tb005_funcionarios
( 
	tb005_matricula      INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb004_cod_loja       NUMERIC(10)  NOT NULL ,
	tb003_cod_endereco   NUMERIC(10)  NOT NULL ,
	tb005_nome_completo  VARCHAR(255)  NOT NULL ,
	tb005_data_nascimento datetime  NOT NULL ,
	tb005_CPF            VARCHAR(17)  NOT NULL ,
	tb005_RG             VARCHAR(15)  NOT NULL ,
	tb005_status         VARCHAR(20)  NOT NULL ,
	tb005_data_contratacao datetime  NOT NULL ,
	tb005_data_demissao  datetime  NULL 
);

CREATE TABLE tb006_cargos
( 
	tb006_cod_cargo      INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb006_nome_cargo     VARCHAR(255)  NOT NULL 
);

CREATE TABLE tb010_012_vendas
( 
	tb010_012_cod_venda  INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb010_cpf            NUMERIC(15)  NOT NULL ,
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb005_matricula      NUMERIC(10)  NOT NULL ,
	tb010_012_data       datetime  NOT NULL ,
	tb010_012_quantidade NUMERIC(10)  NOT NULL ,
	tb010_012_valor_unitario NUMERIC(12,4)  NOT NULL
);

CREATE TABLE tb010_clientes
( 
	tb010_cpf            NUMERIC(15)  NOT NULL ,
	tb010_nome           VARCHAR(255)  NOT NULL ,
	tb010_fone_residencial VARCHAR(255)  NOT NULL ,
	tb010_fone_celular   VARCHAR(255)  NULL 
);

CREATE TABLE tb010_clientes_antigos
( 
	tb010_cpf            NUMERIC(15,0)  NOT NULL ,
	tb010_nome           VARCHAR(255)  NULL
);

CREATE TABLE tb011_logins
( 
	tb011_logins         VARCHAR(255)  NOT NULL ,
	tb010_cpf            NUMERIC(15)  NOT NULL ,
	tb011_senha          VARCHAR(255)  NOT NULL ,
	tb011_data_cadastro  datetime  NULL 
);

CREATE TABLE tb012_017_compras
( 
	tb012_017_cod_compra INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb017_cod_fornecedor NUMERIC(10)  NOT NULL ,
	tb012_017_data       datetime  NULL ,
	tb012_017_quantidade NUMERIC(10)  NULL ,
	tb012_017_valor_unitario NUMERIC(12,2)  NULL
);

CREATE TABLE tb012_produtos
( 
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb013_cod_categoria  NUMERIC(10)  NOT NULL ,
	tb012_descricao      VARCHAR(255)  NOT NULL 
);

CREATE TABLE tb013_categorias
( 
	tb013_cod_categoria  INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb013_descricao      VARCHAR(255)  NOT NULL 
);

CREATE TABLE tb014_prd_alimentos
( 
	tb014_cod_prd_alimentos INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb014_detalhamento   VARCHAR(255)  NOT NULL ,
	tb014_unidade_medida VARCHAR(255)  NOT NULL ,
	tb014_num_lote       VARCHAR(255)  NULL ,
	tb014_data_vencimento datetime  NULL ,
	tb014_valor_sugerido numeric(10,2)  NULL 
);

CREATE TABLE tb015_prd_eletros
( 
	tb015_cod_prd_eletro INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb015_detalhamento   VARCHAR(255)  NOT NULL ,
	tb015_tensao         VARCHAR(255)  NULL ,
	tb015_nivel_consumo_procel char(1)  NULL ,
	tb015_valor_sugerido numeric(10,2)  NULL 
);

CREATE TABLE tb016_prd_vestuarios
( 
	tb016_cod_prd_vestuario INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb012_cod_produto    NUMERIC(10)  NOT NULL ,
	tb016_detalhamento   VARCHAR(255)  NOT NULL ,
	tb016_sexo           CHAR(1)  NOT NULL ,
	tb016_tamanho        VARCHAR(255)  NULL ,
	tb016_numeracao      NUMERIC(3)  NULL ,
	tb016_valor_sugerido numeric(10,2)  NULL 
);

CREATE TABLE tb017_fornecedores
( 
	tb017_cod_fornecedor INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb017_razao_social   VARCHAR(255)  NULL ,
	tb017_nome_fantasia  VARCHAR(255)  NULL ,
	tb017_fone           VARCHAR(15)  NULL ,
	tb003_cod_endereco   NUMERIC(10)  NULL 
);

CREATE TABLE tb999_log
( 
	tb999_cod_log        INTEGER AUTO_INCREMENT PRIMARY KEY,
	tb099_objeto         VARCHAR(100)  NOT NULL ,
	tb999_dml            VARCHAR(25)  NOT NULL ,
	tb999_data           datetime  NOT NULL 
);

INSERT INTO tb001_uf VALUES('AC', 'Acre');
INSERT INTO tb001_uf VALUES('AL', 'Alagoas');
INSERT INTO tb001_uf VALUES('AP', 'Amapá');
INSERT INTO tb001_uf VALUES('AM', 'Amazonas');
INSERT INTO tb001_uf VALUES('BA', 'Bahia');
INSERT INTO tb001_uf VALUES('CE', 'Ceará');
INSERT INTO tb001_uf VALUES('DF', 'Distrito Federal');
INSERT INTO tb001_uf VALUES('ES', 'Espírito Santo');
INSERT INTO tb001_uf VALUES('GO', 'Goiás');
INSERT INTO tb001_uf VALUES('MA', 'Maranhão');
INSERT INTO tb001_uf VALUES('MT', 'Mato Grosso');
INSERT INTO tb001_uf VALUES('MS', 'Mato Grosso do Sul');
INSERT INTO tb001_uf VALUES('MG', 'Minas Gerais');
INSERT INTO tb001_uf VALUES('PA', 'Pará');
INSERT INTO tb001_uf VALUES('PB', 'Paraíba');
INSERT INTO tb001_uf VALUES('PR', 'Paraná');
INSERT INTO tb001_uf VALUES('PE', 'Pernambuco');
INSERT INTO tb001_uf VALUES('PI', 'Piauí');
INSERT INTO tb001_uf VALUES('RR', 'Roraima');
INSERT INTO tb001_uf VALUES('RO', 'Rondônia');
INSERT INTO tb001_uf VALUES('RJ', 'Rio de Janeiro');
INSERT INTO tb001_uf VALUES('RN', 'Rio Grande do Norte');
INSERT INTO tb001_uf VALUES('RS', 'Rio Grande do Sul');
INSERT INTO tb001_uf VALUES('SC', 'Santa Catarina');
INSERT INTO tb001_uf VALUES('SP', 'São Paulo');
INSERT INTO tb001_uf VALUES('SE', 'Sergipe');
INSERT INTO tb001_uf VALUES('TO', 'Tocantins');

INSERT INTO tb002_cidades VALUES(NULL, 'AC', 'Rio Branco');
INSERT INTO tb002_cidades VALUES(NULL, 'AL', 'Maceió');
INSERT INTO tb002_cidades VALUES(NULL, 'AP', 'Macapá');
INSERT INTO tb002_cidades VALUES(NULL, 'AM', 'Manaus');
INSERT INTO tb002_cidades VALUES(NULL, 'BA', 'Salvador');
INSERT INTO tb002_cidades VALUES(NULL, 'CE', 'Fortaleza');
INSERT INTO tb002_cidades VALUES(NULL, 'DF', 'Brasília');
INSERT INTO tb002_cidades VALUES(NULL, 'ES', 'Vitória');
INSERT INTO tb002_cidades VALUES(NULL, 'GO', 'Goiânia');
INSERT INTO tb002_cidades VALUES(NULL, 'MA', 'São Luís');
INSERT INTO tb002_cidades VALUES(NULL, 'MT', 'Cuiabá');
INSERT INTO tb002_cidades VALUES(NULL, 'MS', 'Campo Grande');
INSERT INTO tb002_cidades VALUES(NULL, 'MG', 'Belo Horizonte');
INSERT INTO tb002_cidades VALUES(NULL, 'PA', 'Belém');
INSERT INTO tb002_cidades VALUES(NULL, 'PB', 'João Pessoa');
INSERT INTO tb002_cidades VALUES(NULL, 'PR', 'Curitiba');
INSERT INTO tb002_cidades VALUES(NULL, 'PE', 'Recife');
INSERT INTO tb002_cidades VALUES(NULL, 'PI', 'Teresina');
INSERT INTO tb002_cidades VALUES(NULL, 'RR', 'Boa Vista');
INSERT INTO tb002_cidades VALUES(NULL, 'RO', 'Porto Velho');
INSERT INTO tb002_cidades VALUES(NULL, 'RJ', 'Rio de Janeiro');
INSERT INTO tb002_cidades VALUES(NULL, 'RN', 'Natal');
INSERT INTO tb002_cidades VALUES(NULL, 'RS', 'Porto Alegre');
INSERT INTO tb002_cidades VALUES(NULL, 'SC', 'Florianópolis');
INSERT INTO tb002_cidades VALUES(NULL, 'SP', 'São Paulo');
INSERT INTO tb002_cidades VALUES(NULL, 'SE', 'Aracaju');
INSERT INTO tb002_cidades VALUES(NULL, 'TO', 'Palmas');

INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '1.234',null,null, 'Centro', '80.345-432');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '234',null,null, 'Centro', '80.345-533');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '43', 'Bl 08 AP 30',null, 'Rebouças', '82.345-434');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. 1º de Maio', '34',null,null, 'Pampulha', '81.345-435');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Getúlio Vargas', '4.324',null,null, 'Água Verde', '80.345-634');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '23',null,null, 'Centro', '80.345-735');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '54', 'Casa 02',null, 'Centro', '82.345-435');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '345', 'Casa 20', 'Próx. Shopping Curitiba', 'Centro', '81.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Iguaçú', '11',null,null, 'Rebouças', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Manoel Ribas', '876',null,null, 'Santa Felicidade', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '467',null,null, 'Centro', '80.345-634');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '422',null,null, 'Centro', '80.345-735');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '376', 'Bl 08 AP 31',null, 'Rebouças', '82.345-435');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. 1º de Maio', '331',null,null, 'Pampulha', '81.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Getúlio Vargas', '285',null,null, 'Água Verde', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '240',null,null, 'Centro', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '194', 'Casa 38',null, 'Centro', '82.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Rua Brigadeiro Franco', '149', 'Casa 56', 'Próx. Vicente Machado', 'Centro', '81.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Iguaçú', '103',null,null, 'Rebouças', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Manoel Ribas', '331',null,null, 'Santa Felicidade', '82.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '285',null,null, 'Centro', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '240',null,null, 'Centro', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. Brasil', '331', 'Bl 08 AP 32',null, 'Rebouças', '82.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'MG', 13, 'Av. 1º de Maio', '285',null,null, 'Pampulha', '81.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'PR', 16, 'Av. Getúlio Vargas', '240',null,null, 'Água Verde', '80.345-038');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '43',null,null, 'Centro', '80.345-634');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '34',null,null, 'Centro', '80.345-735');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '4.324',null,null, 'Rebouças', '82.345-435');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '23', 'Casa 01',null, 'Rebouças', '81.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '54', 'Casa 23',null, 'Centro', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Joaquim Lima', '345', 'Casa 99',null, 'Centro', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '11',null,null, 'Ladeira', '82.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '876',null,null, 'Ladeira', '81.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '467',null,null, 'Ladeira', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '422',null,null, 'Ladeira', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '376',null,null, 'Ladeira', '80.345-634');
INSERT INTO  tb003_enderecos VALUES(NULL, 'RS', 23, 'Av. Das Nações', '331',null,null, 'Ladeira', '80.345-735');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Das Nações', '285',null,null, 'Ladeira', '82.345-436');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Das Nações', '240',null,null, 'Ladeira', '81.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Das Nações', '34',null,null, 'Ladeira', '80.345-156');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Paulista', '4.324',null,null, 'Centro', '80.345-199');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Washington Luiz', '23',null,null, 'Moema', '82.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Washington Luiz', '54',null,null, 'Moema', '81.345-438');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Washington Luiz', '345',null,null, 'Moema', '80.345-103');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Washington Luiz', '11',null,null, 'Moema', '80.345-123');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '34',null,null, 'Centro', '80.345-836');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '4.324',null,null, 'Centro', '80.345-937');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '23',null,null, 'Centro', '82.345-437');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '54',null,null, 'Centro', '81.345-438');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '345',null,null, 'Centro', '80.345-599');
INSERT INTO  tb003_enderecos VALUES(NULL, 'SP', 25, 'Av. Consolação', '11',null,null, 'Centro', '80.345-836');
INSERT INTO tb004_lojas VALUES(NULL, 5,null, '99.555.000-0001/01', '234.655.765');
INSERT INTO tb004_lojas VALUES(NULL, 1,1, '99.555.000-0001/02', '567.655.766');
INSERT INTO tb004_lojas VALUES(NULL, 28,1, '99.555.000-0001/03', '888.655.767');
INSERT INTO tb004_lojas VALUES(NULL, 41,null, '99.555.000-0001/04', '234.655.768');
INSERT INTO tb004_lojas VALUES(NULL, 10,1, '99.555.000-0001/05', '234.567.769');

INSERT INTO tb005_funcionarios VALUES(NULL, 1, 8, 'Funcionário 01', '1975-1-1', '999.444.555-01', '543.765.234-8', 'Ativo', '2000-1-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 2, 2, 'Funcionário 02', '1978-2-3', '999.444.555-02', '543.765.234-9', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3,24, 'Funcionário 03', '1982-3-10', '999.444.555-03', '543.765.234-10', 'Ativo', '2000-3-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 4, 9, 'Funcionário 04', '1989-4-3', '999.444.555-04', '543.765.234-11', 'Ativo', '2000-4-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 5, 8, 'Funcionário 05', '1979-5-1', '999.444.555-05', '543.765.234-12', 'Inativo', '2000-5-6', '2009-1-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 7, 'Funcionário 06', '1975-1-1', '999.444.555-06', '543.765.234-13', 'Ativo', '2000-6-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 2, 4, 'Funcionário 07', '1978-2-3', '999.444.555-07', '543.765.234-14', 'Ativo', '2000-7-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 1, 'Funcionário 08', '1982-3-10', '999.444.555-08', '543.765.234-15', 'Ativo', '2000-8-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 4,28, 'Funcionário 09', '1989-4-3', '999.444.555-09', '543.765.234-16', 'Ativo', '2000-9-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 5, 9, 'Funcionário 10', '1979-5-1', '999.444.555-10', '543.765.234-17', 'Inativo', '2000-10-6', '2009-2-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 8, 'Funcionário 11', '1975-1-1', '999.444.555-11', '543.765.234-18', 'Ativo', '2000-11-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 2, 5, 'Funcionário 12', '1978-2-3', '999.444.555-12', '543.765.234-19', 'Ativo', '2000-12-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 2, 'Funcionário 13', '1982-3-10', '999.444.555-13', '543.765.234-20', 'Ativo', '2000-10-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 4, 9, 'Funcionário 14', '1989-4-3', '999.444.555-14', '543.765.234-21', 'Ativo', '2000-11-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 5,10, 'Funcionário 15', '1979-5-1', '999.444.555-15', '543.765.234-22', 'Inativo', '2000-12-6', '2009-3-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 9, 'Funcionário 16', '1975-1-1', '999.444.555-16', '543.765.234-23', 'Ativo', '2000-12-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1,15, 'Funcionário 17', '1978-2-3', '999.444.555-17', '543.765.234-24', 'Ativo', '2000-7-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 9, 'Funcionário 18', '1982-3-10', '999.444.555-18', '543.765.234-25', 'Ativo', '2000-11-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1,19, 'Funcionário 19', '1989-4-3', '999.444.555-19', '543.765.234-26', 'Ativo', '2000-10-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 7, 'Funcionário 20', '1979-5-1', '999.444.555-20', '543.765.234-27', 'Inativo', '2000-2-6', '2008-4-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 7, 'Funcionário 21', '1975-1-1', '999.444.555-21', '543.765.234-28', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 2, 5, 'Funcionário 22', '1978-2-3', '999.444.555-22', '543.765.234-29', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 3, 'Funcionário 23', '1982-3-10', '999.444.555-23', '543.765.234-30', 'Ativo', '2000-3-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 3, 'Funcionário 24', '1989-4-3', '999.444.555-24', '543.765.234-31', 'Ativo', '2000-4-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 4, 'Funcionário 25', '1979-5-1', '999.444.555-25', '543.765.234-32', 'Inativo', '2000-5-6', '2005-5-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 5, 'Funcionário 26', '1975-1-1', '999.444.555-26', '543.765.234-33', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3, 6, 'Funcionário 27', '1978-2-3', '999.444.555-27', '543.765.234-34', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 3,25, 'Funcionário 28', '1982-3-10', '999.444.555-28', '543.765.234-35', 'Ativo', '2000-2-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 4, 1, 'Funcionário 29', '1989-4-3', '999.444.555-29', '543.765.234-36', 'Ativo', '2000-1-6',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 5, 1, 'Funcionário 30', '1979-5-1', '999.444.555-30', '543.765.234-37', 'Inativo', '2000-3-6', '2009-6-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 1, 'Funcionário 31', '1975-1-1', '999.444.555-31', '543.765.234-38', 'Ativo', '2000-1-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 5, 2, 'Funcionário 32', '1978-2-3', '999.444.555-32', '543.765.234-39', 'Ativo', '2000-2-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 6, 'Funcionário 33', '1982-3-10', '999.444.555-33', '543.765.234-40', 'Ativo', '2000-3-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 7, 'Funcionário 34', '1989-4-3', '999.444.555-34', '543.765.234-41', 'Ativo', '2000-4-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 8, 'Funcionário 35', '1979-5-1', '999.444.555-35', '543.765.234-42', 'Inativo', '2000-5-7', '2009-7-1');
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 9, 'Funcionário 36', '1975-1-1', '999.444.555-36', '543.765.234-43', 'Ativo', '2000-6-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1,30, 'Funcionário 37', '1978-2-3', '999.444.555-37', '543.765.234-44', 'Ativo', '2000-7-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 1, 'Funcionário 38', '1982-3-10', '999.444.555-38', '543.765.234-45', 'Ativo', '2000-8-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 1, 'Funcionário 39', '1989-4-3', '999.444.555-39', '543.765.234-46', 'Ativo', '2000-9-7',null);
INSERT INTO tb005_funcionarios VALUES(NULL, 1, 4, 'Funcionário 40', '1979-5-1', '999.444.555-40', '543.765.234-47', 'Inativo', '2000-10-7', '2005-8-1');


INSERT INTO tb006_cargos VALUES(NULL, 'Diretor');
INSERT INTO tb006_cargos VALUES(NULL, 'Gerente Regional');
INSERT INTO tb006_cargos VALUES(NULL, 'Caixa');
INSERT INTO tb006_cargos VALUES(NULL, 'Auxiliar Administrativo');
INSERT INTO tb006_cargos VALUES(NULL, 'Vendedor Júnior');
INSERT INTO tb006_cargos VALUES(NULL, 'Vendedor Pleno');
INSERT INTO tb006_cargos VALUES(NULL, 'Vendedor Senior');
INSERT INTO tb006_cargos VALUES(NULL, 'Motorista');
INSERT INTO tb006_cargos VALUES(NULL, 'Recursos Humanos');
INSERT INTO tb006_cargos VALUES(NULL, 'Contador');

INSERT INTO tb005_006_funcionarios_cargos VALUES(1, 1, 30000.00, 0.00, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(12, 2, 10000.00, 0.00, '2008-3-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(13, 3, 1000.00, 0.00, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(14, 4, 500.00, 0.00, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(14, 5, 800.00, 0.05, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(16, 6, 1000.00, 0.07, '2008-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(17, 7, 1300.00, 0.10, '2008-2-5');
INSERT INTO tb005_006_funcionarios_cargos VALUES(18, 8, 1050.00, 0.00, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(19, 9, 1150.00, 0.00, '2008-2-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(10, 3, 1050.99, 0.00, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(11, 5, 800.00, 0.06, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(12, 6, 1000.00, 0.06, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(13, 7, 1300.00, 0.11, '2008-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(15, 5, 800.00, 0.04, '2008-2-5');
INSERT INTO tb005_006_funcionarios_cargos VALUES(15, 6, 1000.00, 0.09, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(16, 7, 1300.00, 0.12, '2008-2-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(17, 5, 800.00, 0.05, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(18, 6, 1000.00, 0.09, '2008-12-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(4, 7, 1300.00, 0.12, '2008-10-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(20, 3, 1000.00, 0.00, '2008-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(11, 3, 1000.00, 0.00, '2008-2-5');
INSERT INTO tb005_006_funcionarios_cargos VALUES(12, 3, 1000.00, 0.00, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(13, 8, 1050.00, 0.00, '2008-5-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(14, 8, 1050.00, 0.00, '2008-6-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(15, 8, 1050.00, 0.00, '2008-7-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(16, 8, 1050.00, 0.00, '2008-8-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(17, 2, 10000.00, 0.00, '2008-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(18, 2, 10000.00, 0.00, '2008-2-5');
INSERT INTO tb005_006_funcionarios_cargos VALUES(14, 2, 10000.00, 0.00, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(10, 5, 800.00, 0.04, '2008-9-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(11, 6, 1000.00, 0.07, '2008-6-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(12, 7, 1300.00, 0.12, '2008-7-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(13, 5, 800.00, 0.04, '2008-12-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(14, 6, 1000.00, 0.07, '2008-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(15, 7, 1300.00, 0.11, '2008-3-5');
INSERT INTO tb005_006_funcionarios_cargos VALUES(16, 3, 1000.00, 0.00, '2008-1-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(17, 3, 1000.00, 0.00, '2008-5-2');
INSERT INTO tb005_006_funcionarios_cargos VALUES(18, 7, 1300.00, 0.11, '2008-5-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(3, 7, 1300.00, 0.11, '2008-5-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(10, 7, 1300.00, 0.11, '2008-8-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(13, 6, 1000.00, 0.07, '2009-9-3');
INSERT INTO tb005_006_funcionarios_cargos VALUES(8, 7, 1300.00, 0.10, '2009-2-4');
INSERT INTO tb005_006_funcionarios_cargos VALUES(9, 2, 10000.00, 0.10, '2009-2-5');


INSERT INTO tb010_clientes VALUES(10000000000, 'NOME Teste 01', '(41) 3333-0001', '(41) 9999-9001');
INSERT INTO tb010_clientes VALUES(10000000001, 'NOME Teste 02', '(41) 3333-0002', '(41) 9999-9002');
INSERT INTO tb010_clientes VALUES(10000000002, 'NOME Teste 03', '(41) 3333-0003', '(41) 9999-9003');
INSERT INTO tb010_clientes VALUES(10000000003, 'NOME Teste 04', '(41) 3333-0004', '(41) 9999-9004');
INSERT INTO tb010_clientes VALUES(10000000004, 'NOME Teste 05', '(41) 3333-0005', '(41) 9999-9005');
INSERT INTO tb010_clientes VALUES(10000000005, 'NOME Teste 06', '(41) 3333-0006', '(41) 9999-9006');
INSERT INTO tb010_clientes VALUES(10000000006, 'NOME Teste 07', '(41) 3333-0007', '(41) 9999-9007');
INSERT INTO tb010_clientes VALUES(10000000007, 'NOME Teste 08', '(41) 3333-0008', '(41) 9999-9008');
INSERT INTO tb010_clientes VALUES(10000000008, 'NOME Teste 09', '(41) 3333-0009', '(41) 9999-9009');
INSERT INTO tb010_clientes VALUES(10000000009, 'NOME Teste 10', '(41) 3333-0010', '(41) 9999-9010');
INSERT INTO tb010_clientes VALUES(10000000010, 'NOME Teste 11', '(11) 5333-0011', '(41) 9999-9011');
INSERT INTO tb010_clientes VALUES(10000000011, 'NOME Teste 12', '(41) 3333-0012', '(41) 9999-9012');
INSERT INTO tb010_clientes VALUES(10000000012, 'NOME Teste 13', '(41) 3333-0013', '(41) 9999-9013');
INSERT INTO tb010_clientes VALUES(10000000013, 'NOME Teste 14', '(41) 3333-0014', '(41) 9999-9014');
INSERT INTO tb010_clientes VALUES(10000000014, 'NOME Teste 15', '(41) 3333-0015', '(41) 9999-9015');
INSERT INTO tb010_clientes VALUES(10000000015, 'NOME Teste 16', '(48) 5333-8989', '(41) 9999-9016');
INSERT INTO tb010_clientes VALUES(10000000016, 'NOME Teste 17', '(41) 3333-0017', '(41) 9999-9017');
INSERT INTO tb010_clientes VALUES(10000000017, 'NOME Teste 18', '(41) 3333-0018', '(41) 9999-9018');
INSERT INTO tb010_clientes VALUES(10000000018, 'NOME Teste 19', '(41) 3333-0019', '(41) 9999-9019');
INSERT INTO tb010_clientes VALUES(10000000019, 'NOME Teste 20', '(41) 3333-0020', '(41) 9999-9020');
INSERT INTO tb010_clientes VALUES(10000000020, 'NOME Teste 21', '(41) 3333-0021', '(41) 9999-9021');
INSERT INTO tb010_clientes VALUES(10000000021, 'NOME Teste 22', '(41) 3333-0022', '(41) 9999-9022');
INSERT INTO tb010_clientes VALUES(10000000022, 'NOME Teste 23', '(11) 5333-0099', '(41) 9999-9023');
INSERT INTO tb010_clientes VALUES(10000000023, 'NOME Teste 24', '(41) 3333-0024', '(41) 9999-9024');
INSERT INTO tb010_clientes VALUES(10000000024, 'NOME Teste 25', '(41) 3333-0025', '(11) 8999-9025');
INSERT INTO tb010_clientes VALUES(10000000025, 'NOME Teste 26', '(41) 3333-0026', '(41) 9999-9026');
INSERT INTO tb010_clientes VALUES(10000000026, 'NOME Teste 27', '(41) 3333-0027', '(41) 9999-9027');
INSERT INTO tb010_clientes VALUES(10000000027, 'NOME Teste 28', '(41) 3333-0028', '(41) 9999-9028');
INSERT INTO tb010_clientes VALUES(10000000028, 'NOME Teste 29', '(41) 3333-0029', '(41) 9999-9029');
INSERT INTO tb010_clientes VALUES(10000000029, 'NOME Teste 30', '(41) 3333-0030', '(41) 9999-9030');
INSERT INTO tb010_clientes VALUES(10000000030, 'NOME Teste 31', '(41) 3333-0031', '(41) 9999-9031');
INSERT INTO tb010_clientes VALUES(10000000031, 'NOME Teste 32', '(41) 3333-0032', '(41) 9999-9032');
INSERT INTO tb010_clientes VALUES(10000000032, 'NOME Teste 33', '(41) 3333-0033', '(41) 9999-9033');
INSERT INTO tb010_clientes VALUES(10000000033, 'NOME Teste 34', '(41) 3333-0034', '(41) 9999-9034');
INSERT INTO tb010_clientes VALUES(10000000034, 'NOME Teste 35', '(41) 3333-0035', '(41) 9999-9035');
INSERT INTO tb010_clientes VALUES(10000000035, 'NOME Teste 36', '(41) 3333-0036', '(41) 9999-9036');
INSERT INTO tb010_clientes VALUES(10000000036, 'NOME Teste 37', '(41) 3333-0037', '(41) 9999-9037');
INSERT INTO tb010_clientes VALUES(10000000037, 'NOME Teste 38', '(41) 3333-0038', '(41) 9999-9038');
INSERT INTO tb010_clientes VALUES(10000000038, 'NOME Teste 39', '(41) 3333-0039', '(41) 9999-9039');
INSERT INTO tb010_clientes VALUES(10000000039, 'NOME Teste 40', '(41) 3333-0040', '(41) 9999-9040');
INSERT INTO tb010_clientes VALUES(10000000040, 'NOME Teste 41', '(41) 3333-0041', '(41) 9999-9041');
INSERT INTO tb010_clientes VALUES(10000000041, 'NOME Teste 42', '(41) 3333-0042', '(41) 9999-9042');
INSERT INTO tb010_clientes VALUES(10000000042, 'NOME Teste 43', '(41) 3333-0043', '(41) 9999-9043');
INSERT INTO tb010_clientes VALUES(10000000043, 'NOME Teste 44', '(41) 3333-0044', '(41) 9999-9044');
INSERT INTO tb010_clientes VALUES(10000000044, 'NOME Teste 45', '(41) 3333-0045', '(11) 8999-9325');
INSERT INTO tb010_clientes VALUES(10000000045, 'NOME Teste 46', '(41) 3333-0046', '(11) 8999-9089');
INSERT INTO tb010_clientes VALUES(10000000046, 'NOME Teste 47', '(41) 3333-0047', '(41) 9999-9047');
INSERT INTO tb010_clientes VALUES(10000000047, 'NOME Teste 48', '(41) 3333-0048', '(41) 9999-9048');
INSERT INTO tb010_clientes VALUES(10000000048, 'NOME Teste 49', '(41) 3333-0049', '(11) 8999-6464');
INSERT INTO tb010_clientes VALUES(10000000049, 'NOME Teste 50', '(41) 3333-0050', '(41) 9999-9050');
INSERT INTO tb010_clientes VALUES(10000000050, 'NOME Teste 51', '(41) 3333-0051', '(41) 9999-9051');


INSERT INTO tb010_clientes_antigos VALUES(10000000000, 'NOME Teste 01');
INSERT INTO tb010_clientes_antigos VALUES(10000000001, 'NOME Teste 02');
INSERT INTO tb010_clientes_antigos VALUES(10000000002, 'NOME Teste 03');
INSERT INTO tb010_clientes_antigos VALUES(10000000003, 'NOME Teste 04');
INSERT INTO tb010_clientes_antigos VALUES(10000000004, 'NOME Teste 05');
INSERT INTO tb010_clientes_antigos VALUES(10000000005, 'NOME Teste 06');
INSERT INTO tb010_clientes_antigos VALUES(10000000006, 'NOME Teste 07');
INSERT INTO tb010_clientes_antigos VALUES(10000000007, 'NOME Teste 08');
INSERT INTO tb010_clientes_antigos VALUES(10000000008, 'NOME Teste 09');
INSERT INTO tb010_clientes_antigos VALUES(10000000009, 'NOME Teste 10');
INSERT INTO tb010_clientes_antigos VALUES(10000000010, 'NOME Teste 11');
INSERT INTO tb010_clientes_antigos VALUES(10000000011, 'NOME Teste 12');

INSERT INTO tb011_logins VALUES('Teste_01',10000000000, 'Teste_01', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_02',10000000001, 'Teste_02', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_03',10000000002, 'Teste_03', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_04',10000000003, 'Teste_04', '2009-11-1');
INSERT INTO tb011_logins VALUES('Teste_05',10000000004, 'Teste_05', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_06',10000000005, 'Teste_06', '2009-12-1');
INSERT INTO tb011_logins VALUES('Teste_07',10000000006, 'Teste_07', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_08',10000000007, 'Teste_08', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_09',10000000008, 'Teste_09', '2009-1-8');
INSERT INTO tb011_logins VALUES('Teste_10',10000000009, 'Teste_10', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_11',10000000010, 'Teste_11', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_12',10000000011, 'Teste_12', '2008-1-1');
INSERT INTO tb011_logins VALUES('Teste_13',10000000012, 'Teste_13', '2009-3-1');
INSERT INTO tb011_logins VALUES('Teste_14',10000000013, 'Teste_14', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_15',10000000014, 'Teste_15', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_16',10000000015, 'Teste_16', '2009-1-2');
INSERT INTO tb011_logins VALUES('Teste_17',10000000016, 'Teste_17', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_18',10000000017, 'Teste_18', '2009-5-1');
INSERT INTO tb011_logins VALUES('Teste_19',10000000018, 'Teste_19', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_20',10000000019, 'Teste_20', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_21',10000000020, 'Teste_21', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_22',10000000021, 'Teste_22', '2009-11-1');
INSERT INTO tb011_logins VALUES('Teste_23',10000000022, 'Teste_23', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_24',10000000023, 'Teste_24', '2009-5-1');
INSERT INTO tb011_logins VALUES('Teste_25',10000000024, 'Teste_25', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_26',10000000025, 'Teste_26', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_27',10000000026, 'Teste_27', '2009-1-8');
INSERT INTO tb011_logins VALUES('Teste_28',10000000027, 'Teste_28', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_29',10000000028, 'Teste_29', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_30',10000000029, 'Teste_30', '2008-1-1');
INSERT INTO tb011_logins VALUES('Teste_31',10000000030, 'Teste_31', '2009-8-1');
INSERT INTO tb011_logins VALUES('Teste_32',10000000031, 'Teste_32', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_33',10000000032, 'Teste_33', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_34',10000000033, 'Teste_34', '2009-1-2');
INSERT INTO tb011_logins VALUES('Teste_35',10000000034, 'Teste_35', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_36',10000000035, 'Teste_36', '2009-9-1');
INSERT INTO tb011_logins VALUES('Teste_37',10000000036, 'Teste_37', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_38',10000000037, 'Teste_38', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_39',10000000038, 'Teste_39', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_40',10000000039, 'Teste_40', '2009-11-1');
INSERT INTO tb011_logins VALUES('Teste_41',10000000040, 'Teste_41', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_42',10000000041, 'Teste_42', '2009-7-1');
INSERT INTO tb011_logins VALUES('Teste_43',10000000042, 'Teste_43', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_44',10000000043, 'Teste_44', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_45',10000000044, 'Teste_45', '2009-1-8');
INSERT INTO tb011_logins VALUES('Teste_46',10000000045, 'Teste_46', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_47',10000000046, 'Teste_47', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_48',10000000047, 'Teste_48', '2008-1-1');
INSERT INTO tb011_logins VALUES('Teste_49',10000000048, 'Teste_49', '2009-4-1');
INSERT INTO tb011_logins VALUES('Teste_50',10000000049, 'Teste_50', '2009-1-1');
INSERT INTO tb011_logins VALUES('Teste_51',10000000050, 'Teste_51', '2009-1-1');


INSERT INTO tb013_categorias VALUES(NULL, 'Alimentos Perecíveis');
INSERT INTO tb013_categorias VALUES(NULL, 'Alimentos Não Perecíveis');
INSERT INTO tb013_categorias VALUES(NULL, 'Eletrodomésticos');
INSERT INTO tb013_categorias VALUES(NULL, 'Eletrônicos');
INSERT INTO tb013_categorias VALUES(NULL, 'CD e DVD');
INSERT INTO tb013_categorias VALUES(NULL, 'Roupas Masculinas');
INSERT INTO tb013_categorias VALUES(NULL, 'Roupas Femininas');
INSERT INTO tb013_categorias VALUES(NULL, 'Roupas Infantis');


INSERT INTO tb012_produtos VALUES(10, 1, 'Biscoito Recheado');
INSERT INTO tb012_produtos VALUES(11, 1, 'Pão-de-queijo Congelado');
INSERT INTO tb012_produtos VALUES(12, 1, 'Iogurte');
INSERT INTO tb012_produtos VALUES(13, 1, 'Barra de Chocolate');
INSERT INTO tb012_produtos VALUES(14, 1, 'Barra de Cereal');
INSERT INTO tb012_produtos VALUES(15, 1, 'Biscoito Água e Sal');
INSERT INTO tb012_produtos VALUES(16, 1, 'Biscoito Maizena');
INSERT INTO tb012_produtos VALUES(17, 1, 'Salgadinho');
INSERT INTO tb012_produtos VALUES(18, 1, 'Suco Ades');
INSERT INTO tb012_produtos VALUES(19, 1, 'Isotônico');
INSERT INTO tb012_produtos VALUES(20, 2, 'Acúcar');
INSERT INTO tb012_produtos VALUES(21, 2, 'Arroz');
INSERT INTO tb012_produtos VALUES(22, 2, 'Feijão');
INSERT INTO tb012_produtos VALUES(23, 2, 'Milho de Pipoca');
INSERT INTO tb012_produtos VALUES(30, 3, 'Geladeira');
INSERT INTO tb012_produtos VALUES(31, 3, 'Geladeira Duplex');
INSERT INTO tb012_produtos VALUES(32, 3, 'Fogão 4 Bocas');
INSERT INTO tb012_produtos VALUES(33, 3, 'Fogão 6 Bocas');
INSERT INTO tb012_produtos VALUES(34, 3, 'Batedeira');
INSERT INTO tb012_produtos VALUES(35, 3, 'Liquidificador');
INSERT INTO tb012_produtos VALUES(36, 3, 'Torradeira');
INSERT INTO tb012_produtos VALUES(37, 3, 'Sanduicheira');
INSERT INTO tb012_produtos VALUES(38, 3, 'Multiprocessador');
INSERT INTO tb012_produtos VALUES(39, 3, 'Forno Elétrico');
INSERT INTO tb012_produtos VALUES(40, 4, 'TV LCD');
INSERT INTO tb012_produtos VALUES(41, 4, 'TV Cubo de Imagens');
INSERT INTO tb012_produtos VALUES(42, 4, 'DVD');
INSERT INTO tb012_produtos VALUES(43, 4, 'DVD Karaoke');
INSERT INTO tb012_produtos VALUES(44, 4, 'Vídeo-Game');
INSERT INTO tb012_produtos VALUES(45, 4, 'Aparelho de Som');
INSERT INTO tb012_produtos VALUES(46, 4, 'Aparelho de Som Automotivo');
INSERT INTO tb012_produtos VALUES(47, 4, 'Auto-Falantes Automotivos');
INSERT INTO tb012_produtos VALUES(48, 4, 'Notebook');
INSERT INTO tb012_produtos VALUES(49, 4, 'Computador Desktop');
INSERT INTO tb012_produtos VALUES(50, 5, 'CD Rock');
INSERT INTO tb012_produtos VALUES(51, 5, 'CD POP');
INSERT INTO tb012_produtos VALUES(52, 5, 'CD Coletânea');
INSERT INTO tb012_produtos VALUES(53, 5, 'CD Caipira');
INSERT INTO tb012_produtos VALUES(54, 5, 'CD Virgem');
INSERT INTO tb012_produtos VALUES(55, 5, 'DVD Rock');
INSERT INTO tb012_produtos VALUES(56, 5, 'DVD POP');
INSERT INTO tb012_produtos VALUES(57, 5, 'DVD Coletânea');
INSERT INTO tb012_produtos VALUES(58, 5, 'DVD Caipira');
INSERT INTO tb012_produtos VALUES(59, 5, 'DVD Virgem');
INSERT INTO tb012_produtos VALUES(60, 6, 'Calça Jeans');
INSERT INTO tb012_produtos VALUES(61, 6, 'Calça Moleton');
INSERT INTO tb012_produtos VALUES(62, 6, 'Camisa Polo');
INSERT INTO tb012_produtos VALUES(63, 6, 'Camisa Manga Longa');
INSERT INTO tb012_produtos VALUES(64, 6, 'Camisa Manga Curta');
INSERT INTO tb012_produtos VALUES(65, 6, 'Camiseta');
INSERT INTO tb012_produtos VALUES(66, 6, 'Regata');
INSERT INTO tb012_produtos VALUES(67, 6, 'Meias');
INSERT INTO tb012_produtos VALUES(68, 6, 'Roupas de Baixo');
INSERT INTO tb012_produtos VALUES(69, 6, 'Gravatas');
INSERT INTO tb012_produtos VALUES(70, 7, 'Calça Jeans');
INSERT INTO tb012_produtos VALUES(71, 7, 'Calça Moleton');
INSERT INTO tb012_produtos VALUES(72, 7, 'Top');
INSERT INTO tb012_produtos VALUES(73, 7, 'Camisa Manga Longa');
INSERT INTO tb012_produtos VALUES(74, 7, 'Camisa Manga Curta');
INSERT INTO tb012_produtos VALUES(75, 7, 'Camiseta');
INSERT INTO tb012_produtos VALUES(76, 7, 'Regata');
INSERT INTO tb012_produtos VALUES(77, 7, 'Meias');
INSERT INTO tb012_produtos VALUES(78, 7, 'Roupas de Baixo');
INSERT INTO tb012_produtos VALUES(79, 7, 'Bolsas');
INSERT INTO tb012_produtos VALUES(80, 8, 'Camiseta');
INSERT INTO tb012_produtos VALUES(81, 8, 'Bermuda');
INSERT INTO tb012_produtos VALUES(82, 8, 'Tênis');
INSERT INTO tb012_produtos VALUES(83, 8, 'Bonés');

INSERT INTO tb014_prd_alimentos VALUES(NULL, 10, 'Trakinas', 'Kilogramas', '8887775456', '2010-2-11', 1.10);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 10, 'Pica-Pau', 'Kilogramas', '3457684345', '2011-1-2', 0.89);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 10, 'Gulosos', 'Kilogramas', '8276348762', '2011-12-1', 1.09);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 11, 'Quijo de Minas', 'Kilogramas', '5473545453', '2010-1-6', 3.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 11, '+ Pão', 'Kilogramas', '5473545453', '2010-1-6', 2.89);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 12, 'Batavo - Frutas', 'Litros', '5473545453', '2010-1-5', 1.09);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 12, 'Danone', 'Litros', '9768935983', '2010-1-5', 0.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 13, 'Garoto', 'Kilogramas', '9583495345', '2011-1-5', 3.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 13, 'Nestlé', 'Kilogramas', '5345662345', '2011-1-3', 4.19);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 13, 'Hersheys', 'Kilogramas', 'FRU4345GDA', '2011-1-4', 2.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 14, 'Nutri', 'Kilogramas', '5433145453', '2011-1-6', 0.79);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 14, 'Trill', 'Kilogramas', '8757689456', '2011-1-6', 0.69);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 15, 'Nestlé', 'Kilogramas', '2324345423', '2011-1-4', 2.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 15, 'Todeschini', 'Kilogramas', '7896532736', '2011-5-1', 1.39);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 15, 'Mabel', 'Kilogramas', '98475934hhg', '2010-12-12', 1.20);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 16, 'Nestlé', 'Kilogramas', '13468720049', '2010-5-11', 2.10);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 16, 'Todeschini', 'Kilogramas', '19040907362', '2010-1-12', 1.14);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 16, 'Mabel', 'Kilogramas', '46575934hhg', '2010-1-12', 1.18);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 17, 'Elma Chips', 'Kilogramas', '34174845745', '2010-2-6', 1.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 17, 'Tip-Top', 'Kilogramas', '77583275585', '2010-1-8', 1.49);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 17, 'Pipoteca', 'Kilogramas', '9283478gdy9', '2010-8-10', 0.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 18, 'Del Vale', 'Litros', '12874534549', '2010-2-6', 1.39);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 18, 'Ades', 'Litros', '120991705w34', '2010-1-5', 1.09);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 18, 'Minute Maid +', 'Litros', '164400135343frt', '2010-8-10', 2.99);
INSERT INTO tb014_prd_alimentos VALUES(NULL, 19, 'Isotônico', 'Litros', '9283478gdy10', '2010-10-6', 3.99);


INSERT INTO tb015_prd_eletros VALUES(NULL, 30, 'Consul', '110-220 volts', 'A', 999.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 30, 'Esmaltec', '110-220 volts', 'B', 999.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 31, 'Bosch', '110-220 volts', 'B', 1399.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 31, 'Consul', '110-220 volts', 'B', 1399.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 32, 'Continental', '110-220 volts', 'A', 559.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 32, 'Dako', '110-220 volts', 'A', 699.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 33, 'Bosch', '110-220 volts', 'A', 999.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 33, 'Esmaltec', '110 volts', 'B', 899.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 34, 'Arno', '110 volts', 'A', 49.90);
INSERT INTO tb015_prd_eletros VALUES(NULL, 34, 'Arno', '220 volts', 'A', 52.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 35, 'Britânia', '110 volts', 'A', 65.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 35, 'Arno', '110 volts', 'A', 59.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 36, 'Esmaltec', '110 volts', 'A', 38.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 36, 'Arno', '110 volts', 'A', 49.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 37, 'Britânia', '110 volts', 'B', 43.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 37, 'Arno', '110 volts', 'B', 59.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 38, 'Arno', '110-220 volts', 'C', 799.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 39, 'Brastemp', '110-220 volts', 'C', 599.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 40, 'LG 42 Polegadas', '110-220 volts', 'A', 2999.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 40, 'Philco 42 Polegadas', '110-220 volts', 'A', 2850.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 41, 'CCE 29 Polegadas', '110-220 volts', 'B', 899.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 41, 'Samsung 29 Polegadas', '110-220 volts', 'A', 1250.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 42, 'Philips', '110-220 volts', 'A', 299.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 42, 'Philco', '110-220 volts', 'A', 270.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 43, 'Philco', '110-220 volts', 'A', 299.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 43, 'LG', '110-220 volts', 'A', 312.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 44, 'Play Station 2', '110-220 volts', 'A', 499.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 44, 'X Box 360', '110-220 volts', 'A', 650.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 45, 'Sony', '12 volts', null, 519.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 45, 'Aiwa', '12 volts', null, 430.50);
INSERT INTO tb015_prd_eletros VALUES(NULL, 46, 'Sony', '12 volts', null, 249.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 46, 'Pioneer', '12 volts', null, 310.80);
INSERT INTO tb015_prd_eletros VALUES(NULL, 47, 'Booster', '12 volts', null, 130.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 47, 'Bravox', '12 volts', null, 129.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 48, 'Positivo', '110-220 volts', 'A', 2599.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 48, 'Intelbras', '110-220 volts', 'A', 1400.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 49, 'STI', '110-220 volts', 'A', 999.90);
INSERT INTO tb015_prd_eletros VALUES(NULL, 49, 'Positivo', '110-220 volts', 'A', 1235.89);
INSERT INTO tb015_prd_eletros VALUES(NULL, 50, 'AC-DC Collection', null, null, 35.00);
INSERT INTO tb015_prd_eletros VALUES(NULL, 50, 'Ultraje a Rigor', null, null, 21.89);
INSERT INTO tb015_prd_eletros VALUES(NULL, 51, 'Shakira', null, null, 19.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 51, 'Beyonce', null, null, 1.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 52, 'Melhores 80 Rocks', null, null, 23.89);
INSERT INTO tb015_prd_eletros VALUES(NULL, 52, 'Melhores 90 Rocks', null, null, 25.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 53, 'Pena Branca e Xavantinho', null, null, 15.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 53, 'Milhionário e José Rico', null, null, 26.34);
INSERT INTO tb015_prd_eletros VALUES(NULL, 54, 'EMTEC', null, null, 0.89);
INSERT INTO tb015_prd_eletros VALUES(NULL, 54, 'BULK', null, null, 0.73);
INSERT INTO tb015_prd_eletros VALUES(NULL, 55, 'Deep Purple', null, null, 49.90);
INSERT INTO tb015_prd_eletros VALUES(NULL, 55, 'Joe Satriani', null, null, 72.78);
INSERT INTO tb015_prd_eletros VALUES(NULL, 56, 'Shakira', null, null, 89.34);
INSERT INTO tb015_prd_eletros VALUES(NULL, 56, 'Beyonce', null, null, 1.99);
INSERT INTO tb015_prd_eletros VALUES(NULL, 57, 'Melhores 80 Rocks', null, null, 35.75);
INSERT INTO tb015_prd_eletros VALUES(NULL, 57, 'Melhores 90 Rocks', null, null, 32.58);
INSERT INTO tb015_prd_eletros VALUES(NULL, 58, 'Berenice Azambuja', null, null, 35.76);
INSERT INTO tb015_prd_eletros VALUES(NULL, 58, 'Tadeu e Tadando', null, null, 32.59);
INSERT INTO tb015_prd_eletros VALUES(NULL, 59, 'EMTEC', null, null, 1.23);
INSERT INTO tb015_prd_eletros VALUES(NULL, 59, 'BULK', null, null, 0.99);


INSERT INTO tb016_prd_vestuarios VALUES(NULL, 60, 'Lee', 'M', null, 52, 69.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 60, 'Malwe', 'M', null, 56, 89.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 61, 'Malwe', 'U', 'Grande', null, 22.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 61, 'Hering', 'U', 'Pequena', null, 22.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 62, 'Polo', 'M', 'Grande', null, 22.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 62, 'Lacoste', 'M', 'Grande', null, 35.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 63, 'Polo', 'M', 'Grande', null, 27.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 63, 'Lacoste', 'M', 'Grande', null, 38.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 64, 'Polo', 'M', 'Grande', null, 22.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 64, 'Lacoste', 'M', 'Grande', null, 35.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 65, 'Rip Curl', 'U', 'Grande', null, 28.09);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 65, 'Mormai', 'U', 'Grande', null, 32.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 66, 'Mormai', 'M', 'Grande', null, 10.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 66, 'Mormai', 'M', 'Pequena', null, 10.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 67, 'Social', 'M', null, 44, 9.90);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 67, 'Esporte', 'M', null, 44, 12.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 68, 'Cueca', 'M', 'Grande', null, 15.89);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 68, 'Samba Canção', 'M', 'Grande', null, 15.89);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 69, 'Armani', 'M', null, null, 19.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 70, 'Lee', 'F', null, 46, 99.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 70, 'Malwe', 'F', null, 48, 119.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 71, 'Malwe', 'F', 'Grande', null, 35.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 71, 'Hering', 'F', 'Pequena', null, 35.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 72, 'Polo', 'F', 'Média', null, 37.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 72, 'Meimalha', 'F', 'Média', null, 37.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 73, 'Polo', 'F', 'Média', null, 27.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 73, 'Meimalha', 'F', 'Média', null, 38.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 74, 'Polo', 'F', 'Média', null, 22.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 74, 'Meimalha', 'F', 'Média', null, 35.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 75, 'Rip Curl', 'F', 'Média', null, 28.09);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 75, 'Mormai', 'F', 'Média', null, 32.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 76, 'Mormai', 'F', 'Média', null, 10.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 76, 'Mormai', 'F', 'Pequena', null, 10.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 77, 'Social', 'F', null, 44, 9.90);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 77, 'Esporte', 'F', null, 44, 12.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 78, 'Calcinhas', 'F', 'Pequena', null, 19.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 78, 'Soutien', 'F', 'Pequena', null, 29.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 79, 'Renner', 'F', null, null, 139.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 79, 'C & A', 'F', null, null, 119.00);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 80, 'Malwe', 'I', 'Pequena', null, 19.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 80, 'Tigor T Tigre', 'I', 'Pequena', null, 25.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 81, 'Malwe', 'I', 'Pequena', null, 19.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 81, 'Tigor T Tigre', 'I', 'Pequena', null, 25.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 82, 'Klin', 'I', null, 25, 39.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 82, 'Pimpolho', 'I', null, 28, 59.99);
INSERT INTO tb016_prd_vestuarios VALUES(NULL, 83, 'Tigor T Tigre', 'I', null, null, 9.50);


INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 01', 'Nome Fantasia - Empresa 01', '(41) 3343-4545',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 02', 'Nome Fantasia - Empresa 02', '(41) 3343-4546',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 03', 'Nome Fantasia - Empresa 03', '(41) 3343-4547',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 04', 'Nome Fantasia - Empresa 04', '(41) 3343-4548',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 05', 'Nome Fantasia - Empresa 05', '(41) 3343-4549',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 06', 'Nome Fantasia - Empresa 06', '(41) 3343-4550',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 07', 'Nome Fantasia - Empresa 07', '(41) 3343-4551',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 08', 'Nome Fantasia - Empresa 08', '(41) 3343-4552',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 09', 'Nome Fantasia - Empresa 09', '(41) 3343-4553',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 10', 'Nome Fantasia - Empresa 10', '(41) 3343-4554',7);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 11', 'Nome Fantasia - Empresa 11', '(41) 3343-4555',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 12', 'Nome Fantasia - Empresa 12', '(41) 3343-4556',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 13', 'Nome Fantasia - Empresa 13', '(41) 3343-4557',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 14', 'Nome Fantasia - Empresa 14', '(41) 3343-4558',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 15', 'Nome Fantasia - Empresa 15', '(41) 3343-4559',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 16', 'Nome Fantasia - Empresa 16', '(41) 3343-4560',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 17', 'Nome Fantasia - Empresa 17', '(41) 3343-4561',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 18', 'Nome Fantasia - Empresa 18', '(41) 3343-4562',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 19', 'Nome Fantasia - Empresa 19', '(41) 3343-4563',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 20', 'Nome Fantasia - Empresa 20', '(41) 3343-4564',8);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 21', 'Nome Fantasia - Empresa 21', '(41) 3343-4565',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 22', 'Nome Fantasia - Empresa 22', '(41) 3343-4566',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 23', 'Nome Fantasia - Empresa 23', '(41) 3343-4567',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 24', 'Nome Fantasia - Empresa 24', '(41) 3343-4568',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 25', 'Nome Fantasia - Empresa 25', '(41) 3343-4569',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 26', 'Nome Fantasia - Empresa 26', '(41) 3343-4570',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 27', 'Nome Fantasia - Empresa 27', '(41) 3343-4571',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 28', 'Nome Fantasia - Empresa 28', '(41) 3343-4572',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 29', 'Nome Fantasia - Empresa 29', '(41) 3343-4573',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 30', 'Nome Fantasia - Empresa 30', '(41) 3343-4574',9);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 31', 'Nome Fantasia - Empresa 31', '(41) 3343-4575',10);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 32', 'Nome Fantasia - Empresa 32', '(41) 3343-4576',11);
INSERT INTO tb017_fornecedores VALUES(NULL, 'Empresa 33', 'Nome Fantasia - Empresa 33', '(41) 3343-4577',12);


INSERT INTO tb010_012_vendas VALUES(NULL, 10000000000, 10,  4, '2010-03-11', 2, 1.42);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000001, 10,  2, '2010-03-12', 3, 0.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000002, 10,  3, '2010-03-13', 1, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000003, 11,  5, '2010-03-14', 2, 2.46);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000004, 11,  5, '2010-03-15', 2, 2.62);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000005, 11,  6, '2010-03-16', 1, 3.22);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000006, 12,  8, '2010-03-17', 1, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000007, 12,  7, '2010-03-18', 1, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000008, 12,  7, '2010-03-19', 2, 0.83);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000009, 13,  9, '2010-03-20', 2, 3.76);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000010, 13, 10, '2010-03-21', 1, 3.54);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000011, 13, 11, '2010-03-22', 2, 3.34);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000012, 14, 13, '2010-03-23', 3, 0.51);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000013, 14, 12, '2010-03-24', 2, 0.51);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000014, 14, 13, '2010-03-25', 1, 0.45);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000015, 15, 14, '2010-03-26', 1, 1.42);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000016, 15, 15, '2010-03-27', 1, 1.55);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000017, 15, 16, '2010-03-28', 1, 1.42);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000018, 16, 17, '2010-03-29', 2, 2.22);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000019, 16, 18, '2010-03-30', 2, 1.58);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000020, 16, 19, '2010-03-31', 2, 1.63);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000021, 17, 20, '2010-01-04', 1, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000022, 17, 21, '2010-02-04', 3, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000023, 17, 22, '2010-03-04', 2, 0.83);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000024, 18, 23, '2010-04-04', 3, 1.58);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000025, 18, 24, '2010-05-04', 1, 1.63);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000026, 18, 25, '2010-06-04', 2, 1.10);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000027, 19, 26, '2010-07-04', 4, 2.22);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000028, 30,  1, '2010-08-04', 3, 1152.62);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000029, 30,  2, '2010-09-04', 2, 1137.58);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000030, 31,  3, '2010-04-10', 2, 1760.00);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000031, 31,  4, '2010-04-11', 1, 1600.00);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000032, 32,  5, '2010-04-12', 1, 574.40);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000033, 32,  6, '2010-04-13', 1, 577.79);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000034, 33,  7, '2010-04-14', 1, 894.40);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000035, 33,  8, '2010-04-15', 1, 737.79);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000036, 34,  9, '2010-04-16', 1, 24.00);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000037, 34, 10, '2010-04-17', 1, 27.20);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000038, 35, 11, '2010-04-18', 1, 35.20);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000039, 35, 12, '2010-04-19', 2, 49.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000040, 36, 14, '2010-04-20', 2, 43.20);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000041, 37, 15, '2010-04-21', 1, 52.80);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000042, 38, 17, '2010-04-22', 1, 43.20);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000043, 39, 18, '2010-04-23', 1, 52.80);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000044, 40, 20, '2010-03-16', 1, 1643.31);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000045, 41, 21, '2010-03-17', 1, 2949.74);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000046, 42, 24, '2010-03-18', 2, 203.31);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000047, 43, 25, '2010-03-19', 1, 229.74);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000048, 44, 28, '2010-03-20', 1, 660.91);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000049, 45, 29, '2010-03-21', 1, 732.14);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000050, 46, 32, '2010-03-22', 1, 340.91);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000015, 47, 33, '2010-03-23', 3, 143.34);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000016, 48, 36, '2010-03-24', 1, 1968.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000017, 49, 37, '2010-03-25', 2, 980.91);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000018, 50, 40, '2010-03-26', 1, 18.54);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000019, 51,  4, '2010-03-27', 1, 17.26);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000020, 52,  2, '2010-03-28', 4, 18.56);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000021, 53,  3, '2010-03-29', 1, 17.28);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000022, 54,  5, '2010-03-30', 3, 18.58);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000023, 55,  5, '2010-03-31', 1, 17.30);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000024, 56,  6, '2010-01-04', 2, 18.59);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000025, 57,  8, '2010-02-04', 1, 17.31);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000026, 58,  7, '2010-03-04', 1, 18.61);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000027, 59,  7, '2010-04-04', 2, 0.69);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000028, 60,  9, '2010-05-04', 2, 95.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000029, 60, 10, '2010-06-04', 1, 122.38);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000030, 61, 11, '2010-03-16', 2, 29.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000031, 61, 13, '2010-03-17', 1, 29.97);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000032, 62, 12, '2010-03-18', 2, 29.98);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000033, 62, 13, '2010-03-19', 1, 47.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000034, 63, 14, '2010-03-20', 2, 36.72);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000037, 63, 15, '2010-03-21', 1, 51.68);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000038, 64, 16, '2010-03-22', 2, 29.92);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000039, 64, 17, '2010-03-23', 1, 47.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000040, 65, 18, '2010-03-24', 2, 38.19);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000041, 65, 19, '2010-03-25', 1, 43.54);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000000, 66, 20, '2010-03-26', 1, 14.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000001, 66, 21, '2010-03-27', 2, 14.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000002, 67, 22, '2010-03-28', 1, 13.46);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000003, 67, 23, '2010-03-29', 2, 16.42);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000004, 68, 24, '2010-03-30', 1, 21.71);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000005, 68, 25, '2010-03-31', 3, 21.65);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000006, 69, 26, '2010-01-04', 1, 27.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000007, 70,  1, '2010-02-04', 3, 135.98);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000008, 70,  2, '2010-03-04', 1, 163.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000009, 71,  3, '2010-04-04', 1, 47.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000010, 71,  4, '2010-05-04', 2, 47.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000011, 72,  5, '2010-06-04', 1, 50.32);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000000, 72,  6, '2010-03-16', 1, 50.32);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000001, 73,  7, '2010-03-17', 2, 36.72);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000002, 73,  8, '2010-03-18', 1, 51.78);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000003, 74,  9, '2010-03-19', 1, 30.06);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000004, 74, 10, '2010-03-20', 1, 47.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000005, 75, 11, '2010-03-21', 1, 38.19);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000006, 75, 12, '2010-03-22', 2, 43.60);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000007, 76, 14, '2010-03-23', 1, 14.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000008, 76, 15, '2010-03-24', 2, 14.94);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000009, 77, 17, '2010-03-25', 1, 13.46);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000010, 77, 18, '2010-03-26', 1, 16.40);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000011, 78, 20, '2010-03-27', 1, 27.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000012, 78, 21, '2010-03-28', 3, 38.38);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000013, 79, 24, '2010-03-29', 1, 189.49);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000014, 79, 25, '2010-03-30', 1, 161.84);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000015, 80, 28, '2010-03-31', 2, 27.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000012, 80, 29, '2010-01-04', 1, 35.34);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000013, 81, 32, '2010-02-04', 1, 27.18);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000014, 81, 33, '2010-03-04', 1, 35.34);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000015, 82, 36, '2010-04-04', 2, 54.38);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000013, 82, 37, '2010-05-04', 1, 81.58);
INSERT INTO tb010_012_vendas VALUES(NULL, 10000000014, 83, 40, '2010-06-04', 1, 14.38);


INSERT INTO tb012_017_compras VALUES(NULL,  10,  4, '2010-01-01', 3, 0.89);
INSERT INTO tb012_017_compras VALUES(NULL,  10,  2, '2010-01-02', 1, 0.59);
INSERT INTO tb012_017_compras VALUES(NULL,  10,  3, '2010-01-03', 2, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  11,  5, '2010-01-04', 3, 1.54);
INSERT INTO tb012_017_compras VALUES(NULL,  11,  5, '2010-01-05', 1, 1.64);
INSERT INTO tb012_017_compras VALUES(NULL,  11,  6, '2010-01-06', 2, 2.01);
INSERT INTO tb012_017_compras VALUES(NULL,  12,  8, '2010-01-07', 3, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  12,  7, '2010-01-08', 3, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  12,  7, '2010-01-09', 3, 0.52);
INSERT INTO tb012_017_compras VALUES(NULL,  13,  9, '2010-01-10', 3, 2.35);
INSERT INTO tb012_017_compras VALUES(NULL,  13, 10, '2010-01-11', 3, 2.21);
INSERT INTO tb012_017_compras VALUES(NULL,  13, 11, '2010-01-12', 4, 2.09);
INSERT INTO tb012_017_compras VALUES(NULL,  14, 13, '2010-01-13', 4, 0.32);
INSERT INTO tb012_017_compras VALUES(NULL,  14, 12, '2010-01-14', 4, 0.32);
INSERT INTO tb012_017_compras VALUES(NULL,  14, 13, '2010-01-15', 4, 0.28);
INSERT INTO tb012_017_compras VALUES(NULL,  15, 14, '2010-01-16', 5, 0.89);
INSERT INTO tb012_017_compras VALUES(NULL,  15, 15, '2010-01-17', 5, 0.97);
INSERT INTO tb012_017_compras VALUES(NULL,  15, 16, '2010-01-18', 5, 0.89);
INSERT INTO tb012_017_compras VALUES(NULL,  16, 17, '2010-02-19', 5, 1.39);
INSERT INTO tb012_017_compras VALUES(NULL,  16, 18, '2010-02-20', 6, 0.99);
INSERT INTO tb012_017_compras VALUES(NULL,  16, 19, '2010-02-21', 6, 1.02);
INSERT INTO tb012_017_compras VALUES(NULL,  17, 20, '2010-02-22', 3, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  17, 21, '2010-02-23', 4, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  17, 22, '2010-02-24', 2, 0.52);
INSERT INTO tb012_017_compras VALUES(NULL,  18, 23, '2010-02-25', 5, 0.99);
INSERT INTO tb012_017_compras VALUES(NULL,  18, 24, '2010-02-26', 3, 1.02);
INSERT INTO tb012_017_compras VALUES(NULL,  18, 25, '2010-02-27', 4, 0.69);
INSERT INTO tb012_017_compras VALUES(NULL,  19, 26, '2010-02-28', 3, 1.39);
INSERT INTO tb012_017_compras VALUES(NULL,  30,  1, '2010-02-10', 5, 720.39);
INSERT INTO tb012_017_compras VALUES(NULL,  30,  2, '2010-02-11', 5, 710.99);
INSERT INTO tb012_017_compras VALUES(NULL,  31,  3, '2010-02-13', 3, 1100.00);
INSERT INTO tb012_017_compras VALUES(NULL,  31,  4, '2010-02-14', 2, 1000.00);
INSERT INTO tb012_017_compras VALUES(NULL,  32,  5, '2010-02-15', 1, 359.00);
INSERT INTO tb012_017_compras VALUES(NULL,  32,  6, '2010-02-16', 3, 361.12);
INSERT INTO tb012_017_compras VALUES(NULL,  33,  7, '2010-02-17', 3, 559.00);
INSERT INTO tb012_017_compras VALUES(NULL,  33,  8, '2010-02-18', 3, 461.12);
INSERT INTO tb012_017_compras VALUES(NULL,  34,  9, '2010-02-19', 5, 15.00);
INSERT INTO tb012_017_compras VALUES(NULL,  34, 10, '2010-02-20', 2, 17.00);
INSERT INTO tb012_017_compras VALUES(NULL,  35, 11, '2010-02-21', 5, 22.00);
INSERT INTO tb012_017_compras VALUES(NULL,  35, 12, '2010-02-22', 3, 31.00);
INSERT INTO tb012_017_compras VALUES(NULL,  36, 14, '2010-02-23', 4, 27.00);
INSERT INTO tb012_017_compras VALUES(NULL,  37, 15, '2010-02-24', 5, 33.00);
INSERT INTO tb012_017_compras VALUES(NULL,  38, 17, '2010-02-25', 3, 27.00);
INSERT INTO tb012_017_compras VALUES(NULL,  39, 18, '2010-01-26', 5, 33.00);
INSERT INTO tb012_017_compras VALUES(NULL,  40, 20, '2010-03-27', 2, 1027.07);
INSERT INTO tb012_017_compras VALUES(NULL,  41, 21, '2010-03-28', 1, 1843.59);
INSERT INTO tb012_017_compras VALUES(NULL,  42, 24, '2010-03-16', 5, 127.07);
INSERT INTO tb012_017_compras VALUES(NULL,  43, 25, '2010-03-17', 6, 143.59);
INSERT INTO tb012_017_compras VALUES(NULL,  44, 28, '2010-03-18', 4, 413.07);
INSERT INTO tb012_017_compras VALUES(NULL,  45, 29, '2010-03-19', 3, 457.59);
INSERT INTO tb012_017_compras VALUES(NULL,  46, 32, '2010-03-20', 6, 213.07);
INSERT INTO tb012_017_compras VALUES(NULL,  47, 33, '2010-03-16', 6, 89.59);
INSERT INTO tb012_017_compras VALUES(NULL,  48, 16, '2010-03-17', 6, 1230.59);
INSERT INTO tb012_017_compras VALUES(NULL,  49, 27, '2010-03-18', 6, 613.07);
INSERT INTO tb012_017_compras VALUES(NULL,  50, 30, '2010-03-19', 6, 11.59);
INSERT INTO tb012_017_compras VALUES(NULL,  51,  4, '2010-03-20', 3, 10.79);
INSERT INTO tb012_017_compras VALUES(NULL,  52,  2, '2010-03-03', 6, 11.60);
INSERT INTO tb012_017_compras VALUES(NULL,  53,  3, '2010-03-04', 4, 10.80);
INSERT INTO tb012_017_compras VALUES(NULL,  54,  5, '2010-03-05', 6, 11.61);
INSERT INTO tb012_017_compras VALUES(NULL,  55,  5, '2010-03-06', 3, 10.81);
INSERT INTO tb012_017_compras VALUES(NULL,  56,  6, '2010-01-07', 2, 11.62);
INSERT INTO tb012_017_compras VALUES(NULL,  57,  8, '2010-05-08', 6, 10.82);
INSERT INTO tb012_017_compras VALUES(NULL,  58,  7, '2010-05-09', 6, 11.63);
INSERT INTO tb012_017_compras VALUES(NULL,  59,  7, '2010-05-10', 5, 0.43);
INSERT INTO tb012_017_compras VALUES(NULL,  60,  9, '2010-05-24', 4, 59.49);
INSERT INTO tb012_017_compras VALUES(NULL,  60, 10, '2010-05-25', 6, 76.49);
INSERT INTO tb012_017_compras VALUES(NULL,  61, 11, '2010-05-26', 5, 18.71);
INSERT INTO tb012_017_compras VALUES(NULL,  61, 13, '2010-05-27', 3, 18.73);
INSERT INTO tb012_017_compras VALUES(NULL,  62, 12, '2010-05-28', 5, 18.74);
INSERT INTO tb012_017_compras VALUES(NULL,  62, 13, '2010-05-16', 6, 29.75);
INSERT INTO tb012_017_compras VALUES(NULL,  63, 14, '2010-05-17', 6, 22.95);
INSERT INTO tb012_017_compras VALUES(NULL,  63, 15, '2010-05-18', 6, 32.30);
INSERT INTO tb012_017_compras VALUES(NULL,  64, 16, '2010-05-19', 6, 18.70);
INSERT INTO tb012_017_compras VALUES(NULL,  64, 17, '2010-05-20', 6, 29.75);
INSERT INTO tb012_017_compras VALUES(NULL,  65, 18, '2010-05-16', 6, 23.87);
INSERT INTO tb012_017_compras VALUES(NULL,  65, 19, '2010-05-17', 4, 27.21);
INSERT INTO tb012_017_compras VALUES(NULL,  66, 20, '2010-05-18', 6, 9.34);
INSERT INTO tb012_017_compras VALUES(NULL,  66, 21, '2010-05-19', 3, 9.34);
INSERT INTO tb012_017_compras VALUES(NULL,  67, 22, '2010-05-20', 8, 8.41);
INSERT INTO tb012_017_compras VALUES(NULL,  67, 23, '2010-05-03', 9, 10.26);
INSERT INTO tb012_017_compras VALUES(NULL,  68, 24, '2010-05-04', 6, 13.57);
INSERT INTO tb012_017_compras VALUES(NULL,  68, 25, '2010-05-05', 6, 13.53);
INSERT INTO tb012_017_compras VALUES(NULL,  69, 26, '2010-01-06', 9, 16.99);
INSERT INTO tb012_017_compras VALUES(NULL,  70,  1, '2010-01-07', 8, 84.99);
INSERT INTO tb012_017_compras VALUES(NULL,  70,  2, '2010-08-08', 6, 101.99);
INSERT INTO tb012_017_compras VALUES(NULL,  71,  3, '2010-08-09', 7, 29.75);
INSERT INTO tb012_017_compras VALUES(NULL,  71,  4, '2010-08-10', 6, 29.75);
INSERT INTO tb012_017_compras VALUES(NULL,  72,  5, '2010-08-24', 7, 31.45);
INSERT INTO tb012_017_compras VALUES(NULL,  72,  6, '2010-08-25', 6, 31.45);
INSERT INTO tb012_017_compras VALUES(NULL,  73,  7, '2010-08-26', 7, 22.95);
INSERT INTO tb012_017_compras VALUES(NULL,  73,  8, '2010-08-27', 5, 32.36);
INSERT INTO tb012_017_compras VALUES(NULL,  74,  9, '2010-08-28', 7, 18.79);
INSERT INTO tb012_017_compras VALUES(NULL,  74, 10, '2010-08-16', 4, 29.75);
INSERT INTO tb012_017_compras VALUES(NULL,  75, 11, '2010-08-17', 3, 23.87);
INSERT INTO tb012_017_compras VALUES(NULL,  75, 12, '2010-08-18', 7, 27.25);
INSERT INTO tb012_017_compras VALUES(NULL,  76, 14, '2010-08-19', 3, 9.34);
INSERT INTO tb012_017_compras VALUES(NULL,  76, 15, '2010-08-20', 7, 9.34);
INSERT INTO tb012_017_compras VALUES(NULL,  77, 17, '2010-08-16', 7, 8.41);
INSERT INTO tb012_017_compras VALUES(NULL,  77, 18, '2010-08-17', 2, 10.25);
INSERT INTO tb012_017_compras VALUES(NULL,  78, 20, '2010-08-18', 7, 16.99);
INSERT INTO tb012_017_compras VALUES(NULL,  78, 21, '2010-08-19', 4, 23.99);
INSERT INTO tb012_017_compras VALUES(NULL,  79, 24, '2010-08-20', 7, 118.43);
INSERT INTO tb012_017_compras VALUES(NULL,  79, 25, '2010-08-03', 3, 101.15);
INSERT INTO tb012_017_compras VALUES(NULL,  80, 28, '2010-08-04', 7, 16.99);
INSERT INTO tb012_017_compras VALUES(NULL,  80, 29, '2010-08-05', 7, 22.09);
INSERT INTO tb012_017_compras VALUES(NULL,  81, 32, '2010-08-06', 8, 16.99);
INSERT INTO tb012_017_compras VALUES(NULL,  81, 33, '2010-08-07', 4, 22.09);
INSERT INTO tb012_017_compras VALUES(NULL,  82, 16, '2010-08-08', 5, 33.99);
INSERT INTO tb012_017_compras VALUES(NULL,  82, 17, '2010-01-09', 8, 50.99);
INSERT INTO tb012_017_compras VALUES(NULL,  83, 10, '2010-01-10', 8, 8.99);
