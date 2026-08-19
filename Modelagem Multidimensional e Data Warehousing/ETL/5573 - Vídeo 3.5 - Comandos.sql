
-- Exemplo: Transformando a tabela de dimensão cliente para ter os atributos da data de validade.

USE suprema_bank_dw;

ALTER TABLE dim_cliente
  ADD COLUMN valid_from DATE NOT NULL DEFAULT '1000-01-01',
  ADD COLUMN valid_to   DATE NOT NULL DEFAULT '9999-12-31';

-- Exemplo: Criando alguns indices desejados.

USE suprema_bank_dw;

-- Lookup da versão atual (SCD2)
CREATE INDEX ix_dim_cliente_cod_validto
ON dim_cliente (cod_cliente, valid_to);

-- Exemplo: Criando a Store Procedure de atualização da dimensão cliente.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_dim_cliente_scd2;
DELIMITER $$

CREATE PROCEDURE prc_carga_dim_cliente_scd2()
BEGIN
    DECLARE v_dt_hoje DATE;
    DECLARE v_dt_ontem DATE;

    SET v_dt_hoje  = CURDATE();
    SET v_dt_ontem = DATE_SUB(v_dt_hoje, INTERVAL 1 DAY);

    /* 1) INSERT de novos clientes */
    INSERT INTO suprema_bank_dw.dim_cliente
    (cod_cliente,
        nome_cliente,
        cod_cidade_cliente,
        nome_cidade_cliente,
        cod_estado_cliente,
        nome_estado_cliente,
        status_cliente,
        idade_cliente,
        data_primeira_transacao,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_cliente,
        s.nome,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        s.status,
        CASE
            WHEN s.data_nascimento IS NULL THEN NULL
            ELSE TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
        END AS idade_cliente,
        s.data_cadastro AS data_primeira_transacao,
        '1000-01-01' AS valid_from,
        '9999-12-31' AS valid_to
    FROM suprema_bank_db.clientes AS s
    LEFT JOIN (
        SELECT DISTINCT cod_cliente
        FROM suprema_bank_dw.dim_cliente
    ) AS d
      ON d.cod_cliente = s.cod_cliente
    WHERE d.cod_cliente IS NULL;


    /* 2a) SCD2: FECHAR versão atual dos que mudaram (usando PK no WHERE) */
    UPDATE suprema_bank_dw.dim_cliente d
    SET d.valid_to = v_dt_ontem
    WHERE d.id_cliente IN (
        SELECT x.id_cliente
        FROM (
            SELECT d2.id_cliente
            FROM suprema_bank_dw.dim_cliente d2
            JOIN suprema_bank_db.clientes s
              ON s.cod_cliente = d2.cod_cliente
            WHERE d2.valid_to = '9999-12-31'
              AND (
                    (COALESCE(d2.status_cliente,'') <> COALESCE(s.status,''))
                 OR (COALESCE(d2.nome_cidade_cliente,'') <> COALESCE(s.cidade,''))
                 OR (COALESCE(d2.cod_estado_cliente,'') <> COALESCE(s.estado,''))
                 OR (
                      d2.idade_cliente IS NULL <> (s.data_nascimento IS NULL)
                      OR (
                            d2.idade_cliente IS NOT NULL
                            AND s.data_nascimento IS NOT NULL
                            AND d2.idade_cliente <> TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
                         )
                    )
              )
        ) x
    );

    /* 2b) Inserir nova versão (os que foram fechados ontem) */
    INSERT INTO suprema_bank_dw.dim_cliente
    (
        cod_cliente,
        nome_cliente,
        cod_cidade_cliente,
        nome_cidade_cliente,
        cod_estado_cliente,
        nome_estado_cliente,
        status_cliente,
        idade_cliente,
        data_primeira_transacao,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_cliente,
        s.nome,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        s.status,
        CASE
            WHEN s.data_nascimento IS NULL THEN NULL
            ELSE TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
        END AS idade_cliente,
        s.data_cadastro AS data_primeira_transacao,
        v_dt_hoje AS valid_from,
        '9999-12-31' AS valid_to
    FROM suprema_bank_db.clientes AS s
    JOIN suprema_bank_dw.dim_cliente d_old
      ON d_old.cod_cliente = s.cod_cliente
    WHERE d_old.valid_to = v_dt_ontem;


    /* 3) SCD1: atualizar atributos "tipo 1" na versão atual (PK no WHERE) */
    UPDATE suprema_bank_dw.dim_cliente d
    SET d.nome_cliente = (
        SELECT s.nome
        FROM suprema_bank_db.clientes s
        WHERE s.cod_cliente = d.cod_cliente
        LIMIT 1
    )
    WHERE d.id_cliente IN (
        SELECT y.id_cliente
        FROM (
            SELECT d3.id_cliente
            FROM suprema_bank_dw.dim_cliente d3
            JOIN suprema_bank_db.clientes s
              ON s.cod_cliente = d3.cod_cliente
            WHERE d3.valid_to = '9999-12-31'
              AND COALESCE(d3.nome_cliente,'') <> COALESCE(s.nome,'')
        ) y
    );

END$$

DELIMITER ;

-- Exemplo: Executando a carga desativando o SQL_SAFE_UPDATES

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_dim_cliente_scd2();
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Mostrando um caso de SAFE UPDATE.

-- UPDATE clientes SET status = 'INATIVO';
-- DELETE FROM pedidos;

-- Exemplo: Verificando as versões de SKs de um mesmo cliente.

SELECT
  cod_cliente, nome_cliente, nome_cidade_cliente, cod_estado_cliente,
  status_cliente, idade_cliente,
  valid_from, valid_to, id_cliente
FROM suprema_bank_dw.dim_cliente
WHERE cod_cliente = '00001'  -- troque por um existente
ORDER BY valid_from;

-- Exemplo: Obter o SK mais atual.

SELECT *
FROM suprema_bank_dw.dim_cliente
WHERE valid_to = '9999-12-31';

-- Exemplo: Modificando os atributos de um dos clientes para tesre.

UPDATE suprema_bank_db.clientes 
SET cidade = 'Rio de Janeiro', estado = 'RJ' 
WHERE cod_cliente = '00001';

SELECT * FROM suprema_bank_db.clientes WHERE cod_cliente = '00001';

-- Exemplo: Rodando de novo a procedure de atualização.

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_dim_cliente_scd2();
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Verificando novamente as versões do cliente 00001.

SELECT
  cod_cliente, nome_cliente, nome_cidade_cliente, cod_estado_cliente,
  status_cliente, idade_cliente,
  valid_from, valid_to, id_cliente
FROM suprema_bank_dw.dim_cliente
WHERE cod_cliente = '00001'  -- troque por um existente
ORDER BY valid_from;

