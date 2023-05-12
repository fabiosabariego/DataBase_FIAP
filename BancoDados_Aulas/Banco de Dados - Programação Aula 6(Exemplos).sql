----------------------------------------------------
-- Exemplos: Banco de Dados - Programação Aula 6.
----------------------------------------------------
-- EXEMPLO: EQUIJOIN ( = )
SELECT e.last_name, d.department_name
FROM   employees e INNER JOIN departments d
ON     e.department_id = d.department_id;

----------------------------------------------------
-- EXEMPLO: NON-EQUIJOIN
----------------------------------------------------
SELECT e.last_name, e.salary, j.grade_level
FROM   employees e JOIN job_grades j
ON     e.salary BETWEEN j.lowest_sal AND j.highest_sal; 

----------------------------------------------------
-- EXEMPLO: INNER JOIN
----------------------------------------------------
SELECT e.last_name, d.department_name
FROM   employees e INNER JOIN departments d
ON     e.department_id = d.department_id;

----------------------------------------------------
-- EXEMPLO: LEFT JOIN
----------------------------------------------------
SELECT e.last_name, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON     e.department_id = d.department_id;

SELECT e.last_name, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON     e.department_id = d.department_id
WHERE  d.department_id is null;

----------------------------------------------------
-- EXEMPLO: RIGHT JOIN
----------------------------------------------------
SELECT e.last_name, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON     e.department_id=d.department_id;

SELECT e.last_name, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON     e.department_id = d.department_id
WHERE  e.department_id is null;

----------------------------------------------------
-- EXEMPLO: FULL JOIN
----------------------------------------------------
SELECT e.last_name, d.department_name
FROM   employees e FULL OUTER JOIN departments d
ON     e.department_id=d.department_id;

----------------------------------------------------
-- EXEMPLO: SELF JOIN
----------------------------------------------------
SELECT m.last_name manager, m.job_id manager_job,
       w.last_name worker,  w.job_id worker_job
FROM   employees w join employees m
ON    (m.employee_id = w.manager_id)
order by m.department_id,m.job_id ;

----------------------------------------------------
-- EXEMPLO: CROSS JOIN
----------------------------------------------------
SELECT e.last_name, d.department_name
FROM   employees e CROSS JOIN departments d;






