SET SERVEROUTPUT ON
DECLARE
    resultado NUMBER :=0;
BEGIN
    resultado := 1/2;
    DBMS_OUTPUT.PUT_LINE(resultado);
    -- o resto da divisao inteira MOD
    resultado := 10 mod 3;
    DBMS_OUTPUT.PUT_LINE(resultado);
    -- SIMBOLO DE DESIGUALDADE (DIFERENTE) <>
    IF resultado <> 4 THEN
        DBMS_OUTPUT.PUT_LINE('O resultado é diferente de 4');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O resultado é igual a 4');
    END IF;
END;