
-- Exemplo: Alterando o banco adicionando JSON.

ALTER TABLE transacoes
ADD COLUMN detalhes_json JSON;

-- Exemplo: Inserindo um valor no campo JSON referente a transação.

SELECT detalhes_json FROM transacoes WHERE id_transacao = 1;


UPDATE transacoes
SET detalhes_json = JSON_OBJECT(
    'origem', 'mobile',
    'risco', false,
    'localizacao', JSON_OBJECT(
        'pais', 'BR',
        'estado', 'SP'
    )
)
WHERE id_transacao = 1;

-- Restaurar o BACKUP relacionado com este vídeo.

-- Exemplo: Usando a função JSON_EXTRACT.

-- {"risco": 0, "origem": "computador", "localizacao": {"pais": "BR", "estado": "MG"}}

SELECT
  id_transacao,
  JSON_EXTRACT(detalhes_json, '$.origem') AS origem
FROM transacoes;

-- Exemplo: Usando a função JSON_SET.

SELECT detalhes_json FROM transacoes WHERE id_transacao = 1;

UPDATE transacoes
SET detalhes_json = JSON_SET(
    detalhes_json,
    '$.risco',
    true
)
WHERE id_transacao = 1;

-- Exemplo: Usando a função JSON_KEYS.

SELECT JSON_KEYS(detalhes_json)
FROM transacoes;

-- Exemplo: Usando a função JSON_TYPE.

SELECT JSON_TYPE(JSON_EXTRACT(detalhes_json, '$.risco'))
FROM transacoes;

select * from transacoes;

-- ExemplO: Usando a função JSON_VALID.

SELECT JSON_VALID(detalhes_json)
FROM transacoes;

-- Exemplo: Usando a função JSON_ARRAY.

SELECT JSON_ARRAY('PIX', 'TED', 'DOC');

-- Exemplo: Retornando as transações cuja origem foi mobile.

SELECT
  t.id_transacao,
  c.nome,
  JSON_EXTRACT(t.detalhes_json, '$.localizacao.estado') AS estado
FROM transacoes t
JOIN contas ct ON ct.id_conta = t.id_conta
JOIN clientes c ON c.id_cliente = ct.id_cliente
WHERE JSON_EXTRACT(t.detalhes_json, '$.origem') = 'mobile';



