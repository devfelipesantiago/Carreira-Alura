
-- Exemplo: Vamos consultar todos os clientes.

SELECT * 
FROM clientes;

-- Exemplo: Selecionando colunas específicas.

SELECT id_cliente, nome, documento 
FROM clientes;

-- Exemplo: Selecionando os Clientes ativos.

SELECT id_cliente, nome, status
FROM clientes
WHERE status = 'ATIVO';

-- Exemplo: Consultando clientes nascidos depois do ano 2000.

SELECT nome, data_nascimento
FROM clientes
WHERE data_nascimento > '1990-01-01';

-- Exemplo: Selecionando as Contas por tipo

SELECT
	id_conta,
	id_cliente,
	id_tipo_conta
FROM
	contas
WHERE
	id_tipo_conta = 1;

-- Exemplo: Obtendo o Saldo inicial maior que 1.000.

SELECT numero_conta, saldo_inicial
FROM contas
WHERE saldo_inicial >= 1000;

-- Exemplo: Obtendo as contas cujo número inicie com 10.

SELECT numero_conta 
FROM contas
WHERE numero_conta LIKE '10%';

-- Exemplo: Usando o operador "Diferente"

SELECT nome FROM clientes WHERE status != 'ATIVO';

-- Exemplo: Selecionando um intervalo numérico.

SELECT numero_conta, saldo_inicial
FROM contas
WHERE saldo_inicial BETWEEN 500 AND 2000;

-- Exemplo: Buscando múltiplos valores.

SELECT id_conta, id_status
FROM contas
WHERE id_status IN (1, 3);

-- Exemplo: Ordenando clientes por nome.

SELECT id_cliente, nome
FROM clientes
ORDER BY nome ASC;

-- Exemplo: Ordenando contas por saldo inicial (maior → menor).

SELECT numero_conta, saldo_inicial
FROM contas
ORDER BY saldo_inicial DESC;

-- Exemplo: Ordenando por data de abertura.

SELECT numero_conta, data_abertura
FROM contas
ORDER BY data_abertura ASC;

-- Exemplo: Mostrando apenas 5 clientes.

SELECT id_cliente, nome
FROM clientes
LIMIT 5;

-- Exemplo: Pulando alguns e apresentar apenas os 5 após pular alguns.

SELECT id_cliente, nome
FROM clientes
ORDER BY id_cliente
LIMIT 5 OFFSET 5;

-- Exemplo: Mudando a forma da seleção usnado a sintaxe específica do MySQL.

SELECT id_cliente, nome
FROM clientes
ORDER BY id_cliente
LIMIT 5, 5;

-- Exemplo: Vendo rapidamente as primeiras contas abertas.

SELECT numero_conta, data_abertura
FROM contas
ORDER BY data_abertura
LIMIT 10;

-- Exemplo: Combinando o SELECT + WHERE + ORDER BY + LIMIT.

SELECT nome, data_cadastro
FROM clientes
WHERE status = 'ATIVO'
ORDER BY data_cadastro DESC
LIMIT 10;

