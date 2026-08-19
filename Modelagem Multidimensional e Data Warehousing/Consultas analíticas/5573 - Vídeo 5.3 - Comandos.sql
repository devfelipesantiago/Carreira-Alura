
-- Exemplo: Análise por faixa de idade (Dim Cliente)

WITH clientes_faixa AS (
    SELECT
        CASE
            WHEN idade_cliente < 25 THEN 'Até 24'
            WHEN idade_cliente BETWEEN 25 AND 40 THEN '25 a 40'
            WHEN idade_cliente BETWEEN 41 AND 60 THEN '41 a 60'
            ELSE '60+'
        END AS faixa_etaria,
        COUNT(*) AS qtd_clientes
    FROM dim_cliente
    WHERE valid_to = '9999-12-31'
    GROUP BY faixa_etaria
)
SELECT *
FROM clientes_faixa;

-- Exemplo: Indicadores financeiros diretamente da fato

WITH credito_tipo_conta AS (
    SELECT
        tc.nome_tipo_conta,
        SUM(f.valor_credito) AS total_credito
    FROM fato_transacoes f
    JOIN dim_tipo_conta tc ON f.id_tipo_conta = tc.id_tipo_conta
    GROUP BY tc.nome_tipo_conta
)
SELECT *
FROM credito_tipo_conta;

-- Exemplo: Transações por agência e gerência.

WITH transacoes_agencia AS (
    SELECT
        g.nome_gerencia,
        a.nome_agencia,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    JOIN dim_gerencia g ON f.id_gerencia = g.id_gerencia
    GROUP BY g.nome_gerencia, a.nome_agencia
)
SELECT *
FROM transacoes_agencia
ORDER BY nome_gerencia, valor_total DESC;

