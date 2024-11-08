--CURSOR NADA MAIS É QUE UMA ESTRATEGIA PARA RECUPERAR DADOS DENTRO DO ORACLE PL SQL
--TIPICAMENTE VEM DE CONSULTAS (SELECT) Q PODEM USAR OBJETOS COMO TABELAS, VIEWS, FUNCOES

--nossa motivacao é trazer todos os codigos e titulos da tabela T_BS_LIVRO
--SELECT * FROM T_BS_LIVRO WHERE cd_codigo = 3;
--SELECT cd_codigo, tx_titulo FROM T_BS_LIVRO WHERE cd_codigo = 3;

SET SERVEROUTPUT ON
-- ABORDAGEM SEM CURSOR PARA UM UNICO TITULO
DECLARE
    v_cod NUMBER;
    v_titulo VARCHAR2(200);
BEGIN
    SELECT cd_codigo, tx_titulo
    INTO v_cod, v_titulo
    FROM T_BS_LIVRO WHERE cd_codigo = 3;
    DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo);
END;


-- ABORDAGEM SEM CURSOR PARA TODOS OS TITULO
DECLARE
--    v_cod NUMBER;
--    v_titulo VARCHAR2(200);
    v_cod T_BS_LIVRO.cd_codigo%TYPE;
    v_titulo T_BS_LIVRO.tx_titulo%TYPE;

    i INTEGER;
BEGIN
    --FOR i IN 1..22 nao funciona porque saiu do sequencial do codigo
    FOR i IN 1..18
    LOOP
        SELECT cd_codigo, tx_titulo
        INTO v_cod, v_titulo
        FROM T_BS_LIVRO WHERE cd_codigo = i;
        DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo);
    END LOOP;
END;


-- ABORDAGEM COM CURSOR PARA TODOS OS TITULOS
DECLARE
--    v_cod NUMBER;
--    v_titulo VARCHAR2(200);
    v_cod T_BS_LIVRO.cd_codigo%TYPE;
    v_titulo T_BS_LIVRO.tx_titulo%TYPE;

    i INTEGER;
    -- CRIANDO UM CURSOR QUE RECUPERA TODOS LIVROS DA TABELA
    CURSOR c_livro is
        SELECT cd_codigo, tx_titulo FROM T_BS_LIVRO;
BEGIN
    OPEN c_livro; --abrindo o cursor
    LOOP
        FETCH c_livro INTO v_cod, v_titulo; -- recuperando os dados e colocando em variaveis
        EXIT WHEN c_livro%NOTFOUND; --saindo do loop qdo nao encontrar mais livros
        DBMS_OUTPUT.PUT_LINE(v_cod || '-' || v_titulo);
    END LOOP;
    CLOSE c_livro; --fechando o cursor
END;


--SELECT BASE
--racional
--SELECT
--    l.tx_titulo, -> v_titulo
--    l.nr_numero_paginas, -> v_pag
--    a.nm_autor -> v_autor
--FROM 
--    T_BS_LIVRO l
--    INNER JOIN
--    T_BS_AUTOR a
--    ON (a.cd_codigo = l.cd_codigo_autor);
SET SERVEROUTPUT ON
DECLARE
    CURSOR c_tit_autor IS
    SELECT
        UPPER(l.tx_titulo) AS tx_titulo,
        l.nr_numero_paginas,
        a.nm_autor
    FROM 
        T_BS_LIVRO l
        INNER JOIN
        T_BS_AUTOR a
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

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_tit_autor IS
    SELECT
        UPPER(l.tx_titulo) AS tx_titulo,
        l.nr_numero_paginas,
        a.nm_autor
    FROM 
        T_BS_LIVRO l
        INNER JOIN
        T_BS_AUTOR a
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


DECLARE
BEGIN
    FOR linha IN
    (
        SELECT
            l.tx_titulo, l.nr_numero_paginas, a.nm_autor
        FROM 
            T_BS_LIVRO l INNER JOIN T_BS_AUTOR a
            ON (a.cd_codigo = l.cd_codigo_autor)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(linha.tx_titulo || '-' || linha.nr_numero_paginas|| '-' ||linha.nm_autor);
    END LOOP;
    
END;

