--*** SOLUÇÃO 1 ***--
/*
drop table item_produto;
drop table produto;
drop table categoria;
drop table materia_prima;
*/
-- LIMPA TELA
CLEAR SCREEN
-- OU
CL SCR
----------------------------------------
-- CATEGORIA
----------------------------------------
    create table categoria
    (cod_categoria int          constraint categoria_pk primary key,
     categoria     varchar(255) constraint categoria_uq unique,
                                constraint item_produto_qtd_ck 
                                           check(categoria in('DOCE','BEBIDA','CONGELADO')));
----------------------------------------
-- MATERIA PRIMA
----------------------------------------
    create table materia_prima
      (cod_materia_prima int          constraint materia_prima_pk primary key,
       materia_prima     varchar(255) constraint materia_prima_uq unique); 
----------------------------------------
-- PRODUTO
----------------------------------------
-- CONSTRAINT FOREIGN KEY E UNIQUE NO NÃ?VEL DE COLUNA
    create table produto
    ( cod_produto   int           constraint produto_pk primary key,
      cod_categoria int           constraint prod_cod_cat_nn not null
                                  constraint prod_cat_fk references categoria,
      produto       varchar(255)  constraint produto_uq unique
    );
    
-- CONSTRAINT FOREIGN KEY, UNIQUE NO NÍVEL DE TABELA
    DROP TABLE PRODUTO;
    
    create table produto
    ( cod_produto   int constraint produto_pk      primary key,
      cod_categoria int constraint prod_cod_cat_nn not null,
      produto       varchar(255) ,
      constraint prod_cat_fk foreign key (cod_categoria)references categoria,
      constraint produto_uq  unique (produto)
    );

----------------------------------------
-- ITEM_PRODUTO
----------------------------------------
-- CONSTRAINTS FOREIGN KEY E CHECK NO NÍVEL DE COLUNA  

    create table item_produto
    (cod_produto       int constraint item_produto_produto_fk       references produto,
     cod_materia_prima int constraint item_produto_materia_prima_fk references materia_prima,
     quantidade        int constraint item_produto_qtd_nn not null,
                           constraint item_produto_pk  primary key (cod_produto,cod_materia_prima)
     );
 
-- CONSTRAINTS FOREIGN KEY E CHECK NO NÍVEL DE TABELA  
DROP TABLE item_produto;

    create table item_produto
    (cod_produto       int,
     cod_materia_prima int,
     quantidade        int constraint item_produto_qtd_nn not null,
     constraint item_produto_pk               primary key (cod_produto,cod_materia_prima),
     constraint item_produto_produto_fk       foreign key (cod_produto)       references produto,
     constraint item_produto_materia_prima_fk foreign key (cod_materia_prima) references materia_prima);

-----------------------------------------------------------------------------------------------
-- VALIDANDO
SELECT TABLE_NAME,
       CONSTRAINT_TYPE,
       CONSTRAINT_NAME,
       SEARCH_CONDITION
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME IN ('CATEGORIA','PRODUTO','MATERIA_PRIMA','ITEM_PRODUTO')
ORDER BY 1,2,3;
