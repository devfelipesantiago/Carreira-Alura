
-- Exemplo: Criando um índice/unique no código natural da dimensão.

ALTER TABLE dim_tipo_conta
  ADD UNIQUE KEY uk_dim_tipo_conta_cod (cod_tipo_conta);

-- Exemplo: Criando uma stored procedure para carga da dimensão tipo_conta.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_upsert_dim_tipo_conta;
DELIMITER $$

CREATE PROCEDURE prc_upsert_dim_tipo_conta()
BEGIN
    /*
      Processo:
      - Lê suprema_bank_db.tipos_conta (fonte)
      - Faz UPSERT na suprema_bank_dw.dim_tipo_conta (destino)
      - Lookup é baseado no código natural: cod_tipo_conta
      - Atualiza nome_tipo_conta se o registro já existir
    */

    INSERT INTO suprema_bank_dw.dim_tipo_conta
        (cod_tipo_conta, nome_tipo_conta)
    SELECT
        s.cod_tipo_conta,
        s.nome
    FROM suprema_bank_db.tipos_conta AS s
    ON DUPLICATE KEY UPDATE
        nome_tipo_conta = VALUES(nome_tipo_conta);
END$$

DELIMITER ;

-- Exemplo: Executando a carga da dimensão.

SELECT * FROM dim_tipo_conta;
CALL suprema_bank_dw.prc_upsert_dim_tipo_conta();

SELECT * FROM dim_tipo_conta;
CALL suprema_bank_dw.prc_upsert_dim_tipo_conta();

SELECT * FROM dim_tipo_conta;

-- Exemplo: Melhorando o processo de carga testando atributos que sofreram alterações.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_upsert_dim_tipo_conta;
DELIMITER $$

CREATE PROCEDURE prc_upsert_dim_tipo_conta()
BEGIN
    /*
      Processo:
      - Lê suprema_bank_db.tipos_conta (fonte)
      - Faz UPSERT na suprema_bank_dw.dim_tipo_conta (destino)
      - Lookup é baseado no código natural: cod_tipo_conta
      - Atualiza nome_tipo_conta se o registro já existir
    */

    INSERT INTO suprema_bank_dw.dim_tipo_conta
        (cod_tipo_conta, nome_tipo_conta)
    SELECT
        s.cod_tipo_conta,
        s.nome
    FROM suprema_bank_db.tipos_conta AS s
    ON DUPLICATE KEY UPDATE
  nome_tipo_conta = IF(nome_tipo_conta <> VALUES(nome_tipo_conta),
                       VALUES(nome_tipo_conta),
                       nome_tipo_conta);
END$$

DELIMITER ;

CALL suprema_bank_dw.prc_upsert_dim_tipo_conta();

SELECT * FROM dim_tipo_conta;

-- Exemplo: Criando uma nova TIPO CONTA na base fonte

SELECT * FROM suprema_bank_db.tipos_conta;
INSERT INTO suprema_bank_db.tipos_conta VALUES ('00004', 'Conta Salário');
UPDATE suprema_bank_db.tipos_conta SET nome = 'Conta de Investimento - Poupança' WHERE cod_tipo_conta = '00002';
SELECT * FROM suprema_bank_db.tipos_conta;



