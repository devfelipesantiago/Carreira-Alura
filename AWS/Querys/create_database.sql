-- Tabela de Clientes
-- Nome legado: ERP_HP_CLIE (Head de Pessoa - Cliente)
CREATE TABLE IF NOT EXISTS erp_hp_clie (
    cod_clie        SERIAL PRIMARY KEY,         -- ID do cliente
    nm_clie         VARCHAR(200),               -- nome do cliente
    ds_email        VARCHAR(200),               -- email
    nr_cpfcnpj      VARCHAR(20),                -- cpf ou cnpj
    tp_pessoa       CHAR(1),                    -- F-física, J-jurídica
    dt_cad          VARCHAR(20),                -- data de cadastro (armazenada como texto!)
    cd_uf           CHAR(2),                    -- estado
    nm_cidade       VARCHAR(100),               -- cidade
    st_ativo        INTEGER DEFAULT 1           -- 1-ativo, 0-inativo
);

-- Tabela de Produtos
-- Nome legado: ERP_IT_PROD (Item de Produto)
CREATE TABLE IF NOT EXISTS erp_it_prod (
    cod_prod        SERIAL PRIMARY KEY,
    ds_prod         VARCHAR(300),               -- descrição do produto
    cd_categ        VARCHAR(50),                -- código da categoria
    ds_categ        VARCHAR(100),               -- descrição da categoria
    vl_preco        NUMERIC(12,2),              -- preço unitário
    vl_custo        NUMERIC(12,2),              -- custo unitário
    qt_estq         INTEGER,                    -- quantidade em estoque
    cd_sku          VARCHAR(50),                -- SKU
    dt_cad          VARCHAR(20),                -- data de cadastro (texto!)
    st_ativo        INTEGER DEFAULT 1           -- 1-ativo, 0-inativo
);

-- Tabela de Pedidos (Cabeçalho)
-- Nome legado: ERP_OV_CABE (Ordem de Venda - Cabeçalho)
CREATE TABLE IF NOT EXISTS erp_ov_cabe (
    nr_ov           SERIAL PRIMARY KEY,
    cod_clie        INTEGER REFERENCES erp_hp_clie(cod_clie),
    dt_ov           VARCHAR(20),                -- data do pedido (texto!)
    vl_tot          NUMERIC(12,2),              -- valor total
    vl_desc         NUMERIC(12,2) DEFAULT 0,    -- valor desconto
    vl_frete        NUMERIC(12,2),              -- valor frete
    cd_status       VARCHAR(20),                -- status (PAGO, CANCELADO, PENDENTE, DEVOLVIDO)
    cd_canal        VARCHAR(50),                -- canal de venda
    cd_pgto         VARCHAR(50),                -- forma de pagamento
    dt_pgto         VARCHAR(20),                -- data pagamento (texto!)
    nr_parcelas     INTEGER DEFAULT 1           -- numero de parcelas
);

-- Tabela de Itens do Pedido
-- Nome legado: ERP_OV_ITEM (Ordem de Venda - Item)
CREATE TABLE IF NOT EXISTS erp_ov_item (
    id_item         SERIAL PRIMARY KEY,
    nr_ov           INTEGER REFERENCES erp_ov_cabe(nr_ov),
    cod_prod        INTEGER REFERENCES erp_it_prod(cod_prod),
    qt_item         INTEGER,                    -- quantidade
    vl_unit         NUMERIC(12,2),              -- valor unitário no momento da venda
    vl_tot_item     NUMERIC(12,2),              -- valor total do item
    vl_desc_item    NUMERIC(12,2) DEFAULT 0,    -- desconto do item
    nr_seq          INTEGER                     -- sequencia do item no pedido
);

-- Tabela de Pagamentos
-- Nome legado: ERP_FN_PGTO (Financeiro - Pagamento)
CREATE TABLE IF NOT EXISTS erp_fn_pgto (
    id_pgto         SERIAL PRIMARY KEY,
    nr_ov           INTEGER REFERENCES erp_ov_cabe(nr_ov),
    cd_pgto         VARCHAR(50),                -- tipo (PIX, CARTAO_CREDITO, BOLETO, CARTAO_DEBITO)
    vl_pgto         NUMERIC(12,2),              -- valor pago
    dt_pgto         VARCHAR(20),                -- data pagamento (texto!)
    cd_status_pgto  VARCHAR(100),               -- APROVADO, RECUSADO, PENDENTE, ESTORNADO
    cd_nsu          VARCHAR(100),               -- NSU da transação
    nr_parcela      INTEGER DEFAULT 1           -- parcela atual
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_ov_cabe_clie ON erp_ov_cabe(cod_clie);
CREATE INDEX IF NOT EXISTS idx_ov_cabe_dt ON erp_ov_cabe(dt_ov);
CREATE INDEX IF NOT EXISTS idx_ov_item_ov ON erp_ov_item(nr_ov);
CREATE INDEX IF NOT EXISTS idx_ov_item_prod ON erp_ov_item(cod_prod);
CREATE INDEX IF NOT EXISTS idx_fn_pgto_ov ON erp_fn_pgto(nr_ov);