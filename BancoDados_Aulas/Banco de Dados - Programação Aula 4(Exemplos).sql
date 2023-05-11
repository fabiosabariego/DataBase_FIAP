-------------------------------------------------------------------------
-- DML (INSERT)
-------------------------------------------------------------------------
-- Exemplo 1
DROP TABLE MATERIA PURGE;

CREATE TABLE MATERIA (
COD_MATERIA NUMBER,
DESCRICAO VARCHAR2(20)
);

INSERT INTO MATERIA 
VALUES (1, 'BANCO DE DADOS');

INSERT INTO MATERIA 
VALUES (2, 'BUSINESS INTELLIGENCE');

SELECT * FROM MATERIA;

COMMIT;

INSERT INTO MATERIA 
VALUES (3, 'BIG DATA');

SELECT * 
FROM MATERIA;

ROLLBACK;

-- Exemplo 2
DROP TABLE CATEGORIA CASCADE CONSTRAINTS;

CREATE TABLE CATEGORIA
(COD_CATEGORIA INT CONSTRAINT CATEGORIA_PK PRIMARY KEY,
CATEGORIA VARCHAR(255));

INSERT INTO CATEGORIA
(COD_CATEGORIA, CATEGORIA)
VALUES (10, 'FRUTA');

COMMIT;

-- Exemplo 3
INSERT ALL
  INTO CATEGORIA VALUES (11, 'LEGUME')
  INTO CATEGORIA VALUES (12, 'CARNE')
  INTO CATEGORIA VALUES (13, 'DOCE')
  INTO CATEGORIA VALUES (14, 'BEBIDA')
SELECT * FROM DUAL; 

COMMIT;

-------------------------------------------------------------------------
-- TABELA DUAL
-------------------------------------------------------------------------
-- Exemplo 4
SELECT SYSDATE 
FROM DUAL;

--SELECT nome_sequence.NEXTVAL 
--FROM DUAL;

SELECT (14382+3238)*12 
FROM DUAL;

-- Exemplo 5
-- Omitindo o valor em uma coluna opcional
INSERT INTO CATEGORIA (COD_CATEGORIA, CATEGORIA)
VALUES (20, NULL);

-- OU

INSERT INTO CATEGORIA (COD_CATEGORIA)
VALUES (20);

-------------------------------------------------------------------------
-- CRIA TABELA PRODUTO PARA OS EXEMPLOS DE UPDATE E DELETE
-------------------------------------------------------------------------
DROP TABLE PRODUTO CASCADE CONSTRAINTS;
CREATE TABLE PRODUTO
(CODIGO INT CONSTRAINT CODIGO_PK PRIMARY KEY,
DESCRICAO VARCHAR(50),
VALOR NUMBER(8,2));

INSERT INTO PRODUTO VALUES (1010,'CAMISA',80.00);
INSERT INTO PRODUTO VALUES (1011,'POLO',120.00);
INSERT INTO PRODUTO VALUES (1012,'CAMISA',150.00);
INSERT INTO PRODUTO VALUES (1013,'CALÇA',100.00);
INSERT INTO PRODUTO VALUES (1014,'SHORTS',70.00);

COMMIT;

SELECT * FROM PRODUTO;

-------------------------------------------------------------------------
-- DML (UPDATE)
-------------------------------------------------------------------------
-- Exemplo 1
UPDATE PRODUTO
SET DESCRICAO = 'CAMISETA'
WHERE CODIGO = 1010; 

COMMIT;

SELECT * FROM PRODUTO
WHERE CODIGO = 1010;

-- Exemplo 2
SELECT * FROM PRODUTO;

UPDATE PRODUTO
SET VALOR = VALOR * 1.10; 

COMMIT;

SELECT * FROM PRODUTO;

-- Exemplo 3
SELECT * FROM PRODUTO
WHERE CODIGO = 1013; 
 
UPDATE PRODUTO
SET DESCRICAO = 'CALÇA JEANS', VALOR = 150.00
WHERE CODIGO = 1013; 

COMMIT;

SELECT * FROM PRODUTO
WHERE CODIGO = 1013; 

-------------------------------------------------------------------------
-- DML (DELETE)
-------------------------------------------------------------------------
-- Exemplo 1
SELECT * FROM PRODUTO
WHERE CODIGO = 1013; 

DELETE FROM PRODUTO
WHERE CODIGO = 1013; 

SELECT * FROM PRODUTO
WHERE CODIGO = 1013; 

COMMIT;

-- Exemplo 2
SELECT COUNT(*)
FROM PRODUTO;

DELETE FROM PRODUTO
WHERE VALOR <= 100; 

COMMIT;

SELECT COUNT(*)
FROM PRODUTO;

-------------------------------------------------------------------------
-- Alteração de parâmetro da sessão
-------------------------------------------------------------------------
-- Exemplo Formatação de data
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';


-- Exemplo Formatação de data e aleração do idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE = 'PORTUGUESE';
	SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'MON') MESABV,
	TO_CHAR(SYSDATE, 'MONTH') MES
	FROM DUAL;

-- Exemplo Consulta no dicionário
SELECT * FROM USER_OBJECTS;
SELECT * FROM USER_TAB_COLUMNS;
SELECT * FROM USER_CONSTRAINTS;

