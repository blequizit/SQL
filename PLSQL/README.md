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
