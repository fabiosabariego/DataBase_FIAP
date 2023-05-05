-- Criando a Tabela de Entirade de Cientistas

DROP TABLE CIENTISTAS;

CREATE TABLE CIENTISTAS(
CODIGO NUMBER(4) CONSTRAINT CIENTISTA_COD PRIMARY KEY,
NOME VARCHAR(50) CONSTRAINT CIENTISTA_NOME UNIQUE NOT NULL,
DT_NASC DATE CONSTRAINT CIENTISTA_DATA UNIQUE,
SEXO CHAR CONSTRAINT CIENTISTA_SEXO CHECK(SEXO IN('F', 'M'))
);

DESC CIENTISTAS;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

SELECT * FROM CIENTISTAS;

-- Inserindo valores na Tabela
INSERT INTO CIENTISTAS VALUES (1010, 'Stephen Hawking', TO_DATE('08-01-1942', 'DD/MM/YYYY'), 'M');
INSERT INTO CIENTISTAS VALUES (1011, 'Albert Einstein', TO_DATE('14-03-1879', 'DD/MM/YYYY'), 'M');
INSERT INTO CIENTISTAS VALUES (1012, 'Isaac Newton', TO_DATE('04-01-1643', 'DD/MM/YYYY'), 'M');
INSERT INTO CIENTISTAS VALUES (1013, 'Galileu Galilei', TO_DATE('15-02-1564', 'DD/MM/YYYY'), 'M');
INSERT INTO CIENTISTAS VALUES (1014, 'Nicolau Copernico', TO_DATE('19-02-1473', 'DD/MM/YYYY'), 'M');

COMMIT;

-- EX02 - Inserir uma nova coluna na Tabela

ALTER TABLE CIENTISTAS
ADD (DT_OBITO DATE CONSTRAINT CIENTISTA_OBITO_UQ UNIQUE);

SELECT * FROM CIENTISTAS;

-- Inserindo Valores na coluna DT_OBITO
UPDATE CIENTISTAS SET DT_OBITO = (TO_DATE('14-03-2018', 'DD/MM/YYYY')) WHERE CODIGO = 1010;
UPDATE CIENTISTAS SET DT_OBITO = (TO_DATE('18-04-1955', 'DD/MM/YYYY')) WHERE CODIGO = 1011;
UPDATE CIENTISTAS SET DT_OBITO = (TO_DATE('31-03-1727', 'DD/MM/YYYY')) WHERE CODIGO = 1012;
UPDATE CIENTISTAS SET DT_OBITO = (TO_DATE('08-01-1642', 'DD/MM/YYYY')) WHERE CODIGO = 1013;
UPDATE CIENTISTAS SET DT_OBITO = (TO_DATE('21-05-1543', 'DD/MM/YYYY')) WHERE CODIGO = 1014;

SELECT * FROM CIENTISTAS;

-- Removendo todos os cientistas que n�o nasceram em Fereveiro

DELETE FROM CIENTISTAS
WHERE TO_CHAR(DT_NASC, 'MON') <> 'FEB';


SELECT * FROM CIENTISTAS;



--------------------------------------
-- INSERT COM SELECT







