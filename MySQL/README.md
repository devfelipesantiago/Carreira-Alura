# MySQL

**Evolução e Impacto do MySQL**

- Surgiu nos anos 90, tornando-se o banco de dados preferido para desenvolvimento web (Linux, Apache, MySQL, PHP - LAMP).
- Passou pela Sun Microsystems e foi adquirido pela Oracle.
- O fork MariaDB surgiu por receio de que o MySQL se tornasse proprietário, mas ele permaneceu aberto (versões Community e Enterprise).
- Evoluiu com excelente desempenho, administração mais simples e suporte massivo para a nuvem.
- Possui uma comunidade gigantesca e é testado em milhões de implementações.
- Utilizado em sistemas transacionais de alto volume, ETL, APIs, microsserviços e dados semiestruturados (tipo JSON).
- Funções poderosas de data e tempo para auditorias e rastreamento de eventos.

**O Padrão SQL ANSI (SQL11)**

- É o ponto de partida e padrão base da linguagem SQL.
- Define o núcleo comum que todas as implementações de bancos de dados devem ter.
- Padroniza comandos como SELECT, INSERT, UPDATE, DELETE, JOINs básicos e funções essenciais.

---

## Organização de Dados no MySQL

- **Database vs. Schema**: No MySQL, ambos os termos são sinônimos e representam um contêiner organizado para armazenar objetos de banco de dados.
- **Estrutura do Schema**: Um schema pode conter tabelas, views, procedimentos, funções e permissões.
- **Organização Empresarial**: Schemas são frequentemente organizados por domínio de negócio (clientes, operações), ambiente (desenvolvimento, produção) ou sistema (aplicativo web, CRM).
- **Visualização no Workbench**: O MySQL Workbench permite explorar os componentes de um schema, como tabelas, colunas, chaves, índices e metadados.


## Tipos de Dados Essenciais

```sql
-- Numéricos:
int: Números inteiros.
bigint: Números inteiros grandes.
decimal, float, double: Números com casas decimais. Evitar float para dados financeiros, preferindo double pela precisão.

-- Texto:
varchar: Texto de comprimento variável.
char: Texto de comprimento fixo.
text: Para textos longos.
Data e Tempo:
date: Apenas data.
datetime: Data e hora.
timestamp: Data e hora com fuso horário.
year: Apenas ano.

-- Outros Tipos:
JSON: Suporte nativo para dados JSON (MySQL 8+)
enum, set: Tipos especiais para categorias predefinidas.
```

## Integridade dos Dados

- **Chave Primária (Primary Key)**: 
    - Identifica unicamente cada linha em uma tabela.
    - Fundamental para consultas rápidas, atualizações corretas e manutenção da integridade do modelo.
- **Chave Estrangeira (Foreign Key)**:
    - Estabelece a conexão e o relacionamento entre tabelas.
    - Garante que as relações não se rompam.
- **Regras de Integridade Referencial**:
    - **onDeleteRestrict**: Impede a exclusão de um registro se houver dependências.
    - **onDeleteCascade**: Exclui registros relacionados automaticamente.
    - **onUpdate**: Controla atualizações em cascata.
- **Restrições de Integridade Adicionais**:
    - **not null**: Garante que um campo não pode ter valor nulo.
    - **unique**: Garante que os valores em um campo são únicos na tabela.
    - **default**: Define um valor padrão para um campo.
    - **check**: Permite definir condições para os valores de um campo (suportado no MySQL 8+).
- **Motor de Armazenamento InnoDB**
    - **Importância**: O motor InnoDB é crucial para ambientes corporativos e sistemas de missão crítica.
    - **Funcionalidades**: Suporta transações, chaves estrangeiras, bloqueio a nível de linha e integridade relacional completa.

---

## Comandos de leitura

```sql
SELECT *: Recupera todas as colunas de uma tabela. Embora prático para exploração inicial, evite em produção para otimizar o desempenho.
SELECT coluna1, coluna2: Seleciona apenas as colunas de interesse, melhorando a eficiência.
FROM tabela: Indica a tabela de onde os dados serão extraídos.
Filtragem de Dados com WHERE
A cláusula WHERE é crucial para refinar os resultados, aplicando condições específicas.

-- Comparação de Igualdade (=): Filtra registros onde uma coluna corresponde a um valor exato. Lembre-se de usar aspas simples para textos e datas, e números diretamente.
Ex: WHERE status = 'ATIVO'
Ex: WHERE id_tipo_conta = 1

-- Comparação de Diferença (!=): Seleciona registros que não correspondem a um valor.
Ex: WHERE status != 'ATIVO'

-- Comparação de Maior/Menor (>, <, >=, <=): Útil para filtrar datas ou valores numéricos.
Ex: WHERE data_nascimento > '1990-01-01'

-- Busca por Padrão (LIKE): Essencial para buscas textuais parciais. O caractere % atua como um curinga para qualquer sequência de caracteres.
Ex: WHERE numero_conta LIKE '10%' (começa com '10')

-- Intervalo (BETWEEN ... AND ...): Filtra valores dentro de um determinado intervalo (inclusivo).
Ex: WHERE saldo_inicial BETWEEN 500 AND 2000
-- Múltiplos Valores (IN): Seleciona registros onde uma coluna corresponde a qualquer um dos valores listados.
Ex: WHERE id_status IN (1, 3)

-- Ordenação de Resultados com ORDER BY
A cláusula ORDER BY organiza a saída da consulta de acordo com uma ou mais colunas.

-- ASC (Ascendente): Ordena do menor para o maior (padrão se não especificado). Para textos, segue a ordem alfabética.
Ex: ORDER BY nome ASC

-- DESC (Descendente): Ordena do maior para o menor.
Ex: ORDER BY saldo_inicial DESC

Importante: A ordem dos resultados não é garantida sem o uso explícito de ORDER BY.
Limitação e Paginação com LIMIT e OFFSET
Para controlar o número de registros retornados, especialmente em grandes conjuntos de dados.

-- LIMIT número: Retorna apenas o número especificado de linhas.
Ex: LIMIT 5

-- LIMIT quantidade OFFSET início: Pula um número de linhas (OFFSET) e então retorna a quantidade de linhas.
Ex: LIMIT 5 OFFSET 5 (pula 5, pega os próximos 5)

-- Sintaxe Simplificada (LIMIT início, quantidade): No MySQL, pode-se usar uma sintaxe mais concisa.
Ex: LIMIT 5, 5 (equivalente a OFFSET 5 LIMIT 5)

-- Combinação de Cláusulas
É possível e comum combinar todas essas cláusulas para criar consultas poderosas e precisas. A ordem das cláusulas em uma consulta SELECT é geralmente: SELECT, FROM, WHERE, ORDER BY, LIMIT.

Ex: SELECT nome, data_cadastro FROM clientes WHERE status = 'ATIVO' ORDER BY data_cadastro DESC LIMIT 10;
```

---

## Agregando dados

As funções de agregação são ferramentas poderosas para resumir, totalizar e consolidar dados, fundamentais para análises financeiras, relatórios e auditorias.

- **SUM**: Calcula a soma dos valores em uma coluna.
- **AVG**: Determina a média dos valores em uma coluna.
- **COUNT**: Conta o número de linhas ou valores não nulos.
- **MIN**: Encontra o menor valor em uma coluna.
- **MAX**: Encontra o maior valor em uma coluna.

**Agrupamento de Dados com GROUP BY**
O `GROUP BY` é crucial para aplicar funções de agregação a subconjuntos de dados. Ele permite agrupar linhas que têm os mesmos valores em uma ou mais colunas, e então as funções de agregação operam dentro de cada um desses grupos.

- Exemplo: Contar o número de contas por cliente ou somar o saldo por agência.
- Agrupamento Múltiplo: É possível agrupar por várias colunas, separando-as por vírgula no GROUP BY.

**Filtrando Dados Agregados com HAVING**
O `HAVING` é utilizado para filtrar os resultados após a aplicação das funções de agregação e do GROUP BY. Diferente do WHERE, que filtra linhas individuais antes da agregação, o HAVING filtra os grupos já formados com base nos valores agregados.

- **Sintaxe**: O HAVING sempre vem depois do GROUP BY na consulta.
- **Exemplo**: Selecionar agências cuja soma total de saldos seja maior que um determinado valor, ou clientes com mais de uma conta.

**Ordem de Execução e Estrutura da Consulta**
Ao construir consultas com agregação e agrupamento, a ordem das cláusulas é importante:

- **SELECT**: Define as colunas a serem exibidas (incluindo as funções de agregação).
- **FROM**: Especifica a tabela de origem.
- **WHERE**: Filtra linhas individuais (opcional, antes do agrupamento).
- **GROUP** BY: Agrupa as linhas.
- **HAVING**: Filtra os grupos (opcional, após o agrupamento).
- **ORDER BY**: Ordena os resultados finais.

___

## JOINS

- **O que são JOINS**: Mecanismos poderosos no SQL para combinar dados de duas ou mais tabelas.
- **Importância**: Essenciais no mundo corporativo e financeiro para obter uma visão completa e integrada dos dados. Consultas em uma única tabela são insuficientes para sistemas relacionais complexos.
- **Contexto**: Permitem conectar informações de diferentes entidades, como clientes, contas e transações, para gerar relatórios e análises significativas.

**Tipos de Relações**

- **Um para Um (1:1)**: Rara, usada para estender atributos de uma entidade em tabelas separadas.
- **Um para N (1:N)**: A mais comum. Ex: um cliente tem muitas contas; uma conta tem muitas transações.
- **N para M (N:M)**: Geralmente envolve tabelas intermediárias para conectar duas entidades. Ex: um cliente pode ter vários produtos financeiros, e um produto pode ser de vários clientes.

**O que os JOINS resolvem no dia a dia**

- **Integração de Dados**: Transformam dados desconectados em informações úteis e coesas.
- **Relatórios Complexos**: Permitem criar relatórios detalhados (ex: nome do cliente e saldo, transações com tipo e descrição).
- **Análises**: Fundamentais para análises de comportamento financeiro, KPIs e investigações de fraude.

### INNER JOIN

O INNER JOIN é a operação mais comum para combinar dados de múltiplas tabelas em SQL. Ele atua como uma interseção, retornando apenas os registros que possuem correspondência em todas as tabelas envolvidas na junção. Isso garante que apenas dados **válidos, consistentes e íntegros** sejam exibidos, eliminando registros "órfãos" ou inconsistentes.

A sintaxe básica do INNER JOIN é:

```sql
SELECT
    t1.coluna1,
    t2.coluna2
FROM tabela1 t1
INNER JOIN tabela2 t2 ON t1.id = t2.id_tabela1;
```

- **Filtros (WHERE)**: Podem ser aplicados sobre o resultado de um JOIN para refinar os dados. Exemplo: WHERE transacoes.valor > 50.
- **Agregações (SUM, GROUP BY)**: Permitem calcular totais ou outras métricas sobre os dados unidos. Exemplo: SUM(transacoes.valor) GROUP BY clientes.nome para ver o total movimentado por cliente.

**Boas Práticas**

- **Identificar PKs e FKs**: Essencial para visualizar como as tabelas se conectam.
- **Usar ALIAS**: Abrevia nomes de tabelas (c.nome em vez de clientes.nome) para consultas mais curtas e legíveis.
- **Aplicar Filtros Após o JOIN**: Garante que a lógica do JOIN não seja comprometida.
- **Verificar o Número de Linhas**: O resultado de um INNER JOIN geralmente tem menos linhas do que as tabelas individuais, pois elimina registros sem correspondência.

### OUTHER JOIN
Os principais outer joins são:

- **LEFT JOIN**: Preserva todos os registros da tabela à esquerda (a primeira tabela mencionada após o FROM) e traz os correspondentes da tabela à direita. Se não houver correspondência na tabela da direita, os campos dessa tabela aparecerão como NULL. É útil para encontrar, por exemplo, clientes que não têm contas.

- **RIGHT JOIN**: É o inverso do left join. Preserva todos os registros da tabela à direita e traz os correspondentes da tabela à esquerda. Se não houver correspondência na tabela da esquerda, os campos dessa tabela aparecerão como NULL. Na prática, é comum transformar um right join em um left join invertendo a ordem das tabelas.

- **FULL JOIN**: Preserva todos os registros de ambas as tabelas, trazendo correspondências quando existem e NULL para os registros que não têm correspondência em uma das tabelas. No MySQL, o full join não é implementado diretamente, mas pode ser simulado combinando um left join e um right join com a cláusula UNION.

**Processo Mental para Consultas Grandes**:

- **Tabela Principal**: Escolha a tabela mais importante como ponto de partida.
- **Tabelas Relacionadas Diretamente**: Conecte as tabelas que possuem relação direta com a principal.
- **Tabelas Dependentes**: Adicione as tabelas que dependem das já conectadas.
- **Tabelas Auxiliares**: Inclua tabelas adicionais se necessário.
- **Filtros, Ordenações e Agrupamentos**: Aplique-os no final para refinar os resultados.

## Subconsultas
Subconsultas, ou consultas aninhadas, são consultas SQL executadas dentro de outra consulta. Elas permitem realizar cálculos e obter resultados intermediários que são então utilizados pela consulta externa. São essenciais para análises complexas, especialmente em cenários que exigem etapas de cálculo antes do resultado final.

**Tipos de Resultados de Subconsultas**

Uma subconsulta pode produzir:

- Um único valor.
- Uma lista de valores.
- Uma tabela intermediária.

Subconsultas são ideais para resolver problemas como:

- Encontrar a primeira transação de cada conta.
- Identificar clientes com movimentação acima da média.
- Listar contas com saldo maior que o saldo médio geral.
- Filtrar transações acima de um percentual ou valor específico.
- Determinar clientes que realizaram mais transações que a média geral.

---

### Tipos de Subconsultas e Suas Aplicações

Subconsultas no WHERE:

- Função: Filtram dados com base em cálculos ou resultados intermediários.
- Exemplo: Selecionar contas cujo saldo_inicial é maior que a média de todos os saldo_inicial.
- Característica: A condição de filtro é dinâmica, adaptando-se a mudanças nos dados.

```sql
Sintaxe
SELECT * FROM tabela WHERE coluna operando (SELECT coluna FROM tabela WHERE condição);
```

Subconsultas no SELECT:

- Função: Criam colunas calculadas individualmente para cada linha da consulta principal.
- Exemplo: Adicionar uma coluna que mostra o total_transacoes para cada cliente.
- Característica: Frequentemente fazem um INNER JOIN com a tabela externa para referenciar dados da linha atual. A subconsulta é executada para cada linha do resultado da consulta principal.

```sql
Sintaxe
SELECT 
    t1.coluna1,
    (SELECT coluna_sub FROM tabela_sub WHERE tabela_sub.coluna = t1.coluna) AS coluna_calculada
FROM tabela1 t1;
```

Subconsultas no FROM (Tabelas Derivadas):

- Função: Criam uma tabela virtual temporária que pode ser usada como uma tabela real na consulta externa.
- Exemplo: Calcular o total_movimentado por id_conta em uma subconsulta e, em seguida, fazer um JOIN com a tabela contas para obter informações adicionais.
- Característica: Permitem encadear raciocínios e tornar cada etapa do cálculo mais clara.

```sql
Sintaxe
SELECT
  coluna1,
  coluna2
FROM (
  SELECT
    coluna_subconsulta1,
    coluna_subconsulta2
  FROM
    tabela_origem_subconsulta
  WHERE
    condicao_subconsulta
  GROUP BY
    coluna_agrupamento_subconsulta
) AS nome_alias_da_subconsulta
JOIN
  outra_tabela ON condicao_join;

```

**Vantagens das Subconsultas**

- Organização Lógica: Estruturam seleções complexas de forma mais compreensível.
- Redução de JOINs: Podem diminuir a necessidade de múltiplos JOINs.
- Cálculos Intermediários: Facilitam a realização de etapas de cálculo antes do resultado final.
- Modularidade: Tornam o código mais modular e fácil de gerenciar.

**Desvantagens das Subconsultas**

- Performance: Podem ser mais lentas que JOINs em alguns cenários.
- Legibilidade: O uso excessivo pode tornar a consulta difícil de ler e entender.

## CTEs
A estrutura básica de uma CTE começa com WITH, seguido de um nome para a CTE e a consulta SELECT entre parênteses. Se houver mais de uma CTE, você as separa por vírgulas, e uma CTE pode fazer referência a uma anterior. No final, um SELECT principal utiliza o resultado das CTEs para exibir o resultado final.

**Estrutura Básica de uma CTE**

- Início com a palavra-chave WITH.
- Atribuição de nomes a SELECTs opcionais.

```sql
WITH nome_cte AS (SELECT ...), nome_outra_cte AS (SELECT ... FROM nome_cte) 
SELECT ... FROM nome_outra_cte;
```
- Múltiplas CTEs são separadas por vírgulas.
- Uma CTE pode referenciar CTEs anteriores.
- O SELECT final exibe o resultado.

**Quando Utilizar CTEs**

- Consultas muito grandes, com muitos JOINs e subconsultas, que se tornam ilegíveis.
- Necessidade de reutilizar cálculos intermediários.
- Separação da lógica em etapas claras (fluxo de raciocínio).
- Realização de transformações sequenciais de dados.

**As principais vantagens das CTEs incluem**:

- Melhora da legibilidade do código.
- Facilita a depuração, permitindo testar cada etapa.
- Permite sequências encadeadas de cálculos.
- Evita a repetição de código.
- Torna o SQL mais organizado e profissional.

**Boas Práticas**

- Nomes claros e autoexplicativos para cada CTE.
- Evitar CTEs excessivamente grandes.
- Usar CTEs apenas quando houver um benefício real na organização ou legibilidade.
- Utilizar alias claros e corretos no SELECT final.
- Manter a ordem lógica das etapas.

---

### CTEs com Agregações
CTEs (Common Table Expressions) combinadas com funções de agregação (SUM, AVG, COUNT, MIN, MAX) são a base para a criação de relatórios financeiros e métricas em análises de dados. Essa união permite calcular índices como montante total por cliente, média de transações, número de operações por período, maior/menor transação, ticket médio e ranking de clientes.

**Aplicações Práticas em Análises Financeiras**

- **Total Movimentado por Conta**: Agregação de valores transacionados por id_conta.
- **Total por Cliente**: Combinação de CTEs para somar o total de transações de todas as contas de um cliente.
- **Ticket Médio por Tipo de Conta**: Cálculo da média, contagem, máximo e mínimo de transações, agrupados pelo tipo de conta.
- **Ranking de Clientes**: Utilização da função de janela RANK() para classificar clientes com base no volume financeiro.
- **Transações por Mês**: Contagem de transações agrupadas por ano e mês.
- **Clientes Acima da Média Geral**: Identificação de clientes cujo total transacionado excede a média de transações de todos os clientes.

**O Poder das CTEs com JOINs**

- **Propósito**: Combinar CTEs com JOINs permite construir relatórios financeiros completos e organizados, simulando práticas de engenharia de dados em instituições financeiras.
- **CTEs**: Preparam e organizam os dados em etapas lógicas.
- **JOINs**: Conectam métricas preparadas a entidades como clientes, contas e tipos, enriquecendo a análise.
- **Estrutura Lógica**: Essencial para qualquer relatório financeiro corporativo.

**Estrutura Padrão de CTEs para Relatórios**

A construção de relatórios com CTEs segue uma sequência lógica:

- **CTE 1: Filtragem de Dados Brutos**
  - Extrai o conjunto de dados inicial com base em critérios de tempo ou outros filtros básicos.
  - Não aplica agregações ou transformações nesta etapa.

```sql
WITH ultimos_30_dias AS (
    SELECT *
    FROM transacoes
    WHERE data_transacao >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
)
```

- **CTE 2: Métricas Intermediárias**
  - Utiliza a CTE anterior para calcular agregações (soma, contagem, média) por uma chave específica (ex: id_conta).

```sql
,
total_por_conta AS (
    SELECT
        id_conta,
        SUM(valor) AS total_conta,
        COUNT(*) AS qtd_transacoes
    FROM ultimos_30_dias
    GROUP BY id_conta
)
```

- **CTE 3: Enriquecimento com JOINs**
  - Conecta os resultados das CTEs anteriores com outras tabelas (clientes, contas, tipos) para adicionar contexto.
  - Pode envolver múltiplos JOINs para ligar diferentes entidades.

```sql
,
total_por_cliente AS (
    SELECT
        c.id_cliente,
        c.nome,
        SUM(tc.total_conta) AS total_cliente,
        SUM(tc.qtd_transacoes) AS transacoes_cliente
    FROM clientes c
    JOIN contas ct ON c.id_cliente = ct.id_cliente
    JOIN total_por_conta tc ON ct.id_conta = tc.id_conta
    GROUP BY c.id_cliente, c.nome
)

```

- **SELECT Final: Relatório Limpo**
  - Apresenta o resultado final, aplicando ordenações e filtros adicionais se necessário.
  - Não deve conter lógica de negócio complexa, apenas a exibição dos dados preparados.

```sql
SELECT *
FROM total_por_cliente
ORDER BY total_cliente DESC;
    ```

- **Exemplos Práticos de Aplicação**
  - **Contas sem Transações (Ativas)**:
    - Identifica contas ativas que não registraram movimentos.
    - Usa LEFT JOIN para incluir todas as contas e WHERE t.id_transacao IS NULL para filtrar as sem correspondência.
WITH contas_sem_transacoes AS (
    SELECT
        ct.id_conta,
        ct.numero_conta,
        c.nome AS cliente
    FROM contas ct
    LEFT JOIN transacoes t ON ct.id_conta = t.id_conta
    JOIN clientes c ON c.id_cliente = ct.id_cliente
    WHERE t.id_transacao IS NULL
    AND ct.id_status = 1 -- Exemplo: status 1 = ativa
)
SELECT *
FROM contas_sem_transacoes;
Extrato Resumido por Tipo de Conta:

Calcula métricas agregadas (contagem, soma, média, max, min) para transações, agrupadas por tipo de conta.
WITH transacoes_tipos AS (
    SELECT
        tp.nome AS tipo_conta,
        t.valor
    FROM transacoes t
    JOIN contas ct ON t.id_conta = ct.id_conta
    JOIN tipos_conta tp ON ct.id_tipo_conta = tp.id_tipo_conta
)
SELECT
    tipo_conta,
    COUNT(*) AS total_transacoes,
    SUM(valor) AS volume_total,
    AVG(valor) AS ticket_medio,
    MAX(valor) AS maior_valor,
    MIN(valor) AS menor_valor
FROM transacoes_tipos
GROUP BY tipo_conta
ORDER BY volume_total DESC;
```

- **Ranking de Clientes por Movimento Total**:
  - Calcula o total de transações por conta, depois por cliente, e aplica uma função de ranking (RANK() OVER).

```sql
WITH total_por_conta AS (
    SELECT id_conta, SUM(valor) AS total
    FROM transacoes
    GROUP BY id_conta
),
total_por_cliente AS (
    SELECT
        c.id_cliente,
        c.nome,
        SUM(tc.total) AS total_cliente
    FROM clientes c
    JOIN contas ct ON c.id_cliente = ct.id_cliente
    JOIN total_por_conta tc ON ct.id_conta = tc.id_conta
    GROUP BY c.id_cliente, c.nome
),
ranking AS (
    SELECT
        *,
        RANK() OVER (ORDER BY total_cliente DESC) AS posicao
    FROM total_por_cliente
)
SELECT *
FROM ranking
WHERE posicao <= 20;
```

- **Identificação de Transações Atípicas**:
  - Detecta transações cujo valor é significativamente maior que a média (ex: o dobro da média) por conta.

```sql
WITH media_por_cliente AS (
    SELECT
        ct.id_conta,
        AVG(t.valor) AS media_cliente
    FROM transacoes t
    JOIN contas ct ON t.id_conta = ct.id_conta
    GROUP BY ct.id_conta
),
transacoes_acima_do_dobro AS (
    SELECT
        t.*,
        m.media_cliente
    FROM transacoes t
    JOIN media_por_cliente m ON t.id_conta = m.id_conta
    WHERE t.valor > (m.media_cliente * 2)
)
SELECT *
FROM transacoes_acima_do_dobro
ORDER BY valor DESC;
```

----

## Introdução ao DML

A manipulação de dados em SQL é realizada através da DML (Data Manipulation Language), que permite alterar o conteúdo das tabelas. É uma etapa poderosa e crítica, especialmente em bancos de dados financeiros.

**Usos Comuns do DML:**

- Carga de grandes volumes de dados de outras fontes (APIs, arquivos).
- Simulação de dados para testes e ajustes.
- Correção de inconsistências ou adaptação de dados externos.
- Execução de processos de ETL (Extract, Transform, Load) para transformar e carregar dados.
- Preparação de ambientes de teste e homologação com dados realistas.

**Comandos Fundamentais do DML**

Os três comandos essenciais para a manipulação de dados são:

- INSERT: Adiciona novas linhas a uma tabela.
- UPDATE: Modifica linhas existentes em uma tabela.
- DELETE: Elimina linhas de uma tabela.

**Diferença entre DML, DDL e DCL:**

- DML (Data Manipulation Language): Insere, modifica e elimina dados (INSERT, UPDATE, DELETE).
- DDL (Data Definition Language): Cria ou altera a estrutura do sistema de dados (CREATE, ALTER, DROP, TRUNCATE).
- DCL (Data Control Language): Controla acessos e permissões (GRANT, REVOKE).

**Criticidade do DML em Bancos Financeiros**

Em sistemas financeiros, as operações DML têm um impacto direto e significativo:

- INSERT: Criação de novos clientes, contas, transações.
- UPDATE: Mudança de estado de contas, correção de registros, ajuste de saldos, atualização de dados sensíveis.
- DELETE: Eliminação de dados incorretos, limpeza de testes, remoção de registros inválidos.

---

Toda modificação deve ser auditável, rastreável e explicável para garantir conformidade legal e regulatória, além de assegurar a confiabilidade dos dados para relatórios e decisões estratégicas.

**Comandos de Inserção e Modificação**

Para adicionar uma nova linha, especifique a tabela, as colunas e os valores. Campos auto-incremento (como id_cliente) não precisam ser incluídos no comando.

**Exemplo de INSERT:**

```sql
INSERT INTO clientes (
    nome,
    documento,
    data_nascimento,
    data_cadastro,
    status
)
VALUES (
    'Carlos Henrique Lima',
    '12345678901',
    '1985-06-12',
    NOW(),
    'ATIVO'
);
```

**Atualizando Dados Existentes (UPDATE):**

Para modificar dados, utilize UPDATE seguido do nome da tabela, SET para definir as novas colunas e valores, e WHERE para especificar quais linhas serão afetadas.

**Exemplo de UPDATE:**

```sql
UPDATE clientes
SET nome = 'Carlos H. Lima'
WHERE id_cliente = 1;
```

---

**Boas Práticas para o Uso de DML:**

- Sempre usar WHERE: Em comandos UPDATE e DELETE para evitar alterações em toda a tabela.
- Respeitar Chaves Primárias (PKs): Garante a integridade dos dados.
- Verificar com SELECT: Antes de executar um DML crítico, faça um SELECT para entender o impacto.
- Compreender o Impacto: Nunca execute DML crítico sem entender suas consequências.

---

## Transações em MySQL: Garantindo a Integridade dos Dados

As transações são blocos de operações que devem ser executadas de forma indivisível. A regra é clara: ou todas as operações são concluídas com sucesso, ou nenhuma delas é aplicada, garantindo que o banco de dados nunca fique em um estado inconsistente. Isso é fundamental, especialmente em sistemas que lidam com dados financeiros.

### O Princípio ACID

As transações em MySQL aderem ao princípio ACID, um conjunto de propriedades que asseguram a confiabilidade das transações:

- **Atomicidade**: As operações são tratadas como uma unidade indivisível. Se qualquer parte da transação falhar, toda a transação é desfeita.
- **Consistência**: Garante que a transação leve o banco de dados de um estado válido para outro estado válido, respeitando todas as regras e restrições.
- **Isolamento**: Transações simultâneas são executadas de forma isolada, sem interferir umas nas outras, como se estivessem sendo processadas sequencialmente.
- **Durabilidade**: Uma vez que uma transação é confirmada (commit), suas alterações são permanentes e resistem a falhas do sistema.

### Estrutura Básica de uma Transação

Para iniciar, gerenciar e finalizar uma transação, utilizamos os seguintes comandos:

- **Início da Transação**:

```sql
START TRANSACTION;
```

A partir deste ponto, todas as operações DML (INSERT, UPDATE, DELETE) são consideradas parte da transação e não são permanentes até a confirmação.

- **Confirmação da Transação**:

```sql
COMMIT;
```

Este comando torna permanentes todas as alterações realizadas desde o START TRANSACTION.

- **Reversão da Transação**:

```sql
ROLLBACK;
```

Este comando desfaz todas as alterações realizadas desde o START TRANSACTION, retornando o banco de dados ao estado anterior.

### Exemplos Práticos

**Operação de Crédito e Atualização de Saldo**:

```sql
START TRANSACTION;

INSERT INTO transacoes (id_conta, tipo, descricao, valor, data_transacao)
VALUES (1, 'CREDITO', 'Depósito em dinheiro', 500.00, NOW());

UPDATE contas
SET saldo_inicial = saldo_inicial + 500.00
WHERE id_conta = 1;

COMMIT; -- Confirma ambas as operações
```

**Simulação de Erro e Reversão**:

```sql
START TRANSACTION;

INSERT INTO transacoes (id_conta, tipo, descricao, valor, data_transacao)
VALUES (1, 'DEBITO', 'Tentativa de saque', 2000.00, NOW());

ROLLBACK; -- Desfaz a inserção, pois houve um erro ou arrependimento
```

**Transferência entre Contas**:

```sql
START TRANSACTION;

UPDATE contas
SET saldo_inicial = saldo_inicial - 300.00
WHERE id_conta = 1;

UPDATE contas
SET saldo_inicial = saldo_inicial + 300.00
WHERE id_conta = 2;

INSERT INTO transacoes (id_conta, tipo, descricao, valor, data_transacao)
VALUES
(1, 'DEBITO', 'Transferência enviada', 300.00, NOW()),
(2, 'CREDITO', 'Transferência recebida', 300.00, NOW());

COMMIT; -- Confirma todas as atualizações e inserções
```

### Quando Utilizar Transações

Transações são essenciais em situações onde a inconsistência de dados é inaceitável:

- **Alterações em múltiplas linhas relacionadas**.
- **Execução de regras de negócio sensíveis**.
- **Atualização de saldos ou valores financeiros**.
- **Correção manual de dados**.
- **Ajustes de auditoria**.

### Boas Práticas

- **Sempre revise as operações antes de executar COMMIT, pois é irreversível**.
- **Evite transações muito longas para não bloquear dados e impactar a performance**.
- **Sempre verifique os filtros (WHERE) em comandos UPDATE e DELETE dentro de transações**.
- **O COMMIT deve ser uma decisão consciente, nunca automática**.

---

## Concorrência e Isolamento

A concorrência é essencial para gerenciar múltiplas operações em um banco de dados ao mesmo tempo. Ela garante que as alterações sejam feitas de forma segura e consistente, evitando a corrupção de dados.

O MySQL utiliza **mecanismos de bloqueio (locks)** para controlar o acesso simultâneo aos dados. Esses bloqueios são aplicados principalmente a nível de linha, permitindo que outras partes da tabela sejam acessadas enquanto uma linha específica está sendo modificada.

- **Shared Lock**: Permite que várias transações leiam o mesmo dado simultaneamente, mas impede qualquer escrita enquanto a leitura está ativa.
- **Exclusive Lock**: Mais restritivo, impede que qualquer outra transação leia ou escreva a mesma linha enquanto uma transação está escrevendo.

### Isolamento

O isolamento define o grau em que as transações são independentes umas das outras, ou seja, o quanto uma transação pode ver as alterações de outras transações que ainda não foram confirmadas.

**Níveis de Isolamento no MySQL:**

**Read Uncommitted:** 
- Permite "leituras sujas" (Dirty Reads), onde uma transação pode ler dados que ainda não foram confirmados por outra.
- Pode levar a informações temporárias e inconsistentes.

**Read Committed:**
- Elimina Dirty Reads, pois só permite a leitura de dados que já foram confirmados (commit). 
- Ainda pode ocorrer que o mesmo dado mude entre duas leituras dentro da mesma transação se outra transação confirmar uma alteração nesse intervalo.

**Repeatable Read:** 
- Nível de isolamento padrão do MySQL.
- Garante que, dentro da mesma transação, as leituras dos mesmos dados retornarão os mesmos valores, mesmo que outras transações tenham feito commit de alterações.
- Pode ocorrer o problema de "leitura fantasma" (Phantom Read), onde novas linhas aparecem em consultas repetidas.

**Serializable:** 
- Nível máximo de isolamento.
- As transações são executadas sequencialmente, uma após a outra, eliminando qualquer interferência.
- Oferece a maior consistência, mas com um impacto significativo no desempenho.

**Problemas de Concorrência e Isolamento**
- **Dirty Read**: Leitura de dados não confirmados que podem ser desfeitos.
- **Non-Repeatable Read**: O mesmo dado lido em momentos diferentes dentro da mesma transação apresenta valores distintos.
- **Phantom Read**: Novas linhas aparecem em um conjunto de resultados entre duas execuções da mesma consulta.

**Boas Práticas**
- Compreender a concorrência é fundamental para a integridade dos dados.
- Transações longas podem bloquear o sistema, especialmente em níveis de isolamento mais altos.
- A escolha adequada do nível de isolamento é crucial para equilibrar segurança, consistência e desempenho.

## Manipulando Strings, Números e Dados

As funções avançadas no MySQL são ferramentas poderosas para transformar e enriquecer dados, sendo cruciais para engenheiros de dados, relatórios financeiros e processos de limpeza. Elas permitem ir além da estruturação e cruzamento de tabelas, focando na manipulação direta dos valores.

### Funções de Texto

Essas funções são ideais para padronizar e limpar dados textuais, como nomes de clientes e descrições.

**Padronização de Caixa:**

- **UCASE(coluna)**: Converte todo o texto para maiúsculas.
- **LCASE(coluna)**: Converte todo o texto para minúsculas.

Exemplo: 
```sql
SELECT UCASE(nome) FROM clientes;
```

**Remoção de Espaços:**

- **TRIM(coluna)**: Remove espaços do início e do fim do texto.
- **LTRIM(coluna)**: Remove espaços apenas do início (esquerda).
- **RTRIM(coluna)**: Remove espaços apenas do fim (direita).

Exemplo: 
```sql
SELECT TRIM(' texto com espaços ');
```

**Extração e Substituição:**

- **SUBSTRING(coluna, posição_inicial, quantidade_caracteres)**: Extrai uma parte do texto.
- **REPLACE(coluna, 'texto_antigo', 'texto_novo')**: Substitui um fragmento de texto por outro.

Exemplo: 
```sql
SELECT SUBSTRING(descricao, 1, 20) FROM transacoes;
```

Exemplo: 
```sql
SELECT REPLACE(descricao, 'PIX', 'TRANSFERÊNCIA PIX') FROM transacoes;
```

**Concatenação:**

- **CONCAT(valor1, valor2, ...)**: Une múltiplos valores em um único texto.

Exemplo: 
```sql
SELECT CONCAT(codigo_agencia, '-', numero_conta) FROM contas;
```

### Funções Numéricas

Essas funções são aplicadas para arredondamentos e ajustes matemáticos em valores numéricos.

**Arredondamento:**

- **ROUND(numero, casas_decimais)**: Arredonda um número para o número de casas decimais especificado.
- **CEIL(numero)**: Retorna o menor inteiro maior ou igual ao número.
- **FLOOR(numero)**: Retorna o maior inteiro menor ou igual ao número.

Exemplo: 
```sql
SELECT ROUND(valor, 1) FROM transacoes;
```

Exemplo: 
```sql
SELECT CEIL(41.6), FLOOR(41.6);
```

**Arredondamento:**

- **ROUND(numero, casas_decimais)**: Arredonda um número para o número de casas decimais especificado.
- **CEIL(numero)**: Retorna o menor inteiro maior ou igual ao número.
- **FLOOR(numero)**: Retorna o maior inteiro menor ou igual ao número.

Exemplo: 
```sql
SELECT ROUND(valor, 1) FROM transacoes;
```

Exemplo: 
```sql
SELECT CEIL(41.6), FLOOR(41.6);
```
**Formatação para Exibição:**

- **FORMAT(numero, casas_decimais, 'localidade')**: Formata um número como texto, aplicando regras de localidade (ex: separador decimal).

Exemplo: 
```sql
SELECT FORMAT(valor * 1000, 2, 'pt_BR') FROM transacoes;
```

**Funções de Controle de Fluxo e Tratamento de Nulos**

Essas funções permitem criar lógicas condicionais e gerenciar valores ausentes.

**Classificação Condicional:**

- **CASE WHEN condição1 THEN resultado1 WHEN condição2 THEN resultado2 ELSE resultado_padrao END**: Permite criar múltiplas condições para classificar valores.

Exemplo:
```sql
CASE
    WHEN valor >= 1000 THEN 'ALTA'
    WHEN valor >= 300 THEN 'MEDIA'
    ELSE 'BAIXA'
END AS classificacao
```

**Tratamento de Valores Nulos:**

- **IFNULL(coluna, valor_padrao)**: Substitui valores NULL por um valor padrão.
- **NULLIF(valor1, valor2)**: Retorna NULL se valor1 for igual a valor2; caso contrário, retorna valor1.

Exemplo: 
```sql
SELECT IFNULL(descricao, 'SEM DESCRIÇÃO') FROM transacoes;
```

Exemplo: 
```sql
SELECT NULLIF(valor, 0) FROM transacoes;
```

## Manipulação de Datas e Horários em SQL

**A Importância do Tempo em Sistemas Bancários**

O tempo é um elemento crucial em qualquer sistema bancário, essencial para registrar transações, datas de abertura de contas, períodos de auditoria e ciclos de relatórios. A manipulação de datas e horários em SQL é uma habilidade fundamental para engenheiros e analistas de dados que trabalham com informações financeiras.

**Tipos de Dados Temporais em SQL**

Existem diferentes tipos de dados para armazenar informações temporais:

- **DATE**: Armazena apenas a data (ano, mês, dia), sem informações de hora.

Exemplo: 
```sql
SELECT data_abertura FROM contas;
```

- **DATETIME**: Armazena tanto a data quanto a hora.

Exemplo: 
```sql
SELECT data_transacao FROM transacoes;
```

- **TIMESTAMP**: Armazena data e hora, sendo sensível ao fuso horário. O MySQL armazena o valor em UTC e o converte para o fuso horário da sessão ou do servidor ao consultar. É ideal para registrar datas de criação de logs, últimas modificações (Updated At).

Exemplo: 
```sql
SELECT NOW();
```

**Funções Essenciais para Manipulação de Datas**

Diversas funções SQL permitem trabalhar com datas e horários:

- **NOW()**: Retorna a data e hora atual do servidor.
- **CURDATE()**: Retorna apenas a data atual.
- **CURTIME()**: Retorna apenas a hora atual.

```sql
SELECT
    NOW() AS data_hora_atual,
    CURDATE() AS data_atual,
    CURTIME() AS hora_atual;
```

- **DATE_SUB(data, INTERVAL valor unidade)**: Subtrai um intervalo de tempo de uma data.

Exemplo:

```sql
SELECT
    data_transacao,
    DATE_SUB(data_transacao, INTERVAL 30 DAY) AS data_30_dias_antes
FROM transacoes;
```

- **DATE_ADD(data, INTERVAL valor unidade)**: Adiciona um intervalo de tempo a uma data.

```sql
SELECT
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 1 MONTH) AS proximo_mes;
```

- **DATEDIFF(data1, data2)**: Calcula a diferença entre duas datas em dias.

```sql
SELECT
    id_conta,
    DATEDIFF(CURDATE(), data_abertura) AS dias_desde_abertura
FROM contas;
```

- **TIMESTAMPDIFF(unidade, data_inicio, data_fim)**: Calcula a diferença entre duas datas em uma unidade específica (MONTH, YEAR, HOUR, etc.).

```sql
SELECT
    id_conta,
    TIMESTAMPDIFF(MONTH, data_abertura, CURDATE()) AS meses_de_conta
FROM contas;
```

- **YEAR(data), MONTH(data), DAY(data)**: Extraem partes específicas de uma data.

```sql
SELECT
    YEAR(data_transacao) AS ano,
    MONTH(data_transacao) AS mes,
    COUNT(*) AS total_transacoes
FROM transacoes
GROUP BY YEAR(data_transacao), MONTH(data_transacao);
```

- **DATE_FORMAT(data, formato)**: Formata uma data em um formato de texto específico para visualização ou exportação.
    - **%d**: dia do mês (01-31)
    - **%m**: mês (01-12)
    - **%Y**: ano com quatro dígitos
    - **%H**: hora (00-23)
    - **%i**: minutos (00-59)
    - **%M**: nome do mês
    - **%W**: nome do dia da semana

```sql
SELECT
    DATE_FORMAT(data_transacao, '%d/%m/%Y %H:%i') AS data_formatada
FROM transacoes;

- **QUARTER(data)**: Retorna o trimestre do ano (1-4).

```sql
SELECT
    QUARTER(data_transacao) AS trimestre
FROM transacoes;
```

### Boas Práticas com Datas

- **Evitar funções em colunas de filtros grandes**: Isso pode prejudicar o desempenho. Prefira filtrar períodos usando DATE_ADD ou DATE_SUB com a coluna diretamente.
- **Padronizar formatação apenas na visualização**: Armazene as datas em seu formato original no banco de dados e aplique a formatação apenas no momento da exibição ou exportação.
- **Usar TIMESTAMPDIFF para métricas temporais**: É mais flexível para calcular diferenças em diversas unidades.

## JSON no MySQL

JSON (JavaScript Object Notation) é um formato de dados leve e padronizado, baseado em chave-valor, usado para representar informações estruturadas. Sua principal vantagem é a flexibilidade, permitindo armazenar dados semiestruturados, o que é muito útil em integrações de sistemas e APIs. É fácil de ler por humanos e de interpretar por máquinas.

### JSON como Tipo de Dado Nativo no MySQL
No MySQL, JSON não é apenas um texto, mas um tipo de dado nativo. Isso significa que o banco de dados:

- **Realiza validação automática do conteúdo JSON.**
- **Oferece funções próprias para manipulação.**
- **Possui otimizações internas para desempenho.**
- **É integrável com o SQL tradicional, permitindo JOINs, CTEs e agregações.**

### Quando Usar JSON
O JSON é ideal quando:

- **As informações de uma entidade variam de formato.**
- **É preciso armazenar metadados de transações sem alterar a estrutura principal da tabela.**
- **Há necessidade de registrar detalhes de comunicação entre sistemas (registros de integração).**
- **É preciso guardar dados sobre a origem de operações (tipo de dispositivo, etc.).**
- **Há dados brutos de APIs que precisam ser armazenados e analisados posteriormente.**
- **É necessário configurar comportamentos específicos por cliente (parametrizações).**

Um exemplo prático é adicionar uma coluna JSON na tabela de transações para guardar detalhes como origem, dispositivo, localização e risco da transação.

### Principais Funções JSON no MySQL
O MySQL oferece diversas funções para manipular dados JSON:

- **JSON_OBJECT**: Cria um novo objeto JSON ou atualiza um existente.

```sql
JSON_OBJECT(
    'chave1', 'valor1',
    'chave2', JSON_OBJECT('subchave', 'subvalor')
);
```

- **JSON_EXTRACT**: Extrai um valor específico de uma propriedade JSON. O caminho é indicado por $. para a raiz, seguido dos nomes das propriedades.

```sql
JSON_EXTRACT(detalhes_json, '$.origem');
JSON_EXTRACT(detalhes_json, '$.localizacao.estado');
```

- **JSON_SET**: Atualiza apenas partes de um JSON.

```sql
JSON_SET(
    detalhes_json,
    '$.risco', true
);
```

- **JSON_KEYS**: Retorna as chaves de um objeto JSON.

```sql
JSON_KEYS(detalhes_json);
```

- **JSON_TYPE**: Retorna o tipo de dado de uma propriedade JSON.

```sql
JSON_TYPE(JSON_EXTRACT(detalhes_json, '$.risco'));
```

- **JSON_VALID**: Verifica se uma string é um JSON válido (retorna 1 para válido, 0 para inválido).

```sql
JSON_VALID(detalhes_json);
```

- **JSON_ARRAY**: Cria um array JSON a partir de uma lista de valores.

```sql
JSON_ARRAY('item1', 'item2', 'item3');
```

### Combinando JSON com SQL Tradicional
É possível combinar dados JSON com outras tabelas usando JOINs e filtrar resultados com base em valores dentro do JSON.

```sql
SELECT
    t.id_transacao,
    c.nome,
    JSON_EXTRACT(t.detalhes_json, '$.localizacao.estado') AS estado
FROM transacoes t
JOIN contas ct ON ct.id_conta = t.id_conta
JOIN clientes c ON c.id_cliente = ct.id_cliente
WHERE JSON_EXTRACT(t.detalhes_json, '$.origem') = 'mobile';
```

### Indexação em JSON

#### 1. A Importância dos Índices em Bancos de Dados

- **Função Principal**: Índices são estruturas auxiliares que aceleram a busca de informações em tabelas.
- **Como Funcionam**: Em vez de o banco de dados percorrer todas as linhas (full table scan), o índice permite localizar registros relevantes rapidamente, como um índice de livro.
- **Benefícios**:
    - **Reduzem drasticamente o tempo de resposta de consultas.**
    - **Essenciais para tabelas grandes (milhares/milhões de linhas).**
    - **Tornam WHERE, ORDER BY e JOINs mais eficientes.**
- **Custos**:
    - **Consomem mais espaço em disco.**
    - **Tornam INSERT, UPDATE e DELETE mais lentos.**
- **Critério de Uso**: Criar índices com critério, focando em consultas frequentes e evitando o uso desnecessário.

#### 2. Otimizando Consultas JSON com Índices

- **Desafio do JSON_EXTRACT**: Executar JSON_EXTRACT em filtros sem índices exige percorrer toda a tabela, o que é inviável para grandes volumes de dados (ex: transações bancárias).
- **Estratégia de Indexação**: Não se indexa o JSON completo. Em vez disso, indexam-se colunas geradas a partir de extrações de propriedades específicas do JSON.

#### 3. Criando Colunas Geradas e Índices no MySQL

- **Colunas Geradas (GENERATED ALWAYS AS)**: São colunas físicas na tabela. Seu valor é automaticamente calculado e atualizado a partir de outras colunas (neste caso, de um campo JSON). Não é necessário atualizar manualmente.

**Exemplo de criação**:

```sql
ALTER TABLE transacoes
    ADD COLUMN origem VARCHAR(20)
    GENERATED ALWAYS AS (
        JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem'))
    ) STORED;
```

- **JSON_UNQUOTE**: Remove as aspas duplas que JSON_EXTRACT geralmente retorna.

```sql
-- Exemplo de JSON_EXTRACT com aspas
SELECT JSON_EXTRACT(detalhes_json, '$.origem') FROM transacoes;
-- Resultado: "mobile"

-- Exemplo de JSON_UNQUOTE(JSON_EXTRACT) sem aspas
SELECT JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem')) FROM transacoes;
-- Resultado: mobile
```

- **Atualização Automática**: Alterar o campo JSON original (detalhes_json) automaticamente atualiza a coluna gerada (origem).

```sql
UPDATE transacoes
SET detalhes_json = JSON_SET(detalhes_json, '$.origem', 'ATM')
WHERE id_transacao = 1;
-- Após o UPDATE, a coluna 'origem' da transação 1 também mudará para 'ATM'.    
```

- **Criação de Índice na Coluna Gerada**:

```sql
CREATE INDEX idx_transacoes_origem
ON transacoes (origem);
```

#### 4. Comparando Eficiência de Consultas

- **Consulta Lenta (sem índice direto)**:

```sql
SELECT *
FROM transacoes
WHERE JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem')) = 'ATM';
-- Percorre linha por linha, extraindo e comparando. Extremamente lento em tabelas grandes.
```

- **Consulta Eficiente (com índice na coluna gerada)**:

```sql
SELECT *
FROM transacoes
WHERE origem = 'ATM';
-- Utiliza o índice criado na coluna 'origem', resultando em busca rápida.
```

- **Resultado**: Ambas as consultas retornam o mesmo resultado, mas a segunda é significativamente mais eficiente em termos de desempenho.

#### 5. Boas Práticas com JSON no MySQL

- **Complemento, Não Substituição**: JSON complementa o modelo relacional, não o substitui.
- **Dados Críticos**: Use JSON para dados críticos, mas crie colunas normais dependentes para informações essenciais ao negócio, garantindo integridade e desempenho.
- **Atributos Opcionais/Variáveis**: Ideal para dados que mudam de formato ou são opcionais.
- **Indexação de Filtros**: Sempre indexe campos JSON que são frequentemente usados em filtros, criando colunas dependentes para isso.
- **Tamanho do JSON**: Evite JSONs muito grandes, pois dificultam leitura, manutenção e afetam o desempenho.
- **CTEs (Common Table Expressions)**: Use CTEs para organizar consultas JSON complexas, separando a lógica de extração da lógica principal do SQL, tornando o código mais limpo e profissional.

## Views
Uma View é uma consulta SQL armazenada no banco de dados. Ela age como uma tabela lógica, mas não armazena dados. A consulta é executada sempre que a View é consultada, funcionando como um atalho para lógicas complexas.

**Utilidade das Views**

- **Encapsulamento de Lógica**: Concentra regras e joins complexos, simplificando o uso do banco.
- **Reutilização de SQL**: Evita a reescrita da mesma consulta em relatórios e análises.
- **Facilidade de Manutenção**: Modificações na lógica são feitas uma única vez na View.
- **Padronização de Dados**: Usada em engenharia de dados e BI para acelerar análises e reduzir erros.

**Criação de Views**

A criação de uma View segue a sintaxe `CREATE VIEW nome_da_view AS SELECT ....` É uma convenção iniciar o nome da View com `VW_`.

**Exemplo de Criação**:

```sql
CREATE VIEW vw_transacoes_normalizadas AS
SELECT
    t.id_transacao,
    t.id_conta,
    c.id_cliente,
    c.nome AS nome_cliente,
    t.tipo,
    t.valor,
    t.data_transacao,
    t.origem
FROM transacoes t
JOIN contas ct ON ct.id_conta = t.id_conta
JOIN clientes c ON c.id_cliente = ct.id_cliente;
```

**Utilizando Views**

Após criada, uma View é consultada como uma tabela. Todos os comandos aplicáveis a tabelas `(SELECT, WHERE, ORDER BY, GROUP BY, LIMIT, JOIN)` podem ser usados em Views.

**Exemplo de Consulta**:

```sql
SELECT *
FROM vw_transacoes_normalizadas
WHERE origem = 'mobile'
ORDER BY data_transacao DESC
LIMIT 10;
```

**Exemplo de View com Agregação**:

```sql
CREATE VIEW vw_clientes_contas AS
SELECT
    c.id_cliente,
    c.nome,
    COUNT(ct.id_conta) AS total_contas,
    SUM(ct.saldo_inicial) AS saldo_total
FROM clientes c
LEFT JOIN contas ct ON ct.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;
```

**Consulta na View Agregada**:

```sql
SELECT *
FROM vw_clientes_contas
WHERE saldo_total > 10000;
```

**O que Views Não São**

- **Não armazenam dados**: São apenas definições de consulta.
- **Não melhoram o desempenho automaticamente**: A eficiência depende do SQL subjacente e dos índices das tabelas base.
- **Não substituem a indexação**: Índices devem estar nas tabelas originais.
- **Não são Views Materializadas no MySQL**: O MySQL não suporta Views materializadas nativamente; a consulta é executada a cada vez.


## Stored Functions
As funções armazenadas no MySQL são uma extensão da linguagem SQL que permite encapsular regras de negócio e lógica complexa diretamente no banco de dados. Elas são ideais para padronizar operações que se repetem, garantindo consistência e reusabilidade.

**Características Essenciais:**

- **Retorno Único**: Uma função armazenada sempre devolve um único valor.
- **Integração com SQL**: Podem ser utilizadas dentro de comandos SELECT como funções nativas.
- **Lógica Complexa**: Permitem combinar comandos SQL com estruturas de controle (como laços de repetição, embora não explicitamente detalhados na aula, a extensão da linguagem SQL do MySQL permite isso).
- **Padronização**: Evitam a repetição de código e garantem que todos os usuários apliquem a mesma lógica para um determinado cálculo ou classificação.

**Criação de Funções Armazenadas**
A criação de uma função armazenada envolve a definição de um delimitador temporário, o comando CREATE FUNCTION, o nome da função, seus parâmetros, o tipo de retorno e a lógica interna.

**Sintaxe Básica:**

```sql
DELIMITER $$

CREATE FUNCTION nome_da_funcao(parametro TIPO)
RETURNS TIPO_RETORNO
DETERMINISTIC -- Opcional, indica que o resultado é sempre o mesmo para os mesmos inputs
BEGIN
    -- Lógica da função
    RETURN valor_calculado;
END$$

DELIMITER ;
```

**Exemplo 1: Classificação de Transações**

Uma função pode classificar transações financeiras em categorias como "BAIXA", "MEDIA" ou "ALTA" com base em seu valor.

```sql
DELIMITER $$

CREATE FUNCTION fn_categoria_transacao(valor DECIMAL(10,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN valor < 100 THEN 'BAIXA'
        WHEN valor BETWEEN 100 AND 500 THEN 'MEDIA'
        ELSE 'ALTA'
    END;
END$$

DELIMITER ;
```

**Aplicação em Consulta:**

```sql
SELECT
    id_transacao,
    valor,
    fn_categoria_transacao(valor) AS categoria
FROM transacoes;
```

**Exemplo 2: Normalização de Texto**

Outra aplicação comum é a normalização de textos, como converter para maiúsculas e remover espaços extras.

```sql
DELIMITER $$

CREATE FUNCTION fn_normaliza_texto(txt VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN TRIM(UCASE(txt));
END$$

DELIMITER ;
```

**Aplicação em Consulta:**

```sql
SELECT
    id_transacao,
    descricao,
    fn_normaliza_texto(descricao) AS descricao_normalizada
FROM transacoes;
```

**Boas Práticas**

Para garantir o bom desempenho e a manutenção das funções armazenadas:

- **Regras Pequenas e Definidas**: Use funções para encapsular lógicas simples e reutilizáveis.
- **Evitar Lógica Pesada**: Funções com muita complexidade podem degradar o desempenho, pois são executadas linha a linha em consultas.
- **DETERMINISTIC**: Sempre que uma função retornar o mesmo resultado para os mesmos parâmetros de entrada, marque-a como `DETERMINISTIC`. Isso auxilia o otimizador do MySQL.
- **Alternativas para Lógica Grande**: Para lógicas de negócio muito extensas, prefira o uso de CTEs (Common Table Expressions) em vez de funções armazenadas.
- **Cuidado com Grandes Volumes**: Evite o abuso de funções em SELECTs que processam milhões de linhas.

## Generated Columns

As Generated Columns são um recurso poderoso no MySQL que permite ao banco de dados calcular e armazenar valores de colunas automaticamente, com base em outras colunas da mesma tabela. Isso centraliza a lógica de cálculo no banco, garantindo consistência e eliminando a necessidade de a aplicação realizar esses cálculos repetidamente.

**Tipos de Generated Columns**
Existem dois tipos principais, cada um com suas características:

- **Virtual**: Calculada dinamicamente a cada leitura. Não ocupa espaço em disco, mas não pode ser indexada. Ideal para cálculos que não são frequentemente filtrados.
- **Storage**: Calculada e armazenada fisicamente no momento do INSERT ou UPDATE. Ocupa espaço em disco, mas pode ser indexada, o que é crucial para melhorar o desempenho de consultas que filtram por essa coluna. Em cenários que exigem previsibilidade e performance, como em bancos de dados financeiros, a Storage é geralmente a preferida.

**Exemplos Práticos**
A criação de Generated Columns envolve a cláusula GENERATED ALWAYS AS seguida da expressão de cálculo e, opcionalmente, STORED para o tipo Storage.

1. **Coluna valor_nominal para transações**:

Para ajustar o valor de transações para ser positivo em créditos e negativo em débitos, pode-se usar uma Generated Column com uma estrutura CASE:

```sql
ALTER TABLE transacoes
ADD COLUMN valor_nominal DECIMAL(10,2)
GENERATED ALWAYS AS (
    CASE
        WHEN tipo = 'CREDITO' THEN valor
        WHEN tipo = 'DEBITO' THEN -valor
        ELSE 0
    END
) STORED;   
```

Após a execução, uma consulta como `SELECT tipo, valor, valor_nominal FROM transacoes LIMIT 5;` mostraria:

| tipo | valor | valor_nominal |
|------|-------|---------------|
| CREDITO | 100.00 | 100.00 |
| DEBITO | 50.00 | -50.00 |
| CREDITO | 200.00 | 200.00 |

2. **Coluna ano_transacao para extrair o ano**:

Para extrair o ano de uma coluna de data, a função YEAR() é útil:

```sql
ALTER TABLE transacoes
ADD COLUMN ano_transacao INT
GENERATED ALWAYS AS (YEAR(data_transacao)) STORED;
```

Uma consulta como `SELECT data_transacao, ano_transacao FROM transacoes LIMIT 5;` resultaria em:

| data_transacao | ano_transacao |
|:------------- | :------------ |
| 2023-01-15 | 2023 |
| 2022-11-20 | 2022 |
| 2023-03-01 | 2023 |

3. **Extração de dados de JSON**:

Generated Columns são excelentes para extrair e indexar informações de campos JSON, como a propriedade origem de um detalhes_json:

```sql
ALTER TABLE transacoes
ADD COLUMN origem VARCHAR(20)
GENERATED ALWAYS AS (
    JSON_UNQUOTE(JSON_EXTRACT(detalhes_json, '$.origem'))
) STORED;
```

Essa coluna pode então ser indexada, permitindo buscas rápidas em dados JSON sem a necessidade de percorrer toda a tabela.

**Quando usar Generated Columns**

- **Valores Derivados**: Quando um valor pode ser calculado a partir de outros campos, evitando redundância e erros.
- **Cálculos Repetitivos**: Centraliza a lógica de cálculo, simplificando consultas.
- **Indexação Necessária**: Permite indexar resultados de cálculos ou extrações, melhorando o desempenho de filtros.
- **Extração de JSON**: A melhor forma de extrair e indexar dados importantes de campos JSON.
- **Centralização de Regras**: Garante que as regras de negócio sejam aplicadas de forma consistente em todo o banco de dados.

# Fundamentos do Otimizador de Consultas e Análise de Desempenho

## Otimizador de Consultas (Query Optimizer)

O MySQL não executa um SELECT imediatamente. Primeiramente, ele constrói um plano de execução. Este plano define a ordem de acesso às tabelas, quais índices serão utilizados e como filtros e joins serão aplicados. O objetivo é encontrar o caminho mais eficiente.

- **Uso de Estatísticas**: O otimizador baseia suas decisões em estatísticas coletadas periodicamente e armazenadas. Ele não verifica o tamanho real da tabela no momento da consulta. Se as estatísticas estiverem desatualizadas, o plano de execução pode ser ineficiente.

## Comando EXPLAIN: Desvendando o Plano de Execução

O comando EXPLAIN é fundamental para entender como o MySQL planeja executar uma consulta. Ele revela o "caminho" escolhido, permitindo identificar gargalos e antecipar problemas de desempenho.

**Sintaxe:**

```sql
EXPLAIN SELECT coluna1, coluna2 FROM tabela WHERE condicao;
```

**Indicadores Chave do EXPLAIN**

Ao analisar o resultado do EXPLAIN, observe os seguintes indicadores:

- **TYPE**: Tipo de acesso aos dados.
    - **Pior**: ALL (leitura completa da tabela).
    - **Melhor**: CONST, EQ_REF (acesso direto e eficiente via índice).
- **KEY**: O índice que o MySQL escolheu usar. Se estiver vazio, nenhum índice foi utilizado.
- **POSSIBLE_KEYS**: Lista de índices que o MySQL considerou usar.
- **ROWS**: Estimativa do número de linhas que serão lidas.
- **FILTERED**: Percentual estimado de linhas que serão filtradas após a leitura.
- **EXTRA**: Informações adicionais cruciais.
    - **USING INDEX**: A consulta foi respondida usando apenas o índice, sem acessar a tabela (ótimo desempenho).
    - **USING TEMPORARY**: O MySQL precisou criar uma tabela temporária (pode indicar custo de memória/disco, comum em GROUP BY, DISTINCT, ORDER BY complexos).
    - **USING FILESORT**: O MySQL precisou ordenar os dados fora do índice (sinal de gargalo, especialmente com ORDER BY ou GROUP BY).

## O Inimigo do Desempenho: FULL TABLE SCAN

> A frase `FULL TABLE SCAN` no `EXPLAIN` é um alerta vermelho. Significa que o MySQL lerá todas as linhas da tabela para encontrar os registros.

**Causas Comuns:**

- Ausência de um índice adequado na coluna do WHERE.
- Aplicação de funções diretamente na coluna indexada no WHERE (ex: `WHERE FUNCAO(coluna) = 'valor'`).
- Filtros pouco seletivos, onde o otimizador decide que escanear a tabela inteira é mais eficiente.

## Melhorando Consultas com EXPLAIN

O EXPLAIN guia a análise para otimização:

- **Verificar o uso de índices (KEY).**
- **Analisar o TYPE de acesso.**
- **Identificar a presença de USING FILESORT ou USING TEMPORARY.**
- **Avaliar se o plano de execução faz sentido para o objetivo da consulta.**
- **Ajustar o SQL para aproveitar melhor os índices existentes ou criar novos.**

## Importância do Desempenho em Instituições Financeiras

Em ambientes como bancos, o desempenho não é um luxo, mas um requisito operacional crítico devido a:

- **Milhões de transações contínuas.**
- **Dashboards e relatórios em tempo real.**
- **Auditorias e relatórios regulatórios com prazos rígidos.**
- **Cálculo de risco e conformidade.**
- **Processos batch noturnos com janelas de tempo limitadas.**

## Lendo um plano de execução

A ferramenta `EXPLAIN FORMAT=JSON` é essencial para entender como o MySQL processa as consultas, permitindo identificar gargalos de performance. O resultado em JSON detalha o plano de execução, revelando informações cruciais sobre o acesso aos dados.

### Fundamentos do Plano de Execução

- **QueryBlock e SelectId**: Indicam blocos de consulta. Um `SelectId` igual a 1 geralmente significa uma consulta simples, sem subconsultas ou joins complexos.
- **TableName**: Mostra as tabelas envolvidas na consulta.
- **AccessType**: Descreve como o MySQL acessa as linhas da tabela.
- **ALL**: Indica um Full Table Scan, ou seja, a leitura de todas as linhas da tabela. É um sinal de alerta para performance.
- **REF**: Sugere o uso de um índice para encontrar linhas correspondentes.
- **RowsExaminedPerScan**: Estimativa do número de linhas que o MySQL lerá.
- **RowsProducedPerJoin**: Número de linhas resultantes após a aplicação de filtros.
- **Filtered**: Percentual de linhas que passam pelo filtro. Um baixo percentual indica trabalho desperdiçado.
- **UsedColumns**: Lista as colunas selecionadas. `SELECT *` aumenta o I/O.
- **AttachedCondition**: Exibe o filtro aplicado na cláusula WHERE.
- **query_cost**: Um valor interno do MySQL que estima o custo total da consulta. Não possui unidade de medida e é útil para comparar a performance entre diferentes planos de execução.

**Consultas com JOINs**

```sql
EXPLAIN FORMAT=JSON
SELECT
    c.nome,
    ct.numero_conta,
    t.valor,
    t.data_transacao
FROM clientes c
JOIN contas ct ON ct.id_cliente = c.id_cliente
JOIN transacoes t ON t.id_conta = ct.id_conta
WHERE c.status = 'ATIVO';
```

**Observações**:

- **NEARTH LOOPING**: Um array no JSON que detalha o processamento de cada tabela envolvida no JOIN.
- **A ordem das tabelas no JOIN influencia a ordem de processamento**.
- **O uso de índices (chaves primárias e estrangeiras) é crucial para otimizar o acesso às tabelas em um JOIN (`AccessType REF`)**.
- **Um Full Table Scan na primeira tabela do JOIN pode elevar significativamente o `query_cost`**.

**Consultas com GROUP BY**

```sql
EXPLAIN FORMAT=JSON
SELECT
    ct.id_agencia,
    COUNT(*) AS total_contas
FROM contas ct
GROUP BY ct.id_agencia;
```

**Observações**:

- **GROUPING OPERATION**: Indica uma operação de agrupamento.
- **USING FILE SORT FALSE**: Bom sinal, significa que não foi necessária uma tabela temporária para agrupar.
- **USING INDEX TRUE**: O agrupamento foi otimizado pelo uso de um índice (geralmente de chave estrangeira), resultando em baixo `query_cost`.

**Consultas com ORDER BY**

```sql
EXPLAIN FORMAT=JSON
SELECT
    id_transacao,
    valor,
    data_transacao
FROM transacoes
ORDER BY data_transacao DESC;
```

**Observações**:

- **ORDER IN OPERATION**: Indica uma operação de ordenação.
- **USING FILE SORT TRUE**: Mau sinal, significa que o MySQL precisou ler todas as linhas e usar uma tabela temporária para ordenar, pois não havia índice na coluna de ordenação.
- **Resulta em um `query_cost` elevado, sendo geralmente o pior cenário de performance**.

**Pontos Chave para Análise de Performance**

- **Uso de Índices**: O MySQL está utilizando índices ou realizando Full Table Scans?
- **Tipo de Acesso**: O `AccessType` é coerente com o volume de dados e os filtros?
- **Linhas Estimadas**: Quantas linhas o MySQL estima ler (`RowsExaminedPerScan`)? Um número alto indica maior custo.
- **FILE SORTS e Tabelas Temporárias**: Há indicações de `USING FILE SORT TRUE` ou uso de tabelas temporárias para ordenação/agrupamento? Isso aponta para gargalos.
- **Escalabilidade**: O plano de execução será performático à medida que o volume de dados cresce? O `EXPLAIN` fornece uma estimativa baseada nas estatísticas atuais.
