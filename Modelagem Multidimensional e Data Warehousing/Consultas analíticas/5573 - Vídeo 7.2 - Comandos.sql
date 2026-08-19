
-- Exemplo: Valor acumulado por ano

WITH mensal AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        SUM(f.valor_transacao) AS valor_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT
    ano,
    mes,
    valor_mes,
    SUM(valor_mes) OVER (
        PARTITION BY ano
        ORDER BY ano_mes
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS valor_acumulado_ano
FROM mensal
ORDER BY ano_mes;

-- Exemplo: Valor acumulado sem o PARTITION BY.

WITH mensal AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        SUM(f.valor_transacao) AS valor_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT
    ano,
    mes,
    valor_mes,
    SUM(valor_mes) OVER (
        ORDER BY ano_mes
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS valor_acumulado_ano
FROM mensal
ORDER BY ano_mes;

-- Exemplo: Rolling 3 Months (R3M) do valor transacionado.

WITH mensal AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        SUM(f.valor_transacao) AS valor_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT
    ano,
    mes,
    valor_mes,
    SUM(valor_mes) OVER (
        ORDER BY ano_mes
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_meses
FROM mensal
ORDER BY ano_mes;

-- Exemplo: O Rolling 6 e Rolling 12 meses.

WITH mensal AS (
    SELECT
        (t.ano * 100 + t.mes) AS ano_mes,
        t.ano,
        t.mes,
        SUM(f.valor_transacao) AS valor_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    GROUP BY t.ano, t.mes
)
SELECT
    ano,
    mes,
    valor_mes,
    SUM(valor_mes) OVER (
        ORDER BY ano_mes
        ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
    ) AS rolling_6_meses,
    SUM(valor_mes) OVER (
        ORDER BY ano_mes
        ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
    ) AS rolling_12_meses
FROM mensal
ORDER BY ano_mes;

-- UNBOUNDED PRECEDING → CURRENT ROW = acumulado total
-- 2 PRECEDING → CURRENT ROW = janela de 3 meses
-- 11 PRECEDING → CURRENT ROW = janela de 12 meses

-- Exemplo: Rolling 12 dentro de cada regional.

WITH mensal_regional AS (
    SELECT
        (t.ano * 100 + t.mes) AS ano_mes,
        t.ano,
        t.mes,
        g.nome_regional,
        SUM(f.valor_transacao) AS valor_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    JOIN dim_gerencia g ON g.id_gerencia = f.id_gerencia
    GROUP BY t.ano, t.mes, g.nome_regional
)
SELECT
    ano,
    mes,
    ano_mes,
    nome_regional,
    valor_mes,
    SUM(valor_mes) OVER (
        PARTITION BY nome_regional
        ORDER BY ano_mes
        ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
    ) AS rolling_12_regional
FROM mensal_regional
ORDER BY nome_regional, ano_mes;

-- Exemplo: Média móvel de 3 meses do saldo líquido por tipo de conta.

WITH mensal_tipo AS (
    SELECT
        (t.ano * 100 + t.mes) AS ano_mes,
        t.ano,
        t.mes,
        tc.nome_tipo_conta,
        SUM(f.saldo_liquido) AS saldo_mes
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
    JOIN dim_tipo_conta tc ON tc.id_tipo_conta = f.id_tipo_conta
    GROUP BY t.ano, t.mes, tc.nome_tipo_conta
)
SELECT
    ano,
    mes,
    nome_tipo_conta,
    saldo_mes,
    AVG(saldo_mes) OVER (
        PARTITION BY nome_tipo_conta
        ORDER BY ano_mes
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS media_movel_3m_saldo
FROM mensal_tipo
ORDER BY nome_tipo_conta, ano_mes;

