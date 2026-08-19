

-- Exemplo: Ticket Médio por Canal com Comparação Trimestral (QoQ)

WITH canal_trimestre AS (
    SELECT
        f.origem_transacao,
        t.ano,
        t.trimestre,
        (t.ano * 10 + t.trimestre) AS ano_tri,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY f.origem_transacao, t.ano, t.trimestre
),
ticket_trimestre AS (
    SELECT
        *,
        valor_total / qtd_transacoes AS ticket_medio
    FROM canal_trimestre
),
qoq_calculo AS (
    SELECT
        *,
        LAG(ticket_medio) OVER (
            PARTITION BY origem_transacao
            ORDER BY ano_tri
        ) AS variacao_ticket_deslocado,
        ticket_medio
        - LAG(ticket_medio) OVER (
            PARTITION BY origem_transacao
            ORDER BY ano_tri
        ) AS variacao_ticket
    FROM ticket_trimestre
)
SELECT *
FROM qoq_calculo
ORDER BY origem_transacao, ano_tri;

-- Exemplo: Verificando o resultado do primeiro CTE.

WITH canal_trimestre AS (
    SELECT
        f.origem_transacao,
        t.ano,
        t.trimestre,
        (t.ano * 10 + t.trimestre) AS ano_tri,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY f.origem_transacao, t.ano, t.trimestre
)
SELECT * FROM canal_trimestre;

-- Exemplo: Verificando o resultado do segundo CTE.

WITH canal_trimestre AS (
    SELECT
        f.origem_transacao,
        t.ano,
        t.trimestre,
        (t.ano * 10 + t.trimestre) AS ano_tri,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    GROUP BY f.origem_transacao, t.ano, t.trimestre
),
ticket_trimestre AS (
    SELECT
        *,
        valor_total / qtd_transacoes AS ticket_medio
    FROM canal_trimestre
)
SELECT * FROM ticket_trimestre ;

-- Exemplo: Score de Agência (Combinação de Tabelas Fato).

WITH transacoes_agencia AS (
    SELECT
        a.id_agencia,
        a.nome_agencia,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    WHERE a.valid_to = '9999-12-31'
    GROUP BY a.id_agencia, a.nome_agencia
),
credito_agencia AS (
    SELECT
        a.id_agencia,
        SUM(f.valor_credito) AS total_credito
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    WHERE a.valid_to = '9999-12-31'
    GROUP BY a.id_agencia
),
score_agencia AS (
    SELECT
        t.nome_agencia,
        t.qtd_transacoes,
        t.valor_total,
        c.total_credito,
        (t.valor_total * 0.6 + c.total_credito * 0.4) AS score_final
    FROM transacoes_agencia t
    JOIN credito_agencia c ON t.id_agencia = c.id_agencia
)
SELECT *
FROM score_agencia
ORDER BY score_final DESC;

-- Exemplo: Verificando resultado da primeira CTE.

WITH transacoes_agencia AS (
    SELECT
        a.id_agencia,
        a.nome_agencia,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    WHERE a.valid_to = '9999-12-31'
    GROUP BY a.id_agencia, a.nome_agencia
)
SELECT * FROM transacoes_agencia ;

-- Exemplo: Verificando resultado da segunda CTE.

WITH transacoes_agencia AS (
    SELECT
        a.id_agencia,
        a.nome_agencia,
        COUNT(*) AS qtd_transacoes,
        SUM(f.valor_transacao) AS valor_total
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    WHERE a.valid_to = '9999-12-31'
    GROUP BY a.id_agencia, a.nome_agencia
),
credito_agencia AS (
    SELECT
        a.id_agencia,
        SUM(f.valor_credito) AS total_credito
    FROM fato_transacoes f
    JOIN dim_agencia a ON f.id_agencia = a.id_agencia
    WHERE a.valid_to = '9999-12-31'
    GROUP BY a.id_agencia
)
SELECT * FROM credito_agencia ;

