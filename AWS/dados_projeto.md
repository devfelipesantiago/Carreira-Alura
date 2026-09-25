# Dados do projeto >> ## Visão Geral

Pipeline analítico completo na AWS para uma empresa de e-commerce, transformando dados de um ERP legado
(RDS PostgreSQL) em um modelo dimensional otimizado para analytics.

## Tabelas Legado (ERP)

| Tabela          | Descrição            | Chave Primária         | Problemas Intencionais                               |
|-----------------|----------------------|------------------------|------------------------------------------------------|
| `erp_hp_clie`   | Clientes             | `cod_clie`             | Emails nulos, datas em formatos variados             |
| `erp_it_prod`   | Produtos             | `cod_prod`             | Categorias com case inconsistente, sem acentos       |
| `erp_ov_cabe`   | Cabeçalho de pedidos | `nr_ov`                | Status variados (PAGO/Pago/pago), canais inconsistentes |
| `erp_ov_item`   | Itens do pedido      | `nr_ov` + `nr_seq`     | Quantidades negativas, product_id nulo               |
| `erp_fn_pgto`   | Pagamentos           | `nr_ov` + `nr_parcela` | Formas de pagamento inconsistentes                   |