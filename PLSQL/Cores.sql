-- ENTRE COM UMA COR PARA VERIFICAR SE ELA ESTA NA BANDEIRA
--racional - entra com a cor 
--usa o operador IN com lista ('AMARELO', 'VERDE', 'AZUL', 'BRANCO')
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
