----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;

CREATE TABLE ALUNO (
   MATRICULA NUMBER,
   NOME VARCHAR2(200),
   SEXO CHAR(1),
   DATA_NASC DATE
); 
----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;

CREATE TABLE ALUNO (
   MATRICULA NUMBER NOT NULL,
   NOME VARCHAR2(200) NOT NULL,
   SEXO CHAR(1),
   DATA_NASC DATE
); 
----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;

CREATE TABLE ALUNO (
   MATRICULA NUMBER CONSTRAINT NN_ALUNO_MATRICULA NOT NULL,
   NOME VARCHAR2(200) CONSTRAINT NN_ALUNO_NOME NOT NULL,
   SEXO CHAR(1),
   DATA_NASC DATE
); 

----------------------------------------------------------------------------
-- Exemplo
drop  TABLE MATERIA;

CREATE TABLE MATERIA (
   CODIGO NUMBER NOT NULL,
   DESCRICAO VARCHAR2(200) UNIQUE
); 

----------------------------------------------------------------------------
-- Exemplo
drop table MATERIA ;

CREATE TABLE MATERIA (
   CODIGO NUMBER CONSTRAINT NN_MATERIA_CODIGO NOT NULL,
   DESCRICAO VARCHAR2(200) CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE
); 

----------------------------------------------------------------------------
-- Exemplo
drop table MATERIA ;

CREATE TABLE MATERIA (
   CODIGO NUMBER CONSTRAINT NN_MATERIA_CODIGO NOT NULL,
   DESCRICAO VARCHAR2(200),
   CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE(DESCRICAO)
); 

----------------------------------------------------------------------------
-- Exemplo
drop table MATERIA ;

CREATE TABLE MATERIA (
   CODIGO NUMBER PRIMARY KEY,
   DESCRICAO VARCHAR2(200) UNIQUE
); 

----------------------------------------------------------------------------
-- Exemplo
drop table MATERIA ;

CREATE TABLE MATERIA (
   CODIGO NUMBER CONSTRAINT PK_MATERIA_CODIGO PRIMARY KEY,
   DESCRICAO VARCHAR2(200) CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE
); 

----------------------------------------------------------------------------
-- Exemplo
drop table MATERIA ;

CREATE TABLE MATERIA (
   CODIGO NUMBER,
   SIGLA CHAR(2),
   DESCRICAO VARCHAR2(200) UNIQUE,
   CONSTRAINT PK_MATERIA_CODIGO_SIGLA PRIMARY KEY (CODIGO, SIGLA)
); 

----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;
CREATE TABLE ALUNO (
   MATRICULA NUMBER,
   NOME VARCHAR2(30),
   SEXO CHAR(1) CHECK (SEXO IN ('M', 'F'))
); 

----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;
CREATE TABLE ALUNO (
   MATRICULA NUMBER,
   NOME VARCHAR2(30),
   SEXO CHAR(1) CONSTRAINT CK_ALUNO_SEXO CHECK (SEXO IN ('M', 'F'))
); 

----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;
CREATE TABLE ALUNO (
   MATRICULA NUMBER,
   NOME VARCHAR2(30),
   SEXO CHAR(1), CONSTRAINT CK_ALUNO_SEXO CHECK (SEXO IN ('M', 'F'))
); 

----------------------------------------------------------------------------
-- Exemplo
drop table ALUNO ;
CREATE TABLE ALUNO (
   MATRICULA NUMBER PRIMARY KEY,
   NOME VARCHAR2(30),
   SEXO CHAR(1) CHECK (SEXO IN ('M', 'F'))
); 

----------------------------------------------------------------------------
-- Exemplo
drop table CELULAR ;
CREATE TABLE CELULAR (
   COD_CELULAR NUMBER PRIMARY KEY,
   NUMERO VARCHAR2(10) UNIQUE,
   MATRICULA NUMBER(3) REFERENCES ALUNO (MATRICULA)
); 

----------------------------------------------------------------------------
-- Exemplo
drop table CELULAR ;
CREATE TABLE CELULAR (
   COD_CELULAR NUMBER CONSTRAINT PK_CELULAR_COD_CELULAR PRIMARY KEY,
   NUMERO VARCHAR2(10) CONSTRAINT UK_CELULAR_NUMERO UNIQUE,
   MATRICULA NUMBER(3)
   CONSTRAINT FK_CELULAR_ALUNO_MATRICULA REFERENCES ALUNO (MATRICULA)
); 

----------------------------------------------------------------------------
-- Exemplo
drop table CELULAR ;
CREATE TABLE CELULAR (
   COD_CELULAR NUMBER PRIMARY KEY,
   NUMERO VARCHAR2(10) UNIQUE,
   CPF VARCHAR2(14),
   MATRICULA NUMBER(3),
   CONSTRAINT FK_CELULAR_ALUNO_CPF_MATRICULA
   FOREIGN KEY (CPF, MATRICULA)
   REFERENCES ALUNO (CPF, MATRICULA)
); 


