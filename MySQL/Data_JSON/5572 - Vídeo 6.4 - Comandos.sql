
-- Exemplo: Criando uma coluna associada a propriedade JSON.

ALTER TABLE transacoes
ADD COLUMN origem VARCHAR(20)
GENERATED ALWAYS AS (
    JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem'))
) STORED;

SELECT * FROM transacoes;

-- Exemplo: Testando a modificação do campo associado a propriedade do JSON.

UPDATE transacoes
SET detalhes_json = JSON_SET(detalhes_json, '$.origem', 'ATM')
WHERE id_transacao = 1;

-- Exemplo: Criando índice para a coluna associada a propriedade do JSON.

CREATE INDEX idx_transacoes_origem
ON transacoes (origem);

-- Exemplo: Usando a query buscando os dados pela propriedade origem do JSON.

SELECT *
FROM transacoes
WHERE JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem')) = 'ATM';

-- Exemplo: Usando a query buscando os dados por origem - Via campo

SELECT *
FROM transacoes
WHERE origem = 'ATM';

