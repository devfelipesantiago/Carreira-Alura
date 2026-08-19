
SELECT @@sql_mode;

SELECT * FROM transacoes LIMIT 10;

INSERT INTO `suprema_bank`.`transacoes`
(`id_conta`,
`tipo`,
`descricao`,
`valor`,
`detalhes_json`)
VALUES
(1,
'CREDITO',
'Transferência PIX enviada',
'ABC',
'{"risco": true, "origem": "ATM", "localizacao": {"pais": "BR", "estado": "SP"}}');

SELECT id_transacao FROM transacoes ORDER BY id_transacao DESC LIMIT 10;

START TRANSACTION;

INSERT INTO transacoes
(`id_conta`,
`tipo`,
`descricao`,
`valor`,
`detalhes_json`)
VALUES
(1,
'CREDITO',
'Transferência PIX enviada',
100,
'{"risco": true, "origem": "ATM", "localizacao": {"pais": "BR", "estado": "SP"}}');

SELECT id_transacao FROM transacoes ORDER BY id_transacao DESC LIMIT 10;

ROLLBACK;

SELECT id_transacao FROM transacoes ORDER BY id_transacao DESC;

INSERT INTO transacoes
(`id_conta`,
`tipo`,
`descricao`,
`valor`,
`detalhes_json`)
VALUES
(1,
'CREDITO',
'Transferência PIX enviada',
100,
'{"risco": true, "origem": "ATM", "localizacao": {"pais": "BR", "estado": "SP"}}');

SELECT id_transacao FROM transacoes ORDER BY id_transacao DESC;

SHOW TABLE STATUS WHERE name = 'transacoes';


