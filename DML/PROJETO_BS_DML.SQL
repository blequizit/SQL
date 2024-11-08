-- Inserções de dados nas tabelas
-- Cadastrando os autores
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (1,'Robert Kirkman');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (2,'E.L. James');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (3,'Drauzio Varela');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (4,'Dante Alighieri');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (5,'Machado de Assis');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (6,'John Green');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (7,'Markus Zusak');
INSERT INTO T_BS_AUTOR(cd_codigo, nm_autor) VALUES (8,'Suzanne Collins');

-- Cadastrando as Livrarias
INSERT INTO T_BS_LIVRARIA(cd_livraria, nm_livraria) VALUES (1,'Livraria Cultura');
INSERT INTO T_BS_LIVRARIA(cd_livraria, nm_livraria) VALUES (2,'Livraria Saraiva');
INSERT INTO T_BS_LIVRARIA(cd_livraria, nm_livraria) VALUES (3,'Livraria Nobel');
INSERT INTO T_BS_LIVRARIA(cd_livraria, nm_livraria) VALUES (4,'Livraria Martins Fontes');

-- Cadastrando os livros
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(1,'Walking Dead: A ascensão do governador',1);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(2,'Walking Dead: O Caminho para Woodbury',1);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(3,'Walking Dead: A Queda do Governador - Parte 1',1);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(4,'Walking Dead: A Queda do Governador - Parte 2',1);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(5,'Walking Dead: Descent',1);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(6,'50 tons de cinza',2);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(7,'50 tons mais escuros',2);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(8,'50 tons de liberdade',2);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(9,'50 tons de prazer',2);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(10,'Carandiru',3);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(11,'Carcereiros',3);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(12,'Divina Comédia',4);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(13,'Dom Casmurro',5);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(14,'Jogos Vorazes',8);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(15,'Em chamas',8);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(16,'Esperança parte 1',8);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(17,'Esperança parte 2',8);
INSERT INTO T_BS_LIVRO(cd_codigo, tx_titulo, cd_codigo_autor) VALUES(18,'A menina que roubava livros',7);

-- Cadastrando as disponibilidades de A menina que roubava livros
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(18,1,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(18,2,'D',16,29.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(18,3,'D',120,39.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(18,4,'I',0,0);

-- Cadastrando as disponibilidades de Esperança parte 2
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(17,1,'D',4,19.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(17,2,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(17,3,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(17,4,'D',4,34.5);

-- Cadastrando as disponibilidades de Esperança parte 1
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(16,1,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(16,2,'D',12,19.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(16,3,'D',33,19.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(16,4,'I',0,0);

-- Cadastrando as disponibilidades de Em chamas
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(15,1,'D',8,59.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(15,2,'D',7,69.9);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(15,3,'D',1,71.30);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(15,4,'D',1,37.9);

-- Cadastrando as disponibilidades de Jogos Vorazes
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(14,1,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(14,2,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(14,3,'I',0,0);
INSERT INTO T_BS_LIVRO_LIVRARIA VALUES(14,4,'I',0,0);

-- Atualizando os dados das livrarias
UPDATE "T_BS_LIVRARIA" SET TX_ENDERECO = 'Rua Pamplona', NR_NUMEROENDERECO = 197, TX_BAIRRO = 'Jardins' WHERE CD_LIVRARIA =  1;
UPDATE "T_BS_LIVRARIA" SET TX_ENDERECO = 'Avenida Higienopolis', NR_NUMEROENDERECO = 2000, TX_BAIRRO = 'Higienopolis' WHERE CD_LIVRARIA = 2;
UPDATE "T_BS_LIVRARIA" SET TX_ENDERECO = 'Rua Direita', NR_NUMEROENDERECO = 499, TX_BAIRRO = 'Centro' WHERE CD_LIVRARIA = 3;
UPDATE "T_BS_LIVRARIA" SET TX_ENDERECO = 'Rua Eça de Queiroz', NR_NUMEROENDERECO = 132, TX_BAIRRO ='Paraiso' WHERE CD_LIVRARIA = 4;
