# Modelagem da Camada Gold — Alumart Data Lake

Este documento detalha o reconhecimento dos dados da camada **Silver**, a arquitetura dimensional em **Star Schema** proposta para a camada **Gold**, o diagrama de linhagem, os scripts **CTAS (Presto SQL / AWS Athena)** e as consultas analíticas para responder às 7 perguntas de negócio fundamentais da **Lumarte**.

---

## 1. Passo 1 — Reconhecimento dos Dados (Camada Silver)

A inspeção detalhada das tabelas Silver resultou no seguinte mapeamento de esquemas, cardinalidades, domínios e regras de qualidade herdadas da camada Silver:

### 1.1 `silver.clientes` (Origem: `erp_hp_clie`)

- **Granularidade**: 1 registro por cliente cadastrado.
- **Chave Primária**: `cod_clie` (Cardinalidade: ~50 clientes).
- **Colunas e Tipos**:
  - `cod_clie` (`BIGINT`): Identificador único do cliente.
  - `nm_clie` (`VARCHAR`): Nome completo ou razão social.
  - `ds_email` (`VARCHAR`): E-mail validado via regex (e-mails inválidos foram nulificados na Silver).
  - `nr_cpfcnpj` (`VARCHAR`): CPF/CNPJ padronizado apenas com dígitos (11 ou 14 caracteres).
  - `tp_pessoa` (`VARCHAR`): Tipo de pessoa (`'F'` = Física, `'J'` = Jurídica).
  - `dt_cad` (`TIMESTAMP`): Data e hora de cadastro do cliente convertida para timestamp.
  - `cd_uf` (`VARCHAR`): Sigla do Estado (ex: `'SP'`, `'RJ'`, `'MG'`).
  - `nm_cidade` (`VARCHAR`): Nome do município.
  - `st_ativo` (`BIGINT`): Status cadastral (`1` = Ativo, `0` = Inativo).

### 1.2 `silver.produtos` (Origem: `erp_it_prod`)
- **Granularidade**: 1 registro por produto/SKU do catálogo.
- **Chave Primária**: `cod_prod` (Cardinalidade: ~30 produtos).
- **Colunas e Tipos**:
  - `cod_prod` (`BIGINT`): Identificador único do produto.
  - `ds_prod` (`VARCHAR`): Descrição do produto.
  - `cd_categ` (`VARCHAR`): Código da categoria (`'ELET'`, `'MODA'`, `'ELED'`, `'LIVR'`, `'SAUD'`, `'CASA'`, `'ESPT'`).
  - `ds_categ` (`VARCHAR`): Descrição da categoria normalizada.
  - `vl_preco` (`DOUBLE`): Preço unitário de tabela/venda.
  - `vl_custo` (`DOUBLE`): Custo unitário de aquisição/fabricação.
  - `qt_estq` (`BIGINT`): Quantidade atual em estoque no ERP.
  - `cd_sku` (`VARCHAR`): Código SKU único do produto.
  - `dt_cad` (`TIMESTAMP`): Data de cadastro do produto.
  - `st_ativo` (`BIGINT`): Indicador se o produto está ativo para venda (`1` = Sim, `0` = Não).

### 1.3 `silver.pedidos` (Origem: `erp_ov_cabe`)
- **Granularidade**: 1 registro por ordem de venda (cabeçalho).
- **Chave Primária**: `nr_ov` (Cardinalidade: ~500 pedidos).
- **Particionamento Silver**: `year` (`BIGINT`), `month` (`BIGINT`) baseados em `dt_ov`.
- **Colunas e Tipos**:
  - `nr_ov` (`BIGINT`): Número da ordem de venda.
  - `cod_clie` (`BIGINT`): Chave estrangeira para `silver.clientes`.
  - `dt_ov` (`TIMESTAMP`): Data e hora da emissão da ordem de venda.
  - `vl_tot` (`DOUBLE`): Valor total bruto do pedido.
  - `vl_desc` (`DOUBLE`): Valor de desconto total no pedido.
  - `vl_frete` (`DOUBLE`): Valor total de frete cobrado no pedido.
  - `cd_status` (`VARCHAR`): Status normalizado do pedido. Valores distintos canônicos:
    - `'PAGO'` (~65% a 70% dos pedidos)
    - `'PENDENTE'`
    - `'CANCELADO'`
    - `'DEVOLVIDO'`
  - `cd_canal` (`VARCHAR`): Canal de venda normalizado. Valores distintos canônicos:
    - `'WEBSITE'`
    - `'APP_MOBILE'`
    - `'WHATSAPP'`
    - `'MARKETPLACE'`
    - `'INSTAGRAM'`
    - `'LOJA_FISICA'`
  - `cd_pgto` (`VARCHAR`): Forma principal de pagamento (`'PIX'`, `'CARTAO_CREDITO'`, `'BOLETO'`, `'CARTAO_DEBITO'`).
  - `dt_pgto` (`TIMESTAMP`): Data da confirmação do pagamento.
  - `nr_parcelas` (`BIGINT`): Número total de parcelas.
  - `fl_sem_pgto` (`BOOLEAN`): Flag cross-table gerada na Silver indicando pedidos com status `PAGO` sem registro correspondente em pagamentos.

### 1.4 `silver.itens_pedido` (Origem: `erp_ov_item`)
- **Granularidade**: 1 registro por item da ordem de venda.
- **Chave Primária**: Composta (`nr_ov`, `nr_seq`).
- **Colunas e Tipos**:
  - `id_item` (`BIGINT`): Identificador sequencial do item.
  - `nr_ov` (`BIGINT`): Chave estrangeira para `silver.pedidos`.
  - `cod_prod` (`BIGINT`): Chave estrangeira para `silver.produtos` (linhas órfãs/nulas foram removidas pelo `drop_null_fk` na Silver).
  - `qt_item` (`BIGINT`): Quantidade vendida do item (filtrado `qt_item != 0`).
  - `vl_unit` (`DOUBLE`): Preço unitário praticado na venda.
  - `vl_tot_item` (`DOUBLE`): Valor total registrado para a linha (`qt_item * vl_unit`).
  - `vl_desc_item` (`DOUBLE`): Desconto específico atribuído ao item.
  - `nr_seq` (`BIGINT`): Número de sequência do item dentro do pedido.
  - `fl_calc_inconsistente` (`BOOLEAN`): Flag de DQ indicando se `abs(vl_tot_item - (qt_item * vl_unit - vl_desc_item)) > 0.01`.
  - `fl_qt_negativa` (`BOOLEAN`): Flag de DQ indicando se `qt_item < 0`.

### 1.5 `silver.pagamentos` (Origem: `erp_fn_pgto`)
- **Granularidade**: 1 registro por parcela de pagamento liquidada ou processada.
- **Chave Primária**: `id_pgto` (Cardinalidade: ~800 parcelas).
- **Particionamento Silver**: `year` (`BIGINT`), `month` (`BIGINT`) baseados em `dt_pgto`.
- **Colunas e Tipos**:
  - `id_pgto` (`BIGINT`): Identificador único da transação de pagamento.
  - `nr_ov` (`BIGINT`): Chave estrangeira para `silver.pedidos`.
  - `cd_pgto` (`VARCHAR`): Método de pagamento normalizado (`'PIX'`, `'CARTAO_CREDITO'`, `'BOLETO'`, `'CARTAO_DEBITO'`).
  - `vl_pgto` (`DOUBLE`): Valor pago na parcela.
  - `dt_pgto` (`TIMESTAMP`): Data do pagamento.
  - `cd_status_pgto` (`VARCHAR`): Status da transação (`'APROVADO'`, `'PENDENTE'`, `'RECUSADO'`, `'ESTORNADO'`).
  - `cd_nsu` (`VARCHAR`): Número Sequencial Único da adquirente.
  - `nr_parcela` (`BIGINT`): Número da parcela atual.

---

## 2. Passo 2 — Modelagem Dimensional Gold (Star Schema)

A camada Gold foi estruturada segundo as melhores práticas de modelagem dimensional de Ralph Kimball, composta por **duas tabelas fato** e **quatro tabelas dimensão conformadas**, permitindo responder a todas as perguntas de negócio com alto desempenho e simplicidade analítica.

```
                  +-------------------+
                  |   dim_customers   |
                  +-------------------+
                            |
                            | (1:N)
+---------------+           v           +-------------------+
|   dim_date    | ---> fact_sales <--- |   dim_products    |
+---------------+           ^           +-------------------+
       |                    |                     |
       | (1:N)              | (1:N)               | (1:N)
       v                    |                     v
+----------------+          |           +-------------------+
| fact_inventory | <--------+           |   dim_channels    |
+----------------+                      +-------------------+
```

---

### 2.1 Tabela Fato: `gold.fact_sales`
- **Conceito de Negócio**: Registra cada linha de item faturado/pago com detalhamento de receita, custos e rateios de frete.
- **Granularidade**: **1 linha por item de pedido efetivamente pago** (`silver.pedidos.cd_status = 'PAGO'`).
- **Particionamento**: `order_year_month` (`VARCHAR`, ex: `'2024-06'`).

| Coluna                  | Tipo Presto/Athena | Descrição                                       | Origem Silver                               | Regra de Negócio / Cálculo                                                                 |
| ----------------------- | ------------------ | ----------------------------------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `sales_item_sk`         | `VARCHAR`          | Surrogate Key da linha da fato                  | Hash/Concat                                 | `CONCAT(CAST(i.nr_ov AS VARCHAR), '-', CAST(i.nr_seq AS VARCHAR))`                         |
| `order_id`              | `BIGINT`           | Número da Ordem de Venda (Degenerate Dimension) | `silver.pedidos.nr_ov`                      | Chave natural do pedido no ERP                                                             |
| `order_item_seq`        | `BIGINT`           | Sequencial do item no pedido                    | `silver.itens_pedido.nr_seq`                | Número de sequência do item                                                                |
| `order_date_key`        | `INTEGER`          | Chave de data do pedido (`YYYYMMDD`)            | `silver.pedidos.dt_ov`                      | `CAST(DATE_FORMAT(p.dt_ov, '%Y%m%d') AS INTEGER)`                                          |
| `payment_date_key`      | `INTEGER`          | Chave de data do pagamento (`YYYYMMDD`)         | `silver.pedidos.dt_pgto`                    | `CAST(DATE_FORMAT(COALESCE(p.dt_pgto, p.dt_ov), '%Y%m%d') AS INTEGER)`                     |
| `customer_key`          | `BIGINT`           | Chave da dimensão cliente                       | `silver.pedidos.cod_clie`                   | FK para `gold.dim_customers.customer_key`                                                  |
| `product_key`           | `BIGINT`           | Chave da dimensão produto                       | `silver.itens_pedido.cod_prod`              | FK para `gold.dim_products.product_key`                                                    |
| `channel_key`           | `VARCHAR`          | Chave da dimensão canal                         | `silver.pedidos.cd_canal`                   | FK para `gold.dim_channels.channel_key`                                                    |
| `payment_method_code`   | `VARCHAR`          | Código do meio de pagamento                     | `silver.pedidos.cd_pgto`                    | Método principal de pagamento                                                              |
| `quantity`              | `BIGINT`           | Quantidade de itens faturados                   | `silver.itens_pedido.qt_item`               | Quantidade vendida                                                                         |
| `unit_price`            | `DOUBLE`           | Preço unitário praticado na venda               | `silver.itens_pedido.vl_unit`               | Preço unitário no momento da venda                                                         |
| `unit_cost`             | `DOUBLE`           | Custo unitário de aquisição                     | `silver.produtos.vl_custo`                  | Custo de tabela do produto                                                                 |
| `gross_item_amount`     | `DOUBLE`           | Valor bruto do item                             | `silver.itens_pedido.vl_tot_item`           | Valor bruto registrado no ERP                                                              |
| `item_discount_amount`  | `DOUBLE`           | Valor de desconto aplicado no item              | `silver.itens_pedido.vl_desc_item`          | Desconto concedido                                                                         |
| `vl_receita_liquida`    | `DOUBLE`           | **Receita líquida da venda do item**            | Calculado                                   | `i.vl_tot_item - COALESCE(i.vl_desc_item, 0)`                                              |
| `vl_frete_rateado`      | `DOUBLE`           | **Frete rateado proporcionalmente por item**    | Calculado                                   | `COALESCE(p.vl_frete, 0.0) * (i.vl_tot_item / NULLIF(tot_ov.total_itens_ov, 0.0))`         |
| `total_cost_amount`     | `DOUBLE`           | Custo total dos itens vendidos                  | Calculado                                   | `i.qt_item * COALESCE(pr.vl_custo, 0.0)`                                                   |
| `gross_profit_amount`   | `DOUBLE`           | Lucro bruto antes do frete                      | Calculado                                   | `(i.vl_tot_item - COALESCE(i.vl_desc_item, 0)) - (i.qt_item * COALESCE(pr.vl_custo, 0.0))` |
| `fl_calc_inconsistente` | `BOOLEAN`          | Flag de DQ: cálculo divergente na origem        | `silver.itens_pedido.fl_calc_inconsistente` | Herdado do DQ Silver (~15% de casos com erro de cálculo no ERP)                            |
| `fl_sem_pgto`           | `BOOLEAN`          | Flag de DQ: pedido pago sem registro de PGTO    | `silver.pedidos.fl_sem_pgto`                | Herdado da Silver (Cross-table check)                                                      |
| `order_year_month`      | `VARCHAR`          | Coluna de partição (`YYYY-MM`)                  | `silver.pedidos.dt_ov`                      | `DATE_FORMAT(p.dt_ov, '%Y-%m')`                                                            |

---

### 2.2 Tabela Fato: `gold.fact_inventory`
- **Conceito de Negócio**: Tabela de snapshot periódico/diário da posição de estoque por produto, monitorando nível de abastecimento, capital imobilizado a custo e potencial de faturamento.
- **Granularidade**: **1 linha por produto por data de snapshot**.
- **Particionamento**: `snapshot_year_month` (`VARCHAR`, ex: `'2024-06'`).

| Coluna                  | Tipo Presto/Athena | Descrição                              | Origem Silver              | Regra de Negócio / Cálculo                                                                                |
| ----------------------- | ------------------ | -------------------------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------- |
| `inventory_sk`          | `VARCHAR`          | Surrogate Key da linha de snapshot     | Hash/Concat                | `CONCAT(CAST(DATE_FORMAT(CURRENT_DATE, '%Y%m%d') AS VARCHAR), '-', CAST(cod_prod AS VARCHAR))`            |
| `date_key`              | `INTEGER`          | Chave de data do snapshot (`YYYYMMDD`) | Sistema                    | `CAST(DATE_FORMAT(CURRENT_DATE, '%Y%m%d') AS INTEGER)`                                                    |
| `product_key`           | `BIGINT`           | Chave do produto                       | `silver.produtos.cod_prod` | FK para `gold.dim_products.product_key`                                                                   |
| `stock_quantity`        | `BIGINT`           | Quantidade física disponível           | `silver.produtos.qt_estq`  | Saldo de estoque em unidades                                                                              |
| `unit_cost`             | `DOUBLE`           | Custo unitário de reposição            | `silver.produtos.vl_custo` | Custo unitário de tabela                                                                                  |
| `unit_price`            | `DOUBLE`           | Preço de venda unitário de tabela      | `silver.produtos.vl_preco` | Preço de tabela                                                                                           |
| `stock_cost_amount`     | `DOUBLE`           | **Capital total imobilizado a custo**  | Calculado                  | `qt_estq * vl_custo`                                                                                      |
| `stock_sales_potential` | `DOUBLE`           | **Potencial de receita do estoque**    | Calculado                  | `qt_estq * vl_preco`                                                                                      |
| `stock_status`          | `VARCHAR`          | Classificação do nível de estoque      | Calculado                  | `CASE WHEN qt_estq <= 0 THEN 'ESGOTADO' WHEN qt_estq < 50 THEN 'ESTOQUE_BAIXO' ELSE 'ESTOQUE_NORMAL' END` |
| `is_product_active`     | `BOOLEAN`          | Indicador se produto está ativo        | `silver.produtos.st_ativo` | `CASE WHEN st_ativo = 1 THEN TRUE ELSE FALSE END`                                                         |
| `snapshot_date`         | `DATE`             | Data civil do snapshot                 | Sistema                    | `CURRENT_DATE`                                                                                            |
| `snapshot_year_month`   | `VARCHAR`          | Coluna de partição (`YYYY-MM`)         | Sistema                    | `DATE_FORMAT(CURRENT_DATE, '%Y-%m')`                                                                      |

---

### 2.3 Tabela Dimensão: `gold.dim_date`
- **Conceito de Negócio**: Calendário analítico com granularidade diária, enriquecido com atributos temporais essenciais para análises de sazonalidade, trimestres, meses e diferenciação entre dias úteis e finais de semana.
- **Granularidade**: **1 linha por dia civil** (cobre o período histórico de 2022 a 2026).

| Coluna           | Tipo Presto/Athena | Descrição                                         | Regra / Exemplo               |
| ---------------- | ------------------ | ------------------------------------------------- | ----------------------------- |
| `date_key`       | `INTEGER`          | Chave primária substituta no formato numérico     | `20240615`                    |
| `full_date`      | `DATE`             | Data completa ISO                                 | `2024-06-15`                  |
| `year_number`    | `INTEGER`          | Ano civil com 4 dígitos                           | `2024`                        |
| `quarter_number` | `INTEGER`          | Número do trimestre civil (1 a 4)                 | `2`                           |
| `quarter_name`   | `VARCHAR`          | Nome do trimestre                                 | `'T2'` ou `'2024-T2'`         |
| `month_number`   | `INTEGER`          | Número do mês (1 a 12)                            | `6`                           |
| `month_name`     | `VARCHAR`          | Nome do mês em português                          | `'Junho'`                     |
| `month_abbr`     | `VARCHAR`          | Sigla de 3 letras do mês                          | `'Jun'`                       |
| `year_month`     | `VARCHAR`          | Ano e mês formatados                              | `'2024-06'`                   |
| `week_of_year`   | `INTEGER`          | Semana do ano (1 a 53)                            | `24`                          |
| `day_of_month`   | `INTEGER`          | Dia do mês (1 a 31)                               | `15`                          |
| `day_of_week`    | `INTEGER`          | Dia da semana (1 = Segunda-feira ... 7 = Domingo) | `6`                           |
| `day_name`       | `VARCHAR`          | Nome do dia da semana em português                | `'Sábado'`                    |
| `is_weekend`     | `BOOLEAN`          | **Flag booleana: TRUE se Sábado ou Domingo**      | `day_of_week IN (6, 7)`       |
| `is_weekday`     | `BOOLEAN`          | **Flag booleana: TRUE se Segunda a Sexta**        | `day_of_week BETWEEN 1 AND 5` |

---

### 2.4 Tabela Dimensão: `gold.dim_customers`
- **Conceito de Negócio**: Dimensão conformada de clientes com dados de perfil, localização e governança cadastral.
- **Granularidade**: 1 registro por cliente (`customer_key`).

| Coluna              | Tipo Presto/Athena | Descrição                                            | Origem Silver                |
| ------------------- | ------------------ | ---------------------------------------------------- | ---------------------------- |
| `customer_key`      | `BIGINT`           | Chave primária da dimensão                           | `silver.clientes.cod_clie`   |
| `customer_name`     | `VARCHAR`          | Nome do cliente                                      | `silver.clientes.nm_clie`    |
| `customer_email`    | `VARCHAR`          | E-mail do cliente (limpo/validado)                   | `silver.clientes.ds_email`   |
| `customer_tax_id`   | `VARCHAR`          | CPF ou CNPJ formatado apenas em dígitos              | `silver.clientes.nr_cpfcnpj` |
| `person_type_code`  | `VARCHAR`          | Código do tipo de pessoa (`'F'` ou `'J'`)            | `silver.clientes.tp_pessoa`  |
| `person_type_desc`  | `VARCHAR`          | Descrição (`'Pessoa Física'` ou `'Pessoa Jurídica'`) | Tradução de `tp_pessoa`      |
| `state_code`        | `VARCHAR`          | UF de residência / sede                              | `silver.clientes.cd_uf`      |
| `city_name`         | `VARCHAR`          | Município                                            | `silver.clientes.nm_cidade`  |
| `registration_date` | `TIMESTAMP`        | Data e hora do cadastro                              | `silver.clientes.dt_cad`     |
| `is_active`         | `BOOLEAN`          | Indicador se cliente está ativo                      | `st_ativo = 1`               |

---

### 2.5 Tabela Dimensão: `gold.dim_products`
- **Conceito de Negócio**: Dimensão de produtos e hierarquia de categorias de catálogo.
- **Granularidade**: 1 registro por produto (`product_key`).

| Coluna               | Tipo Presto/Athena | Descrição                          | Origem Silver                      |
| -------------------- | ------------------ | ---------------------------------- | ---------------------------------- |
| `product_key`        | `BIGINT`           | Chave primária da dimensão produto | `silver.produtos.cod_prod`         |
| `product_name`       | `VARCHAR`          | Descrição comercial do produto     | `silver.produtos.ds_prod`          |
| `sku_code`           | `VARCHAR`          | Código SKU do item                 | `silver.produtos.cd_sku`           |
| `category_code`      | `VARCHAR`          | Código da categoria                | `silver.produtos.cd_categ`         |
| `category_name`      | `VARCHAR`          | Nome padronizado da categoria      | `silver.produtos.ds_categ`         |
| `list_price`         | `DOUBLE`           | Preço de tabela                    | `silver.produtos.vl_preco`         |
| `standard_cost`      | `DOUBLE`           | Custo de tabela                    | `silver.produtos.vl_custo`         |
| `unit_margin_amount` | `DOUBLE`           | Margem bruta unitária de tabela    | `vl_preco - vl_custo`              |
| `margin_percentage`  | `DOUBLE`           | Percentual de margem sobre o preço | `(vl_preco - vl_custo) / vl_preco` |
| `is_active`          | `BOOLEAN`          | Indicador se o produto está ativo  | `st_ativo = 1`                     |

---

### 2.6 Tabela Dimensão: `gold.dim_channels`
- **Conceito de Negócio**: Dimensão conformada de canais de aquisição e venda.
- **Granularidade**: 1 registro por canal de venda (`channel_key`).

| Coluna         | Tipo Presto/Athena | Descrição                                                                                             | Regra / Origem            |
| -------------- | ------------------ | ----------------------------------------------------------------------------------------------------- | ------------------------- |
| `channel_key`  | `VARCHAR`          | Código canônico do canal (PK)                                                                         | `silver.pedidos.cd_canal` |
| `channel_name` | `VARCHAR`          | Nome formatado para relatórios                                                                        | Nome capitalizado         |
| `channel_type` | `VARCHAR`          | Segmentação do canal (`'E-commerce Próprio'`, `'Marketplace'`, `'Social/Messaging'`, `'Loja Física'`) | Mapeamento de negócio     |

---

## 3. Passo 3 — Diagrama de Linhagem de Dados (Silver -> Gold)

```
========================================================================================================
CAMADA SILVER (S3 Parquet / Glue Metastore)                 CAMADA GOLD (Star Schema / Athena)
========================================================================================================

[silver.clientes] -----------------------------------------> [gold.dim_customers]
  - cod_clie, nm_clie, ds_email, nr_cpfcnpj,                   - customer_key, customer_name,
    tp_pessoa, dt_cad, cd_uf, nm_cidade, st_ativo               email, tax_id, state_code, ...

[silver.produtos] -----------------------------------------> [gold.dim_products]
  - cod_prod, ds_prod, cd_categ, ds_categ,                     - product_key, product_name,
    vl_preco, vl_custo, qt_estq, cd_sku, st_ativo               sku, category_name, list_price, ...
         |
         +-------------------------------------------------> [gold.fact_inventory]
                                                               - inventory_sk, product_key, date_key,
                                                                 stock_quantity, stock_cost_amount, ...

[Gerador de Calendário SQL / CTE Sequence] -----------------> [gold.dim_date]
                                                               - date_key, full_date, year,
                                                                 month_name, is_weekend, is_weekday

[silver.pedidos] (cd_status = 'PAGO')
  - nr_ov, cod_clie, dt_ov, vl_tot, vl_frete,
    cd_status, cd_canal, cd_pgto, dt_pgto, fl_sem_pgto
         |
         +-------+-----------------------------------------> [gold.dim_channels]
         |       |                                             - channel_key, channel_name, channel_type
         |       |
         |       v
[silver.itens_pedido] -------------------------------------> [gold.fact_sales]
  - id_item, nr_ov, cod_prod, qt_item, vl_unit,                - sales_item_sk, order_id, order_date_key,
    vl_tot_item, vl_desc_item, fl_calc_inconsistente             customer_key, product_key, channel_key,
                                                                 quantity, vl_receita_liquida,
                                                                 vl_frete_rateado, gross_profit_amount...
========================================================================================================
```

---

## 4. Passo 4 — Scripts CTAS (Presto SQL / AWS Athena)

As consultas abaixo utilizam a sintaxe do **Presto SQL / Trino** suportada pelo AWS Athena para criar o banco de dados `gold` e todas as tabelas em formato **Parquet** com compressão **Snappy**.

> **Nota**: Substitua `${S3_BUCKET}` pelo nome real do bucket S3 do projeto (ex: `alumart-datalake-oscar-576355729000-us-east-2-an`).

### 4.1 Criação do Database Gold no AWS Glue / Athena
```sql
CREATE DATABASE IF NOT EXISTS gold
COMMENT 'Camada Gold analítica em modelo dimensional Star Schema para a Lumarte';
```

---

### 4.2 Criação da `gold.dim_date`
```sql
CREATE TABLE gold.dim_date
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    external_location = 's3://${S3_BUCKET}/gold/dim_date/'
) AS
WITH calendar_sequence AS (
    SELECT
        sequence(DATE '2022-01-01', DATE '2026-12-31', INTERVAL '1' DAY) AS date_array
),
expanded_dates AS (
    SELECT
        date_val AS full_date
    FROM calendar_sequence
    CROSS JOIN UNNEST(date_array) AS t(date_val)
)
SELECT
    CAST(date_format(full_date, '%Y%m%d') AS INTEGER) AS date_key,
    full_date,
    year(full_date) AS year_number,
    quarter(full_date) AS quarter_number,
    CONCAT(CAST(year(full_date) AS VARCHAR), '-T', CAST(quarter(full_date) AS VARCHAR)) AS quarter_name,
    month(full_date) AS month_number,
    CASE month(full_date)
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Março'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Maio'
        WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro'
        WHEN 11 THEN 'Novembro'
        WHEN 12 THEN 'Dezembro'
    END AS month_name,
    date_format(full_date, '%b') AS month_abbr,
    date_format(full_date, '%Y-%m') AS year_month,
    week_of_year(full_date) AS week_of_year,
    day_of_month(full_date) AS day_of_month,
    day_of_week(full_date) AS day_of_week, -- 1 = Segunda-feira ... 7 = Domingo no Presto
    CASE day_of_week(full_date)
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sábado'
        WHEN 7 THEN 'Domingo'
    END AS day_name,
    CASE
        WHEN day_of_week(full_date) IN (6, 7) THEN TRUE
        ELSE FALSE
    END AS is_weekend,
    CASE
        WHEN day_of_week(full_date) BETWEEN 1 AND 5 THEN TRUE
        ELSE FALSE
    END AS is_weekday
FROM expanded_dates;
```

---

### 4.3 Criação da `gold.dim_customers`
```sql
CREATE TABLE gold.dim_customers
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    external_location = 's3://${S3_BUCKET}/gold/dim_customers/'
) AS
SELECT
    cod_clie AS customer_key,
    nm_clie AS customer_name,
    ds_email AS customer_email,
    nr_cpfcnpj AS customer_tax_id,
    tp_pessoa AS person_type_code,
    CASE
        WHEN tp_pessoa = 'F' THEN 'Pessoa Física'
        WHEN tp_pessoa = 'J' THEN 'Pessoa Jurídica'
        ELSE 'Não Informado'
    END AS person_type_desc,
    cd_uf AS state_code,
    nm_cidade AS city_name,
    dt_cad AS registration_date,
    CASE
        WHEN st_ativo = 1 THEN TRUE
        ELSE FALSE
    END AS is_active
FROM silver.clientes;
```

---

### 4.4 Criação da `gold.dim_products`
```sql
CREATE TABLE gold.dim_products
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    external_location = 's3://${S3_BUCKET}/gold/dim_products/'
) AS
SELECT
    cod_prod AS product_key,
    ds_prod AS product_name,
    cd_sku AS sku_code,
    cd_categ AS category_code,
    UPPER(ds_categ) AS category_name,
    vl_preco AS list_price,
    vl_custo AS standard_cost,
    ROUND(vl_preco - vl_custo, 2) AS unit_margin_amount,
    CASE
        WHEN vl_preco > 0 THEN ROUND((vl_preco - vl_custo) / vl_preco, 4)
        ELSE 0.0
    END AS margin_percentage,
    CASE
        WHEN st_ativo = 1 THEN TRUE
        ELSE FALSE
    END AS is_active
FROM silver.produtos;
```

---

### 4.5 Criação da `gold.dim_channels`
```sql
CREATE TABLE gold.dim_channels
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    external_location = 's3://${S3_BUCKET}/gold/dim_channels/'
) AS
SELECT DISTINCT
    cd_canal AS channel_key,
    CASE cd_canal
        WHEN 'WEBSITE' THEN 'Website Oficial'
        WHEN 'APP_MOBILE' THEN 'App Mobile'
        WHEN 'WHATSAPP' THEN 'Vendas WhatsApp'
        WHEN 'MARKETPLACE' THEN 'Marketplaces Parceiros'
        WHEN 'INSTAGRAM' THEN 'Instagram Shopping'
        WHEN 'LOJA_FISICA' THEN 'Loja Física'
        ELSE cd_canal
    END AS channel_name,
    CASE cd_canal
        WHEN 'WEBSITE' THEN 'E-commerce Próprio'
        WHEN 'APP_MOBILE' THEN 'E-commerce Próprio'
        WHEN 'WHATSAPP' THEN 'Social / Messaging'
        WHEN 'INSTAGRAM' THEN 'Social / Messaging'
        WHEN 'MARKETPLACE' THEN 'Marketplace Terceiro'
        WHEN 'LOJA_FISICA' THEN 'Varejo Físico'
        ELSE 'Outros'
    END AS channel_type
FROM silver.pedidos
WHERE cd_canal IS NOT NULL;
```

---

### 4.6 Criação da `gold.fact_sales`
```sql
CREATE TABLE gold.fact_sales
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    partitioned_by = ARRAY['order_year_month'],
    external_location = 's3://${S3_BUCKET}/gold/fact_sales/'
) AS
WITH totals_by_order AS (
    -- Calcula a soma dos itens de cada pedido para rateio de frete
    SELECT
        nr_ov,
        SUM(vl_tot_item) AS total_itens_ov
    FROM silver.itens_pedido
    GROUP BY nr_ov
)
SELECT
    CONCAT(CAST(i.nr_ov AS VARCHAR), '-', CAST(i.nr_seq AS VARCHAR)) AS sales_item_sk,
    i.nr_ov AS order_id,
    i.nr_seq AS order_item_seq,
    CAST(date_format(p.dt_ov, '%Y%m%d') AS INTEGER) AS order_date_key,
    CAST(date_format(COALESCE(p.dt_pgto, p.dt_ov), '%Y%m%d') AS INTEGER) AS payment_date_key,
    p.cod_clie AS customer_key,
    i.cod_prod AS product_key,
    p.cd_canal AS channel_key,
    p.cd_pgto AS payment_method_code,
    i.qt_item AS quantity,
    i.vl_unit AS unit_price,
    COALESCE(pr.vl_custo, 0.0) AS unit_cost,
    i.vl_tot_item AS gross_item_amount,
    COALESCE(i.vl_desc_item, 0.0) AS item_discount_amount,
    -- Regra de Negócio: Receita Líquida por Item
    ROUND(i.vl_tot_item - COALESCE(i.vl_desc_item, 0.0), 2) AS vl_receita_liquida,
    -- Regra de Negócio: Rateio Proporcional do Frete por Item
    ROUND(
        COALESCE(p.vl_frete, 0.0) * (i.vl_tot_item / NULLIF(tot.total_itens_ov, 0.0)),
        2
    ) AS vl_frete_rateado,
    -- Custos e Lucro Bruto
    ROUND(i.qt_item * COALESCE(pr.vl_custo, 0.0), 2) AS total_cost_amount,
    ROUND(
        (i.vl_tot_item - COALESCE(i.vl_desc_item, 0.0)) - (i.qt_item * COALESCE(pr.vl_custo, 0.0)),
        2
    ) AS gross_profit_amount,
    i.fl_calc_inconsistente AS fl_calc_inconsistente,
    COALESCE(p.fl_sem_pgto, FALSE) AS fl_sem_pgto,
    date_format(p.dt_ov, '%Y-%m') AS order_year_month
FROM silver.pedidos p
INNER JOIN silver.itens_pedido i
    ON p.nr_ov = i.nr_ov
LEFT JOIN totals_by_order tot
    ON p.nr_ov = tot.nr_ov
LEFT JOIN silver.produtos pr
    ON i.cod_prod = pr.cod_prod
WHERE p.cd_status = 'PAGO';
```

---

### 4.7 Criação da `gold.fact_inventory`
```sql
CREATE TABLE gold.fact_inventory
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    partitioned_by = ARRAY['snapshot_year_month'],
    external_location = 's3://${S3_BUCKET}/gold/fact_inventory/'
) AS
SELECT
    CONCAT(CAST(date_format(CURRENT_DATE, '%Y%m%d') AS VARCHAR), '-', CAST(p.cod_prod AS VARCHAR)) AS inventory_sk,
    CAST(date_format(CURRENT_DATE, '%Y%m%d') AS INTEGER) AS date_key,
    p.cod_prod AS product_key,
    p.qt_estq AS stock_quantity,
    p.vl_custo AS unit_cost,
    p.vl_preco AS unit_price,
    ROUND(p.qt_estq * p.vl_custo, 2) AS stock_cost_amount,
    ROUND(p.qt_estq * p.vl_preco, 2) AS stock_sales_potential,
    CASE
        WHEN p.qt_estq <= 0 THEN 'ESGOTADO'
        WHEN p.qt_estq < 50 THEN 'ESTOQUE_BAIXO'
        ELSE 'ESTOQUE_NORMAL'
    END AS stock_status,
    CASE
        WHEN p.st_ativo = 1 THEN TRUE
        ELSE FALSE
    END AS is_product_active,
    CURRENT_DATE AS snapshot_date,
    date_format(CURRENT_DATE, '%Y-%m') AS snapshot_year_month
FROM silver.produtos p;
```

---

## 5. Passo 5 — Respostas às 7 Perguntas de Negócio

Todas as consultas abaixo foram construídas sobre as tabelas da camada **Gold** (`gold.fact_sales`, `gold.dim_date`, `gold.dim_customers`, `gold.dim_products`, `gold.dim_channels`).

---

### Pergunta 1: Qual o tamanho do negócio?
- **Tabelas Gold Utilizadas**: `gold.fact_sales`, `gold.dim_customers`, `gold.dim_products`.
- **Métricas Respondidas**: Receita Bruta Total, Receita Líquida Total, Volume de Itens Faturados, Pedidos Pagos Únicos, Ticket Médio por Pedido, Base de Clientes Ativos Compradores e Lucro Bruto Total.

```sql
SELECT
    COUNT(DISTINCT f.order_id) AS total_pedidos_pagos,
    COUNT(DISTINCT f.customer_key) AS total_clientes_unicos_compradores,
    COUNT(DISTINCT f.product_key) AS total_produtos_distintos_vendidos,
    SUM(f.quantity) AS total_itens_vendidos,
    ROUND(SUM(f.gross_item_amount), 2) AS receita_bruta_total,
    ROUND(SUM(f.item_discount_amount), 2) AS total_descontos_concedidos,
    ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida_total,
    ROUND(SUM(f.vl_frete_rateado), 2) AS total_frete_arrecadado,
    ROUND(SUM(f.gross_profit_amount), 2) AS lucro_bruto_total,
    ROUND(SUM(f.vl_receita_liquida) / COUNT(DISTINCT f.order_id), 2) AS ticket_medio_por_pedido,
    ROUND(SUM(f.vl_receita_liquida) / COUNT(DISTINCT f.customer_key), 2) AS receita_media_por_cliente
FROM gold.fact_sales f;
```

---

### Pergunta 2: Como a receita evoluiu ao longo do tempo?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_date`.
- **Métricas Respondidas**: Evolução temporal mensal (Mês a Mês - MoM) da receita líquida, volume de pedidos, ticket médio e taxa de crescimento percentual em relação ao mês anterior via window function (`LAG`).

```sql
WITH monthly_revenue AS (
    SELECT
        d.year_number,
        d.month_number,
        d.year_month,
        d.month_name,
        COUNT(DISTINCT f.order_id) AS total_pedidos,
        SUM(f.quantity) AS total_itens,
        ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida,
        ROUND(SUM(f.vl_receita_liquida) / COUNT(DISTINCT f.order_id), 2) AS ticket_medio
    FROM gold.fact_sales f
    INNER JOIN gold.dim_date d
        ON f.order_date_key = d.date_key
    GROUP BY
        d.year_number,
        d.month_number,
        d.year_month,
        d.month_name
)
SELECT
    year_month,
    month_name,
    year_number,
    total_pedidos,
    total_itens,
    receita_liquida,
    ticket_medio,
    LAG(receita_liquida) OVER (ORDER BY year_month) AS receita_mes_anterior,
    ROUND(
        (receita_liquida - LAG(receita_liquida) OVER (ORDER BY year_month))
        / NULLIF(LAG(receita_liquida) OVER (ORDER BY year_month), 0) * 100,
        2
    ) AS crescimento_mom_perc
FROM monthly_revenue
ORDER BY year_month;
```

---

### Pergunta 3: Qual canal de venda está crescendo ou caindo?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_channels` JOIN `gold.dim_date`.
- **Métricas Respondidas**: Faturamento mensal por canal, participação percentual (Market Share do canal) e variação percentual de faturamento Mês a Mês para identificar tendências de expansão ou retração.

```sql
WITH channel_monthly AS (
    SELECT
        c.channel_name,
        c.channel_type,
        d.year_month,
        COUNT(DISTINCT f.order_id) AS total_pedidos,
        ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida
    FROM gold.fact_sales f
    INNER JOIN gold.dim_channels c
        ON f.channel_key = c.channel_key
    INNER JOIN gold.dim_date d
        ON f.order_date_key = d.date_key
    GROUP BY
        c.channel_name,
        c.channel_type,
        d.year_month
)
SELECT
    channel_name,
    channel_type,
    year_month,
    total_pedidos,
    receita_liquida,
    ROUND(
        receita_liquida / SUM(receita_liquida) OVER (PARTITION BY year_month) * 100,
        2
    ) AS share_receita_mes_perc,
    LAG(receita_liquida) OVER (PARTITION BY channel_name ORDER BY year_month) AS receita_mes_anterior,
    ROUND(
        (receita_liquida - LAG(receita_liquida) OVER (PARTITION BY channel_name ORDER BY year_month))
        / NULLIF(LAG(receita_liquida) OVER (PARTITION BY channel_name ORDER BY year_month), 0) * 100,
        2
    ) AS crescimento_canal_perc
FROM channel_monthly
ORDER BY channel_name, year_month;
```

---

### Pergunta 4: Quais produtos geram mais receita?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_products`.
- **Métricas Respondidas**: Ranking (Curva ABC) dos produtos por faturamento, quantidade comercializada, ticket médio unitário, margem de lucro bruto acumulada e percentual representativo sobre a receita total da empresa.

```sql
SELECT
    p.product_key,
    p.product_name,
    p.sku_code,
    p.category_name,
    SUM(f.quantity) AS total_unidades_vendidas,
    ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida_total,
    ROUND(SUM(f.gross_profit_amount), 2) AS lucro_bruto_total,
    ROUND(SUM(f.gross_profit_amount) / NULLIF(SUM(f.vl_receita_liquida), 0) * 100, 2) AS margem_lucro_perc,
    ROUND(
        SUM(f.vl_receita_liquida) / (SELECT SUM(vl_receita_liquida) FROM gold.fact_sales) * 100,
        2
    ) AS representatividade_receita_total_perc,
    DENSE_RANK() OVER (ORDER BY SUM(f.vl_receita_liquida) DESC) AS ranking_faturamento
FROM gold.fact_sales f
INNER JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY
    p.product_key,
    p.product_name,
    p.sku_code,
    p.category_name
ORDER BY receita_liquida_total DESC;
```

---

### Pergunta 5: Quem são os clientes que mais geram receita?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_customers`.
- **Métricas Respondidas**: Top clientes por LTV (Lifetime Value / Faturamento Líquido Acumulado), frequência de compras (total de pedidos), total de itens adquiridos e ticket médio por pedido.

```sql
SELECT
    c.customer_key,
    c.customer_name,
    c.customer_email,
    c.person_type_desc,
    c.state_code,
    c.city_name,
    COUNT(DISTINCT f.order_id) AS total_pedidos_realizados,
    SUM(f.quantity) AS total_itens_comprados,
    ROUND(SUM(f.vl_receita_liquida), 2) AS ltv_receita_liquida,
    ROUND(SUM(f.vl_receita_liquida) / COUNT(DISTINCT f.order_id), 2) AS ticket_medio_por_pedido,
    DENSE_RANK() OVER (ORDER BY SUM(f.vl_receita_liquida) DESC) AS ranking_cliente
FROM gold.fact_sales f
INNER JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_key,
    c.customer_name,
    c.customer_email,
    c.person_type_desc,
    c.state_code,
    c.city_name
ORDER BY ltv_receita_liquida DESC
LIMIT 50;
```

---

### Pergunta 6: Há sazonalidade? Quais meses e trimestres vendem mais?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_date`.
- **Métricas Respondidas**: Agregação sazonal consolidada por Trimestre (`quarter_number`) e por Mês do Ano (`month_number`), revelando padrões recorrentes e períodos de pico de vendas (ex: Black Friday em novembro / Natal em dezembro).

#### 6.1 Análise por Trimestre (Sazonalidade Trimestral)
```sql
SELECT
    d.quarter_number,
    CONCAT('Trimestre ', CAST(d.quarter_number AS VARCHAR)) AS trimestre,
    COUNT(DISTINCT f.order_id) AS total_pedidos,
    SUM(f.quantity) AS total_itens_vendidos,
    ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida_total,
    ROUND(AVG(f.vl_receita_liquida), 2) AS valor_medio_por_item,
    ROUND(
        SUM(f.vl_receita_liquida) / (SELECT SUM(vl_receita_liquida) FROM gold.fact_sales) * 100,
        2
    ) AS share_receita_trimestre_perc
FROM gold.fact_sales f
INNER JOIN gold.dim_date d
    ON f.order_date_key = d.date_key
GROUP BY d.quarter_number
ORDER BY d.quarter_number;
```

#### 6.2 Análise por Mês do Ano (Padrão Sazonal Mensal)
```sql
SELECT
    d.month_number,
    d.month_name,
    COUNT(DISTINCT f.order_id) AS total_pedidos,
    SUM(f.quantity) AS total_itens_vendidos,
    ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida_total,
    ROUND(
        SUM(f.vl_receita_liquida) / (SELECT SUM(vl_receita_liquida) FROM gold.fact_sales) * 100,
        2
    ) AS share_sazonalidade_anual_perc,
    DENSE_RANK() OVER (ORDER BY SUM(f.vl_receita_liquida) DESC) AS ranking_meses_mais_vendedores
FROM gold.fact_sales f
INNER JOIN gold.dim_date d
    ON f.order_date_key = d.date_key
GROUP BY
    d.month_number,
    d.month_name
ORDER BY d.month_number;
```

---

### Pergunta 7: Fins de semana vendem mais que dias úteis?
- **Tabelas Gold Utilizadas**: `gold.fact_sales` JOIN `gold.dim_date`.
- **Métricas Respondidas**: Comparativo rigoroso entre Dias Úteis (`is_weekend = FALSE`, Segunda a Sexta) e Finais de Semana (`is_weekend = TRUE`, Sábado e Domingo), calculando faturamento total, total de dias ocorridos no calendário e a **Receita Média por Dia Real**, eliminando a distorção da proporção de 5 dias úteis para 2 dias de fim de semana.

```sql
WITH daily_sales AS (
    -- Agrupa vendas por dia civil no calendário
    SELECT
        d.full_date,
        d.is_weekend,
        d.day_name,
        d.day_of_week,
        COUNT(DISTINCT f.order_id) AS pedidos_no_dia,
        COALESCE(SUM(f.vl_receita_liquida), 0.0) AS receita_no_dia,
        COALESCE(SUM(f.quantity), 0) AS itens_no_dia
    FROM gold.dim_date d
    LEFT JOIN gold.fact_sales f
        ON d.date_key = f.order_date_key
    -- Filtra apenas o intervalo de operação de vendas da base
    WHERE d.full_date BETWEEN (SELECT MIN(DATE(dt_ov)) FROM silver.pedidos WHERE cd_status = 'PAGO')
                          AND (SELECT MAX(DATE(dt_ov)) FROM silver.pedidos WHERE cd_status = 'PAGO')
    GROUP BY
        d.full_date,
        d.is_weekend,
        d.day_name,
        d.day_of_week
)
SELECT
    CASE
        WHEN is_weekend THEN 'Fim de Semana (Sáb/Dom)'
        ELSE 'Dias Úteis (Seg-Sex)'
    END AS tipo_de_dia,
    COUNT(DISTINCT full_date) AS total_dias_no_calendario,
    SUM(pedidos_no_dia) AS total_pedidos_acumulados,
    SUM(itens_no_dia) AS total_itens_acumulados,
    ROUND(SUM(receita_no_dia), 2) AS receita_liquida_total,
    -- Métricas normalizadas por dia (Comparação justa)
    ROUND(AVG(receita_no_dia), 2) AS receita_media_diaria,
    ROUND(AVG(CAST(pedidos_no_dia AS DOUBLE)), 2) AS pedidos_medios_por_dia,
    ROUND(SUM(receita_no_dia) / NULLIF(SUM(pedidos_no_dia), 0), 2) AS ticket_medio_por_pedido
FROM daily_sales
GROUP BY is_weekend
ORDER BY is_weekend DESC;
```

#### 7.1 Detalhamento por Dia da Semana (Segunda a Domingo)
```sql
SELECT
    d.day_of_week,
    d.day_name,
    CASE WHEN d.is_weekend THEN 'Fim de Semana' ELSE 'Dia Útil' END AS tipo_dia,
    COUNT(DISTINCT f.order_id) AS total_pedidos,
    ROUND(SUM(f.vl_receita_liquida), 2) AS receita_liquida_acumulada,
    ROUND(
        SUM(f.vl_receita_liquida) / COUNT(DISTINCT d.full_date),
        2
    ) AS receita_media_por_dia_da_semana
FROM gold.dim_date d
INNER JOIN gold.fact_sales f
    ON d.date_key = f.order_date_key
GROUP BY
    d.day_of_week,
    d.day_name,
    d.is_weekend
ORDER BY d.day_of_week;
```

---

## 6. Resumo e Próximos Passos na Orquestração

1. **Camadas Alinhadas**: A modelagem dimensional Star Schema na Gold consome diretamente as tabelas tratadas da Silver (`silver.clientes`, `silver.produtos`, `silver.pedidos`, `silver.itens_pedido`, `silver.pagamentos`).
2. **Qualidade e Flags Preservadas**: As regras de integridade e auditoria da Silver (`fl_calc_inconsistente`, `fl_sem_pgto`) foram propagadas para a fato `gold.fact_sales`, mantendo rastreabilidade total.
3. **Pronto para BI**: O modelo Star Schema permite conexão direta com ferramentas como Amazon QuickSight, Tableau, PowerBI ou consultas interativas no AWS Athena sem necessidade de joins complexos ou transformações em tempo de query.
