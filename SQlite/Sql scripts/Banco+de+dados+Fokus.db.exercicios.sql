SELECT * FROM clientes ORDER BY nome ASC LIMIT 5;

SELECT * FROM produtos WHERE descricao IS NULL;

SELECT * FROM funcionarios WHERE nome LIKE 'A%' AND nome LIKE '%s';

SELECT departamento, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento
HAVING AVG(salario) > 5000;

SELECT nome || ' ' || sobrenome AS nome_completo, LENGTH(nome || ' ' || sobrenome) AS comprimento_nome
FROM clientes;

SELECT id, data_venda, julianday('now') - julianday(data_venda) AS diferenca_dias
FROM vendas;

SELECT id, ROUND(preco_total) AS preco_arredondado
FROM pedidos;

SELECT *
FROM eventos
WHERE CAST(data_string AS DATE) > '2023-01-01';

SELECT id,
  CASE 
    WHEN pontuacao BETWEEN 1 AND 3 THEN 'Ruim'
    WHEN pontuacao BETWEEN 4 AND 7 THEN 'Média'
    ELSE 'Boa'
  END AS classificacao
FROM avaliacoes;

-- Renomeando a coluna
ALTER TABLE funcionarios RENAME COLUMN data_nasc TO data_nascimento;

-- Selecionando funcionários
SELECT * FROM funcionarios WHERE CAST(data_nascimento AS DATE) > '1990-01-01';