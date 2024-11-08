--FAIXA DE VALORES 
--1a faixa 1 a 10
--2a faixa 11 a 20
SET SERVEROUTPUT ON
ACCEPT numero PROMPT 'Entre com um numero'
DECLARE
    numero NUMBER := &numero;
BEGIN
--    IF numero >= 1 AND numero <= 20 THEN
--        IF numero >= 1 and numero <= 10 THEN
--            DBMS_OUTPUT.PUT_LINE('1a faixa');
--        END IF;
--        IF numero >= 11 and numero <= 20 THEN
--            DBMS_OUTPUT.PUT_LINE('2a faixa');
--        END IF;
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('faixa invalida');
--    END IF;


--    IF numero BETWEEN 1 AND 20 THEN
--        IF numero BETWEEN 1 AND 10 THEN
--            DBMS_OUTPUT.PUT_LINE('1a faixa');
--        ELSIF numero BETWEEN 11 AND 20 THEN
--            DBMS_OUTPUT.PUT_LINE('2a faixa');
--        END IF;
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('faixa invalida');
--    END IF;

--    IF numero BETWEEN 1 AND 10 THEN
--        DBMS_OUTPUT.PUT_LINE('1a faixa');
--    ELSIF numero BETWEEN 11 AND 20 THEN
--        DBMS_OUTPUT.PUT_LINE('2a faixa');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('faixa invalida');
--    END IF;    
--    

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