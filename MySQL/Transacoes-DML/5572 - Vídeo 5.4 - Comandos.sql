
-- Exemplo: READ COMMITTED

-- ABA 1

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

UPDATE contas
SET saldo_inicial = saldo_inicial - 300
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;

-- ABA 2

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
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

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

--  Exemplo: REPEATABLE READ

ABA 1

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

UPDATE contas
SET saldo_inicial = saldo_inicial + 500
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;

ABA 2

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

ABA 1

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1
FOR UPDATE;

UPDATE contas
SET saldo_inicial = saldo_inicial + 500
WHERE id_conta = 1;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;

ABA 2

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

COMMIT;
-- ou ROLLBACK (foi apenas leitura)

SELECT saldo_inicial
FROM contas
WHERE id_conta = 1;

