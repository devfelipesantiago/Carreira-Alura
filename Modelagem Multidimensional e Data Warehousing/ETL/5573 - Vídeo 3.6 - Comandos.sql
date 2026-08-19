
-- Exemplo: Alterando a estrutura da tabela de dimensão agência.

USE suprema_bank_dw;

ALTER TABLE dim_agencia
  ADD COLUMN valid_from DATE NOT NULL DEFAULT '1000-01-01',
  ADD COLUMN valid_to   DATE NOT NULL DEFAULT '9999-12-31';

-- Exemplo: Criando índices para a dimensão agência.

-- Lookup da versão atual (SCD2)
CREATE INDEX ix_dim_agencia_cod_validto
ON dim_agencia (cod_agencia, valid_to);

-- Exemplo: Alterando a estrutura da tabela de dimensão gerência.

USE suprema_bank_dw;

ALTER TABLE dim_gerencia
  ADD COLUMN valid_from DATE NOT NULL DEFAULT '1000-01-01',
  ADD COLUMN valid_to   DATE NOT NULL DEFAULT '9999-12-31';

-- Exemplo: Criando índices para a dimensão gerência.

-- Lookup da versão atual (SCD2)
CREATE INDEX ix_dim_gerencia_cod_validto
ON dim_gerencia (cod_gerencia, valid_to);

-- Exemplo: Criando índices para a dimensão status_conta.

USE suprema_bank_dw;

ALTER TABLE dim_status_conta
  ADD UNIQUE KEY uk_dim_status_conta_cod (cod_status_conta);

-- Exemplo: SP para a dimensão agência.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_dim_agencia_scd2;
DELIMITER $$

CREATE PROCEDURE prc_carga_dim_agencia_scd2()
BEGIN
    DECLARE v_dt_hoje DATE;
    DECLARE v_dt_ontem DATE;

    SET v_dt_hoje  = CURDATE();
    SET v_dt_ontem = DATE_SUB(v_dt_hoje, INTERVAL 1 DAY);

    /* 1) INSERT novas agências (não existem em nenhuma versão) */
    INSERT INTO suprema_bank_dw.dim_agencia
    (
        cod_agencia,
        nome_agencia,
        cod_cidade_agencia,
        nome_cidade_agencia,
        cod_estado_agencia,
        nome_estado_agencia,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_agencia,
        CONCAT(s.codigo_agencia, ' - ', s.nome) AS nome_agencia,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        '1000-01-01',
        '9999-12-31'
    FROM suprema_bank_db.agencias s
    LEFT JOIN (SELECT DISTINCT cod_agencia FROM suprema_bank_dw.dim_agencia) d
      ON d.cod_agencia = s.cod_agencia
    WHERE d.cod_agencia IS NULL;

    /* 2a) SCD2: fecha versão atual se mudou cidade ou estado */
    UPDATE suprema_bank_dw.dim_agencia d
    SET d.valid_to = v_dt_ontem
    WHERE d.id_agencia IN (
        SELECT x.id_agencia
        FROM (
            SELECT d2.id_agencia
            FROM suprema_bank_dw.dim_agencia d2
            JOIN suprema_bank_db.agencias s
              ON s.cod_agencia = d2.cod_agencia
            WHERE d2.valid_to = '9999-12-31'
              AND (
                    COALESCE(d2.nome_cidade_agencia,'') <> COALESCE(s.cidade,'')
                 OR COALESCE(d2.cod_estado_agencia,'')  <> COALESCE(s.estado,'')
              )
        ) x
    );

    /* 2b) SCD2: insere nova versão para os que foram fechados (valid_to = ontem) */
    INSERT INTO suprema_bank_dw.dim_agencia
    (
        cod_agencia,
        nome_agencia,
        cod_cidade_agencia,
        nome_cidade_agencia,
        cod_estado_agencia,
        nome_estado_agencia,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_agencia,
        CONCAT(s.codigo_agencia, ' - ', s.nome) AS nome_agencia,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        v_dt_hoje,
        '9999-12-31'
    FROM suprema_bank_db.agencias s
    JOIN suprema_bank_dw.dim_agencia d_old
      ON d_old.cod_agencia = s.cod_agencia
    WHERE d_old.valid_to = v_dt_ontem;

    /* 3) SCD1: atualiza apenas o nome_agencia na versão atual */
    UPDATE suprema_bank_dw.dim_agencia d
    JOIN suprema_bank_db.agencias s
      ON s.cod_agencia = d.cod_agencia
    SET d.nome_agencia = CONCAT(s.codigo_agencia, ' - ', s.nome)
    WHERE d.valid_to = '9999-12-31'
      AND COALESCE(d.nome_agencia,'') <> COALESCE(CONCAT(s.codigo_agencia, ' - ', s.nome),'');
END$$

DELIMITER ;

-- Exemplo: SP para a dimensão gerência.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_dim_gerencia_scd2;
DELIMITER $$

CREATE PROCEDURE prc_carga_dim_gerencia_scd2()
BEGIN
    DECLARE v_dt_hoje DATE;
    DECLARE v_dt_ontem DATE;

    SET v_dt_hoje  = CURDATE();
    SET v_dt_ontem = DATE_SUB(v_dt_hoje, INTERVAL 1 DAY);

    /* Fonte “vista” (gerentes + regionais) */
    /* 1) INSERT novos gerentes (não existem em nenhuma versão) */
    INSERT INTO suprema_bank_dw.dim_gerencia
    (
        cod_gerencia,
        nome_gerencia,
        cod_regional,
        nome_regional,
        valid_from,
        valid_to
    )
    SELECT
        g.cod_gerente AS cod_gerencia,
        g.nome        AS nome_gerencia,
        g.cod_regional,
        r.nome        AS nome_regional,
        '1000-01-01',
        '9999-12-31'
    FROM suprema_bank_db.gerentes g
    LEFT JOIN suprema_bank_db.regionais r
      ON r.cod_regional = g.cod_regional
    LEFT JOIN (SELECT DISTINCT cod_gerencia FROM suprema_bank_dw.dim_gerencia) d
      ON d.cod_gerencia = g.cod_gerente
    WHERE d.cod_gerencia IS NULL;

    /* 2a) SCD2: fecha versão atual se mudou regional (cod ou nome) */
    UPDATE suprema_bank_dw.dim_gerencia d
    SET d.valid_to = v_dt_ontem
    WHERE d.id_gerencia IN (
        SELECT x.id_gerencia
        FROM (
            SELECT d2.id_gerencia
            FROM suprema_bank_dw.dim_gerencia d2
            JOIN suprema_bank_db.gerentes g
              ON g.cod_gerente = d2.cod_gerencia
            LEFT JOIN suprema_bank_db.regionais r
              ON r.cod_regional = g.cod_regional
            WHERE d2.valid_to = '9999-12-31'
              AND (
                    COALESCE(d2.cod_regional,'')  <> COALESCE(g.cod_regional,'')
                 OR COALESCE(d2.nome_regional,'') <> COALESCE(r.nome,'')
              )
        ) x
    );

    /* 2b) Insere nova versão para os fechados */
    INSERT INTO suprema_bank_dw.dim_gerencia
    (
        cod_gerencia,
        nome_gerencia,
        cod_regional,
        nome_regional,
        valid_from,
        valid_to
    )
    SELECT
        g.cod_gerente AS cod_gerencia,
        g.nome        AS nome_gerencia,
        g.cod_regional,
        r.nome        AS nome_regional,
        v_dt_hoje,
        '9999-12-31'
    FROM suprema_bank_db.gerentes g
    LEFT JOIN suprema_bank_db.regionais r
      ON r.cod_regional = g.cod_regional
    JOIN suprema_bank_dw.dim_gerencia d_old
      ON d_old.cod_gerencia = g.cod_gerente
    WHERE d_old.valid_to = v_dt_ontem;

    /* 3) SCD1: atualiza nome_gerencia na versão atual */
    UPDATE suprema_bank_dw.dim_gerencia d
    JOIN suprema_bank_db.gerentes g
      ON g.cod_gerente = d.cod_gerencia
    SET d.nome_gerencia = g.nome
    WHERE d.valid_to = '9999-12-31'
      AND COALESCE(d.nome_gerencia,'') <> COALESCE(g.nome,'');
END$$

DELIMITER ;

-- Exemplo: SP para a dimensão status_conta.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_upsert_dim_status_conta_scd1;
DELIMITER $$

CREATE PROCEDURE prc_upsert_dim_status_conta_scd1()
BEGIN
    INSERT INTO suprema_bank_dw.dim_status_conta
        (cod_status_conta, nome_status_conta)
    SELECT
        s.cod_status,
        s.nome
    FROM suprema_bank_db.status_conta s
    ON DUPLICATE KEY UPDATE
        nome_status_conta = VALUES(nome_status_conta);
END$$

DELIMITER ;

-- Exemplo: Executando as cargas das 3 dimensões.

SET SQL_SAFE_UPDATES = 0;

CALL suprema_bank_dw.prc_carga_dim_agencia_scd2();
CALL suprema_bank_dw.prc_carga_dim_gerencia_scd2();
CALL suprema_bank_dw.prc_upsert_dim_status_conta_scd1();

SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Verificando as versões de SKs da dimensão agência.

SELECT cod_agencia, nome_agencia, nome_cidade_agencia, cod_estado_agencia, valid_from, valid_to, id_agencia
FROM suprema_bank_dw.dim_agencia
ORDER BY cod_agencia, valid_from;

-- Exemplo: Verificando a versão atual da dimensão gerência.

SELECT *
FROM suprema_bank_dw.dim_gerencia
WHERE valid_to = '9999-12-31';

-- Exemplo: Verificando a versão atual da dimensão status conta.

SELECT *
FROM suprema_bank_dw.dim_status_conta
ORDER BY id_status_conta;
