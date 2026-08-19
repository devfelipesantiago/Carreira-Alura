

-- Exemplo: Volume de transações por mês.

WITH transacoes_mes AS (
    SELECT
        t.ano,
        t.mes,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT *
FROM transacoes_mes
ORDER BY ano, mes;

-- Exemplo: Ticket Médio por Canal.

WITH ticket_canal AS (
    SELECT
        f.origem_transacao,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total,
        AVG(f.valor_transacao) AS ticket_medio
    FROM fato_transacoes f
    GROUP BY f.origem_transacao
)
SELECT *
FROM ticket_canal;

