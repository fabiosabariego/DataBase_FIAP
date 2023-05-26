ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

-- 1. Trazer o nome do Funcionario com, somente as iniciais em maiusculo
SELECT 
    INITCAP(NM_FUNCIONARIO)
FROM DB_FUNCIONARIO;


-- 2. Trazer o nome do funcionario, a data de nascimento e calcular sua idade

SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    CURRENT_DATE AS DataLocal,
    TRUNC((MONTHS_BETWEEN(CURRENT_DATE, DT_NASCIMENTO) / 12), 0) as Idade
FROM DB_FUNCIONARIO;

-- 3. Informar se o Funcionario possui idade par ou impar
SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    CURRENT_DATE AS DataLocal,
    TRUNC((MONTHS_BETWEEN(CURRENT_DATE, DT_NASCIMENTO) / 12), 0) as Idade,
    CASE WHEN MOD(TRUNC((MONTHS_BETWEEN(CURRENT_DATE, DT_NASCIMENTO) / 12), 0), 2) = 0 THEN 'PAR' ELSE 'IMPAR' END AS IdadeParImpar
FROM DB_FUNCIONARIO;

-- 4. Trazer o Nome do Funcionario e o Salario, Criando uma Regra de Arredondamento salarial para cima
SELECT
    NM_FUNCIONARIO,
    VL_SALARIO_BRUTO,
    CEIL(VL_SALARIO_BRUTO) AS SalarioArredondado
FROM DB_FUNCIONARIO;


-- ------------------------------ DESAFIOS ------------------------------

-- 1. Suponto que, com 55 anos de Idade, uma pessoa se aposente. Quais sao os Profissionais que estarao aposentados em 2025?
SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    TRUNC((MONTHS_BETWEEN('31/12/2025', DT_NASCIMENTO) / 12), 0) AS Idade2025
FROM DB_FUNCIONARIO
WHERE TRUNC((MONTHS_BETWEEN('31/12/2025', DT_NASCIMENTO) / 12), 0) >= 33
ORDER BY DT_NASCIMENTO;

-- 2. Quais funcionarios nao estarao aposentados em 2025, e quantos anos faltam pra se aposentar?
SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    TRUNC((MONTHS_BETWEEN('31/12/2025', DT_NASCIMENTO) / 12), 0) AS IdadeAtual,
    (55 - TRUNC((MONTHS_BETWEEN('31/12/2025', DT_NASCIMENTO) / 12), 0)) AS AnosParaAposentar
FROM DB_FUNCIONARIO
WHERE TRUNC((MONTHS_BETWEEN('31/12/2025', DT_NASCIMENTO) / 12), 0) < 55;
--ORDER BY DT_NASCIMENTO DESC;

-- 3. Supondo que, apos aposentar, o funcionario passe a receber 70% do valor de seu salario atual, quanto ele recebera?
















