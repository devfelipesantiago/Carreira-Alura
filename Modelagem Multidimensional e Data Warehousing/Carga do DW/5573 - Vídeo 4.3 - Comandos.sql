
-- Exemplo: Consulta dos dados da fonte para a tabela de fato de engajamento de cliente.

SELECT
    c.cod_cliente,
    DATE(t.data_transacao) AS data_transacao,
    COUNT(*)               AS qtd_transacoes,
    SUM(t.valor)           AS valor_transacao,
    SUM(t.valor) / COUNT(*) AS ticket_medio_cliente,
    NOW()                  AS data_carga
FROM suprema_bank_db.transacoes AS t
INNER JOIN suprema_bank_db.contas AS c
    ON t.cod_conta = c.cod_conta
WHERE t.data_transacao >= '2020-01-01'
  AND t.data_transacao <=  '2020-01-31'
GROUP BY
    c.cod_cliente,
    DATE(t.data_transacao);

-- Exemplo: Procedure para carga dos dados na fato de engajamento de clientes

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_fato_engajamento_cliente;
DELIMITER $$

CREATE PROCEDURE prc_carga_fato_engajamento_cliente(
    IN p_data_inicio DATE,
    IN p_data_fim    DATE
)
BEGIN
    DECLARE v_data_fim_excl DATETIME;

    SET v_data_fim_excl = DATE_ADD(p_data_fim, INTERVAL 1 DAY);

    -- (1) EXCLUI POR PERÍODO
    DELETE f
    FROM suprema_bank_dw.fato_engajamento_cliente f
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = f.id_tempo
    WHERE dt.data_completa >= p_data_inicio
      AND dt.data_completa <= p_data_fim;

    -- (2) ODS TEMP
    DROP TEMPORARY TABLE IF EXISTS tmp_ods_engajamento_cliente;

    CREATE TEMPORARY TABLE tmp_ods_engajamento_cliente (
        cod_cliente           VARCHAR(50) NOT NULL,
        data_transacao        DATE        NOT NULL,
        qtd_transacoes        INT         NOT NULL,
        valor_transacao       DECIMAL(15,2) NOT NULL,
        ticket_medio_cliente  DECIMAL(15,2) NOT NULL,
        data_carga            DATETIME    NOT NULL,
        KEY ix_ods_data (data_transacao),
        KEY ix_ods_cliente (cod_cliente)
    ) ENGINE=MEMORY;

    -- (3) CARREGA ODS
    INSERT INTO tmp_ods_engajamento_cliente
    (
        cod_cliente,
        data_transacao,
        qtd_transacoes,
        valor_transacao,
        ticket_medio_cliente,
        data_carga
    )
    SELECT
        c.cod_cliente,
        DATE(t.data_transacao) AS data_transacao,
        COUNT(*)               AS qtd_transacoes,
        SUM(t.valor)           AS valor_transacao,
        SUM(t.valor) / COUNT(*) AS ticket_medio_cliente,
        NOW()                  AS data_carga
    FROM suprema_bank_db.transacoes t
    JOIN suprema_bank_db.contas c
      ON t.cod_conta = c.cod_conta
    WHERE t.data_transacao >= p_data_inicio
      AND t.data_transacao <  v_data_fim_excl
    GROUP BY
        c.cod_cliente,
        DATE(t.data_transacao);

    -- (4) INSERE NA FATO (LOOKUP: Tempo SCD1 + Cliente SCD2)
    INSERT INTO suprema_bank_dw.fato_engajamento_cliente
    (
        id_tempo,
        id_cliente,
        qtd_transacoes_cliente,  
        valor_total_cliente,
        ticket_medio_cliente,
        data_carga
    )
    SELECT
        dt.id_tempo,
        dc.id_cliente,
        o.qtd_transacoes,
        o.valor_transacao,
        o.ticket_medio_cliente,
        o.data_carga
    FROM tmp_ods_engajamento_cliente o
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = CAST(DATE_FORMAT(o.data_transacao, '%Y%m%d') AS SIGNED)
    JOIN suprema_bank_dw.dim_cliente dc
      ON dc.cod_cliente = o.cod_cliente
     AND o.data_transacao BETWEEN dc.valid_from AND dc.valid_to;

END$$
DELIMITER ;

-- Exemplo: Execução da carga da tabela de fato de engajamento de clientes.

SELECT * FROM fato_engajamento_cliente;
SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_fato_engajamento_cliente('2020-01-01', '2020-01-31');
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Checar quantas linhas entraram na fato e o intervalo de datas.

SELECT
    MIN(dt.data_completa) AS inicio,
    MAX(dt.data_completa) AS fim,
    COUNT(*)              AS linhas
FROM suprema_bank_dw.fato_engajamento_cliente f
JOIN suprema_bank_dw.dim_tempo dt
  ON dt.id_tempo = f.id_tempo;

-- Exemplo: Identifica se o Lookup falhou na carga da tabela de fato de engajamento de clientes.

SELECT
    o.*,

    -- flags para identificar rapidamente onde o lookup falhou
    CASE WHEN dt.id_tempo   IS NULL THEN 1 ELSE 0 END AS falha_tempo,
    CASE WHEN dc.id_cliente IS NULL THEN 1 ELSE 0 END AS falha_cliente

FROM tmp_ods_engajamento_cliente o

-- Dimensão Tempo (SCD Tipo 1)
LEFT JOIN suprema_bank_dw.dim_tempo dt
    ON dt.id_tempo = CAST(DATE_FORMAT(o.data_transacao, '%Y%m%d') AS SIGNED)

-- Dimensão Cliente (SCD Tipo 2)
LEFT JOIN suprema_bank_dw.dim_cliente dc
    ON dc.cod_cliente = o.cod_cliente
   AND o.data_transacao BETWEEN dc.valid_from AND dc.valid_to

WHERE
    dt.id_tempo IS NULL
 OR dc.id_cliente IS NULL;

-- Exemplo: Consulta para buscar dados da fote para a fato de performance da agencia.

SELECT
    c.cod_agencia,
    c.cod_gerente,
    DATE(t.data_transacao) AS data_transacao,

    COUNT(*) AS qtd_transacoes,
    SUM(t.valor) AS valor_transacao,

    SUM(
        CASE 
            WHEN t.descricao = 'Tarifa bancária' 
            THEN t.valor 
            ELSE 0 
        END
    ) AS valor_tarifas,

    NOW() AS data_carga
FROM suprema_bank_db.transacoes AS t
INNER JOIN suprema_bank_db.contas AS c
    ON t.cod_conta = c.cod_conta
WHERE t.data_transacao >= '2020-01-01'
  AND t.data_transacao <= '2020-01-31'
GROUP BY
    c.cod_agencia,
    c.cod_gerente,
    DATE(t.data_transacao);

-- Exemplos: Criação de stored procedure para carga de dados na fato de performance das agencias.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_fato_performance_agencia;
DELIMITER $$

CREATE PROCEDURE prc_carga_fato_performance_agencia(
    IN p_data_inicio DATE,
    IN p_data_fim    DATE
)
BEGIN
    DECLARE v_data_fim_excl DATETIME;

    -- fim exclusivo: cobre o último dia inteiro
    SET v_data_fim_excl = DATE_ADD(p_data_fim, INTERVAL 1 DAY);

    /* =========================================================
       (1) EXCLUI DADOS DO PERÍODO NA FATO (via JOIN dim_tempo)
       ========================================================= */
    DELETE f
    FROM suprema_bank_dw.fato_performance_agencia f
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = f.id_tempo
    WHERE dt.data_completa >= p_data_inicio
      AND dt.data_completa <= p_data_fim;

    /* =========================================================
       (2) ODS TEMPORÁRIA
       ========================================================= */
    DROP TEMPORARY TABLE IF EXISTS tmp_ods_performance_agencia;

    CREATE TEMPORARY TABLE tmp_ods_performance_agencia (
        cod_agencia      VARCHAR(50) NOT NULL,
        cod_gerencia     VARCHAR(50) NOT NULL,
        data_transacao   DATE        NOT NULL,
        qtd_transacoes   INT         NOT NULL,
        valor_transacao  DECIMAL(15,2) NOT NULL,
        valor_tarifas    DECIMAL(15,2) NOT NULL,
        data_carga       DATETIME    NOT NULL,
        KEY ix_ods_data (data_transacao),
        KEY ix_ods_agencia (cod_agencia),
        KEY ix_ods_gerencia (cod_gerencia)
    ) ENGINE=MEMORY;

    /* =========================================================
       (3) CARREGA ODS A PARTIR DA FONTE (agência x gerente x dia)
       ========================================================= */
    INSERT INTO tmp_ods_performance_agencia
    (
        cod_agencia,
        cod_gerencia,
        data_transacao,
        qtd_transacoes,
        valor_transacao,
        valor_tarifas,
        data_carga
    )
    SELECT
        c.cod_agencia,
        c.cod_gerente AS cod_gerencia,
        DATE(t.data_transacao) AS data_transacao,
        COUNT(*) AS qtd_transacoes,
        SUM(t.valor) AS valor_transacao,
        SUM(CASE WHEN t.descricao = 'Tarifa bancária' THEN t.valor ELSE 0 END) AS valor_tarifas,
        NOW() AS data_carga
    FROM suprema_bank_db.transacoes AS t
    INNER JOIN suprema_bank_db.contas AS c
        ON t.cod_conta = c.cod_conta
    WHERE t.data_transacao >= p_data_inicio
      AND t.data_transacao <  v_data_fim_excl
    GROUP BY
        c.cod_agencia,
        c.cod_gerente,
        DATE(t.data_transacao);

    /* =========================================================
       (4) INSERE NA FATO FINAL COM LOOKUPS (SCD1 + SCD2)
       ========================================================= */
    INSERT INTO suprema_bank_dw.fato_performance_agencia
    (
        id_tempo,
        id_agencia,
        id_gerencia,
        qtd_transacoes,
        valor_total_mov,
        valor_tarifas,
        data_carga
    )
    SELECT
        dt.id_tempo,
        da.id_agencia,
        dg.id_gerencia,
        o.qtd_transacoes,
        o.valor_transacao as valor_total_mov,
        o.valor_tarifas,
        o.data_carga
    FROM tmp_ods_performance_agencia o

    -- Tempo (SCD1)
    JOIN suprema_bank_dw.dim_tempo dt
      ON dt.id_tempo = CAST(DATE_FORMAT(o.data_transacao, '%Y%m%d') AS SIGNED)

    -- Agência (SCD2)
    JOIN suprema_bank_dw.dim_agencia da
      ON da.cod_agencia = o.cod_agencia
     AND o.data_transacao BETWEEN da.valid_from AND da.valid_to

    -- Gerência (SCD2)
    JOIN suprema_bank_dw.dim_gerencia dg
      ON dg.cod_gerencia = o.cod_gerencia
     AND o.data_transacao BETWEEN dg.valid_from AND dg.valid_to;

END$$

DELIMITER ;

-- Exemplo: Executando a carga da tabela de fato de performance de agencias.

SELECT * FROM fato_performance_agencia;
SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_fato_performance_agencia('2020-01-01', '2020-01-31');
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Consulta para determinar se houve falha no lookup para a carga da tabela de fato de performance de agencias.

SELECT
    o.*,
    CASE WHEN dt.id_tempo    IS NULL THEN 1 ELSE 0 END AS falha_tempo,
    CASE WHEN da.id_agencia  IS NULL THEN 1 ELSE 0 END AS falha_agencia,
    CASE WHEN dg.id_gerencia IS NULL THEN 1 ELSE 0 END AS falha_gerencia
FROM tmp_ods_performance_agencia o
LEFT JOIN suprema_bank_dw.dim_tempo dt
  ON dt.id_tempo = CAST(DATE_FORMAT(o.data_transacao, '%Y%m%d') AS SIGNED)
LEFT JOIN suprema_bank_dw.dim_agencia da
  ON da.cod_agencia = o.cod_agencia
 AND o.data_transacao BETWEEN da.valid_from AND da.valid_to
LEFT JOIN suprema_bank_dw.dim_gerencia dg
  ON dg.cod_gerencia = o.cod_gerencia
 AND o.data_transacao BETWEEN dg.valid_from AND dg.valid_to
WHERE dt.id_tempo IS NULL
   OR da.id_agencia IS NULL
   OR dg.id_gerencia IS NULL;








