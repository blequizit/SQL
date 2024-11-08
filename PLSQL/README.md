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
