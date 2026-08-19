
-- Exemplo: KPI de MIX por tipo de conta.

WITH por_tipo AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        tc.nome_tipo_conta,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t        ON t.id_tempo = f.id_tempo
    JOIN dim_tipo_conta tc  ON tc.id_tipo_conta = f.id_tipo_conta
    GROUP BY t.ano, t.mes, tc.nome_tipo_conta
),
totais_mes AS (
    SELECT
        ano_mes,
        SUM(credito_total) AS credito_mes,
        SUM(debito_total)  AS debito_mes
    FROM por_tipo
    GROUP BY ano_mes
),
kpi AS (
    SELECT
        p.ano,
        p.mes,
        p.ano_mes,
        p.nome_tipo_conta,
        p.credito_total,
        p.debito_total,
        (p.credito_total / NULLIF(t.credito_mes, 0)) * 100 AS pct_credito_mes,
        (p.debito_total  / NULLIF(t.debito_mes, 0))  * 100 AS pct_debito_mes
    FROM por_tipo p
    JOIN totais_mes t ON t.ano_mes = p.ano_mes
),
ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY ano_mes ORDER BY credito_total DESC) AS rank_credito,
        DENSE_RANK() OVER (PARTITION BY ano_mes ORDER BY debito_total DESC)  AS rank_debito
    FROM kpi
)
SELECT
    ano, mes, nome_tipo_conta,
    credito_total, pct_credito_mes, rank_credito,
    debito_total,  pct_debito_mes,  rank_debito
FROM ranked
ORDER BY ano_mes, rank_credito, rank_debito;

-- Exemplo: Executando a primeira CTE.

WITH por_tipo AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        tc.nome_tipo_conta,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t        ON t.id_tempo = f.id_tempo
    JOIN dim_tipo_conta tc  ON tc.id_tipo_conta = f.id_tipo_conta
    GROUP BY t.ano, t.mes, tc.nome_tipo_conta
)
SELECT * FROM por_tipo;

-- Exemplo: Observando o resultado da segunda CTE.

WITH por_tipo AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        tc.nome_tipo_conta,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t        ON t.id_tempo = f.id_tempo
    JOIN dim_tipo_conta tc  ON tc.id_tipo_conta = f.id_tipo_conta
    GROUP BY t.ano, t.mes, tc.nome_tipo_conta
),
totais_mes AS (
    SELECT
        ano_mes,
        SUM(credito_total) AS credito_mes,
        SUM(debito_total)  AS debito_mes
    FROM por_tipo
    GROUP BY ano_mes
)
SELECT * FROM totais_mes;

-- Exemplo: Executando novamente o KPI completo para verificar o resultado depois de entender como ele foi construido.

WITH por_tipo AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        tc.nome_tipo_conta,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t        ON t.id_tempo = f.id_tempo
    JOIN dim_tipo_conta tc  ON tc.id_tipo_conta = f.id_tipo_conta
    GROUP BY t.ano, t.mes, tc.nome_tipo_conta
),
totais_mes AS (
    SELECT
        ano_mes,
        SUM(credito_total) AS credito_mes,
        SUM(debito_total)  AS debito_mes
    FROM por_tipo
    GROUP BY ano_mes
),
kpi AS (
    SELECT
        p.ano,
        p.mes,
        p.ano_mes,
        p.nome_tipo_conta,
        p.credito_total,
        p.debito_total,
        (p.credito_total / NULLIF(t.credito_mes, 0)) * 100 AS pct_credito_mes,
        (p.debito_total  / NULLIF(t.debito_mes, 0))  * 100 AS pct_debito_mes
    FROM por_tipo p
    JOIN totais_mes t ON t.ano_mes = p.ano_mes
),
ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY ano_mes ORDER BY credito_total DESC) AS rank_credito,
        DENSE_RANK() OVER (PARTITION BY ano_mes ORDER BY debito_total DESC)  AS rank_debito
    FROM kpi
)
SELECT
    ano, mes, nome_tipo_conta,
    credito_total, pct_credito_mes, rank_credito,
    debito_total,  pct_debito_mes,  rank_debito
FROM ranked
ORDER BY ano_mes, rank_credito, rank_debito;

