
-- Exemplo: Classificando uma transação para saber se ela é uma transação BAIXA, MÉDIA ou ALTA.

DELIMITER $$

CREATE FUNCTION fn_categoria_transacao(valor DECIMAL(10,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN valor < 100 THEN 'BAIXA'
        WHEN valor BETWEEN 100 AND 500 THEN 'MEDIA'
        ELSE 'ALTA'
    END;
END$$

DELIMITER ;

-- Exemplo: Usando a função numa seleção.

SELECT
    id_transacao,
    valor,
    fn_categoria_transacao(valor) AS categoria
FROM transacoes;

-- Exemplo: Fazendo a normalização de descrições.

DELIMITER $$

CREATE FUNCTION fn_normaliza_texto(txt VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN TRIM(UCASE(txt));
END$$

DELIMITER ;

-- Exemplo: Usando a função.

SELECT
    id_transacao,
    fn_normaliza_texto(descricao) AS descricao_normalizada
FROM transacoes;

