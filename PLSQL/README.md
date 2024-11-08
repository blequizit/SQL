# PL/SQL

Esta pasta contém scripts em PL/SQL, a linguagem procedural do Oracle para trabalhar com SQL. Os principais componentes do PL/SQL incluem:

- **Blocos**: Estruturas fundamentais que contêm instruções SQL e lógica de programação.
- **Procedures**: Módulos que encapsulam lógica de negócios.
- **Functions**: Módulos que retornam valores.
- **Triggers**: Procedimentos que são executados automaticamente em resposta a eventos no banco de dados.

## Scripts e suas explicações

### 1. **Americas.sql**
**Descrição**: Este script solicita ao usuário a entrada de um nome de país e verifica se o país informado está na América. Ele utiliza uma estrutura `CASE` para comparar o país e exibir uma mensagem indicando se ele é reconhecido como parte da América ou não.

**Código:**
```sql
SET SERVEROUTPUT ON

ACCEPT pais PROMPT 'Entre com o pais';

DECLARE
    -- pais VARCHAR2(15) := UPPER('&pais');
    pais VARCHAR2(15) := '&pais';
BEGIN
    CASE UPPER(pais)
        WHEN 'BRASIL' THEN
            DBMS_OUTPUT.PUT_LINE(pais || ' esta na America');
        WHEN 'ARGENTINA' THEN
            DBMS_OUTPUT.PUT_LINE(pais || ' esta na America');
        WHEN 'URUGUAI' THEN
            DBMS_OUTPUT.PUT_LINE(pais || ' esta na America');
        WHEN 'CHILE' THEN
            DBMS_OUTPUT.PUT_LINE(pais || ' esta na America');
        ELSE
            DBMS_OUTPUT.PUT_LINE(pais || ' NAO RECONHECIDO');
    END CASE;
END;
```

**Explicação**
- O script começa com o comando `SET SERVEROUTPUT ON`, que habilita a exibição de mensagens no console, permitindo que o usuário veja a saída do script.
- A instrução ACCEPT é usada para solicitar que o usuário insira o nome de um país quando o script for executado.
- No bloco DECLARE, uma variável pais é declarada para armazenar o nome do país inserido pelo usuário.
- A estrutura CASE é utilizada para verificar o valor da variável pais e imprimir uma mensagem específica dependendo do país informado:
  - Se o país for "BRASIL", "ARGENTINA", "URUGUAI" ou "CHILE", o script imprime uma mensagem dizendo que o país está na América.
  - Caso contrário, imprime uma mensagem informando que o país não é reconhecido.
 
### 2. **Cores.sql**
**Descrição**: Este script solicita ao usuário a entrada de uma cor e verifica se ela está presente nas cores da bandeira de um país. O script utiliza o operador `IN` para checar se a cor informada está na lista predefinida de cores (AMARELO, VERDE, AZUL, BRANCO) e exibe uma mensagem de acordo com o resultado.

**Código:**
```sql
-- ENTRE COM UMA COR PARA VERIFICAR SE ELA ESTA NA BANDEIRA
-- Racional: O script recebe uma cor e verifica se ela faz parte da lista de cores da bandeira.

SET SERVEROUTPUT ON

ACCEPT cor PROMPT 'Entre com a cor';

DECLARE
    cor VARCHAR2(15) := UPPER('&cor');
BEGIN
    IF cor IN ('AMARELO', 'VERDE', 'AZUL', 'BRANCO') THEN
        DBMS_OUTPUT.PUT_LINE(cor || ' esta na bandeira');
    ELSE
        DBMS_OUTPUT.PUT_LINE(cor || ' NAO esta na bandeira');
    END IF;
END;
```

**Explicação**
- O script começa com o comando SET SERVEROUTPUT ON, que ativa a exibição de mensagens no console.
- A instrução ACCEPT solicita que o usuário insira o nome de uma cor quando o script for executado.
- A variável cor é declarada no bloco DECLARE e recebe o valor inserido pelo usuário, sendo convertida para maiúsculas com a função UPPER.
- O script utiliza o operador IN para verificar se a cor informada está na lista de cores ('AMARELO', 'VERDE', 'AZUL', 'BRANCO').
    - Se a cor estiver na lista, uma mensagem é exibida informando que a cor está presente na bandeira.
    - Caso contrário, o script imprime uma mensagem dizendo que a cor não está na bandeira.

### 3. **EntradaDados.sql**
**Descrição**: Este script solicita ao usuário a entrada de um valor numérico e o exibe no console. Ele utiliza o comando `ACCEPT` para capturar a entrada do usuário e o bloco `PL/SQL` para processá-la e exibi-la na tela.

**Código:**
```sql
SET SERVEROUTPUT ON
-- O INPUT NO PL/SQL NÃO É UMA COISA COMUM, ENTÃO A GENTE ACABA USANDO OS COMANDOS DO SQLPLUS
-- Configuração da janela que pede os dados
ACCEPT valor PROMPT 'Digite o valor:';

DECLARE
    -- Aqui estamos trazendo o valor da janela e transferindo para o programa propriamente dito
    n NUMBER := &valor;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Você digitou ' || n);
END;
```
**Explicação**
- O script começa com o comando SET SERVEROUTPUT ON, que habilita a exibição de mensagens no console. Esse comando é necessário para que a função DBMS_OUTPUT.PUT_LINE mostre a saída no terminal.
- A instrução ACCEPT solicita que o usuário insira um valor numérico ao executar o script. O valor inserido é armazenado na variável de substituição &valor.
- No bloco DECLARE, uma variável n do tipo NUMBER é declarada e recebe o valor digitado pelo usuário.
- No bloco BEGIN...END, a função DBMS_OUTPUT.PUT_LINE imprime o valor da variável n, exibindo uma mensagem no console que informa o número que foi digitado.

### 4. **FaixaValores.sql**
**Descrição**: Este script solicita ao usuário a entrada de um número e verifica em qual faixa o número se encontra. O script possui três faixas definidas:
- Faixa 1: Números entre 1 e 10.
- Faixa 2: Números entre 11 e 20.
Além disso, ele faz uma verificação especial para números específicos (13, 17, 18), que imprime a mensagem "Adivinhou o número" se o número inserido for um desses.

**Código:**
```sql
--FAIXA DE VALORES 
--1a faixa 1 a 10
--2a faixa 11 a 20
SET SERVEROUTPUT ON
ACCEPT numero PROMPT 'Entre com um numero'

DECLARE
    numero NUMBER := &numero;
BEGIN
    IF numero BETWEEN 1 AND 10 THEN
        DBMS_OUTPUT.PUT_LINE('1a faixa');
    ELSIF numero BETWEEN 11 AND 20 THEN
        DBMS_OUTPUT.PUT_LINE('2a faixa');
        IF numero IN (13, 17, 18) THEN
            DBMS_OUTPUT.PUT_LINE('Adivinhou o numero');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('faixa invalida');
    END IF;    
END;
```
**Explicação**
- O script começa com o comando SET SERVEROUTPUT ON, que habilita a exibição de mensagens no console, permitindo que o usuário veja a saída do script.
- A instrução ACCEPT solicita que o usuário insira um número ao executar o script. O número inserido é armazenado na variável de substituição &numero.
- O bloco DECLARE inicializa a variável numero com o valor digitado pelo usuário.
- O script então verifica se o número está na faixa de 1 a 10 ou de 11 a 20 usando o comando BETWEEN.
    - Se o número estiver entre 1 e 10, o script imprime "1a faixa".
    - Se o número estiver entre 11 e 20, imprime "2a faixa" e, adicionalmente, se o número for 13, 17 ou 18, ele imprime "Adivinhou o numero".
    - Se o número estiver fora dessas faixas, o script imprime "faixa invalida".

### 5. **MediaDoisValores.sql**
**Descrição**: Este script solicita ao usuário a entrada de dois valores numéricos e calcula a média entre esses valores. O resultado da média é exibido no console.

**Código:**
```sql
SET SERVEROUTPUT ON

ACCEPT v1 PROMPT 'Entre com primeiro valor';
ACCEPT v2 PROMPT 'Entre com segundo valor';

DECLARE
    n1 NUMBER := &v1;
    n2 NUMBER := &v2;
    total NUMBER;
BEGIN
    total := (n1 + n2) / 2;
    DBMS_OUTPUT.PUT_LINE('A media dos valores ' || n1 || ' e ' || n2 || ' é ' || total);
END;
```
**Explicação**
- O script começa com o comando SET SERVEROUTPUT ON, que ativa a exibição de mensagens no console.
- A instrução ACCEPT é utilizada para solicitar ao usuário que insira dois valores numéricos quando o script for executado. Esses valores são armazenados nas variáveis &v1 e &v2.
- No bloco DECLARE, as variáveis n1 e n2 são inicializadas com os valores fornecidos pelo usuário, e a variável total é declarada para armazenar o resultado da média.
- No bloco BEGIN...END, a média dos dois valores é calculada e armazenada na variável total. A função DBMS_OUTPUT.PUT_LINE é então utilizada para exibir no console a média dos dois valores inseridos, juntamente com a mensagem explicativa.


### 6. **Operadores.sql**
**Descrição**: Este script demonstra o uso de operadores aritméticos e de comparação no Oracle PL/SQL. Ele realiza uma divisão simples, uma operação de módulo, e utiliza a comparação de desigualdade (`<>`) para verificar se o resultado é igual a 4.

**Código:**
```sql
SET SERVEROUTPUT ON
DECLARE
    resultado NUMBER := 0;
BEGIN
    -- Realiza a divisão simples
    resultado := 1 / 2;
    DBMS_OUTPUT.PUT_LINE(resultado);

    -- Realiza a operação de módulo (resto da divisão)
    resultado := 10 mod 3;
    DBMS_OUTPUT.PUT_LINE(resultado);

    -- Verifica a desigualdade
    IF resultado <> 4 THEN
        DBMS_OUTPUT.PUT_LINE('O resultado é diferente de 4');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O resultado é igual a 4');
    END IF;
END;
```
**Explicação**
- O script começa com o comando SET SERVEROUTPUT ON, que habilita a exibição de mensagens no console.
- No bloco DECLARE, é declarada a variável resultado para armazenar os resultados das operações.
- Primeira operação: A variável resultado recebe o valor da divisão 1 / 2, que resulta em 0.5 (como o Oracle trata números decimais).
- Segunda operação: A variável resultado é então modificada para armazenar o resultado da operação 10 mod 3, que calcula o resto da divisão (no caso, 10 mod 3 resulta em 1).
- Verificação de desigualdade: Usando a instrução IF, o script verifica se o valor de resultado é diferente de 4. Como o valor de resultado é 1, o script imprime a mensagem "O resultado é diferente de 4".
- A função DBMS_OUTPUT.PUT_LINE é usada para exibir os resultados das operações e das comparações no console.

### 7. **CursoresBS.sql**

**Descrição**: Este script explora o uso de cursores no Oracle PL/SQL para recuperar dados da tabela `T_BS_LIVRO`, com o objetivo de exibir títulos de livros e seus respectivos autores. O script utiliza diferentes abordagens para manipulação de dados, incluindo abordagens sem cursor e com cursor explícito, utilizando `FETCH`, `LOOP` e `DBMS_OUTPUT` para exibir os resultados.

## 1. Abordagem sem cursor para um único título

### Código:
```sql
SET SERVEROUTPUT ON

DECLARE
    v_cod NUMBER;
    v_titulo VARCHAR2(200);
BEGIN
    SELECT cd_codigo, tx_titulo
    INTO v_cod, v_titulo
    FROM T_BS_LIVRO WHERE cd_codigo = 3;
    DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo);
END;
```

**Explicação**
- Este bloco declara duas variáveis (v_cod e v_titulo) para armazenar o código e o título do livro.
- A consulta SELECT é executada para buscar o livro com cd_codigo = 3 na tabela T_BS_LIVRO.
- O resultado da consulta é armazenado nas variáveis e exibido com o comando DBMS_OUTPUT.PUT_LINE, concatenando o código e o título do livro.

## 2. Abordagem sem cursor para todos os títulos

### Código:
```sql
SET SERVEROUTPUT ON

DECLARE
    v_cod T_BS_LIVRO.cd_codigo%TYPE;
    v_titulo T_BS_LIVRO.tx_titulo%TYPE;
    i INTEGER;
BEGIN
    FOR i IN 1..18
    LOOP
        SELECT cd_codigo, tx_titulo
        INTO v_cod, v_titulo
        FROM T_BS_LIVRO WHERE cd_codigo = i;
        DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo);
    END LOOP;
END;
```
**Explicação**
- O script usa um FOR LOOP para iterar sobre os códigos dos livros de 1 a 18 (supondo que existam 18 livros na tabela).
- A cada iteração, a consulta SELECT busca o código e o título do livro correspondente ao código i.
- O resultado é exibido na tela usando DBMS_OUTPUT.PUT_LINE.

## 3. Abordagem com cursor explícito para todos os títulos

### Código:
```sql
SET SERVEROUTPUT ON

DECLARE
    v_cod T_BS_LIVRO.cd_codigo%TYPE;
    v_titulo T_BS_LIVRO.tx_titulo%TYPE;
    i INTEGER;
    
    CURSOR c_livro IS
        SELECT cd_codigo, tx_titulo FROM T_BS_LIVRO;
BEGIN
    OPEN c_livro; -- Abre o cursor
    LOOP
        FETCH c_livro INTO v_cod, v_titulo; -- Recupera o próximo conjunto de dados
        EXIT WHEN c_livro%NOTFOUND; -- Sai do loop quando não houver mais registros
        DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo); -- Exibe o resultado
    END LOOP;
    CLOSE c_livro; -- Fecha o cursor
END;
```

**Explicação**
- Este script utiliza um cursor explícito para iterar sobre todos os livros na tabela T_BS_LIVRO.
- O cursor c_livro é definido com uma consulta que seleciona o código e o título de todos os livros.
- A operação OPEN c_livro abre o cursor, e FETCH c_livro INTO v_cod, v_titulo recupera os dados de cada linha.
- O loop continua até que todos os registros sejam processados (EXIT WHEN c_livro%NOTFOUND), e o cursor é fechado com CLOSE c_livro.

## 4. Abordagem com cursor explícito para livros e autores
### Código:
```sql
SET SERVEROUTPUT ON

DECLARE
    CURSOR c_tit_autor IS
    SELECT
        UPPER(l.tx_titulo) AS tx_titulo,
        l.nr_numero_paginas,
        a.nm_autor
    FROM 
        T_BS_LIVRO l
        INNER JOIN T_BS_AUTOR a
        ON (a.cd_codigo = l.cd_codigo_autor);
    
    v_titulo T_BS_LIVRO.tx_titulo%TYPE;
    v_pag T_BS_LIVRO.nr_numero_paginas%TYPE;
    v_autor T_BS_AUTOR.nm_autor%TYPE;

BEGIN
    OPEN c_tit_autor;
    LOOP
        FETCH c_tit_autor INTO v_titulo, v_pag, v_autor;
        EXIT WHEN c_tit_autor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_titulo || '-' || v_pag || '-' || v_autor);
    END LOOP;
    CLOSE c_tit_autor;
END;
```

**Explicação**
- Este bloco de código faz um JOIN entre as tabelas T_BS_LIVRO e T_BS_AUTOR para recuperar o título do livro, o número de páginas e o nome do autor.
- O cursor c_tit_autor é aberto e percorre todos os livros e seus respectivos autores.
- O comando FETCH recupera os dados para as variáveis v_titulo, v_pag e v_autor.
- Cada resultado é exibido no formato título - número de páginas - autor usando DBMS_OUTPUT.PUT_LINE.
- O cursor é fechado após a execução do loop.

## 5. Abordagem com ROWTYPE para livros e autores
### Código:
```sql
SET SERVEROUTPUT ON

DECLARE
    CURSOR c_tit_autor IS
    SELECT
        UPPER(l.tx_titulo) AS tx_titulo,
        l.nr_numero_paginas,
        a.nm_autor
    FROM 
        T_BS_LIVRO l
        INNER JOIN T_BS_AUTOR a
        ON (a.cd_codigo = l.cd_codigo_autor);
    
    ltit_autor c_tit_autor%ROWTYPE;

BEGIN
    OPEN c_tit_autor;
    LOOP
        FETCH c_tit_autor INTO ltit_autor;
        EXIT WHEN c_tit_autor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(ltit_autor.tx_titulo || '-' || ltit_autor.nr_numero_paginas || '-' || ltit_autor.nm_autor);
    END LOOP;
    CLOSE c_tit_autor;
END;
```

**Explicação**
- Nesta abordagem, o script utiliza o tipo ROWTYPE para armazenar os resultados do cursor em uma variável que corresponde exatamente à estrutura das colunas retornadas pela consulta.
- A variável ltit_autor é do tipo ROWTYPE do cursor c_tit_autor, o que significa que ela pode armazenar todas as colunas (título, número de páginas e autor) como uma única variável.
- O loop continua a buscar e exibir os resultados no formato título - número de páginas - autor até que todos os registros sejam processados.

## 6. Abordagem com FOR loop para livros e autores
### Código:
```sql
DECLARE
BEGIN
    FOR linha IN
    (
        SELECT
            l.tx_titulo, l.nr_numero_paginas, a.nm_autor
        FROM 
            T_BS_LIVRO l 
        INNER JOIN T_BS_AUTOR a
        ON (a.cd_codigo = l.cd_codigo_autor)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(linha.tx_titulo || '-' || linha.nr_numero_paginas || '-' || linha.nm_autor);
    END LOOP;
END;
```
**Explicação**
- Esta abordagem usa um FOR LOOP implícito no qual a consulta SELECT é executada diretamente dentro do loop.
- Cada linha retornada pela consulta é automaticamente processada dentro do loop, e os resultados são exibidos no formato título - número de páginas - autor.
- Não há necessidade de declarar variáveis explícitas ou usar cursores, já que o FOR loop cuida da iteração sobre os resultados da consulta.

## Considerações Finais
Essas abordagens demonstram diferentes formas de trabalhar com cursores e recuperação de dados no Oracle PL/SQL, variando de consultas simples a manipulação mais avançada com cursores explícitos e tipos de dados. Essas técnicas são úteis para quem precisa manipular grandes volumes de dados ou executar operações iterativas em PL/SQL.
