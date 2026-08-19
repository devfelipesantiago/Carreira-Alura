
-- Exemplo: Criando uma coluna do valor absoluto.

SELECT * FROM transacoes LIMIT 100;

ALTER TABLE transacoes
ADD COLUMN valor_nominal DECIMAL(10,2)
GENERATED ALWAYS AS (
  CASE
    WHEN tipo = 'CREDITO' THEN valor
    WHEN tipo = 'DEBITO'  THEN -valor
    ELSE 0
  END
) STORED;

-- Exemplo: Criando uma coluna que seja sempre o ano que a transação foi realizada.

ALTER TABLE transacoes
ADD COLUMN ano_transacao INT
GENERATED ALWAYS AS (YEAR(data_transacao)) STORED;

-- Exemplo: Criando a coluna associada ao JSON (Não executar).

ALTER TABLE transacoes
ADD COLUMN origem VARCHAR(20)
GENERATED ALWAYS AS (
  JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem'))
) STORED;

-- Exemplo: Criando o índice associado a nova coluna. (Não executar).

CREATE INDEX idx_transacoes_origem
ON transacoes (origem);

