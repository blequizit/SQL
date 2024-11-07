SET SERVEROUTPUT ON

ACCEPT pais PROMPT 'Entre com o pais';

DECLARE
--    pais VARCHAR2(15) := UPPER('&pais');
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
