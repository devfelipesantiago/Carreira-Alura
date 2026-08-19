
-- Exemplo: Execução do KPI de Liquidez.

WITH base AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        g.nome_regional,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        SUM(f.saldo_liquido) AS saldo_liquido_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t     ON t.id_tempo = f.id_tempo
    JOIN dim_gerencia g  ON g.id_gerencia = f.id_gerencia
    GROUP BY t.ano, t.mes, g.nome_regional
),
kpi AS (
    SELECT
        *,
        (credito_total / NULLIF(debito_total, 0)) AS indice_liquidez,
        (saldo_liquido_total / NULLIF(qtd_transacoes, 0)) AS saldo_medio_por_transacao
    FROM base
),
mom AS (
    SELECT
        *,
        indice_liquidez - LAG(indice_liquidez) OVER (
            PARTITION BY nome_regional ORDER BY ano_mes
        ) AS variacao_mom_liquidez
    FROM kpi
)
SELECT
    ano, mes, nome_regional,
    credito_total, debito_total,
    indice_liquidez,
    variacao_mom_liquidez
FROM mom
ORDER BY nome_regional, ano_mes;

-- Exemplo: Executando a primeira CTE do KPI.

WITH base AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        g.nome_regional,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        SUM(f.saldo_liquido) AS saldo_liquido_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t     ON t.id_tempo = f.id_tempo
    JOIN dim_gerencia g  ON g.id_gerencia = f.id_gerencia
    GROUP BY t.ano, t.mes, g.nome_regional
)
SELECT * FROM base;

- Exemplo: Execute o KPI novamente.

WITH base AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        g.nome_regional,
        SUM(f.valor_credito) AS credito_total,
        SUM(f.valor_debito) AS debito_total,
        SUM(f.saldo_liquido) AS saldo_liquido_total,
        COUNT(*) AS qtd_transacoes
    FROM fato_transacoes f
    JOIN dim_tempo t     ON t.id_tempo = f.id_tempo
    JOIN dim_gerencia g  ON g.id_gerencia = f.id_gerencia
    GROUP BY t.ano, t.mes, g.nome_regional
),
kpi AS (
    SELECT
        *,
        (credito_total / NULLIF(debito_total, 0)) AS indice_liquidez,
        (saldo_liquido_total / NULLIF(qtd_transacoes, 0)) AS saldo_medio_por_transacao
    FROM base
),
mom AS (
    SELECT
        *,
        indice_liquidez - LAG(indice_liquidez) OVER (
            PARTITION BY nome_regional ORDER BY ano_mes
        ) AS variacao_mom_liquidez
    FROM kpi
)
SELECT
    ano, mes, nome_regional,
    credito_total, debito_total,
    indice_liquidez,
    variacao_mom_liquidez
FROM mom
ORDER BY nome_regional, ano_mes;

