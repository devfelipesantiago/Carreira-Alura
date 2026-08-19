
-- Exemplo: Padronização de texto — UCASE e LCASE.

SELECT 
    id_cliente,
    nome,
    UCASE(nome) AS nome_maiusculo,
    LCASE(nome) AS nome_minusculo
FROM clientes;

-- Exemplo: Limpeza de texto — TRIM.

SELECT 
    id_cliente,
    nome,
    TRIM(nome) AS nome_limpo,
    LTRIM(nome) AS nome_limpo_esquerda,
    RTRIM(nome) AS nome_limpo_esquerda
FROM clientes;

SELECT 
    CONCAT('-', '  teste  ','-'),
    CONCAT('-', TRIM('  teste  '),'-') AS nome_limpo,
    CONCAT('-', LTRIM('  teste  '),'-') AS nome_limpo_esquerda,
    CONCAT('-', RTRIM('  teste  '),'-') AS nome_limpo_esquerda;

-- Exemplo: Extração de parte do texto — SUBSTRING.

SELECT 
    descricao,
    SUBSTRING(descricao, 1, 20) AS resumo,
    SUBSTRING(descricao, 5, 20) AS resumo2
FROM transacoes;


-- Exemplo: Substituição de conteúdo — REPLACE.

SELECT 
    descricao,
    REPLACE(descricao, 'PIX', 'TRANSFERÊNCIA PIX') AS descricao_padronizada
FROM transacoes;

-- Exemplo: Montagem de campos derivados — CONCAT.

SELECT 
    c.id_conta,
    a.codigo_agencia,
    c.numero_conta,
    CONCAT(a.codigo_agencia, '-', c.numero_conta) AS conta_formatada
FROM contas c
JOIN agencias a ON a.id_agencia = c.id_agencia;

-- Exemplo: Arredondamento — ROUND.

SELECT 
    id_transacao,
    valor,
    ROUND(valor, 1) AS valor_arredondado
FROM transacoes;

-- Exemplo: Ajustes matemáticos — CEIL e FLOOR.

SELECT 
    valor,
    CEIL(valor) AS arredondar_para_cima,
    FLOOR(valor) AS arredondar_para_baixo
FROM transacoes;

-- Exemplo: Formatação para exibição — FORMAT

SELECT 
    FORMAT(valor * 1000, 2, 'pt_BR') AS valor_formatado
FROM transacoes;

-- Exemplo: Classificação de valores — CASE.

SELECT 
    id_transacao,
    valor,
    CASE
        WHEN valor >= 1000 THEN 'ALTA'
        WHEN valor >= 300 THEN 'MEDIA'
        ELSE 'BAIXA'
    END AS classificacao
FROM transacoes;

-- Exemplo: Tratamento de valores nulos — IFNULL.

SELECT 
    descricao,
    IFNULL(descricao, 'SEM DESCRIÇÃO') AS descricao_tratada
FROM transacoes;

-- Exemplo: Comparações seguras — NULLIF

SELECT 
    NULLIF(valor, 0) AS valor_validado,
    NULLIF(0, 0) AS valor_validado_2
FROM transacoes;

-- Exemplo: Aplicação Real no SupremaBank (Exemplo Integrado).

SELECT 
    c.id_cliente,
    UCASE(c.nome) AS nome_cliente,
    COUNT(t.id_transacao) AS qtd_transacoes,
    ROUND(SUM(t.valor), 2) AS total_movimentado,
    CASE
        WHEN SUM(t.valor) > 5000 THEN 'ALTO VOLUME'
        ELSE 'VOLUME NORMAL'
    END AS perfil_movimentacao
FROM clientes c
JOIN contas ct ON ct.id_cliente = c.id_cliente
JOIN transacoes t ON t.id_conta = ct.id_conta
GROUP BY c.id_cliente, c.nome;

