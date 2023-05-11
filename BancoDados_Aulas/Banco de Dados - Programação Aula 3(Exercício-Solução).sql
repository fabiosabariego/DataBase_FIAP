-----------------------------------------------------------------------------
-- PARA EXECUTAR ESSE EXERCÍCIO É NECESSÁRIO EFETUAR O EXERCÍCIO DA AULA 2 --
-----------------------------------------------------------------------------

--DDL: ALTERAÇÃO DE ESTRUTURAS
-----------------------------------------------------------------------------
-- Exercício 1
ALTER TABLE ITEM_PRODUTO
ADD TIPO_MEDIDA VARCHAR2(30); 

-- Exercício 2
ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT CH_ITEPRO_TIPMED 
CHECK (TIPO_MEDIDA IN('LITRO','KILO','UNIDADE'));

-- Exercício 3
ALTER TABLE MATERIA_PRIMA
DROP  CONSTRAINT MATERIA_PRIMA_UQ;
    
-- Exercício 4
SELECT TABLE_NAME,
       CONSTRAINT_TYPE,
       CONSTRAINT_NAME,
       SEARCH_CONDITION
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME IN ('CATEGORIA','PRODUTO','MATERIA_PRIMA','ITEM_PRODUTO')
ORDER BY 1,2,3;


--DDL/DML: CRIAÇÃO E MANIPULAÇÃO DO SEQUENCE
-----------------------------------------------------------------------------
-- Exercício 1
CREATE SEQUENCE SEQ_CATEGORIA;

-- Exercício 2
INSERT INTO CATEGORIA 
VALUES (10,'DOCE');

INSERT INTO PRODUTO 
VALUES(1,10, 'CHOCOLATE');

INSERT INTO CATEGORIA 
VALUES(SEQ_CATEGORIA.NEXTVAL, 'BEBIDA');

COMMIT;

SELECT * FROM CATEGORIA;