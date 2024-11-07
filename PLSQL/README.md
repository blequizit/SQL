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
