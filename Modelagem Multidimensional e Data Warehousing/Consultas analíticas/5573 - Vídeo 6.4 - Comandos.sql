
-- Exemplo: KPI de Desalinhamento Geográfico Cliente x Agência

WITH base_trans AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        f.id_cliente,
        f.id_agencia,
        f.id_gerencia
    FROM fato_transacoes f
    JOIN dim_tempo t ON t.id_tempo = f.id_tempo
),
cliente_atual AS (
    SELECT
        id_cliente,
        nome_cidade_cliente,
        nome_estado_cliente
    FROM dim_cliente
    WHERE valid_to = '9999-12-31'
),
agencia_atual AS (
    SELECT
        id_agencia,
        nome_cidade_agencia,
        nome_estado_agencia
    FROM dim_agencia
    WHERE valid_to = '9999-12-31'
),
enriquecida AS (
    SELECT
        b.ano, b.mes, b.ano_mes,
        g.nome_regional,
        b.id_cliente,
        CASE WHEN c.nome_cidade_cliente <> a.nome_cidade_agencia THEN 1 ELSE 0 END AS flg_cidade_diferente,
        CASE WHEN c.nome_estado_cliente <> a.nome_estado_agencia THEN 1 ELSE 0 END AS flg_estado_diferente
    FROM base_trans b
    JOIN cliente_atual c ON c.id_cliente = b.id_cliente
    JOIN agencia_atual a ON a.id_agencia = b.id_agencia
    JOIN dim_gerencia g  ON g.id_gerencia = b.id_gerencia
),
kpi AS (
    SELECT
        ano, mes, ano_mes, nome_regional,
        COUNT(DISTINCT id_cliente) AS clientes_ativos,
        COUNT(DISTINCT CASE WHEN flg_cidade_diferente = 1 THEN id_cliente END) AS clientes_cidade_diferente,
        COUNT(DISTINCT CASE WHEN flg_estado_diferente = 1 THEN id_cliente END) AS clientes_estado_diferente
    FROM enriquecida
    GROUP BY ano, mes, ano_mes, nome_regional
)
SELECT
    ano, mes, nome_regional,
    clientes_ativos,
    clientes_cidade_diferente,
    (clientes_cidade_diferente / NULLIF(clientes_ativos,0)) * 100 AS pct_cidade_diferente,
    clientes_estado_diferente,
    (clientes_estado_diferente / NULLIF(clientes_ativos,0)) * 100 AS pct_estado_diferente
FROM kpi
ORDER BY nome_regional, ano_mes;

-- Exemplo: Execução fazendo o JOIN mais acertivo para obter o estado/cidade de cliente e agencia levando em consideração o período de validade.

WITH base_trans AS (
    SELECT
        t.ano,
        t.mes,
        (t.ano * 100 + t.mes) AS ano_mes,
        t.data_completa AS dt_evento,
        f.id_cliente,
        f.id_agencia,
        f.id_gerencia
    FROM fato_transacoes f
    JOIN dim_tempo t
        ON t.id_tempo = f.id_tempo
),

cliente_atual AS (
    SELECT
        b.ano_mes,
        b.dt_evento,
        b.id_cliente,
        c.nome_cidade_cliente,
        c.nome_estado_cliente
    FROM base_trans b
    JOIN dim_cliente c
        ON c.id_cliente = b.id_cliente
       AND b.dt_evento >= c.valid_from
       AND b.dt_evento <  c.valid_to
),

agencia_atual AS (
    SELECT
        b.ano_mes,
        b.dt_evento,
        b.id_agencia,
        a.nome_cidade_agencia,
        a.nome_estado_agencia
    FROM base_trans b
    JOIN dim_agencia a
        ON a.id_agencia = b.id_agencia
       AND b.dt_evento >= a.valid_from
       AND b.dt_evento <  a.valid_to
),

enriquecida AS (
    SELECT
        b.ano, b.mes, b.ano_mes,
        g.nome_regional,
        b.id_cliente,
        CASE WHEN c.nome_cidade_cliente <> a.nome_cidade_agencia THEN 1 ELSE 0 END AS flg_cidade_diferente,
        CASE WHEN c.nome_estado_cliente <> a.nome_estado_agencia THEN 1 ELSE 0 END AS flg_estado_diferente
    FROM base_trans b
    JOIN cliente_atual c
        ON c.id_cliente = b.id_cliente
       AND c.ano_mes    = b.ano_mes
    JOIN agencia_atual a
        ON a.id_agencia = b.id_agencia
       AND a.ano_mes    = b.ano_mes
    JOIN dim_gerencia g
        ON g.id_gerencia = b.id_gerencia
       AND b.dt_evento >= g.valid_from
       AND b.dt_evento <  g.valid_to
),

kpi AS (
    SELECT
        ano, mes, ano_mes, nome_regional,
        COUNT(DISTINCT id_cliente) AS clientes_ativos,
        COUNT(DISTINCT CASE WHEN flg_cidade_diferente = 1 THEN id_cliente END) AS clientes_cidade_diferente,
        COUNT(DISTINCT CASE WHEN flg_estado_diferente = 1 THEN id_cliente END) AS clientes_estado_diferente
    FROM enriquecida
    GROUP BY ano, mes, ano_mes, nome_regional
)

SELECT
    ano, mes, nome_regional,
    clientes_ativos,
    clientes_cidade_diferente,
    (clientes_cidade_diferente / NULLIF(clientes_ativos,0)) * 100 AS pct_cidade_diferente,
    clientes_estado_diferente,
    (clientes_estado_diferente / NULLIF(clientes_ativos,0)) * 100 AS pct_estado_diferente
FROM kpi
ORDER BY nome_regional, ano_mes;

