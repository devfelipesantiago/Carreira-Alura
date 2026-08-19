
-- Exemplo: Verificando clientes que possuem contas

SELECT 
    clientes.id_cliente,
    clientes.nome,
    contas.id_conta,
    contas.numero_conta,
    contas.data_abertura
FROM clientes
INNER JOIN contas 
       ON clientes.id_cliente = contas.id_cliente;

-- Exemplo: Verificando a relação entre clientes e agencias

SELECT 
    contas.id_conta,
    contas.numero_conta,
    agencias.nome AS agencia,
    agencias.cidade,
    agencias.estado
FROM contas
INNER JOIN agencias
       ON contas.id_agencia = agencias.id_agencia;

-- Exemplo: Verificando a relação entre clientes, contas e agencias

SELECT 
    clientes.nome AS cliente,
    contas.numero_conta,
    agencias.nome AS agencia
FROM clientes
INNER JOIN contas
       ON clientes.id_cliente = contas.id_cliente
INNER JOIN agencias
       ON contas.id_agencia = agencias.id_agencia;

-- Exemplo: Juntando clientes + contas + transações

SELECT 
    clientes.nome AS cliente,
    contas.numero_conta,
    transacoes.tipo,
    transacoes.descricao,
    transacoes.valor,
    transacoes.data_transacao
FROM clientes
INNER JOIN contas
       ON clientes.id_cliente = contas.id_cliente
INNER JOIN transacoes
       ON contas.id_conta = transacoes.id_conta;

-- Exemplo: Trazendo transações acima de 500 reais.

SELECT
    clientes.nome,
    contas.numero_conta,
    transacoes.valor,
    transacoes.data_transacao
FROM clientes
INNER JOIN contas
       ON clientes.id_cliente = contas.id_cliente
INNER JOIN transacoes
       ON contas.id_conta = transacoes.id_conta
WHERE transacoes.valor > 50;

-- Exemplo: Total movimentado por cliente.

SELECT
    clientes.nome,
    SUM(transacoes.valor) AS total_movimentado
FROM clientes
INNER JOIN contas
       ON clientes.id_cliente = contas.id_cliente
INNER JOIN transacoes
       ON contas.id_conta = transacoes.id_conta
GROUP BY clientes.nome;

