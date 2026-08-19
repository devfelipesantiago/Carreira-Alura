
-- Exemplo: Crescimento mês contra mês.

WITH transacoes_mes AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY t.ano, t.mes
),
mom_calculo AS (
    SELECT
        *,
        LAG(valor_total) OVER (ORDER BY ano_mes) AS valor_deslocado,
        valor_total
        - LAG(valor_total) OVER (ORDER BY ano_mes) AS variacao_abs,
        (valor_total / LAG(valor_total) OVER (ORDER BY ano_mes) - 1) * 100
            AS variacao_pct
    FROM transacoes_mes
)
SELECT *
FROM mom_calculo
ORDER BY ano_mes;

-- Exemplo: Executando a conulta parcial do primeiro CTE.

WITH transacoes_mes AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT * FROM transacoes_mes

