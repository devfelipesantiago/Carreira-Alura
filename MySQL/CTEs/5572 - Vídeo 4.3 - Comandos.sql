
-- Exemplo: Uma CTE simples que seleciona todas as transações.

WITH base_transacoes AS (
    SELECT 
        t.id_transacao,
        t.id_conta,
        t.valor,
        t.tipo,
        t.data_transacao
    FROM transacoes t
)
SELECT * 
FROM base_transacoes;

-- Exemplo: Soma total movimentada por conta (CTE + SUM).

WITH total_por_conta AS (
    SELECT 
        id_conta,
        SUM(valor) AS total_movimentado,
        COUNT(*) AS qtd_transacoes
    FROM transacoes
    GROUP BY id_conta
)
SELECT *
FROM total_por_conta
ORDER BY total_movimentado DESC;

-- Exemplo: Relacionar contas com clientes dentro da CTE.

WITH total_por_conta AS (
    SELECT 
        id_conta, 
        SUM(valor) AS total
    FROM transacoes
    GROUP BY id_conta
),
total_por_cliente AS (
    SELECT 
        c.id_cliente,
        c.nome,
        SUM(tc.total) AS total_cliente
    FROM clientes c
    JOIN contas ct ON c.id_cliente = ct.id_cliente
    JOIN total_por_conta tc ON ct.id_conta = tc.id_conta
    GROUP BY c.id_cliente, c.nome
)
SELECT *
FROM total_por_cliente
ORDER BY total_cliente DESC;

-- Exemplo: Ticket médio por tipo de conta.

WITH transacoes_com_tipo AS (
    SELECT 
        tp.nome AS tipo_conta,
        t.valor
    FROM transacoes t
    JOIN contas ct ON t.id_conta = ct.id_conta
    JOIN tipos_conta tp ON ct.id_tipo_conta = tp.id_tipo_conta
)
SELECT 
    tipo_conta,
    COUNT(*) AS total_transacoes,
    AVG(valor) AS ticket_medio,
    MAX(valor) AS maior_transacao,
    MIN(valor) AS menor_transacao
FROM transacoes_com_tipo
GROUP BY tipo_conta
ORDER BY ticket_medio DESC;

-- Exemplo: Quero saber o Ranking dos clientes (CTE → CTE → SELECT final).

WITH total_por_conta AS (
    SELECT 
        id_conta,
        SUM(valor) AS total
    FROM transacoes
    GROUP BY id_conta
),
total_por_cliente AS (
    SELECT 
        c.id_cliente,
        c.nome,
        SUM(tc.total) AS total_cliente
    FROM clientes c
    JOIN contas ct ON c.id_cliente = ct.id_cliente
    JOIN total_por_conta tc ON ct.id_conta = tc.id_conta
    GROUP BY c.id_cliente, c.nome
),
ranking AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY total_cliente DESC) AS posicao
    FROM total_por_cliente
)
SELECT *
FROM ranking
WHERE posicao <= 20;

-- Exemplo: Número de transações por mês (CTE + DATE_FORMAT).

WITH transacoes_mes AS (
    SELECT 
        DATE_FORMAT(data_transacao, '%Y-%m') AS ano_mes,
        COUNT(*) AS qtd
    FROM transacoes
    GROUP BY ano_mes
)
SELECT *
FROM transacoes_mes
ORDER BY ano_mes;

-- Exemplo: Quantas transações foram feitas por mês.

WITH total AS (
    SELECT 
        id_conta,
        SUM(valor) AS total_conta
    FROM transacoes
    GROUP BY id_conta
),
cliente_total AS (
    SELECT 
        c.id_cliente,
        c.nome,
        SUM(t.total_conta) AS total
    FROM clientes c
    JOIN contas ct ON c.id_cliente = ct.id_cliente
    JOIN total t ON ct.id_conta = t.id_conta
    GROUP BY c.id_cliente, c.nome
),
media_geral AS (
    SELECT AVG(total) AS media
    FROM cliente_total
)
SELECT 
    c.*,
    m.media
FROM cliente_total c
CROSS JOIN media_geral m
WHERE c.total > m.media
ORDER BY c.total DESC;

