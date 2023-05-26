----------------------------------------------------
-- Exemplos: Banco de Dados - Programação Aula 8.
----------------------------------------------------
---------------------------------------------------
-- FUNÇÃO AVG (MÉDIA)
---------------------------------------------------
SELECT department_id, AVG(Salary) avg_Salary
FROM Employees
GROUP BY department_id;

-------------------------------------------------------------------
select  department_id,
        round(avg(Salary),2)avg_sal,
        min(salary) min_sal,
        max(salary) max_Sal
        from employees
        group by department_id;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary)
from employees
        group by department_id,job_id
        order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary) sum_salary,
        round(avg(salary)) AVG_SALARY,
        count(salary) count_sal,
        max(salary) max_sal,
        min(salary) min_sal
from employees
        group by department_id,job_id
        order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary) sum_salary,
        round(avg(salary)) AVG_SALARY,
        count(salary) count_sal,
        max(salary) max_sal,
        min(salary) min_sal
from employees
       WHERE DEPARTMENT_ID IN (10,60,90)
       group by department_id,job_id
       order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary) sum_salary,
        round(avg(salary)) AVG_SALARY,
        count(salary) count_sal,
        max(salary) max_sal,
        min(salary) min_sal
from employees
       WHERE DEPARTMENT_ID IN (10,60,90)
       group by department_id,job_id
       HAVING SUM(Salary) > 25000
       order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary) sum_salary
        from employees
        group by rollup(department_id,job_id)
        order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_id,job_id,
        sum(salary)
from employees
        group by cube(department_id,job_id)
        order by 1;
-------------------------------------------------------------------
-------------------------------------------------------------------
select  department_name,job_id,
        sum(salary)
from employees e join departments d
        on (d.department_id = e.department_id)
where d.department_id in (20,30,40)
group by cube(department_name,job_id)
having sum(salary) > 7000
order by 1;
-------------------------------------------------------------------


SELECT
   NM_DEPARTAMENTO,
   AVG(VL_SALARIO)   FUNC_AVG
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO COUNT (CONTAGEM)
---------------------------------------------------
SELECT COUNT(NM_NOME)   FUNC_COUNT
FROM T_EX01_FUNCIONARIO;


SELECT
   NM_DEPARTAMENTO,
   COUNT(NM_NOME)   FUNC_COUNT
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO MAX (MAIOR VALOR)
---------------------------------------------------
SELECT MAX(VL_SALARIO) FUNC_MAX
FROM T_EX01_FUNCIONARIO;

SELECT
   NM_DEPARTAMENTO,
   MAX(VL_SALARIO)   FUNC_MAX
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO MIN (MENOR VALOR)
---------------------------------------------------
SELECT MIN(VL_SALARIO FUNC_MIN
FROM T_EX01_FUNCIONARIO;

SELECT
   NM_DEPARTAMENTO,
   MIN(VL_SALARIO)   FUNC_MIN
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO SUM (SOMA)
---------------------------------------------------
SELECT SUM(VL_SALARIO)FUNC_SUM
FROM T_EX01_FUNCIONARIO;

SELECT
   NM_DEPARTAMENTO,
   SUM(VL_SALARIO)   FUNC_SUM
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO STDDEV (DESVIO PADRÃO)
---------------------------------------------------
SELECT STDDEV(VL_SALARIO) FUNC_STDDEV
FROM T_EX01_FUNCIONARIO;

SELECT
   NM_DEPARTAMENTO,
   STDDEV(VL_SALARIO)   FUNC_STDDEV
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- FUNÇÃO STDDEV (VARIÂNCIA)
---------------------------------------------------
SELECT VARIANCE(VL_SALARIO) FUNC_VARIANCE
FROM T_EX01_FUNCIONARIO;

SELECT
   NM_DEPARTAMENTO,
   VARIANCE(VL_SALARIO)   FUNC_VARIANCE
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

---------------------------------------------------
-- INTRODUÇÃO A FUNÇÕES DE AGREGAÇÃO
---------------------------------------------------

---------------------------------------------------
-- CONDIÇÃO HAVING
---------------------------------------------------
SELECT NM_DEPARTAMENTO, COUNT(NM_NOME) FUNC_COUNT
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO;

SELECT
  NM_DEPARTAMENTO,
  COUNT(NM_NOME)   FUNC_COUNT
FROM T_EX01_FUNCIONARIO F
INNER JOIN T_EX01_DEPARTAMENTO D
ON F.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO
GROUP BY NM_DEPARTAMENTO
HAVING COUNT(NM_NOME) > 1;

---------------------------------------------------
-- EXPRESSÃO CASE
---------------------------------------------------
SELECT
   NM_PROJETO,
   DT_TERMINO,
   CASE
     WHEN DT_TERMINO IS NULL
     THEN 'EM ANDAMENTO'
     ELSE 'FINALIZADO'
   END STATUS_PROJETO
FROM T_EX01_PROJETO; -- TABELA NÃO EXISTE

SELECT  last_name, salary,
CASE 
  WHEN SALARY >= 1000 AND SALARY <=2999 THEN 'A'
  WHEN SALARY >= 3000 AND SALARY <=5999 THEN 'B'
  WHEN SALARY >= 6000 AND SALARY <=9999 THEN 'C'
  WHEN SALARY >= 10000 AND SALARY <=14999 THEN 'D'
  WHEN SALARY >= 15000 AND SALARY <=24999 THEN 'E'
  WHEN SALARY >= 25000 AND SALARY <=40000 THEN 'F'
END grade_level
FROM EMPLOYEES;


