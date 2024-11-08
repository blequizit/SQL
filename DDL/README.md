# DDL (Data Definition Language)

Esta pasta contém scripts de DDL, usados para definir a estrutura do banco de dados. Os principais comandos DDL incluem:

- `CREATE`: Cria novos objetos, como tabelas e índices.
- `ALTER`: Modifica a estrutura de objetos existentes.
- `DROP`: Remove objetos do banco de dados.
- `RENAME`: Renomeia um objeto existente.
- `TRUNCATE`: Remove todas as linhas de uma tabela, mas mantém a estrutura.

## Scripts

### 1. **PROJETO_BS_DDL.SQL**
*Banco de Dados de Livraria - Script DDL para Estudo*

Script em SQL que cria a estrutura de tabelas para um banco de dados de uma livraria, incluindo informações sobre autores, livros, livrarias e o inventário de livros em cada local. 

**Este script foi criado exclusivamente para fins de estudo e aprendizado. Os dados inseridos ou referenciados não devem ser considerados reais.**

### Estrutura das Tabelas

#### Tabela `T_BS_AUTOR`
Esta tabela armazena dados dos autores dos livros. Cada autor possui um código único (`cd_codigo`) como chave primária.

- **cd_codigo**: Código único do autor (INTEGER, `NOT NULL`, chave primária).
- **nm_autor**: Nome do autor (VARCHAR(50)).

#### Tabela `T_BS_LIVRO`
Armazena dados dos livros disponíveis, como título, ano de publicação e autor.

- **cd_codigo**: Código único do livro (INTEGER, `NOT NULL`, chave primária).
- **tx_titulo**: Título do livro (VARCHAR(200)).
- **nr_numero_paginas**: Número de páginas (INTEGER).
- **nr_ano_publicacao**: Ano de publicação (INTEGER).
- **nr_edicao**: Edição do livro (INTEGER).
- **cd_codigo_autor**: Código do autor (INTEGER, chave estrangeira que referencia `T_BS_AUTOR(cd_codigo)`).

#### Tabela `T_BS_LIVRARIA`
Armazena dados das livrarias.

- **cd_livraria**: Código único da livraria (INTEGER, `NOT NULL`, chave primária).
- **nm_livraria**: Nome da livraria (VARCHAR(50)).
- **tx_endereco**: Endereço da livraria (VARCHAR(100)).
- **nr_numeroendereco**: Número do endereço (INTEGER).
- **tx_bairro**: Bairro onde a livraria está localizada (VARCHAR(50)).
- **tx_cep**: Código Postal (CEP) da livraria (VARCHAR(9)).

#### Tabela `T_BS_LIVRO_LIVRARIA`
Relaciona livros com livrarias, mostrando disponibilidade e preço por unidade.

- **cd_codigo**: Código do livro (INTEGER, `NOT NULL`, chave estrangeira que referencia `T_BS_LIVRO(cd_codigo)`).
- **cd_livraria**: Código da livraria (INTEGER, `NOT NULL`, chave estrangeira que referencia `T_BS_LIVRARIA(cd_livraria)`).
- **tx_status**: Status de disponibilidade do livro (VARCHAR(1)).
- **nr_quant**: Quantidade de exemplares disponíveis (NUMBER(19,2)).
- **vl_unitario**: Valor unitário do livro (NUMBER(19,2)).
- **Chave Primária Composta**: A combinação de `cd_codigo` e `cd_livraria` forma a chave primária, garantindo a unicidade da relação entre livro e livraria.

### Relacionamentos

- **`T_BS_LIVRO` ↔ `T_BS_AUTOR`**: Cada livro está associado a um único autor.
- **`T_BS_LIVRO_LIVRARIA` ↔ `T_BS_LIVRO`**: Cada item do inventário é vinculado a um livro específico.
- **`T_BS_LIVRO_LIVRARIA` ↔ `T_BS_LIVRARIA`**: Cada item do inventário é vinculado a uma livraria específica.

### Boas Práticas Adotadas

1. **Uso de Prefixo Consistente para Tabelas**: Todas as tabelas usam o prefixo `T_BS_`, indicando que pertencem ao mesmo contexto. Esse padrão facilita a identificação e organização das tabelas, especialmente em bancos de dados maiores.

2. **Prefixo nos Nomes dos Atributos**: Cada coluna adota prefixos (`cd_`, `tx_`, `nr_`, `vl_`) que indicam seu tipo ou propósito:
   - `cd_` para código (chave primária ou estrangeira),
   - `nm_` para nome,
   - `tx_` para textos descritivos,
   - `nr_` para números, e
   - `vl_` para valores monetários.
   
   Esse padrão aumenta a legibilidade e a clareza do código.

3. **Uso de Chaves Primárias e Estrangeiras**: As chaves primárias e estrangeiras são definidas para garantir integridade referencial entre tabelas. A chave composta em `T_BS_LIVRO_LIVRARIA` evita duplicidade de registros, garantindo que cada par livro-livraria seja único.

---

Este script fornece uma estrutura inicial de banco de dados para gerenciar informações de uma livraria fictícia. Por ser um projeto de estudo, o foco está em aplicar boas práticas de design e organização da estrutura do banco de dados.
