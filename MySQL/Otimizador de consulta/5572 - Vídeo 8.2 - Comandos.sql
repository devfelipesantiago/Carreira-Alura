

-- Exemplo: Fazendo a primeira análise: consulta simples sem JOIN

EXPLAIN FORMAT=JSON
SELECT *
FROM transacoes
WHERE valor > 500;

-- Exemplo: Ainda vendo 1 tabela mas com filtro diferente.

EXPLAIN FORMAT=JSON
SELECT *
FROM transacoes
WHERE data_transacao >= '2025-01-01';

-- Exemplo com um JOIN clássico.

EXPLAIN FORMAT=JSON
SELECT
    c.nome,
    ct.numero_conta,
    t.valor,
    t.data_transacao
FROM clientes c
JOIN contas ct ON ct.id_cliente = c.id_cliente
JOIN transacoes t ON t.id_conta = ct.id_conta
WHERE c.status = 'ATIVO';

-- Exemplo: Usando GROUP BY.

EXPLAIN FORMAT=JSON
SELECT
    ct.id_agencia,
    COUNT(*) AS total_contas
FROM contas ct
GROUP BY ct.id_agencia;

-- Exemplo: Usando agregação.

EXPLAIN FORMAT=JSON
SELECT
    id_transacao,
    valor,
    data_transacao
FROM transacoes
ORDER BY data_transacao DESC;

