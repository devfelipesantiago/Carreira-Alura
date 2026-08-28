# Fundamentos para Consultas Rápidas

A base para consultas eficientes reside em bons índices. Colunas envolvidas em filtros `(WHERE)`, junções `(JOIN)`, ordenações `(ORDER BY)` e agrupamentos `(GROUP BY)` devem ser indexadas. Chaves primárias e estrangeiras já garantem índices. A ferramenta `EXPLAIN` é essencial para validar o impacto dos índices.

## Otimizando Filtros

Evitar funções em colunas filtradas: Aplicar funções diretamente na coluna de um filtro impede o uso de índices.

```sql
Ruim: WHERE YEAR(data_transacao) = 2025

Bom: WHERE data_transacao >= '2025-01-01' AND data_transacao < '2026-01-01'
```

## Seleção de Dados

Especificar colunas: Evitar SELECT * é crucial. Selecionar apenas as colunas necessárias reduz o custo de I/O e memória.

```sql
Ruim: SELECT * FROM transacoes WHERE valor > 500;

Bom: SELECT id_transacao, valor, data_transacao FROM transacoes WHERE valor > 500;
```

## Planejamento de Junções (JOINs)

O segredo está em um JOIN bem planejado. Comece a junção pela tabela que mais reduz o volume de dados, especialmente se o filtro principal estiver nela. Índices nas colunas de JOIN são mandatórios.

```sql
FROM clientes c
JOIN contas ct ON ct.id_cliente = c.id_cliente
JOIN transacoes t ON t.id_conta = ct.id_conta
WHERE c.status = 'ATIVO';
```

## Otimizando Agrupamentos e Ordenações

GROUP BY e ORDER BY são potenciais gargalos. Crie índices nas condições usadas para agrupar ou ordenar. Para ORDER BY, combinar com LIMIT é ainda mais eficaz para reduzir a saída de dados.

```sql
ORDER BY data_transacao LIMIT 100
```

## Evitando Subconsultas Desnecessárias

Muitas subconsultas podem ser substituídas por `JOINs` mais eficientes, que permitem o uso de índices.

```sql
Ruim (com subconsulta): SELECT ct.* FROM contas ct WHERE ct.id_cliente IN (SELECT c.id_cliente FROM clientes c WHERE c.status = 'ATIVO');
Bom (com JOIN):
SELECT ct.*
FROM contas ct
JOIN clientes c ON c.id_cliente = ct.id_cliente
WHERE c.status = 'ATIVO';
```

## Gestão de Transações

Mantenha as transações curtas para evitar bloqueios prolongados, aumentar a concorrência e reduzir o risco de deadlocks.

**Erros Comuns a Evitar**

- Falta de índices em colunas críticas.
- Uso de `LIKE '%texto'` (invalida o índice).
- Aplicar funções diretamente na coluna.
- JOINs sem seletividade.
- Repetição de subconsultas.
- Excesso de índices (pode impactar a performance de escrita).

**Dicas Adicionais**

- **Tipos de dados menores**: Use tipos de dados que se adequem ao tamanho real dos dados para melhorar a leitura.
- **Colunas seletivas**: Índices funcionam melhor em colunas com muitas combinações únicas (alta seletividade).
- **Índices compostos**: Devem seguir a ordem dos filtros na consulta.
- **Reescrever queries**: Adapte consultas para usar índices já existentes.
- **Evitar conversões implícitas**: Comparar tipos de dados diferentes pode impedir o uso de índices.
- **Colunas geradas**: Use-as para filtros derivados de dados complexos (ex: JSON) e indexe-as.

> Sempre valide as otimizações com o `EXPLAIN` para entender o plano de execução e confirmar os ganhos de performance.
