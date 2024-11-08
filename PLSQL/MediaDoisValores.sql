SET SERVEROUTPUT ON

ACCEPT v1 PROMPT 'Entre com primeiro valor';
ACCEPT v2 PROMPT 'Entre com segundo valor';

DECLARE
    n1 NUMBER := &v1;
    n2 NUMBER := &v2;
    total NUMBER;
BEGIN
    total := (n1+n2)/2;
    DBMS_OUTPUT.PUT_LINE('A media dos valores '|| n1 || ' e ' || n2 || ' é ' || total);
END;
