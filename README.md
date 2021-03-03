# Business Warehouse

## Requisições para Execução do Projeto

- [Composer](https://getcomposer.org/)
- PHP v8(recomendado usar o [XAMPP](https://www.apachefriends.org/index.html) ou outro pacote de desenvolvimento plug&play)
- Drivers PHP para conexão com **MySQL** (incluso no XAMPP) e **PostgreSQL**

## Itens a Serem Implementados

- [x] COnverter dialeto SQL Server para mySQL;
- [x] Recuperar backup de dados em instância do MySQL (*staging area*);
- [x] Criar esquemas para Data Warehouse em instância do Postgres;
- [x] Processar dados em *staging area* e inseri-los nas tabelas do DW;

## Configurar o Ambiente

Primeriramente, execute `composer update` na linha de comando para instalar as dependências da aplicação.

Em seguida, atualize o arquivo **.env** existente agora na raíz do projeto e altere os dados de conexão com os 2 bancos de dados.

Tenha certeza de que você tem os dois bancos de dados criados em cada um dos SGBD's (MySQL e Postgres) e seus respectivos serviços ativos no SO.

Execute o programa através da linha de comando:

```bash
php -f index.php
```
