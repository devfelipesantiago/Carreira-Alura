

-- Exemplo: Passo 1 — iniciar a transação.

START TRANSACTION;

-- Exemplo: Passo 2 — registrar a transação.

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
    'Depósito em dinheiro',
    500.00,
    NOW()
);

-- Exemplo: Passo 3 — atualizar saldo da conta.

UPDATE contas
SET saldo_inicial = saldo_inicial + 500.00
WHERE id_conta = 1;

-- Exemplo: Passo 4 — confirmar.

COMMIT;

-- Exemplo: Vamos simular um erro.

START TRANSACTION;

INSERT INTO transacoes (
    id_conta,
    tipo,
    descricao,
    valor,
    data_transacao
)
VALUES (
    1,
    'DEBITO',
    'Tentativa de saque',
    2000.00,
    NOW()
);

-- Exemplo: Cancelar a operação.

ROLLBACK;

-- Exemplo: Fazendo a transferência envolve duas contas.

START TRANSACTION;

-- debita da conta origem
UPDATE contas
SET saldo_inicial = saldo_inicial - 300.00
WHERE id_conta = 1;

-- credita na conta destino
UPDATE contas
SET saldo_inicial = saldo_inicial + 300.00
WHERE id_conta = 2;

-- registra a transação
INSERT INTO transacoes (
    id_conta,
    tipo,
    descricao,
    valor,
    data_transacao
)
VALUES
(1, 'DEBITO', 'Transferência enviada', 300.00, NOW()),
(2, 'CREDITO', 'Transferência recebida', 300.00, NOW());

COMMIT;

