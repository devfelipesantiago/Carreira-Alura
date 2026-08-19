
-- Exemplo: Verificando os clientes SEM conta.

SELECT 
    clientes.id_cliente,
    clientes.nome,
    contas.id_conta,
    contas.numero_conta,
    contas.data_abertura
FROM clientes LEFT JOIN contas
       ON clientes.id_cliente = contas.id_cliente;

-- Exemplo: Verificando contas sem transações.

SELECT
    contas.id_conta,
    contas.numero_conta,
    transacoes.id_transacao,
    transacoes.valor
FROM contas LEFT JOIN transacoes
       ON contas.id_conta = transacoes.id_conta;

-- Exemplo: Verificando os tipos de conta SEM contas associadas

SELECT
    tipos_conta.nome AS tipo_conta,
    contas.id_conta
FROM tipos_conta RIGHT JOIN contas
       ON tipos_conta.id_tipo_conta = contas.id_tipo_conta;

SELECT
    tipos_conta.nome AS tipo_conta,
    contas.id_conta
FROM contas LEFT JOIN tipos_conta
       ON tipos_conta.id_tipo_conta = contas.id_tipo_conta;

-- Exemplo: Simulando o FULL JOIN.

SELECT *
FROM clientes
LEFT JOIN contas
       ON clientes.id_cliente = contas.id_cliente
UNION
SELECT *
FROM clientes
RIGHT JOIN contas
       ON clientes.id_cliente = contas.id_cliente;

-- Exemplos: Revisando situações reais onde OUTER JOIN é essencial.
-- Clientes sem contas.

SELECT
	DISTINCT 
    clientes.id_cliente,
	clientes.nome,
	numero_conta 
FROM
	clientes
LEFT JOIN contas
ON
	clientes.id_cliente = contas.id_cliente
WHERE
	contas.id_cliente IS NULL;

-- Tipos de conta nunca utilizados.

SELECT tipos_conta.nome
FROM tipos_conta
LEFT JOIN contas ON tipos_conta.id_tipo_conta = contas.id_tipo_conta
WHERE contas.id_conta IS NULL;

-- Contas abertas sem depósitos.

SELECT contas.numero_conta
FROM contas
LEFT JOIN transacoes 
     ON contas.id_conta = transacoes.id_conta
WHERE transacoes.valor IS NULL;

