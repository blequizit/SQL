# DML (Data Manipulation Language)

Esta pasta contém scripts de DML, utilizados para manipular dados em tabelas do banco de dados Oracle.

- `INSERT`: Adiciona novas linhas a uma tabela.
- `UPDATE`: Modifica dados existentes em uma tabela.
- `DELETE`: Remove linhas de uma tabela.
- `MERGE`: Combina dados de duas tabelas.
- `TRUNCATE`: Remove todas as linhas de uma tabela, liberando espaço.

## Scripts

### 1. **PROJETO_BS_DML.SQL**
*Banco de Dados de Livraria - Script DML para Estudo*

Este script contém instruções SQL para a inserção e atualização de dados no banco de dados de uma livraria, incluindo dados sobre autores, livros, livrarias e o inventário disponível em cada estabelecimento.

**Nota:** Este script é destinado apenas para estudo e aprendizado. Os dados inseridos são fictícios e não devem ser considerados reais.

### Estrutura dos Dados

#### Inserções

1. **Cadastrando Autores**
   - Adiciona registros na tabela `T_BS_AUTOR`, com códigos únicos e nomes de autores.
   - Exemplo:
     ```sql
     INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (1,'Robert Kirkman');
     ```

2. **Cadastrando Livrarias**
   - Adiciona registros na tabela `T_BS_LIVRARIA`, com códigos e nomes das livrarias.
   - Exemplo:
     ```sql
     INSERT INTO T_BS_LIVRARIA(cd_livraria, nm_livraria) VALUES (1,'Livraria Cultura');
     ```

3. **Cadastrando Livros**
   - Insere dados na tabela `T_BS_LIVRO`, incluindo o código do livro, título e código do autor.
   - Exemplo:
     ```sql
     INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES (1, 'Walking Dead: A ascensão do governador', 1);
     ```

4. **Cadastrando Disponibilidade de Livros nas Livrarias**
   - Insere informações sobre a disponibilidade de cada livro em cada livraria na tabela `T_BS_LIVRO_LIVRARIA`, incluindo o código do livro, código da livraria, status de disponibilidade, quantidade e valor unitário.
   - Exemplo:
     ```sql
     INSERT INTO T_BS_LIVRO_LIVRARIA VALUES (18, 2, 'D', 16, 29.9);
     ```

#### Atualizações

1. **Atualizando Endereços das Livrarias**
   - Modifica os dados de endereço das livrarias na tabela `T_BS_LIVRARIA`, incluindo rua, número e bairro.
   - Exemplo:
     ```sql
     UPDATE T_BS_LIVRARIA 
     SET TX_ENDERECO = 'Rua Pamplona', NR_NUMEROENDERECO = 197, TX_BAIRRO = 'Jardins' 
     WHERE CD_LIVRARIA = 1;
     ```

### Resumo das Tabelas e Dados Modificados

- **Tabela `T_BS_AUTOR`**: Cadastro de autores, identificados pelo código e nome.
- **Tabela `T_BS_LIVRARIA`**: Cadastro de livrarias, com atualização dos dados de endereço.
- **Tabela `T_BS_LIVRO`**: Cadastro de livros, relacionando cada título com seu autor.
- **Tabela `T_BS_LIVRO_LIVRARIA`**: Relação entre livros e livrarias, com informações sobre estoque, preço e status de disponibilidade.

### Boas Práticas Adotadas

1. **Organização por Seções**:
   - As instruções DML são organizadas em seções de inserções e atualizações, facilitando o entendimento e a manutenção do script.

2. **Uso de Dados Fictícios para Exemplificação**:
   - Os dados são criados de forma fictícia para demonstrar a manipulação de dados e aplicar conceitos de SQL de forma prática e segura em um ambiente de aprendizado.

3. **Clareza nos Nomes das Colunas e Tabelas**:
   - Os nomes dos campos seguem um padrão que facilita a leitura e identifica facilmente a função de cada coluna (`cd_` para códigos, `nm_` para nomes, etc.).

---

Este script fornece um exemplo prático de manipulação de dados no banco de dados de uma livraria. Como projeto de estudo, o foco está na aplicação de boas práticas de DML e na organização dos dados.
