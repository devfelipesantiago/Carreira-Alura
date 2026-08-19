
-- Exemplo: Obtendo quantas contas existem.

SELECT COUNT(*) AS total_contas
FROM contas;

-- Exemplo: Executando o COUNT por cliente (GROUP BY básico).

SELECT id_cliente, COUNT(*) AS qtd_contas
FROM contas
GROUP BY id_cliente;

-- Exemplo: Usando o SUM: Total de saldos das contas.

SELECT SUM(saldo_inicial) AS saldo_total
FROM contas;

-- Exemplo: Obtendo o total de saldo inicial por agência.

SELECT id_agencia, SUM(saldo_inicial) AS total_saldo
FROM contas
GROUP BY id_agencia;

-- Exemplo: Usando o AVG: Média dos saldos.

SELECT AVG(saldo_inicial) AS media_saldos
FROM contas;

-- Exemplo: Obtendo o menor saldo.

SELECT MIN(saldo_inicial) AS menor_saldo
FROM contas;

-- Exemplo: Obtendo o maior saldo.

SELECT MAX(saldo_inicial) AS maior_saldo
FROM contas;

-- Exemplo: Obtendo o saldo médio por tipo de conta em cada agência.

SELECT id_agencia,
       id_tipo_conta,
       AVG(saldo_inicial) AS media_saldo
FROM contas
GROUP BY id_agencia, id_tipo_conta;

-- Exemplo: Verificando quais agências possuem saldo total acima de 10.000.

SELECT id_agencia,
       SUM(saldo_inicial) AS total_saldo
FROM contas
GROUP BY id_agencia
HAVING SUM(saldo_inicial) > 10000;

-- Exemplo: Obtendo os clientes com mais de 1 conta.

SELECT id_cliente,
       COUNT(*) AS qtd_contas
FROM contas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- Exemplo: Listando clientes com mais contas, do maior para o menor.

SELECT id_cliente,
       COUNT(*) AS qtd_contas
FROM contas
GROUP BY id_cliente
ORDER BY qtd_contas DESC;

-- Exemplo: Executando os três passos mentais para montar uma consulta.

SELECT id_agencia,
       COUNT(*) AS qtd_contas
FROM contas
WHERE saldo_inicial > 100
GROUP BY id_agencia
HAVING COUNT(*) > 2;

