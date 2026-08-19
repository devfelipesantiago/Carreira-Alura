
-- Exemplo: READ COMMITTED

-- ABA 2

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

select CONNECTION_ID(), @@autocommit, @@transaction_isolation;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

--  Exemplo: REPEATABLE READ

-- ABA 2

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;
-- ou ROLLBACK (como foi apenas leitura)

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

-- Exemplo: SERIALIZABLE

-- ABA 2

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;
-- ou ROLLBACK (foi apenas leitura)

