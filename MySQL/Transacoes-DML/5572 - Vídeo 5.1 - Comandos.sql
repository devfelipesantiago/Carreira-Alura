
-- Exemplo: Incluindo um novo cliente.

INSERT INTO clientes (
    nome,
    documento,
    data_nascimento,
    data_cadastro,
    status
)
VALUES (
    'Carlos Henrique Lima',
    '12345678901',
    '1985-06-12',
    NOW(),
    'ATIVO'
);

SELECT * FROM clientes WHERE nome =  'Carlos Henrique Lima';


-- Excemplo: Criando uma nova conta para o cliente.

INSERT INTO contas (
    id_cliente,
    id_agencia,
    id_tipo_conta,
    id_status,
    numero_conta,
    saldo_inicial,
    data_abertura
)
VALUES (
    1,
    1,
    1,
    1,
    '00012345-6',
    1000.00,
    CURDATE()
);

-- Exemplo: Registrando uma nova transação

INSERT INTO transacoes (
    id_conta,
    tipo,
    descricao,
    valor,
    data_transacao
)
VALUES (
    1,
    'CREDITO',
    'Depósito inicial',
    1000.00,
    NOW()
);

-- Exemplo: Atualizando os dados cadastrais do cliente.

UPDATE clientes
SET nome = 'Carlos H. Lima'
WHERE id_cliente = 1;

-- Exemplo: Alterando um status de uma conta.

UPDATE contas
SET id_status = 2
WHERE id_conta = 1;

-- Exemplo: Removendo uma transação de teste.

DELETE FROM transacoes
WHERE descricao = 'Depósito inicial'
  AND id_conta = 1;

