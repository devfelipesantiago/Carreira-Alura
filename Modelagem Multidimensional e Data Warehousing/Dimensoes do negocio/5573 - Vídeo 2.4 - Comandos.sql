
-- Exemplo: Criação da tabela de fato de transações

CREATE TABLE fato_transacoes (
    -- Chave da fato (surrogate key da transação no DW)
    id_fato_transacao BIGINT AUTO_INCREMENT PRIMARY KEY,

    -- Chaves estrangeiras para as dimensões
    id_tempo        INT         NOT NULL,  -- FK dim_tempo(id_tempo)
    id_cliente      INT         NOT NULL,  -- FK dim_cliente(id_cliente)
    id_agencia      INT         NOT NULL,  -- FK dim_agencia(id_agencia)
    id_gerencia     INT         NOT NULL,  -- FK dim_gerencia(id_gerencia)
    id_tipo_conta   INT         NOT NULL,  -- FK dim_tipo_conta(id_tipo_conta)
    id_status_conta INT         NOT NULL,  -- FK dim_status_conta(id_status_conta)

    -- Atributos "degenerados" (detalhes da transação)
    num_conta_operacional VARCHAR(20),     -- vem de contas.numero_conta
    tipo_transacao        VARCHAR(30),     -- vem de transacoes.tipo (ENUM)
    origem_transacao      VARCHAR(30),     -- se você tiver essa info na fonte
    descricao_transacao   VARCHAR(200),    -- opcional, texto da transação

    -- MEDIDAS / INDICADORES
    -- 1) Contagem de transações (sempre 1 por linha)
    qtd_transacoes   INT           NOT NULL DEFAULT 1,

    -- 2) Valor original da transação (com sinal ou sempre positivo)
    valor_transacao  DECIMAL(15,2) NOT NULL,

    -- 3) Quebra em crédito x débito e saldo (preenchido no ETL)
    valor_credito    DECIMAL(15,2) NOT NULL DEFAULT 0,
    valor_debito     DECIMAL(15,2) NOT NULL DEFAULT 0,
    saldo_liquido    DECIMAL(15,2) NOT NULL DEFAULT 0,

    -- Metadados de carga (opcionais, mas úteis)
    data_carga       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fonte_sistema    VARCHAR(50)   NULL
);

-- Exemplo: Criação das chaves estrangeiras da primeira tabela de fato.

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_tempo
        FOREIGN KEY (id_tempo)
        REFERENCES dim_tempo(id_tempo);

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES dim_cliente(id_cliente);

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_agencia
        FOREIGN KEY (id_agencia)
        REFERENCES dim_agencia(id_agencia);

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_gerencia
        FOREIGN KEY (id_gerencia)
        REFERENCES dim_gerencia(id_gerencia);

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_tipo_conta
        FOREIGN KEY (id_tipo_conta)
        REFERENCES dim_tipo_conta(id_tipo_conta);

ALTER TABLE fato_transacoes
    ADD CONSTRAINT fk_fato_transacoes_status_conta
        FOREIGN KEY (id_status_conta)
        REFERENCES dim_status_conta(id_status_conta);

-- Exemplo: Criação da tabela de fato de engajamento de cliente

CREATE TABLE fato_engajamento_cliente (
    id_fato_engajamento    BIGINT AUTO_INCREMENT PRIMARY KEY,

    -- Dimensões
    id_cliente             INT NOT NULL,   -- FK dim_cliente(id_cliente)
    id_tempo               INT NOT NULL,   -- FK dim_tempo(id_tempo) representando o mês (ex: 1º dia do mês)

    -- Medidas
    qtd_transacoes_cliente INT            NOT NULL,
    valor_total_cliente    DECIMAL(15,2)  NOT NULL,
    ticket_medio_cliente   DECIMAL(15,2)  NOT NULL,

    -- Metadados de carga (opcional)
    data_carga             DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Exemplo: Criação das chaves estrangeiras da segunda tabela de fato.

ALTER TABLE fato_engajamento_cliente
    ADD CONSTRAINT fk_fato_eng_cli_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES dim_cliente(id_cliente);

ALTER TABLE fato_engajamento_cliente
    ADD CONSTRAINT fk_fato_eng_cli_tempo
        FOREIGN KEY (id_tempo)
        REFERENCES dim_tempo(id_tempo);

-- Exemplo: Criação da terceira tabela de fato de performance das agencias.

CREATE TABLE fato_performance_agencia (
    id_fato_performance   BIGINT AUTO_INCREMENT PRIMARY KEY,

    -- Dimensões
    id_tempo              INT NOT NULL,          -- mês (1º dia), FK dim_tempo
    id_agencia            INT NOT NULL,          -- FK dim_agencia
    id_gerencia           INT NOT NULL,          -- FK dim_gerencia

    -- Medidas
    qtd_transacoes        INT           NOT NULL,  -- número de transações no período
    valor_total_mov       DECIMAL(15,2) NOT NULL,  -- valor total movimentado
    valor_tarifas         DECIMAL(15,2) NOT NULL,  -- total de tarifas no período

    -- Metadados de carga (opcional)
    data_carga            DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Exemplo: Criação das chaves estrangeiras da terceira tabela de fato.

ALTER TABLE fato_performance_agencia
    ADD CONSTRAINT fk_perf_agencia_tempo
        FOREIGN KEY (id_tempo)
        REFERENCES dim_tempo(id_tempo);

ALTER TABLE fato_performance_agencia
    ADD CONSTRAINT fk_perf_agencia_agencia
        FOREIGN KEY (id_agencia)
        REFERENCES dim_agencia(id_agencia);

ALTER TABLE fato_performance_agencia
    ADD CONSTRAINT fk_perf_agencia_gerencia
        FOREIGN KEY (id_gerencia)
        REFERENCES dim_gerencia(id_gerencia);

