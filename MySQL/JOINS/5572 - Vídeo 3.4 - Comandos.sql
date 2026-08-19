-- Exemplo: Clientes que não tem transações nem contas

SELECT clientes.nome
FROM clientes
LEFT JOIN contas ON clientes.id_cliente = contas.id_cliente
LEFT JOIN transacoes ON contas.id_conta = transacoes.id_conta
WHERE transacoes.id_transacao IS NULL;

-- Exemplo: Relatório completo: cliente + conta + agência

SELECT 
    c.nome AS cliente,
    ct.numero_conta,
    ag.nome AS agencia,
    ag.cidade,
    ag.estado
FROM clientes c
INNER JOIN contas ct 
        ON c.id_cliente = ct.id_cliente
INNER JOIN agencias ag
        ON ct.id_agencia = ag.id_agencia;

-- Exemplo: JOIN múltiplo com tipos de conta e status

SELECT 
    c.nome AS cliente,
    ct.numero_conta,
    tp.nome AS tipo_conta,
    st.nome AS status_conta
FROM clientes c
INNER JOIN contas ct 
        ON c.id_cliente = ct.id_cliente
INNER JOIN tipos_conta tp
        ON ct.id_tipo_conta = tp.id_tipo_conta
INNER JOIN status_conta st
        ON ct.id_status = st.id_status;

-- Exemplo: Cliente + Conta + Transações (relatório financeiro)

SELECT 
    c.nome AS cliente,
    ct.numero_conta,
    t.tipo,
    t.valor,
    t.data_transacao,
    t.descricao
FROM clientes c
INNER JOIN contas ct 
        ON c.id_cliente = ct.id_cliente
INNER JOIN transacoes t
        ON ct.id_conta = t.id_conta
ORDER BY c.nome, t.data_transacao DESC;

-- Exemplo: Clientes com contas, mesmo sem transações (INNER + LEFT)

SELECT 
    c.nome,
    ct.numero_conta,
    t.id_transacao,
    t.valor
FROM clientes c
INNER JOIN contas ct 
        ON c.id_cliente = ct.id_cliente
LEFT JOIN transacoes t
       ON ct.id_conta = t.id_conta
ORDER BY c.nome;

-- Exemplo: Volume total movimentado por cliente

SELECT 
    c.nome AS cliente,
    COUNT(t.id_transacao) AS qtd_transacoes,
    SUM(t.valor) AS total_movimentado
FROM clientes c
INNER JOIN contas ct 
        ON c.id_cliente = ct.id_cliente
LEFT JOIN transacoes t
       ON ct.id_conta = t.id_conta
GROUP BY c.nome
ORDER BY total_movimentado DESC;

-- Exemplo: Volume total de transações por tipo de conta

SELECT 
    tp.nome AS tipo_conta,
    COUNT(t.id_transacao) AS total_transacoes,
    SUM(t.valor) AS volume
FROM tipos_conta tp
LEFT JOIN contas ct
       ON tp.id_tipo_conta = ct.id_tipo_conta
LEFT JOIN transacoes t
       ON ct.id_conta = t.id_conta
GROUP BY tp.nome
ORDER BY volume DESC;

