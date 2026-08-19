
-- Exemplo: Verificando a menor e maior data.

SELECT
  MIN(data_transacao) AS menor_data,
  MAX(data_transacao) AS maior_data
FROM suprema_bank_db.transacoes;

-- Exemplo: Alterando o código original da SP prc_popula_dim_tempo para não dar erro de PK.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_popula_dim_tempo;
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
            CAST(DATE_FORMAT(v_data, '%Y%m%d') AS SIGNED),
            v_data,
            YEAR(v_data),
            MONTH(v_data),
            MONTHNAME(v_data),
            DAY(v_data),
            DAYNAME(v_data),
            DAYOFWEEK(v_data),
            WEEK(v_data, 3),
            QUARTER(v_data),
            IF(QUARTER(v_data) IN (1,2), 1, 2),
            IF(v_data = LAST_DAY(v_data), 1, 0),
            IF(DAYOFWEEK(v_data) IN (1,7), 0, 1)
        )
        ON DUPLICATE KEY UPDATE
            -- Dimensão Tempo é SCD Tipo 1: se existir, apenas sobrescreve/garante consistência
            data_completa     = VALUES(data_completa),
            ano               = VALUES(ano),
            mes               = VALUES(mes),
            nome_mes          = VALUES(nome_mes),
            dia_mes           = VALUES(dia_mes),
            nome_dia_semana   = VALUES(nome_dia_semana),
            dia_semana_num    = VALUES(dia_semana_num),
            semana_ano        = VALUES(semana_ano),
            trimestre         = VALUES(trimestre),
            semestre          = VALUES(semestre),
            eh_fim_de_mes     = VALUES(eh_fim_de_mes),
            eh_dia_util       = VALUES(eh_dia_util);

        SET v_data = DATE_ADD(v_data, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

-- Exemplo: Apagando dados da dimensão para carregar novamente.

USE suprema_bank_dw;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM dim_tempo;
SET SQL_SAFE_UPDATES = 1;


-- Exemplo: Caso queria recriar a dimensão tempo com a menor e mairo data da fonte. Não usaremos aqui no curso.

/*
-- Garante que estamos no schema do DW
USE suprema_bank_dw;

-- 1) Declara variáveis para armazenar as datas
SET @dt_inicio = NULL;
SET @dt_fim    = NULL;

-- 2) Descobre a menor e a maior data da tabela de transações (fonte)
SELECT
    MIN(DATE(data_transacao)) AS menor_data,
    MAX(DATE(data_transacao)) AS maior_data
INTO
    @dt_inicio,
    @dt_fim
FROM suprema_bank_db.transacoes;

-- (Opcional) Verifica os valores encontrados
SELECT @dt_inicio AS data_inicio, @dt_fim AS data_fim;

-- 3) Chama a procedure da Dimensão Tempo usando essas datas
CALL suprema_bank_dw.prc_popula_dim_tempo(@dt_inicio, @dt_fim);
*/

-- Exemplo: Usando apenas o primeiro mês do histórico verificado na fonte. Apenas para fins didáticos.

USE suprema_bank_dw;

-- 1) Declara variáveis para armazenar as datas
SET @dt_inicio = '2020-01-15';
SET @dt_fim    = '2020-01-31';

-- 2) Chama a procedure da Dimensão Tempo usando essas datas
CALL suprema_bank_dw.prc_popula_dim_tempo(@dt_inicio, @dt_fim);

-- Exemplo: Validando os dados carregados.

SELECT MIN(data_completa) AS inicio, MAX(data_completa) AS fim, COUNT(*) AS qtd_dias
FROM suprema_bank_dw.dim_tempo;
