

-- Exemplo: Trazer contas com saldo acima da média.

SELECT 
    id_conta,
    id_cliente,
    saldo_inicial
FROM contas
WHERE saldo_inicial > (
    SELECT AVG(saldo_inicial) 
    FROM contas
);

-- Exemplo: Filtrar transações maiores que o valor máximo do mês passado.

SELECT 
    id_transacao,
    id_conta,
    valor,
    data_transacao
FROM transacoes
WHERE valor > (
    SELECT MAX(valor)
    FROM transacoes
    WHERE MONTH(data_transacao) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
      AND YEAR(data_transacao) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
);

-- Exemplo: Selecionar o total de transações por cliente.

SELECT 
    c.id_cliente,
    c.nome,
    (
        SELECT COUNT(*) 
        FROM transacoes t 
        JOIN contas cc ON cc.id_conta = t.id_conta
        WHERE cc.id_cliente = c.id_cliente
    ) AS total_transacoes
FROM clientes c;

-- Exemplo: Selecionar clientes que fizeram mais transações do que a média geral.

SELECT 
    c.id_cliente,
    c.nome,
    (
        SELECT COUNT(*) 
        FROM transacoes t 
        JOIN contas cc ON cc.id_conta = t.id_conta
        WHERE cc.id_cliente = c.id_cliente
    ) AS total_transacoes
FROM clientes c
WHERE (
    SELECT COUNT(*) 
    FROM transacoes t 
    JOIN contas cc ON cc.id_conta = t.id_conta
    WHERE cc.id_cliente = c.id_cliente
) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(*) AS qtd
        FROM transacoes t
        JOIN contas cc ON cc.id_conta = t.id_conta
        GROUP BY cc.id_cliente
    ) AS sub
);

-- Exemplo: Última data de transação de uma conta

SELECT 
    co.id_conta,
    co.id_cliente,
    (
        SELECT MAX(t.data_transacao)
        FROM transacoes t
        WHERE t.id_conta = co.id_conta
    ) AS ultima_transacao
FROM contas co;

-- Exemplo:: A média de movimentação comparada à média do banco.

SELECT 
    co.id_conta,
    co.id_cliente,
    
    -- média da conta
    (
        SELECT AVG(t.valor)
        FROM transacoes t
        WHERE t.id_conta = co.id_conta
    ) AS media_conta,

    -- média geral
    (
        SELECT AVG(valor)
        FROM transacoes
    ) AS media_geral
FROM contas co;

-- Exemplo: Fazendo a comparação direta na própria query.

SELECT 
    co.id_conta,
    co.id_cliente,
    (
        SELECT AVG(t.valor)
        FROM transacoes t
        WHERE t.id_conta = co.id_conta
    ) AS media_conta,
    (
        SELECT AVG(t.valor)
        FROM transacoes t
    ) AS media_banco,
    CASE 
        WHEN (
                SELECT AVG(t.valor)
                FROM transacoes t
                WHERE t.id_conta = co.id_conta
             ) >
             (
                SELECT AVG(t.valor)
                FROM transacoes t
             )
        THEN 'ACIMA DA MÉDIA'
        ELSE 'ABAIXO DA MÉDIA'
    END AS comparacao
FROM contas co;

-- Exemplo: Uma tabela derivada contendo o total movimentado por cada conta.

SELECT 
    tpc.id_conta,
    tpc.total_movimentado,
    c.id_cliente
FROM (
    SELECT 
        id_conta,
        SUM(valor) AS total_movimentado
    FROM transacoes
    GROUP BY id_conta
) AS tpc
JOIN contas c ON c.id_conta = tpc.id_conta;

-- Exemplo: Uma tabela temporária com o Total por conta fazendo uma agregação por cliente.

SELECT
    c.id_cliente,
    cli.nome,
    SUM(tpc.total_movimentado) AS total_cliente
FROM (
    SELECT 
        id_conta,
        SUM(valor) AS total_movimentado
    FROM transacoes
    GROUP BY id_conta
) AS tpc
JOIN contas c   ON c.id_conta = tpc.id_conta
JOIN clientes cli ON cli.id_cliente = c.id_cliente
GROUP BY c.id_cliente, cli.nome;

-- Exemplo: Unindo a quantidade de transações e valor total na mesma consulta.

SELECT 
    cli.id_cliente,
    cli.nome,
    ct.qtd_transacoes,
    ct.total_valor
FROM (
    SELECT 
        c.id_cliente,
        COUNT(t.id_transacao) AS qtd_transacoes,
        SUM(t.valor) AS total_valor
    FROM contas c
    LEFT JOIN transacoes t ON t.id_conta = c.id_conta
    GROUP BY c.id_cliente
) AS ct
JOIN clientes cli ON cli.id_cliente = ct.id_cliente;

