--*** SOLUÇÃO 2 ***--
/*
drop table item_produto;
drop table produto;
drop table categoria;
drop table materia_prima;
*/

/*
1- Criar todas as tabelas com as constraints no nível de coluna:
  PRIMARY KEY
  UNIQUE 
  NOT NULL
  CHECK

2- Criar a constrant FOREIGN KEY com ALTER TABLE
*/

CL SCR
----------------------------------------
-- CATEGORIA
----------------------------------------
create table categoria
(cod_categoria int           constraint categoria_pk primary key,
 categoria     varchar(255)  constraint categoria_uq unique,
                             constraint item_produto_qtd_ck 
                                        check(categoria in('DOCE','BEBIDA','CONGELADO')));

----------------------------------------
-- MATERIA PRIMA
----------------------------------------
create table materia_prima
  (cod_materia_prima int      constraint materia_prima_pk primary key,
   materia_prima varchar(255) constraint materia_prima_uq unique); 

----------------------------------------
-- PRODUTO
----------------------------------------
create table produto
( cod_produto   int          constraint produto_pk      primary key,
  cod_categoria int          constraint prod_cod_cat_nn not null,
  produto       varchar(255) constraint produto_uq unique);
  
----------------------------------------
-- ITEM_PRODUTO
----------------------------------------
create table item_produto
(cod_produto       int,
 cod_materia_prima int,
 quantidade        int  constraint item_produto_qtd_nn not null,
 constraint item_produto_pk primary key (cod_produto,cod_materia_prima));
 
----------------------------------------
-- CRIANDO FOREIGN KEYS
---------------------------------------- 
-- (NOTE QUE LEMBRA MUITO A  CRIAÇÃO DA CONSTRAINT NO NÍVEL DE TABELA)

-- FK PRODUTO 
 alter table produto
 add constraint prod_cat_fk
 foreign key (cod_categoria)
 references categoria;
 
-- FK 1 item_produto
 alter table item_produto
 add constraint item_produto_produto_fk
 foreign key (cod_produto)
 references produto;

-- FK 2 item_produto 
 alter table item_produto
 add constraint item_produto_materia_prima_fk
 foreign key (cod_materia_prima)
 references materia_prima;

-----------------------------------------------------------------------------------------------
-- VALIDANDO
SELECT TABLE_NAME,
       CONSTRAINT_TYPE,
       CONSTRAINT_NAME,
       SEARCH_CONDITION
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME IN ('CATEGORIA','PRODUTO','MATERIA_PRIMA','ITEM_PRODUTO')
ORDER BY 1,2,3;

