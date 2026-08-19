
-- Exemplo: Criação da procedure para carga completa do DW.

DROP PROCEDURE IF EXISTS prc_carga_completa_dw;
DELIMITER $$

CREATE PROCEDURE prc_carga_completa_dw(
    IN p_data_inicio DATE,
    IN p_data_fim    DATE
)
BEGIN
    -- Desabilita SAFE UPDATES para evitar bloqueios no Workbench
    SET SQL_SAFE_UPDATES = 0;

    /* =========================
       DIMENSÕES
       ========================= */
    CALL prc_carga_dim_agencia_scd2();
    CALL prc_carga_dim_cliente_scd2();
    CALL prc_carga_dim_gerencia_scd2();
    CALL prc_upsert_dim_status_conta_scd1();
    CALL prc_upsert_dim_tipo_conta();

    /* =========================
       DIMENSÃO TEMPO
       ========================= */
    CALL prc_popula_dim_tempo(p_data_inicio, p_data_fim);

    /* =========================
       FATOS
       ========================= */
    CALL prc_carga_fato_transacoes(p_data_inicio, p_data_fim);
    CALL prc_carga_fato_engajamento_cliente(p_data_inicio, p_data_fim);
    CALL prc_carga_fato_performance_agencia(p_data_inicio, p_data_fim);

    -- Reabilita SAFE UPDATES
    SET SQL_SAFE_UPDATES = 1;
END$$

DELIMITER ;

-- Exemplo: Executando a carga do ano de 2020.

CALL prc_carga_completa_dw('2020-01-01', '2020-12-31');
SELECT DISTINCT id_tempo FROM fato_transacoes
ORDER BY id_tempo;

-- Exemplo: Executando a carga do ano de 2020 a 2024.

CALL prc_carga_completa_dw('2020-01-01', '2024-12-31');
SELECT MIN(id_tempo), MAX(id_tempo) FROM fato_transacoes;

