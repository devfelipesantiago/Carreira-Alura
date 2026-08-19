
-- Exemplo: Seleção dos dados da fonte para a fato de transações.

SELECT
    c.cod_cliente,
    c.cod_agencia,
    c.cod_gerente,
    c.cod_tipo_conta,
    c.cod_status AS cod_status_conta,

    t.data_transacao,

    c.numero_conta AS num_conta_operacional,
    t.tipo         AS tipo_transacao,

    JSON_UNQUOTE(t.detalhes_json->'$.origem') AS origem_transacao,
    t.descricao as descricao_transacao,

    1       AS qtd_transacoes,
    t.valor AS valor_transacao,

    CASE
        WHEN t.tipo = 'CREDITO' THEN t.valor
        ELSE 0
    END AS valor_credito,

    CASE
        WHEN t.tipo = 'DEBITO' THEN t.valor
        ELSE 0
    END AS valor_debito,

    (
        CASE WHEN t.tipo = 'CREDITO' THEN t.valor ELSE 0 END
        -
        CASE WHEN t.tipo = 'DEBITO'  THEN t.valor ELSE 0 END
    ) AS saldo_liquido,

    NOW()             AS data_carga,
    'SUPREMA_BANK_DB' AS fonte_sistema

FROM suprema_bank_db.transacoes AS t
INNER JOIN suprema_bank_db.contas AS c
    ON t.cod_conta = c.cod_conta
WHERE t.data_transacao >= '2020-01-01'
  AND t.data_transacao <= '2020-01-31';

-- Exemplo: Store procedure para carga da tabela de fato de transacoes.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_fato_transacoes;
DELIMITER $$

CREATE PROCEDURE prc_carga_fato_transacoes(
    IN p_data_inicio DATE,
    IN p_data_fim    DATE
)
BEGIN
    DECLARE v_data_fim_excl DATETIME;

    -- fim exclusivo (pega o dia final inteiro, independentemente de hora)
    SET v_data_fim_excl = DATE_ADD(p_data_fim, INTERVAL 1 DAY);

    /* ============================================================
       1) DELETE por período (usando join com dim_tempo.data_completa)
       ============================================================ */
    DELETE ft
    FROM suprema_bank_dw.fato_transacoes ft
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = ft.id_tempo
    WHERE dt.data_completa >= p_data_inicio
      AND dt.data_completa <= p_data_fim;

    /* ============================================================
       2) ODS temporária (tabela temporária na sessão)
       ============================================================ */
    DROP TEMPORARY TABLE IF EXISTS tmp_ods_transacoes;

    CREATE TEMPORARY TABLE tmp_ods_transacoes (
        cod_cliente         VARCHAR(50),
        cod_agencia         VARCHAR(50),
        cod_gerencia        VARCHAR(50),
        cod_tipo_conta      VARCHAR(50),
        cod_status_conta    VARCHAR(50),

        data_transacao      DATETIME,
        data_dia            DATE,
        id_tempo_calc       INT,

        num_conta_operacional VARCHAR(20),
        tipo_transacao      VARCHAR(30),
        origem_transacao    VARCHAR(30),
        descricao_transacao VARCHAR(200),

        qtd_transacoes      INT,
        valor_transacao     DECIMAL(15,2),
        valor_credito       DECIMAL(15,2),
        valor_debito        DECIMAL(15,2),
        saldo_liquido       DECIMAL(15,2),

        data_carga          DATETIME,
        fonte_sistema       VARCHAR(50),

        KEY ix_ods_periodo (data_dia),
        KEY ix_ods_codigos (cod_cliente, cod_agencia, cod_gerencia, cod_tipo_conta, cod_status_conta)
    ) ENGINE=MEMORY;

    /* ============================================================
       3) Carrega ODS a partir do OLTP (suprema_bank_db)
       ============================================================ */
    INSERT INTO tmp_ods_transacoes
    (
        cod_cliente,
        cod_agencia,
        cod_gerencia,
        cod_tipo_conta,
        cod_status_conta,

        data_transacao,
        data_dia,
        id_tempo_calc,

        num_conta_operacional,
        tipo_transacao,
        origem_transacao,
        descricao_transacao,

        qtd_transacoes,
        valor_transacao,
        valor_credito,
        valor_debito,
        saldo_liquido,

        data_carga,
        fonte_sistema
    )
    SELECT
        c.cod_cliente,
        c.cod_agencia,
        c.cod_gerente     AS cod_gerencia,
        c.cod_tipo_conta,
        c.cod_status      AS cod_status_conta,

        t.data_transacao,
        DATE(t.data_transacao) AS data_dia,
        CAST(DATE_FORMAT(DATE(t.data_transacao), '%Y%m%d') AS SIGNED) AS id_tempo_calc,

        c.numero_conta AS num_conta_operacional,
        t.tipo         AS tipo_transacao,

        JSON_UNQUOTE(t.detalhes_json->'$.origem') AS origem_transacao,
        t.descricao    AS descricao_transacao,

        1       AS qtd_transacoes,
        t.valor AS valor_transacao,

        CASE WHEN t.tipo = 'CREDITO' THEN t.valor ELSE 0 END AS valor_credito,
        CASE WHEN t.tipo = 'DEBITO'  THEN t.valor ELSE 0 END AS valor_debito,

        (CASE WHEN t.tipo = 'CREDITO' THEN t.valor ELSE 0 END)
        -
        (CASE WHEN t.tipo = 'DEBITO'  THEN t.valor ELSE 0 END) AS saldo_liquido,

        NOW()             AS data_carga,
        'SUPREMA_BANK_DB' AS fonte_sistema

    FROM suprema_bank_db.transacoes t
    JOIN suprema_bank_db.contas c
      ON c.cod_conta = t.cod_conta
    WHERE t.data_transacao >= p_data_inicio
      AND t.data_transacao <  v_data_fim_excl;

    /* ============================================================
       4) Insere na fato com lookups
          - SCD1: tempo/tipo_conta/status_conta
          - SCD2: cliente/agencia/gerencia (valid_from/valid_to)
       ============================================================ */
    INSERT INTO suprema_bank_dw.fato_transacoes
    (
        id_tempo,
        id_cliente,
        id_agencia,
        id_gerencia,
        id_tipo_conta,
        id_status_conta,

        num_conta_operacional,
        tipo_transacao,
        origem_transacao,
        descricao_transacao,

        qtd_transacoes,
        valor_transacao,
        valor_credito,
        valor_debito,
        saldo_liquido,

        data_carga,
        fonte_sistema
    )
    SELECT
        -- SCD1 Tempo: garantimos que existe na dim_tempo (join)
        dt.id_tempo,

        -- SCD2 Cliente: pega a versão válida na data do fato
        dc.id_cliente,

        -- SCD2 Agência: pega a versão válida na data do fato
        da.id_agencia,

        -- SCD2 Gerência: pega a versão válida na data do fato
        dg.id_gerencia,

        -- SCD1 Tipo Conta
        dtc.id_tipo_conta,

        -- SCD1 Status Conta
        dsc.id_status_conta,

        o.num_conta_operacional,
        o.tipo_transacao,
        o.origem_transacao,
        o.descricao_transacao,

        o.qtd_transacoes,
        o.valor_transacao,
        o.valor_credito,
        o.valor_debito,
        o.saldo_liquido,

        o.data_carga,
        o.fonte_sistema

    FROM tmp_ods_transacoes o

    -- Tempo (SCD1) - checa existência
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = o.id_tempo_calc

    -- Tipo de conta (SCD1)
    JOIN suprema_bank_dw.dim_tipo_conta dtc
      ON dtc.cod_tipo_conta = o.cod_tipo_conta

    -- Status conta (SCD1)
    JOIN suprema_bank_dw.dim_status_conta dsc
      ON dsc.cod_status_conta = o.cod_status_conta

    -- Cliente (SCD2)
    JOIN suprema_bank_dw.dim_cliente dc
      ON dc.cod_cliente = o.cod_cliente
     AND o.data_dia BETWEEN dc.valid_from AND dc.valid_to

    -- Agência (SCD2)
    JOIN suprema_bank_dw.dim_agencia da
      ON da.cod_agencia = o.cod_agencia
     AND o.data_dia BETWEEN da.valid_from AND da.valid_to

    -- Gerência (SCD2)
    JOIN suprema_bank_dw.dim_gerencia dg
      ON dg.cod_gerencia = o.cod_gerencia
     AND o.data_dia BETWEEN dg.valid_from AND dg.valid_to;

END$$

DELIMITER ;

-- Executando a carga da tabela de fato de transações para janeiro de 2020.

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_fato_transacoes('2020-01-01', '2020-01-31');
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Conferir o conteúdo da tabela de transações.

SELECT * FROM fato_transacoes;

-- Exemplo: Teste se houve algum elemento de qualquer dimensão que não tenha tido problema com a integridade referencial.

SELECT
    o.*,

    -- flags para enxergar rapidamente qual lookup falhou
    CASE WHEN dt.id_tempo          IS NULL THEN 1 ELSE 0 END AS falha_tempo,
    CASE WHEN dc.id_cliente        IS NULL THEN 1 ELSE 0 END AS falha_cliente,
    CASE WHEN da.id_agencia        IS NULL THEN 1 ELSE 0 END AS falha_agencia,
    CASE WHEN dg.id_gerencia       IS NULL THEN 1 ELSE 0 END AS falha_gerencia,
    CASE WHEN dtc.id_tipo_conta    IS NULL THEN 1 ELSE 0 END AS falha_tipo_conta,
    CASE WHEN dsc.id_status_conta  IS NULL THEN 1 ELSE 0 END AS falha_status_conta

FROM tmp_ods_transacoes o

LEFT JOIN suprema_bank_dw.dim_tempo dt
    ON dt.id_tempo = o.id_tempo_calc

LEFT JOIN suprema_bank_dw.dim_tipo_conta dtc
    ON dtc.cod_tipo_conta = o.cod_tipo_conta

LEFT JOIN suprema_bank_dw.dim_status_conta dsc
    ON dsc.cod_status_conta = o.cod_status_conta

LEFT JOIN suprema_bank_dw.dim_cliente dc
    ON dc.cod_cliente = o.cod_cliente
   AND o.data_dia BETWEEN dc.valid_from AND dc.valid_to

LEFT JOIN suprema_bank_dw.dim_agencia da
    ON da.cod_agencia = o.cod_agencia
   AND o.data_dia BETWEEN da.valid_from AND da.valid_to

LEFT JOIN suprema_bank_dw.dim_gerencia dg
    ON dg.cod_gerencia = o.cod_gerencia
   AND o.data_dia BETWEEN dg.valid_from AND dg.valid_to

WHERE
    dt.id_tempo IS NULL
 OR dc.id_cliente IS NULL
 OR da.id_agencia IS NULL
 OR dg.id_gerencia IS NULL
 OR dtc.id_tipo_conta IS NULL
 OR dsc.id_status_conta IS NULL;

-- Exemplo: Verificando os dados da dimensão tempo.

SELECT * FROM dim_tempo;

-- Exemplo: Carga para Fevereiro de 2020 sem atualizar a dimensão.

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_fato_transacoes('2020-02-01', '2020-02-29');
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Verificando os registros recusados após a carga de fevereiro de 2020.

SELECT
    o.*,

    -- flags para enxergar rapidamente qual lookup falhou
    CASE WHEN dt.id_tempo          IS NULL THEN 1 ELSE 0 END AS falha_tempo,
    CASE WHEN dc.id_cliente        IS NULL THEN 1 ELSE 0 END AS falha_cliente,
    CASE WHEN da.id_agencia        IS NULL THEN 1 ELSE 0 END AS falha_agencia,
    CASE WHEN dg.id_gerencia       IS NULL THEN 1 ELSE 0 END AS falha_gerencia,
    CASE WHEN dtc.id_tipo_conta    IS NULL THEN 1 ELSE 0 END AS falha_tipo_conta,
    CASE WHEN dsc.id_status_conta  IS NULL THEN 1 ELSE 0 END AS falha_status_conta

FROM tmp_ods_transacoes o

LEFT JOIN suprema_bank_dw.dim_tempo dt
    ON dt.id_tempo = o.id_tempo_calc

LEFT JOIN suprema_bank_dw.dim_tipo_conta dtc
    ON dtc.cod_tipo_conta = o.cod_tipo_conta

LEFT JOIN suprema_bank_dw.dim_status_conta dsc
    ON dsc.cod_status_conta = o.cod_status_conta

LEFT JOIN suprema_bank_dw.dim_cliente dc
    ON dc.cod_cliente = o.cod_cliente
   AND o.data_dia BETWEEN dc.valid_from AND dc.valid_to

LEFT JOIN suprema_bank_dw.dim_agencia da
    ON da.cod_agencia = o.cod_agencia
   AND o.data_dia BETWEEN da.valid_from AND da.valid_to

LEFT JOIN suprema_bank_dw.dim_gerencia dg
    ON dg.cod_gerencia = o.cod_gerencia
   AND o.data_dia BETWEEN dg.valid_from AND dg.valid_to

WHERE
    dt.id_tempo IS NULL
 OR dc.id_cliente IS NULL
 OR da.id_agencia IS NULL
 OR dg.id_gerencia IS NULL
 OR dtc.id_tipo_conta IS NULL
 OR dsc.id_status_conta IS NULL;

