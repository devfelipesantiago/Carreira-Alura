
-- Exemplo: Análise de Pareto e Curva ABC

WITH base AS (
    SELECT
        a.nome_agencia,
        SUM(f.valor_transacao) AS valor
    FROM dim_agencia a
    JOIN fato_transacoes f ON a.id_agencia = f.id_agencia
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    WHERE t.ano = 2022
    GROUP BY a.nome_agencia
)
-- SELECT * FROM base;
,
ordenada AS (
    SELECT
        nome_agencia,
        valor,
        SUM(valor) OVER () AS valor_total_geral
    FROM base
)
-- SELECT * FROM ordenada;
,
kpis AS (
    SELECT
        nome_agencia,
        valor,
        valor_total_geral,

        SUM(valor) OVER (
            ORDER BY valor DESC, nome_agencia
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS valor_acumulado,

        (valor / NULLIF(valor_total_geral, 0)) * 100 AS pct_valor,

        ROW_NUMBER() OVER (ORDER BY valor DESC, nome_agencia) AS qtd_agencias_acumulada,
        COUNT(*) OVER () AS qtd_agencias_total
    FROM ordenada
)
-- SELECT * FROM kpis;
,
pareto AS (
    SELECT
        nome_agencia,
        valor,
        valor_acumulado,
        pct_valor,

        (valor_acumulado / NULLIF(valor_total_geral, 0)) * 100 AS pct_valor_acumulado,

        qtd_agencias_acumulada,
        qtd_agencias_total,

        (qtd_agencias_acumulada / NULLIF(qtd_agencias_total, 0)) * 100 AS pct_agencias_acumulado,

        CASE
            WHEN (valor_acumulado / NULLIF(valor_total_geral, 0)) * 100 <= 80 THEN 'Dentro do 80%'
            ELSE 'Fora do 80%'
        END AS faixa_pareto,

        -- Curva ABC baseada no % acumulado do valor
        CASE
            WHEN (valor_acumulado / NULLIF(valor_total_geral, 0)) * 100 <= 80 THEN 'A'
            WHEN (valor_acumulado / NULLIF(valor_total_geral, 0)) * 100 <= 95 THEN 'B'
            ELSE 'C'
        END AS curva_abc
    FROM kpis
)
SELECT
    nome_agencia,
    valor,
    valor_acumulado,
    pct_valor,
    pct_valor_acumulado,
    qtd_agencias_acumulada,
    qtd_agencias_total,
    pct_agencias_acumulado,
    faixa_pareto,
    curva_abc
FROM pareto
ORDER BY valor DESC, nome_agencia;

