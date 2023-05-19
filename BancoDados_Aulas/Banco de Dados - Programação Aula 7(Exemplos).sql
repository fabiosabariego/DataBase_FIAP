----------------------------------------------------
-- Exemplos: Banco de Dados - Programação Aula 7.
----------------------------------------------------
---------------------------------------------------
-- FUNÇÕES NUMÉRICAS
---------------------------------------------------
SELECT
   LAST_NAME,
   SALARY,
   ROUND(SALARY,4) 	  FUNC_ROUND,
   MOD(SALARY,2) 	  FUNC_MOD,
   TRUNC(SALARY,0)    FUNC_TRUNC,
   ABS(SALARY * (-1)) FUNC_ABS,
   SQRT(SALARY) 	  FUNC_SQRT,
   FLOOR(SALARY) 	  FUNC_FLOOR,
   CEIL(SALARY) 	  FUNC_CEIL
FROM EMPLOYEES;

---------------------------------------------------
-- EXEMPLO: FUNÇÕES DE CARACTERES
---------------------------------------------------
SELECT
   LOWER(LAST_NAME)   FUNC_LOWER,
   UPPER(LAST_NAME)   FUNC_UPPER,
   INITCAP(LAST_NAME) FUNC_INITCAP
FROM EMPLOYEES;

-----------------------------------------------------------
--EXEMPLO: Funções DE CARACTERES (Concat, substr e length)
-----------------------------------------------------------
SELECT
   CONCAT(LAST_NAME, LAST_NAME) FUNC_CONCAT_EX01,
   CONCAT(LAST_NAME, '_ABC') 	FUNC_CONCAT_EX02,
   SUBSTR(LAST_NAME, 1, 3)  	FUNC_SUBSTR_EX01,
   SUBSTR(LAST_NAME, 3) 	 	FUNC_SUBSTR_EX02,
   LENGTH(LAST_NAME) 	 	    FUNC_LENGHT
FROM EMPLOYEES;

---------------------------------------------------
-- EXEMPLO: FUNÇÕES DE CARACTERES (INSTR)
---------------------------------------------------
SELECT
   LAST_NAME,
   INSTR(LAST_NAME, 'a')  	   FUNC_INSTR_EX01,
   INSTR(LAST_NAME, 'a', 3)    FUNC_INSTR_EX02,
   INSTR(LAST_NAME, 'a', 3, 2) FUNC_INSTR_EX03
FROM EMPLOYEES;

---------------------------------------------------
-- EXEMPLO: FUNÇÕES DE CARACTERES (RPAD E LPAD)
---------------------------------------------------
SELECT
LAST_NAME,
    RPAD(LAST_NAME, 20)  	 FUNC_RPAD_EX01,
    RPAD(LAST_NAME, 20, '.') FUNC_RPAD_EX02,
    LPAD (LAST_NAME, 20,'*') FUNC_LPAD_EX01
FROM EMPLOYEES;

-------------------------------------------------------
-- EXEMPLO: FUNÇÕES DE CARACTERES (LTRIM, RTRIM E TRIM)
-------------------------------------------------------
SELECT
   LAST_NAME,
   LTRIM(LAST_NAME,'K')  	FUNC_LTRIM,
   RTRIM(LAST_NAME,'g')       FUNC_RTRIM,
   TRIM('D' FROM LAST_NAME)   FUNC_TRIM
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (100,101,102);

---------------------------------------------------
-- EXEMPLO: FUNÇÕES DE CARACTERES (REPLACE)
---------------------------------------------------
SELECT
LAST_NAME,
REPLACE (LAST_NAME, 'a' , '*') FUNC_NM_NOME
FROM EMPLOYEES;

---------------------------------------------------
-- EXEMPLO: FUNÇÃO TO_CHAR
---------------------------------------------------
SELECT
    1234 ENTRADA,
    TO_CHAR(1234,'$99999')  	 TO_CHAR_EX01,
    TO_CHAR(1234,'999,999') 	 TO_CHAR_EX02,
    TO_CHAR(1234,'9999.99') 	 TO_CHAR_EX03,
    TO_CHAR(1234,'099999') 	     TO_CHAR_EX04,
    TO_CHAR(1234,'99999') 	     TO_CHAR_EX05,
    TO_CHAR(1234,'B099999')  	 TO_CHAR_EX06,
    TO_CHAR(1234,'C99999')    	 TO_CHAR_EX07
FROM DUAL;

---------------------------------------------------
-- EXEMPLO: FUNÇÃO TO_CHAR
---------------------------------------------------
SELECT
    CURRENT_DATE                     ENTRADA,
    TO_CHAR(CURRENT_DATE,'DD')       DD,
    TO_CHAR(CURRENT_DATE,'DY')       DY,
    TO_CHAR(CURRENT_DATE,'DAY')      DDAY,
    TO_CHAR(CURRENT_DATE,'DDSP')     DDSP,
    TO_CHAR(CURRENT_DATE,'MM')       MM,
    TO_CHAR(CURRENT_DATE,'MON')      MMON,
    TO_CHAR(CURRENT_DATE,'MONTH')    MMONTH,
    TO_CHAR(CURRENT_DATE,'YY')       YY,
    TO_CHAR(CURRENT_DATE,'RR')       RR,
    TO_CHAR(CURRENT_DATE,'YYYY')     YYYY,
    TO_CHAR(CURRENT_DATE,'RRRR')     RRRR,
    TO_CHAR(CURRENT_DATE,'HH:MI:SS') HHMISS,
    TO_CHAR(CURRENT_DATE,'HH24')     HH24
FROM DUAL;

---------------------------------------------------
-- VISUALIZAÇÃO DE DATA NO ORACLE
---------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

---------------------------------------------------
-- FORMATO DE IDIOMA NO ORACLE
---------------------------------------------------
ALTER SESSION SET NLS_DATE_LANGUAGE = 'PORTUGUESE';

SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'MON') MESABV,
	TO_CHAR(SYSDATE, 'MONTH') MES
FROM DUAL;

---------------------------------------------------
-- FUNÇÃO TO_NUMBER
---------------------------------------------------
SELECT
   '1234' ENTRADA,
   TO_NUMBER('1234') + 1234 TO_NUMBER_EX01
FROM DUAL;

---------------------------------------------------
-- FUNÇÃO TO_DATE
---------------------------------------------------
SELECT
    '03/01/2018' ENTRADA,
    TO_DATE('03/01/2018', 'DD/MM/YYYY') TO_DATE_EX01
 FROM DUAL;

---------------------------------------------------
-- EXEMPLO: FUNÇÃO DE DATA
---------------------------------------------------
SELECT
    CURRENT_DATE 		 ENTRADA,
    SYSDATE 			 ENTRADA,
    SYSTIMESTAMP 		 ENTRADA,
    CURRENT_TIMESTAMP 		 ENTRADA,
    ADD_MONTHS(CURRENT_DATE,  2) ADD_MONTHS_EX01,
    ADD_MONTHS(CURRENT_DATE, -2) ADD_MONTHS_EX02
FROM DUAL;

SELECT
    MONTHS_BETWEEN(CURRENT_DATE, '01/01/2018')  MONTHS_BETWEEN_EX01,
    MONTHS_BETWEEN('05/05/2018', '01/01/2018')  MONTHS_BETWEEN_EX02,
    MONTHS_BETWEEN('05/05/2017', '01/01/2018')  MONTHS_BETWEEN_EX03
FROM DUAL;








