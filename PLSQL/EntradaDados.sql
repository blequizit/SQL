SET SERVEROUTPUT ON
--O INPUT NO PL/SQL NAO É UMA COISA COMUM, ENTAO A GENTE ACABA USANDO OS COMANDOS DO SQLPLUS
-- configuracao da janela que pede os dados
ACCEPT valor PROMPT 'Digite o valor:';

DECLARE
    -- aqui q estamos trazendo o valor da janela e transferido para o programa propriamente dito
    n NUMBER := &valor;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Você digitou ' || n);
END;
