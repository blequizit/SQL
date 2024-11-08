-- Criação das tabelas
CREATE TABLE T_BS_AUTOR(
  cd_codigo INTEGER NOT NULL,
  nm_autor VARCHAR(50),
  PRIMARY KEY (cd_codigo)
);

CREATE TABLE T_BS_LIVRO(
  cd_codigo INTEGER NOT NULL,
  tx_titulo VARCHAR(200),
  nr_numero_paginas INTEGER,
  nr_ano_publicacao INTEGER,
  nr_edicao INTEGER,
  cd_codigo_autor INTEGER,
  PRIMARY KEY (cd_codigo),
  FOREIGN KEY (cd_codigo_autor) REFERENCES T_BS_AUTOR(cd_codigo)
);
  
CREATE TABLE T_BS_LIVRARIA(
  cd_livraria INTEGER NOT NULL,
  nm_livraria VARCHAR(50),
  tx_endereco VARCHAR(100),
  nr_numeroendereco INTEGER,
  tx_bairro VARCHAR(50),
  tx_cep VARCHAR(9),
  PRIMARY KEY(cd_livraria)
);

CREATE TABLE T_BS_LIVRO_LIVRARIA(
  cd_codigo INTEGER NOT NULL,
  cd_livraria INTEGER NOT NULL,
  tx_status VARCHAR(1),
  nr_quant NUMBER(19,2),
  vl_unitario NUMBER(19,2),
  PRIMARY KEY(cd_codigo, cd_livraria),
  FOREIGN KEY(cd_codigo) REFERENCES T_BS_LIVRO(cd_codigo),
  FOREIGN KEY(cd_livraria) REFERENCES T_BS_LIVRARIA(cd_livraria)
);
