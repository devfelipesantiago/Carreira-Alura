
-- Exemplo: Criação da tabela da dimensão tempo

CREATE TABLE dim_tempo (
    id_tempo          INT PRIMARY KEY,    -- Surrogate key no formato YYYYMMDD
    data_completa     DATE NOT NULL,      -- A data em si
    ano               INT NOT NULL,
    mes               TINYINT NOT NULL,
    nome_mes          VARCHAR(20) NOT NULL,
    dia_mes           TINYINT NOT NULL,
    nome_dia_semana   VARCHAR(20) NOT NULL,
    dia_semana_num    TINYINT NOT NULL,   -- 1 a 7 (dependendo da config do MySQL)
    semana_ano        TINYINT NOT NULL,
    trimestre         TINYINT NOT NULL,
    semestre          TINYINT NOT NULL,
    eh_fim_de_mes     TINYINT(1) NOT NULL, -- 1 = sim, 0 = não
    eh_dia_util       TINYINT(1) NOT NULL  -- 1 = dia útil, 0 = fim de semana (feriado deixamos para depois)
);

-- Exemplo: Funções de tempo do MySQL

-- YEAR(data) → ano
-- MONTH(data) → número do mês
-- MONTHNAME(data) → nome do mês
-- DAY(data) → dia do mês
-- DAYNAME(data) → nome do dia da semana
-- WEEK(data) → semana do ano
-- QUARTER(data) → trimestre
-- LAST_DAY(data) → último dia do mês
-- DAYOFWEEK(data) → número do dia da semana
-- DATE_ADD(data, INTERVAL 1 DAY) → soma um dia
-- DATE_FORMAT(data, '%Y%m%d') → nossa surrogate key no formato YYYYMMDD

-- Exemplo: Teste para mostrar a execução das funções do tempo no MySQL

SELECT
    '2025-03-15'                         AS data_exemplo,
    YEAR('2025-03-15')                   AS ano,
    MONTH('2025-03-15')                  AS mes,
    MONTHNAME('2025-03-15')              AS nome_mes,
    DAY('2025-03-15')                    AS dia_mes,
    DAYNAME('2025-03-15')                AS nome_dia_semana,
    DAYOFWEEK('2025-03-15')              AS dia_semana_num,
    WEEK('2025-03-15')                   AS semana_ano,
    QUARTER('2025-03-15')                AS trimestre,
    LAST_DAY('2025-03-15')               AS ultimo_dia_mes,
    DATE_FORMAT('2025-03-15', '%Y%m%d')  AS id_tempo;

-- Significado do Surrugate Key

-- 20250101 → 1º de janeiro de 2025
-- 20251231 → 31 de dezembro de 2025

-- Exemplo: Procedure para atualizar a dimensão Tempo.

DELIMITER $$

CREATE PROCEDURE prc_popula_dim_tempo (
    IN p_data_inicio DATE,
    IN p_data_fim    DATE
)
BEGIN
    DECLARE v_data DATE;

    SET v_data = p_data_inicio;

    WHILE v_data <= p_data_fim DO

        INSERT INTO dim_tempo (
            id_tempo,
            data_completa,
            ano,
            mes,
            nome_mes,
            dia_mes,
            nome_dia_semana,
            dia_semana_num,
            semana_ano,
            trimestre,
            semestre,
            eh_fim_de_mes,
            eh_dia_util
        )
        VALUES (
            -- surrogate key YYYYMMDD
            CAST(DATE_FORMAT(v_data, '%Y%m%d') AS SIGNED),
            v_data,
            YEAR(v_data),
            MONTH(v_data),
            MONTHNAME(v_data),
            DAY(v_data),
            DAYNAME(v_data),
            DAYOFWEEK(v_data),
            WEEK(v_data, 3),  -- modo 3: ISO-like (segunda como primeiro dia)
            QUARTER(v_data),
            IF(QUARTER(v_data) IN (1,2), 1, 2), -- semestre 1 ou 2
            IF(v_data = LAST_DAY(v_data), 1, 0), -- eh_fim_de_mes
            -- eh_dia_util: 1 se não for sábado (7) nem domingo (1) no padrão MySQL
            IF(DAYOFWEEK(v_data) IN (1,7), 0, 1)
        );

        SET v_data = DATE_ADD(v_data, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

-- Exemplo: Executando a procedure.

CALL prc_popula_dim_tempo('2020-01-01', '2030-12-31');

-- Exemplo: Conferir o conteúdo da tabela.

SELECT 
    id_tempo,
    data_completa,
    ano,
    mes,
    nome_mes,
    dia_mes,
    nome_dia_semana,
    semana_ano,
    trimestre,
    semestre,
    eh_fim_de_mes,
    eh_dia_util
FROM dim_tempo
ORDER BY data_completa DESC 
LIMIT 20;




