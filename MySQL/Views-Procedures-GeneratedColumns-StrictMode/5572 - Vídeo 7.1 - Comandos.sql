
-- Exemplo: Criando uma View de transações normalizadas.

CREATE VIEW vw_transacoes_normalizadas AS
SELECT
    t.id_transacao,
    t.id_conta,
    c.id_cliente,
    c.nome AS nome_cliente,
    t.tipo,
    t.valor,
    t.data_transacao,
    t.origem
FROM transacoes t
JOIN contas ct ON ct.id_conta = t.id_conta
JOIN clientes c ON c.id_cliente = ct.id_cliente;

-- Exemplo: Usando a view criada.

SELECT *
FROM vw_transacoes_normalizadas
WHERE origem = 'mobile'
ORDER BY data_transacao DESC
LIMIT 10;

-- Exemplo: Vamos ver uma View de consolidação cliente + contas.

CREATE VIEW vw_clientes_contas AS
SELECT
    c.id_cliente,
    c.nome,
    COUNT(ct.id_conta) AS total_contas,
    SUM(ct.saldo_inicial) AS saldo_total
FROM clientes c
LEFT JOIN contas ct ON ct.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Exemplo: Consulta simples usando a view.

SELECT *
FROM vw_clientes_contas
WHERE saldo_total < 10000;

