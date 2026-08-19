

-- Exemplo: Criando índice para otimizar a primeira query.

CREATE INDEX idx_transacoes_valor
ON transacoes (valor);

-- Exemplo: Vendo o resultado da análise da performance.

EXPLAIN FORMAT=JSON
SELECT *
FROM transacoes
WHERE valor > 500;

-- Exemplo: Remova o índice criado anteriormente.

DROP INDEX idx_transacoes_valor
ON transacoes;

-- Exemplo: Crie o índice para melhorar a segunda query.

CREATE INDEX idx_transacoes_data
ON transacoes (data_transacao);

-- Exemplo: Execute o EXPLAIN da segunda query.

EXPLAIN FORMAT=JSON
SELECT *
FROM transacoes
WHERE data_transacao >= '2025-01-01';

-- Exemplo: Remova o índice da segunda query.

DROP INDEX idx_transacoes_data
ON transacoes;

-- Exemplo: Aplique o índice da terceira query e teste o plano.

CREATE INDEX idx_clientes_status
ON clientes (status);

EXPLAIN FORMAT=JSON
SELECT
    c.nome,
    ct.numero_conta,
    t.valor,
    t.data_transacao
FROM clientes c
JOIN contas ct ON ct.id_cliente = c.id_cliente
JOIN transacoes t ON t.id_conta = ct.id_conta
WHERE c.status = 'ATIVO';

-- Exemplo: Remova o índice da query anterior.

DROP INDEX idx_clientes_status
ON clientes;

-- Exemplo: Crie o índice e execute o EXPLAIN da query com ORDER BY.

CREATE INDEX idx_transacoes_data_cover
ON transacoes (data_transacao DESC, id_transacao, valor);

EXPLAIN FORMAT=JSON
SELECT
    id_transacao,
    valor,
    data_transacao
FROM transacoes
ORDER BY data_transacao DESC;

-- Exemplo: Remova o índice.

DROP INDEX idx_transacoes_data_cover
ON transacoes;

