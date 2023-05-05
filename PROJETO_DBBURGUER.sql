-- CRIANDO O PROJETO DBBURGUER
-- 1. Trazer todos funcionarios, informando o nome dos e data de admissao

SELECT NM_FUNCIONARIO AS "Nome Funcionario", DT_CADASTRAMENTO AS "Data Admissao" FROM DB_FUNCIONARIO;

-- 2. Selecionar Todos Funcionarios Cadastrados mostrando nome e salario bruto. Adicionar columa com aumento de 5% e 8%
SELECT  NM_FUNCIONARIO AS "Nome Funcionario", 
        VL_SALARIO_BRUTO AS "Salario Bruto",
        VL_SALARIO_BRUTO * 1.05 AS "Salario Aumento 5%",
        VL_SALARIO_BRUTO * 1.08 AS "Salario Aumento 8%"
        FROM DB_FUNCIONARIO;
        
-- 3. Selecionar todos clientes cadastrados, informando nome e quantidade de estrelas
SELECT NM_CLIENTE AS "Nome Cliente", QT_ESTRELAS AS "Quantidade Estrelas" FROM DB_CLIENTE;

-- 4. Trazer Todos Produtos Cadastrados mostrando descritivo e valor unitario
SELECT DS_PRODUTO AS "Descricao Produto", VL_UNITARIO AS "Valor Unitario" FROM DB_PRODUTO;


-- CONSULTA EM CONDICOES
-- 1. Trazer todos os Clientes que possuem 4 ou mais estrelas
SELECT NM_CLIENTE AS "Nome Cliente", QT_ESTRELAS AS "Quantidade Estrelas" FROM DB_CLIENTE WHERE QT_ESTRELAS >= 4;

-- 2. Selecionar Clientes que tenham 3 ou mais estrelas, e com valor medio de compra maior que R$100,00
SELECT  NM_CLIENTE AS "Nome Cliente",
        QT_ESTRELAS AS "Quantidade Estrelas",
        VL_MEDIO_COMPRA AS "Valor Medio Compra"
        FROM DB_CLIENTE WHERE QT_ESTRELAS >= 3 AND VL_MEDIO_COMPRA > 100.00;
        
-- 3. Todos os clientes com valor medio maior que R$100,00, mostrando nome e quantidade de estrelas
SELECT  NM_CLIENTE AS "Nome Cliente",
        QT_ESTRELAS AS "Quantidade Estrelas",
        VL_MEDIO_COMPRA AS "Valor Medio Compra"
        FROM DB_CLIENTE WHERE VL_MEDIO_COMPRA > 100.00;

-- 4. Listar produtos com valor unitario maior que R$30,00
SELECT * FROM DB_PRODUTO WHERE VL_UNITARIO > 30.00;


-- DESAFIOS
-- 1. Listar todos pedidos feitos em janeiro, fevereiro e marco do ultimo ano
SELECT * FROM DB_PEDIDO
WHERE   EXTRACT(MONTH FROM DT_PEDIDO) <= 3 AND
        EXTRACT(YEAR FROM DT_PEDIDO) = (SELECT MAX(EXTRACT(YEAR FROM DT_PEDIDO)) FROM DB_PEDIDO);

-- 2. Selecionar Todos os profissionais cadastrados em novembro e dezembro
SELECT NM_FUNCIONARIO, DT_CADASTRAMENTO FROM DB_FUNCIONARIO
WHERE   EXTRACT(MONTH FROM DT_CADASTRAMENTO) BETWEEN 11 AND 12;

-- 3. Mostrar todos os pedidos realizados no ano de 2018
SELECT * FROM DB_PEDIDO
WHERE   EXTRACT(YEAR FROM DT_PEDIDO) = 2018;

