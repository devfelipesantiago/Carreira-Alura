# MySQL para Modelagem Multidimensional e Data Warehousing

## Porque o Data Warehouse é diferente do banco transacional

- **Bancos de Dados Transacionais (OLTP)**: São projetados para registrar eventos do negócio em tempo real, focando na eficiência de inserção e atualização de dados, garantindo integridade e respondendo rapidamente a operações pontuais. São altamente normalizados e o maior inimigo é a latência da escrita. Possuem relatórios operacionais para auxiliar as operações diárias.

- **Data Warehouses (OLAP)**: Nascem com o objetivo de ler grandes volumes de dados, cruzar informações, agregar, resumir e analisar para a tomada de decisão. Suas consultas são longas, complexas e exploratórias. São desnormalizados para performance na geração de relatórios, armazenam dados históricos e têm baixa taxa de atualização, mantendo o conteúdo "congelado" na maior parte do tempo. As otimizações são quase que exclusivamente para leitura.

- **Por que não misturar OLTP e OLAP**: Misturar esses dois tipos de cargas no mesmo banco pode causar problemas como locks e deadlocks por consultas longas, lentidão perceptível para o cliente final, dificuldade em manter o histórico e degradação progressiva da performance devido ao grande volume de dados do OLAP.

- **Importância da Separação**: A separação garante que o sistema transacional, que controla o dia a dia da empresa, não seja comprometido pelas consultas analíticas, e que o Data Warehouse possa focar em transformar dados operacionais em informações analíticas confiáveis para a tomada de decisão estratégica.

## Fundamentos da modelagem multidimensional

- **Modelagem Multidimensional**: É uma técnica criada especificamente para análise de dados em um Data Warehouse, diferente da modelagem relacional tradicional. Ela é orientada a perguntas de negócio e se baseia em dois conceitos principais:

  - **Indicadores (Fatos)**: O que queremos analisar (métricas, números, valores mensuráveis). Exemplos incluem total de transações, volume movimentado e ticket médio.

  - **Dimensões**: Como queremos analisar os indicadores (perspectivas). Exemplos incluem cliente, data, agência, canal, produto, período, faixa etária, região e tipo de conta. As dimensões são tabelas descritivas com atributos e hierarquias (como ano, mês, dia para a dimensão tempo).

- **Tabela de Fato**: Representa os eventos de negócio e responde à pergunta: "o que aconteceu?".

  - Pense nela como o registro de uma ocorrência ou uma transação específica. Por exemplo, no contexto do Suprema Bank, a aula menciona que exemplos típicos de fatos são:
    - Transações financeiras
    - Pagamentos
    - Inadimplências
    - Créditos aprovados

- **Granularidade**: Um ponto crucial sobre a tabela de fato é a sua granularidade. Quanto mais detalhado for o fato registrado (ou seja, quanto mais granular for a tabela de fato), maior será o volume de dados, mas também maior será o potencial analítico que você terá para explorar esses dados.

- As métricas presentes em uma tabela de fato são sempre numéricas e podem ser classificadas como:

  - **Aditivas**: Podem ser somadas em todos os níveis da hierarquia.
  - **Semi-aditivas**: Podem ser somadas em algumas dimensões, mas não em outras (ex: médias, máximos/mínimos).
  - **Não aditivas**: Não podem ser somadas (ex: percentuais, divisões).

- Em resumo, a tabela de fato é onde os números e as ocorrências dos eventos de negócio são armazenados, e ela é o coração da análise no Data Warehouse, pois é através dela que você vai medir "o que aconteceu" sob diversas perspectivas (dimensões).

- **Os modelos de organização de fatos e dimensões**:

  - **Modelo estrela**: Uma tabela de fato central cercada por tabelas de dimensões desnormalizadas. É bom para performance.
  - **Modelo snowflake**: Cada nível hierárquico da dimensão está em uma tabela isolada. É mais fácil para manutenção das dimensões.
  - **Modelo pai-filho**: Usado para hierarquias irregulares, onde o número de níveis antecedentes pode variar para o nível folha.

- **Dimensões, hierarquias e atributos**:

  - **Dimensões**: São conjuntos de informações descritivas que contextualizam os fatos, como cliente, produto, canal, agência e tempo.
  - **Atributos dimensionais**: São os campos dentro de uma dimensão que usamos para filtrar, agrupar ou segmentar dados (ex: idade, renda de um cliente).
  - **Hierarquias**: São criadas ao organizar atributos dimensionais de forma lógica, representando níveis de análise do mais consolidado ao mais detalhado (ex: ano, mês, dia na dimensão tempo).
  - **Dimensão tempo**: É a mais importante em qualquer modelo gerencial, pois permite análises históricas, de tendência e comparação. Ela transforma o tempo operacional (timestamp) em uma dimensão rica com atributos como ano, mês, trimestre, dia da semana, feriado, etc.

## Indicadores, KPI, granularidade e forma

- **Introdução aos Indicadores**: Indicadores são números que quantificam eventos ou estados de um negócio. Eles representam métricas como valor de transação, quantidade de transações, saldo acumulado ou volume de crédito aprovado. Esses indicadores são sempre associados a eventos e, por isso, são criados e armazenados na tabela de fatos.

- **Diferença entre Indicadores e KPIs**: Um indicador é uma métrica bruta, um dado numérico simples. Já um KPI (Key Performance Indicator) é um indicador que ganha significado dentro de um contexto de negócio, com uma meta ou objetivo específico. Por exemplo, "inadimplência de 2%" é um indicador, mas "manter a inadimplência abaixo de 1,5%" é um KPI. KPIs são geralmente calculados e interpretados na camada de apresentação (Business Intelligence), e não armazenados diretamente no Data Warehouse.

- **Compreendendo a Granularidade**: A granularidade define o nível mais básico de detalhamento dos dados armazenados em uma tabela de fatos. Ela impacta o tamanho da tabela, os tipos de análise possíveis e a complexidade dos cálculos. Exemplos de granularidade incluem:

  - **Transacional**: Uma linha para cada transação individual.
  - **Diária por cliente**: Uma linha que representa a soma das transações de um cliente em um dia.
  - **Mensal**: Dados já agregados por mês. A escolha da granularidade é uma decisão de projeto, baseada nas necessidades de análise do usuário de negócio.

- **Consolidando Indicadores e Métricas (Forma)**: Os indicadores se comportam de maneiras diferentes quando são consolidados (agregados) em níveis superiores das dimensões:

  - **Métricas aditivas**: Podem ser somadas em qualquer dimensão, incluindo a dimensão tempo. Exemplos são a quantidade de transações e o valor da transação.
  - **Métricas semi-aditivas**: Podem ser somadas em algumas dimensões (como por agência ou cliente), mas não na dimensão tempo. O saldo de conta é um exemplo clássico: o saldo do mês é o saldo do último dia, não a soma dos saldos diários.
  - **Métricas não aditivas**: Não podem ser somadas. Elas geralmente representam médias, taxas ou percentuais (como taxa de juros ou ticket médio). No Data Warehouse, a regra é armazenar apenas métricas simples e aditivas; as métricas não aditivas e derivadas são calculadas nas consultas ou nas ferramentas de Business Intelligence.

## Estrutura prática de um Data Warehouse

- Este é o ponto de partida para a construção de um Data Warehouse. É o momento de aplicar os conceitos teóricos de dimensões, indicadores, granularidades e KPIs em um projeto real. Para isso, é essencial ter uma base de dados que servirá como fonte de informações.

### Recuperando o backup do banco de dados

- Para garantir que todos trabalhem com a mesma base de dados, é comum restaurar um backup. Isso envolve remover um esquema existente, criar um novo esquema para o banco de dados transacional (OLTP) e, em seguida, importar os dados do arquivo de backup para esse novo esquema. Assim, o ambiente fica pronto para ser a fonte do Data Warehouse.

### Considerando a separação de ambientes

- Em projetos de Data Warehouse, é crucial que ele não compartilhe o mesmo ambiente do banco de dados transacional, nem mesmo os mesmos servidores físicos. Isso porque os processos analíticos consomem muitos recursos e não devem competir com as operações do dia a dia. Conceitualmente, o Data Warehouse deve estar em um servidor e hardware separados, embora, por simplicidade em ambientes de estudo, possa ser criado no mesmo servidor.

### Criando o banco de dados do Data Warehouse

- Após configurar o ambiente transacional, o próximo passo é criar o banco de dados que abrigará o Data Warehouse. Este novo esquema, inicialmente vazio, será o local onde todas as tabelas dimensionais e de fatos serão construídas.

### Escolhendo o motor de tabelas no MySQL

- A escolha do motor de tabelas é uma decisão de arquitetura importante. No MySQL, existem motores como MyISAM e InnoDB. Para bancos de dados transacionais, o InnoDB é a escolha padrão devido ao seu controle de transações e integridade referencial. Para Data Warehouses, especialmente a partir do MySQL 8, o InnoDB também se tornou a opção preferencial. Ele oferece melhor performance e a capacidade de implementar chaves primárias (PKs) e chaves estrangeiras (FKs), garantindo a integridade do Data Warehouse sem comprometer o desempenho.

### Comparando MyISAM e InnoDB para Data Warehouses

- Historicamente, o MyISAM era usado em Data Warehouses por facilitar a carga de grandes volumes de dados. No entanto, ele não suporta transações nem chaves estrangeiras, o que pode comprometer a integridade referencial. O InnoDB, por outro lado, oferece suporte completo a transações e integridade referencial, e com as melhorias no MySQL 8, ele superou as vantagens do MyISAM para Data Warehouses, tornando-se a escolha mais moderna e robusta.

### Elaborando o modelo multidimensional

- Antes de construir as tabelas, é fundamental elaborar um modelo multidimensional. Isso começa com a compreensão das necessidades de análise do negócio, geralmente obtidas através de entrevistas com os usuários. O modelo relacional existente pode ser um ponto de partida, mas o modelo multidimensional muitas vezes requer dados complementares e uma estrutura diferente para otimizar as consultas analíticas. A construção de uma matriz dimensão-indicador é uma ferramenta eficaz para documentar esses requisitos.

### Classificando indicadores e dimensões

- Nesta etapa, os indicadores (o que se quer analisar) e as dimensões (como se quer analisar) são classificados. A dimensão tempo é sempre presente. Os indicadores podem vir diretamente da base transacional ou serem calculados. É importante analisar como os indicadores se consolidam ao longo das dimensões, pois um dado que parece ser de entrada pode precisar ser tratado como calculado para garantir a correção dos valores agregados. Por exemplo, o preço, embora venha da base transacional, pode precisar ser calculado como uma média para evitar somas incorretas.

### Consolidando indicadores e definindo atributos

- A consolidação de indicadores envolve decidir quais serão armazenados diretamente na tabela de fatos e quais serão calculados. As fórmulas de cálculo devem ser documentadas. Para as dimensões, cada uma terá, no mínimo, um identificador numérico, um código e um nome. Além disso, são identificados atributos específicos que dependem apenas do membro da dimensão, como a data de nascimento de um cliente ou a população de uma cidade. Se um atributo depende do cruzamento entre dimensões, ele é, na verdade, um indicador.

### Analisando hierarquias e relacionamentos entre dimensões

- É crucial analisar como as dimensões se relacionam. Dimensões que possuem uma relação hierárquica (como cliente, cidade, estado e país) podem ser agrupadas em uma única dimensão para simplificar o modelo e melhorar a performance. A identificação dessas hierarquias é fundamental e muitas vezes requer a colaboração dos usuários.

### Determinando cruzamentos de indicadores e dimensões

- Nem todos os indicadores se cruzam com todas as dimensões. É preciso analisar quais indicadores fazem sentido com quais dimensões. Por exemplo, o custo de um produto pode depender apenas do produto, enquanto o preço de venda pode depender tanto do produto quanto do cliente. A dimensão tempo, no entanto, geralmente se cruza com todos os indicadores.

### Validando o modelo do Data Warehouse

- Após a elaboração da matriz dimensão-indicador, o modelo do Data Warehouse precisa ser validado. A matriz deve ser documentada, seja em uma planilha ou outro software, e apresentada aos usuários para aprovação. Somente após essa validação, a construção do banco de dados pode prosseguir.

## Criando a dimensões de negócios

### Introdução ao Projeto e Definição de Dimensões de Negócio

- Ao iniciar a construção de um Data Warehouse, o primeiro passo é transformar um modelo relacional existente em um modelo multidimensional. Isso envolve identificar as entidades que se tornarão dimensões, que representam os "quem", "o quê", "onde" e "quando" dos dados. Neste contexto, focamos em dimensões de negócio essenciais como cliente, agência e gerência. É importante notar que alguns atributos, como tipo e origem de transação, podem ser mais adequados para a tabela de fatos, que registra os eventos e métricas.

### Considerações sobre Informações e Hierarquias para as Dimensões

- Para definir as dimensões, analisamos as informações disponíveis no modelo relacional. Por exemplo, em vez de criar uma dimensão detalhada para "conta", que é muito granular, optamos por focar em dimensões de negócio mais abrangentes. Dentro de cada dimensão, identificamos atributos e hierarquias. Para a dimensão "agência", consideramos o código, nome, cidade e estado. Para "cliente", incluímos código, nome, data de nascimento, cidade, estado e data de cadastro. A "gerência" abrange o código do gerente, nome e sua relação com a regional. Atributos como status e tipo de conta também são considerados, mas podem se tornar dimensões mais simples.

### Estruturação da Matriz Dimensão-Indicador

- A matriz dimensão-indicador é uma ferramenta crucial para organizar e documentar as dimensões e seus atributos. Para a dimensão "cliente", estabelecemos uma hierarquia que vai do estado, passa pela cidade e chega ao cliente. Cada nível dessa hierarquia possui um código, um descritor e um identificador. Para o cliente, além do código e descritor, incluímos o status e a idade, que é um atributo calculado a partir da data de nascimento. De forma similar, a dimensão "agência" segue a hierarquia estado, cidade e agência, e a dimensão "gerência" organiza-se por regional e gerência.

### Criação de Tabelas para as Dimensões no MySQL

- A implementação das dimensões no Data Warehouse envolve a criação de tabelas no MySQL. Uma característica fundamental dessas tabelas é a utilização de uma surrogate key (chave substituta). Esta é uma chave primária numérica, auto incremental, que identifica unicamente cada membro da dimensão, independentemente do código original do sistema transacional. Por exemplo, a dimensão "cliente" terá um id_cliente como chave primária, em vez do cod_cliente original. Isso garante flexibilidade e desempenho no ambiente do Data Warehouse.

### Detalhamento da Criação das Tabelas de Dimensões

- Ao criar as tabelas, definimos os campos para cada atributo da dimensão. Para a dimensão "cliente", além do ```id_cliente (INT AUTO_INCREMENT PRIMARY KEY), incluímos cod_cliente, nome_cliente, cod_cidade_cliente, nome_cidade_cliente, cod_estado_cliente, nome_estado_cliente, status_cliente, idade_cliente e data_primeira_transacao.``` A dimensão "agência" segue um padrão similar, com ```id_agencia, cod_agencia, nome_agencia, cod_cidade_agencia, nome_cidade_agencia, cod_estado_agencia e nome_estado_agencia```.

### Implementação das Tabelas de Cliente, Agência e Gerência

- As tabelas são criadas utilizando o comando CREATE TABLE no MySQL. É crucial garantir que o banco de dados correto (o Data Warehouse) esteja selecionado para evitar a criação das dimensões no banco de dados transacional. A dimensão "gerência" é criada com ```id_gerencia, cod_gerencia, nome_gerencia, cod_regional e nome_regional```.

### Criação de Dimensões Adicionais

- Além das dimensões principais, também criamos dimensões mais simples para atributos que não possuem hierarquias complexas, como "tipo de conta" e "status de conta". Cada uma dessas dimensões possui um id (surrogate key), um cod e um nome para descrever o tipo ou status.

## Introdução ao processo de ETL

- Imagine que você construiu uma biblioteca muito bem organizada, com prateleiras e seções para cada tipo de livro. Essa é a estrutura do seu Data Warehouse. No entanto, uma biblioteca sem livros não serve para nada, certo? É aí que entra o processo de ETL. Ele é como a equipe que busca os livros em diversas livrarias (fontes de dados), os organiza e cataloga (transformação) e, finalmente, os coloca nas prateleiras certas da sua biblioteca (carga). Sem o ETL, seu Data Warehouse seria apenas um belo projeto vazio.

### A Função do ETL

- Pense em dois mundos distintos: um é o "mundo operacional", onde todas as transações do dia a dia acontecem, como vendas, cadastros de clientes e movimentações bancárias. O outro é o "mundo analítico", onde queremos entender o que aconteceu, por que aconteceu e o que pode acontecer no futuro. O ETL é a ponte que conecta esses dois mundos. Ele pega os dados brutos do mundo operacional e os prepara para que possam ser usados para análises e tomadas de decisão estratégicas no mundo analítico.

**A sigla ETL representa três grandes etapas:**

- **Extrair (Extract)**: É o ato de coletar os dados de suas origens. Pense em um pescador lançando sua rede para pegar peixes. Ele não se preocupa em limpá-los ou cozinhá-los ainda, apenas em trazê-los para o barco. Da mesma forma, nesta etapa, o foco é apenas buscar os dados de forma eficiente, seja de um banco de dados, de arquivos ou de outros sistemas.

- **Transformar (Transform)**: Esta é a etapa mais "inteligente" e crucial. Depois de extrair os dados, eles precisam ser "cozinhados" e "temperados" para a análise. Isso significa aplicar regras de negócio (por exemplo, calcular o lucro de uma venda), padronizar informações (garantir que "SP" e "São Paulo" sejam tratados da mesma forma), limpar dados inconsistentes (corrigir erros ou remover informações duplicadas) e criar novos atributos que serão úteis para a análise. É aqui que os dados brutos se tornam informações valiosas.

- **Carregar (Load)**: Finalmente, os dados transformados são inseridos no Data Warehouse. É como organizar os livros já catalogados nas prateleiras corretas da sua biblioteca. Nesta etapa, também garantimos que o histórico dos dados seja mantido, que as versões sejam controladas e que a integridade seja preservada para que as análises futuras sejam confiáveis.

### Diferenciando o Data Warehouse do Banco Operacional

> É um erro comum pensar que um Data Warehouse é apenas uma cópia do banco de dados que usamos no dia a dia. Não é! Eles têm propósitos diferentes. O banco operacional (OLTP) é otimizado para registrar transações rápidas e frequentes. Já o Data Warehouse (DW) é otimizado para análises complexas e consultas que buscam padrões e tendências ao longo do tempo. Os dados no DW são reorganizados e consolidados para esse fim, não apenas copiados.

### As Camadas do ETL

Para gerenciar todo esse processo de forma organizada, o ETL geralmente utiliza algumas "camadas" intermediárias:

- **Stage (Área de Staging)**: Pense nisso como uma "área de desembarque" ou um "depósito temporário". Quando os dados são extraídos das fontes, eles são primeiramente colocados aqui, quase em seu formato original. O objetivo é apenas gravar os dados rapidamente e de forma controlada, sem se preocupar com regras de negócio ou integridade analítica ainda.

- **ADS (Area de Dados de Suporte)**: Esta é uma camada intermediária onde os dados já estão um pouco mais organizados e limpos. Eles podem conter um nível de detalhe mais granular do que o Data Warehouse final. É útil para auditorias e verificações, permitindo que os usuários consultem detalhes mais específicos se precisarem.

- **Data Warehouse**: Esta é a camada final, onde os dados já estão totalmente transformados e estruturados para a análise. É aqui que os históricos são armazenados de acordo com a modelagem dimensional, e onde os indicadores de desempenho (KPIs) são construídos e consultados pelos usuários.

> Uma frase que resume bem essa arquitetura é: "Staging recebe dados, ADS organiza os dados e Data Warehouse analisa."

#### O Uso de Surrogate Keys

No Data Warehouse, não usamos os códigos originais dos sistemas operacionais para identificar os itens das dimensões (como um cliente ou um produto). Em vez disso, criamos um novo identificador numérico sequencial para cada item, chamado Surrogate Key. Por exemplo, se um cliente é identificado pelo CNPJ no sistema operacional, no Data Warehouse, o CNPJ será apenas um atributo do cliente, e o cliente terá uma Surrogate Key única (como 1, 2, 3...). Isso otimiza o desempenho e a flexibilidade do Data Warehouse. O processo de lookup é o mecanismo que converte o código original na Surrogate Key correspondente durante o ETL.

#### Tipos de Carga no Data Warehouse

Existem duas formas principais de carregar dados no Data Warehouse:

- **Carga Inicial**: É a primeira vez que os dados são carregados. O objetivo é trazer o máximo de histórico possível para o Data Warehouse, preenchendo-o desde o início.

- **Carga Incremental**: Depois da carga inicial, esta é a forma de manter o Data Warehouse atualizado. Ela carrega apenas os dados novos ou modificados desde a última carga, garantindo que o ambiente esteja sempre com as informações mais recentes.

#### SCD1 (Slowly Changing Dimensions Tipo 1) na prática

##### Etapas da implementação do SCD Tipo 1 na prática (com foco nos comandos MySQL):

###### Criação de um Índice Único na Tabela de Dimensão:

- **Objetivo**: Garantir que cada registro na dimensão tenha um código natural exclusivo. Isso é fundamental para que o MySQL saiba identificar se um registro já existe ou se é um novo.

- **Comando**:

```sql
ALTER TABLE dim_tipo_conta ADD UNIQUE KEY uk_dim_tipo_conta_cod (cod_tipo_conta);
```

> **O que o comando faz**: Ele adiciona uma restrição de chave única (UNIQUE KEY) à coluna cod_tipo_conta na tabela dim_tipo_conta. Se você tentar inserir um registro com um cod_tipo_conta que já existe, o MySQL irá detectar essa duplicidade.

**Criação da Stored Procedure para Carga da Dimensão (UPSERT)**:

- **Objetivo**: Automatizar o processo de inserir novos dados ou atualizar dados existentes na tabela de dimensão, buscando os dados da fonte transacional.

- **Comandos principais dentro da Stored Procedure**:

```sql
INSERT INTO suprema_bank_dw.dim_tipo_conta (cod_tipo_conta, nome_tipo_conta) 
SELECT s.cod_tipo_conta, s.nome 
FROM suprema_bank_db.tipos_conta AS s
```

> **O que o comando faz**: Tenta inserir dados da tabela tipos_conta (do banco transacional suprema_bank_db) na tabela de dimensão dim_tipo_conta (do Data Warehouse suprema_bank_dw). Ele seleciona o código natural (cod_tipo_conta) e o nome (nome) da tabela fonte.

```sql
ON DUPLICATE KEY UPDATE nome_tipo_conta = IF(nome_tipo_conta <> VALUES(nome_tipo_conta), VALUES(nome_tipo_conta), nome_tipo_conta);
```

> **O que o comando faz**: Esta é a parte central do SCD Tipo 1 na aula.
> **ON DUPLICATE KEY UPDATE**: Esta cláusula é ativada se o INSERT tentar adicionar um registro com uma chave única (que definimos no passo 1) que já existe. Em vez de falhar, ele executa uma atualização.
> **VALUES(nome_tipo_conta)**: Refere-se ao valor do nome_tipo_conta que está vindo do SELECT (ou seja, o novo valor da fonte).
> **IF(condição, valor_se_verdadeiro, valor_se_falso)**: Testa se o nome_tipo_conta atual na dimensão é diferente (<>) do VALUES(nome_tipo_conta) (o novo valor).
> Se for diferente, ele atualiza o nome_tipo_conta da dimensão para o VALUES(nome_tipo_conta) (o novo valor).
> Se for igual, ele mantém o nome_tipo_conta existente, ou seja, não faz nenhuma alteração. Isso otimiza o processo, atualizando apenas quando há uma mudança real.

**Execução da Stored Procedure**:

- **Objetivo**: Iniciar o processo de carga e atualização da dimensão.
- **Comando**: CALL prc_upsert_dim_tipo_conta(); (Este comando não foi explicitamente mostrado na transcrição, mas é a forma padrão de executar uma stored procedure sem parâmetros).
- **O que o comando faz**: Invoca a stored procedure criada, que então executa a lógica de INSERT...ON DUPLICATE KEY UPDATE, buscando dados da fonte e atualizando a dimensão.

**Testes e Verificação**:

- **Objetivo**: Validar se a lógica de inserção e atualização está funcionando conforme o esperado, observando as mudanças na tabela de dimensão após alterações na tabela fonte.
- **Comandos de exemplo para teste (na tabela fonte)**:

```sql
INSERT INTO suprema_bank_db.tipos_conta VALUES ('00004', 'Conta Salário');
```

> **O que o comando faz**: Adiciona um novo registro na tabela fonte, que deverá ser inserido como um novo membro na dimensão.

```sql
UPDATE suprema_bank_db.tipos_conta SET nome = 'Conta de Investimento - Poupança' WHERE cod_tipo_conta = '00002';
```

> **O que o comando faz**: Altera o nome de um registro existente na tabela fonte, que deverá ser atualizado na dimensão (se a lógica IF detectar a mudança).

#### Gerenciando Mudanças em Dimensões: O Conceito de Slowly Changing Dimensions (SCD)

Ao construir um Data Warehouse, um dos maiores desafios é lidar com a evolução dos dados ao longo do tempo. As informações sobre clientes, produtos ou locais não são estáticas; elas mudam. Como podemos garantir que nossos relatórios históricos reflitam a realidade de cada período, mesmo quando os atributos de uma dimensão se alteram? É aqui que entra o conceito de Slowly Changing Dimensions (Dimensões que Mudam Lentamente), ou SCD.

Imagine que você tem um cliente que mora em Niterói e, em um determinado período, suas transações são registradas. Meses depois, esse cliente se muda para Santos. Se simplesmente atualizarmos o registro do cliente com a nova cidade, todos os relatórios passados que usavam a cidade do cliente passariam a mostrar "Santos", mesmo para o período em que ele morava em Niterói. Isso distorce a análise histórica. O SCD oferece estratégias para gerenciar essas mudanças de forma a preservar a integridade dos dados históricos.

> Existem diferentes abordagens para lidar com essas mudanças, e cada uma é adequada para cenários específicos:

- **SCD Tipo 1: A Simplicidade da Sobrescrita**
  - O SCD Tipo 1 é a estratégia mais direta. Quando um atributo de uma dimensão muda, o valor antigo é simplesmente substituído pelo novo. Não há registro do histórico da mudança.
  - Quando usar? É ideal para atributos onde a perda do histórico não impacta a análise. Por exemplo, se você corrigir um erro de digitação no nome de um cliente, não é necessário manter o registro do nome com o erro. A versão mais recente é a única relevante.
  - Impacto: É fácil de implementar, mas significa que qualquer análise histórica baseada nesse atributo sempre refletirá o valor mais recente.

- **SCD Tipo 2: Preservando o Histórico Completo**
  - O SCD Tipo 2 é a estratégia mais poderosa e amplamente utilizada para manter um histórico completo das mudanças. Em vez de sobrescrever um registro existente, uma nova linha é criada na dimensão sempre que um atributo relevante muda.
  - Como funciona? Cada versão do registro da dimensão recebe uma nova surrogate key (chave substituta) e é associada a um período de validade. A linha antiga é "fechada" (indicando que não é mais a versão atual), e uma nova linha é "aberta" com os novos atributos e um novo período de validade.
  - Quando usar? É essencial para atributos onde o histórico é crucial para a análise, como a cidade de um cliente, a agência bancária de uma conta ou a faixa etária. Se você precisa saber onde o cliente morava em um determinado mês no passado, o SCD Tipo 2 garante que essa informação esteja disponível.
  - Impacto: Permite análises históricas precisas, pois você pode sempre vincular os fatos ao estado correto da dimensão em qualquer ponto no tempo.

- **SCD Tipo 3: Histórico Limitado**
  - O SCD Tipo 3 oferece uma solução intermediária, mantendo um histórico limitado. Geralmente, ele armazena o valor atual e o valor anterior de um atributo em colunas separadas dentro do mesmo registro.
  - Quando usar? Para situações onde apenas o valor imediatamente anterior é relevante para a análise.
  - Impacto: É menos comum e mais complexo de gerenciar do que o Tipo 1 e o Tipo 2 para a maioria dos cenários de Data Warehouse.

#### Desafios e Soluções na Implementação do SCD Tipo 2

- **Objetivo**: Solucionar o desafio fundamental de saber qual versão de um registro de dimensão (qual surrogate key) usar para um determinado evento na tabela de fatos, especialmente quando há várias versões do mesmo cliente ao longo do tempo.

> **Duas abordagens principais são utilizadas para resolver isso**:

#### Usando Flags de Atividade

- Uma coluna booleana (por exemplo, "EstáAtivo") é adicionada à dimensão. Quando uma nova versão de um registro é criada, ela é marcada como "true", e todas as versões anteriores do mesmo código natural são marcadas como "false".
- **Vantagem**: Simples para cargas incrementais, onde apenas novos dados são adicionados e o passado não é alterado.
- **Limitação**: Falha se você precisar recarregar dados históricos. Se um evento de 2023 for recarregado hoje, ele seria associado à versão "ativa" mais recente do cliente, mesmo que essa versão não existisse em 2023, distorcendo o histórico.

#### Usando Datas de Validade (Data de Início e Data de Fim):

- Esta é a abordagem mais robusta. Cada registro na dimensão SCD Tipo 2 tem duas colunas: `DataInicioValidade` e `DataFimValidade`.
- Quando um registro é criado pela primeira vez, sua DataInicioValidade é definida (geralmente uma data muito antiga) e sua DataFimValidade é definida como uma data futura máxima (ou nula).
- Quando um atributo muda, a DataFimValidade do registro antigo é atualizada para a data da mudança (ou um dia antes), e um novo registro é inserido com os novos atributos, tendo sua DataInicioValidade como a data da mudança e sua DataFimValidade como a data futura máxima.
  - **Vantagem**: Permite que você vincule eventos da tabela de fatos à versão correta da dimensão em qualquer ponto no tempo, mesmo ao recarregar dados históricos. Ao carregar um fato, você simplesmente procura a surrogate key da dimensão onde a data do fato está entre a DataInicioValidade e a DataFimValidade do registro da dimensão.
  - **Impacto**: Garante a máxima precisão histórica e flexibilidade para análises e recargas de dados.

#### Implementando Dimensões de Alteração Lenta Tipo 2 (SCD Tipo 2)

Quando trabalhamos com dados em um Data Warehouse, é fundamental que as informações das dimensões reflitam a realidade ao longo do tempo. Algumas características dos nossos dados mudam, e precisamos decidir se queremos manter um registro dessas mudanças ou apenas atualizar o valor mais recente. As Dimensões de Alteração Lenta (SCDs) nos ajudam a gerenciar isso, e o Tipo 2 é especialmente útil para preservar o histórico completo.

> Vamos explorar como implementar essa estratégia, usando como exemplo uma dimensão de clientes.

#### Preparando a Tabela da Dimensão

> Para que uma dimensão possa registrar o histórico de mudanças, precisamos adicionar algumas colunas especiais. Imagine que cada "versão" de um cliente tem um período de validade. Para isso, criamos dois novos campos:

```sql
valid_from: 
-- Esta coluna registra a data em que uma determinada versão do registro do cliente se tornou válida.
valid_to: 
-- Esta coluna registra a data em que essa versão do registro do cliente deixou de ser válida.
```

> Por padrão, quando um registro é criado, ele é válido desde a menor data possível (por exemplo, '1000-01-01') até a maior data possível (por exemplo, '9999-12-31'). Isso indica que essa é a versão "atual" do registro.

#### Otimizando Consultas com Índices

Em uma dimensão Tipo 2, um mesmo cliente (identificado por seu código natural) pode ter várias linhas na tabela, cada uma representando uma versão diferente de seus dados ao longo do tempo. Para encontrar rapidamente a versão correta de um cliente, especialmente a mais atual, precisamos de um mecanismo de busca eficiente.

Criamos um índice que combina o código natural do cliente com a data de validade final (valid_to). Isso permite que o sistema localize rapidamente todas as versões de um cliente e, mais importante, identifique qual é a versão atualmente válida (aquela com a maior data em valid_to).

#### Automatizando a Carga e Atualização com Procedimentos Armazenados

Para gerenciar a complexidade de inserir novos dados e atualizar os existentes, utilizamos um procedimento armazenado (Stored Procedure). Este é um bloco de código SQL que pode ser executado repetidamente, garantindo que a lógica de atualização seja consistente.

> Dentro deste procedimento, lidamos com três cenários principais:

- **Inserindo Novos Clientes**: Quando um cliente aparece pela primeira vez, uma nova linha é adicionada à dimensão. Seus dados são registrados, e as datas valid_from e valid_to são definidas para o período padrão (menor e maior data).
- **Atualizando Atributos que Preservam Histórico**: Se um atributo importante do cliente (como cidade, estado, status ou idade) muda, e queremos manter um registro de como ele era antes, o processo é o seguinte:
  - A versão "atual" do cliente na dimensão tem seu valid_to alterado para a data de "ontem". Isso "fecha" o período de validade da versão antiga.
  - Uma nova linha é inserida para o mesmo cliente, contendo os novos valores dos atributos. Esta nova linha terá seu valid_from definido para a data de "hoje" e seu valid_to para a maior data possível, indicando que é a nova versão "atual".
- **Atualizando Atributos que Não Preservam Histórico**: Para atributos que não exigem histórico (como uma correção no nome do cliente), a atualização é mais simples. Apenas a versão "atual" do cliente na dimensão é modificada diretamente, sem a criação de uma nova linha.

#### Executando e Testando as Atualizações

O procedimento armazenado é executado, e é comum que, para certas operações de atualização, seja necessário desativar temporariamente um recurso de segurança do cliente SQL (SQL_SAFE_UPDATES). Isso permite que as atualizações ocorram conforme a lógica do procedimento, que pode não usar chaves primárias como filtro em todas as suas etapas.

Após a execução, é crucial verificar os resultados. Por exemplo, se alterarmos a cidade de um cliente na fonte de dados e executarmos o procedimento, esperamos ver duas linhas para esse cliente na dimensão: uma com a cidade antiga e a data de validade "fechada" (até ontem), e outra com a nova cidade e a data de validade "aberta" (a partir de hoje até a maior data).

```sql

-- Exemplo: Transformando a tabela de dimensão cliente para ter os atributos da data de validade.

USE suprema_bank_dw;

ALTER TABLE dim_cliente
  ADD COLUMN valid_from DATE NOT NULL DEFAULT '1000-01-01',
  ADD COLUMN valid_to   DATE NOT NULL DEFAULT '9999-12-31';

-- Exemplo: Criando alguns indices desejados.

USE suprema_bank_dw;

-- Lookup da versão atual (SCD2)
CREATE INDEX ix_dim_cliente_cod_validto
ON dim_cliente (cod_cliente, valid_to);

-- Exemplo: Criando a Store Procedure de atualização da dimensão cliente.

USE suprema_bank_dw;

DROP PROCEDURE IF EXISTS prc_carga_dim_cliente_scd2;
DELIMITER $$

CREATE PROCEDURE prc_carga_dim_cliente_scd2()
BEGIN
    DECLARE v_dt_hoje DATE;
    DECLARE v_dt_ontem DATE;

    SET v_dt_hoje  = CURDATE();
    SET v_dt_ontem = DATE_SUB(v_dt_hoje, INTERVAL 1 DAY);

    /* 1) INSERT de novos clientes */
    INSERT INTO suprema_bank_dw.dim_cliente
    (cod_cliente,
        nome_cliente,
        cod_cidade_cliente,
        nome_cidade_cliente,
        cod_estado_cliente,
        nome_estado_cliente,
        status_cliente,
        idade_cliente,
        data_primeira_transacao,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_cliente,
        s.nome,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        s.status,
        CASE
            WHEN s.data_nascimento IS NULL THEN NULL
            ELSE TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
        END AS idade_cliente,
        s.data_cadastro AS data_primeira_transacao,
        '1000-01-01' AS valid_from,
        '9999-12-31' AS valid_to
    FROM suprema_bank_db.clientes AS s
    LEFT JOIN (
        SELECT DISTINCT cod_cliente
        FROM suprema_bank_dw.dim_cliente
    ) AS d
      ON d.cod_cliente = s.cod_cliente
    WHERE d.cod_cliente IS NULL;


    /* 2a) SCD2: FECHAR versão atual dos que mudaram (usando PK no WHERE) */
    UPDATE suprema_bank_dw.dim_cliente d
    SET d.valid_to = v_dt_ontem
    WHERE d.id_cliente IN (
        SELECT x.id_cliente
        FROM (
            SELECT d2.id_cliente
            FROM suprema_bank_dw.dim_cliente d2
            JOIN suprema_bank_db.clientes s
              ON s.cod_cliente = d2.cod_cliente
            WHERE d2.valid_to = '9999-12-31'
              AND (
                    (COALESCE(d2.status_cliente,'') <> COALESCE(s.status,''))
                 OR (COALESCE(d2.nome_cidade_cliente,'') <> COALESCE(s.cidade,''))
                 OR (COALESCE(d2.cod_estado_cliente,'') <> COALESCE(s.estado,''))
                 OR (
                      d2.idade_cliente IS NULL <> (s.data_nascimento IS NULL)
                      OR (
                            d2.idade_cliente IS NOT NULL
                            AND s.data_nascimento IS NOT NULL
                            AND d2.idade_cliente <> TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
                         )
                    )
              )
        ) x
    );

    /* 2b) Inserir nova versão (os que foram fechados ontem) */
    INSERT INTO suprema_bank_dw.dim_cliente
    (
        cod_cliente,
        nome_cliente,
        cod_cidade_cliente,
        nome_cidade_cliente,
        cod_estado_cliente,
        nome_estado_cliente,
        status_cliente,
        idade_cliente,
        data_primeira_transacao,
        valid_from,
        valid_to
    )
    SELECT
        s.cod_cliente,
        s.nome,
        s.cidade,
        s.cidade,
        s.estado,
        s.estado,
        s.status,
        CASE
            WHEN s.data_nascimento IS NULL THEN NULL
            ELSE TIMESTAMPDIFF(YEAR, s.data_nascimento, v_dt_hoje)
        END AS idade_cliente,
        s.data_cadastro AS data_primeira_transacao,
        v_dt_hoje AS valid_from,
        '9999-12-31' AS valid_to
    FROM suprema_bank_db.clientes AS s
    JOIN suprema_bank_dw.dim_cliente d_old
      ON d_old.cod_cliente = s.cod_cliente
    WHERE d_old.valid_to = v_dt_ontem;


    /* 3) SCD1: atualizar atributos "tipo 1" na versão atual (PK no WHERE) */
    UPDATE suprema_bank_dw.dim_cliente d
    SET d.nome_cliente = (
        SELECT s.nome
        FROM suprema_bank_db.clientes s
        WHERE s.cod_cliente = d.cod_cliente
        LIMIT 1
    )
    WHERE d.id_cliente IN (
        SELECT y.id_cliente
        FROM (
            SELECT d3.id_cliente
            FROM suprema_bank_dw.dim_cliente d3
            JOIN suprema_bank_db.clientes s
              ON s.cod_cliente = d3.cod_cliente
            WHERE d3.valid_to = '9999-12-31'
              AND COALESCE(d3.nome_cliente,'') <> COALESCE(s.nome,'')
        ) y
    );

END$$

DELIMITER ;

-- Exemplo: Executando a carga desativando o SQL_SAFE_UPDATES

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_dim_cliente_scd2();
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Mostrando um caso de SAFE UPDATE.

-- UPDATE clientes SET status = 'INATIVO';
-- DELETE FROM pedidos;

-- Exemplo: Verificando as versões de SKs de um mesmo cliente.

SELECT
  cod_cliente, nome_cliente, nome_cidade_cliente, cod_estado_cliente,
  status_cliente, idade_cliente,
  valid_from, valid_to, id_cliente
FROM suprema_bank_dw.dim_cliente
WHERE cod_cliente = '00001'  -- troque por um existente
ORDER BY valid_from;

-- Exemplo: Obter o SK mais atual.

SELECT *
FROM suprema_bank_dw.dim_cliente
WHERE valid_to = '9999-12-31';

-- Exemplo: Modificando os atributos de um dos clientes para tesre.

UPDATE suprema_bank_db.clientes 
SET cidade = 'São Paulo', estado = 'SP' 
WHERE cod_cliente = '00001';

SELECT * FROM suprema_bank_db.clientes WHERE cod_cliente = '00001';

-- Exemplo: Rodando de novo a procedure de atualização.

SET SQL_SAFE_UPDATES = 0;
CALL suprema_bank_dw.prc_carga_dim_cliente_scd2();
SET SQL_SAFE_UPDATES = 1;

-- Exemplo: Verificando novamente as versões do cliente 00001.

SELECT
  cod_cliente, nome_cliente, nome_cidade_cliente, cod_estado_cliente,
  status_cliente, idade_cliente,
  valid_from, valid_to, id_cliente
FROM suprema_bank_dw.dim_cliente
WHERE cod_cliente = '00001'  -- troque por um existente
ORDER BY valid_from;
```

## Otimização de performance no Data Warehouse

Os principais pontos que vimos foram:

- **Impacto dos Índices**: Um dos primeiros pontos a considerar é o uso de índices. Embora as conexões entre tabelas (chaves primárias e estrangeiras) já sejam eficientes por padrão, as análises de dados raramente se limitam a elas. Frequentemente, os usuários filtram ou agrupam informações por atributos descritivos, como cidade ou tipo de produto. Se essas colunas não tiverem índices, o sistema precisará examinar cada linha da tabela, o que rapidamente se torna lento à medida que o volume de dados cresce. Além disso, operações como agrupar (GROUP BY) ou ordenar (ORDER BY) dados sem índices exigem que o sistema organize tudo manualmente, consumindo muita memória e, em casos extremos, gravando dados temporários em disco, o que desacelera drasticamente a consulta.

- **Custo dos Índices**: É importante lembrar que os índices, apesar de acelerarem as consultas, têm um custo. Cada vez que novos dados são adicionados, alterados ou removidos, o sistema precisa atualizar não apenas os dados, mas também todas as estruturas de índice. Em um ambiente com grandes volumes de carga de dados, isso pode tornar o processo de atualização mais lento e consumir mais recursos. O desafio é encontrar o equilíbrio certo: acelerar a leitura sem comprometer demais a velocidade de carga.

- **Dimensões do Tipo 2**: Para as tabelas que registram o histórico de mudanças (as chamadas dimensões do tipo 2), é vital garantir que o sistema encontre a versão correta de um registro em um determinado período. Isso é feito através de campos que indicam a validade de cada registro. Indexar esses campos, combinando-os com o identificador da dimensão, permite que o sistema localize rapidamente a informação correta.

- **Comando EXPLAIN**: Para entender como o sistema está processando uma consulta e identificar gargalos, existe uma ferramenta poderosa: o comando EXPLAIN. Ele revela o "plano de execução" da consulta, mostrando se os índices estão sendo utilizados ou se o sistema está varrendo tabelas inteiras. Analisar esse plano é fundamental para otimizar as consultas e garantir que os índices criados realmente tragam benefícios.

- **Views**: Outra ferramenta útil são as Views. Elas são como consultas pré-salvas que ajudam a organizar e padronizar lógicas complexas. Em vez de reescrever a mesma lógica várias vezes, uma View centraliza-a, tornando o código mais limpo, fácil de ler e manter. Se uma regra de negócio muda, basta ajustar a View, e todas as consultas que a utilizam serão atualizadas automaticamente. Embora as Views não melhorem a performance diretamente (o sistema ainda executa a consulta por trás delas), elas são excelentes para a consistência e a manutenção.

- **Views Materializadas e Tabelas Sumarizadas**: Quando a performance é uma preocupação crítica e o banco de dados não oferece Views materializadas (que armazenam o resultado de uma consulta fisicamente), podemos criar tabelas sumarizadas. Elas são tabelas físicas que contêm dados já agregados ou pré-processados. Isso significa que os relatórios podem consultar dados já prontos, reduzindo drasticamente o tempo de processamento. A desvantagem é que o processo de carga de dados se torna mais complexo, pois essas tabelas precisam ser atualizadas regularmente.

- **Particionamento de Tabelas**: Para tabelas que crescem muito, acumulando milhões ou bilhões de linhas, o particionamento é uma técnica eficaz. Ele divide fisicamente uma tabela grande em partes menores, mas mantém a aparência de uma única tabela para quem consulta. O critério mais comum para particionar é o tempo (por exemplo, por ano ou mês), pois a maioria das análises envolve recortes temporais. Quando uma consulta filtra por esse critério, o sistema acessa apenas as partições relevantes, ignorando o restante dos dados e acelerando significativamente o processo. No entanto, o particionamento só traz benefícios se a coluna de partição for consistentemente usada nos filtros das consultas; caso contrário, o sistema terá que ler todas as partes, e a complexidade adicional não trará ganhos.

- **Práticas Essenciais de Manutenção**: Finalmente, a manutenção de um Data Warehouse é um trabalho contínuo. É essencial manter as estatísticas do banco de dados sempre atualizadas, revisar os índices periodicamente (pois as necessidades de consulta mudam), monitorar as consultas mais lentas, evitar trazer colunas desnecessárias (SELECT *) e mover cálculos complexos para o processo de carga de dados sempre que possível. Documentar todas as decisões de performance é crucial para a sustentabilidade e evolução do sistema.

## **Governança de Dados no Data Warehouse**

Imagine um grande armazém de informações, o nosso "data warehouse". Não basta apenas construir esse armazém com a melhor tecnologia; é crucial garantir que tudo o que está lá dentro seja confiável e compreensível para todos. É aí que entra a governança de dados.

A governança é um conjunto de práticas que assegura que todos, desde quem analisa os dados até a alta direção, confiem plenamente nos números que veem. Ela não é apenas sobre quem pode acessar o quê, mas sobre como os dados são gerenciados desde o momento em que nascem até o momento em que são usados para tomar decisões.

Para que esse armazém de informações seja realmente valioso, ele precisa se apoiar em quatro pilares fundamentais:

- **Confiabilidade**: Os dados precisam ser corretos, consistentes e refletir a realidade do negócio.
- **Disponibilidade**: As informações devem estar acessíveis quando necessário, de forma previsível e estável.
- **Segurança**: É essencial proteger dados sensíveis, controlar quem pode vê-los, rastrear seu uso e garantir a conformidade com as leis.
- **Clareza**: Todos na organização precisam entender o significado dos dados, sua granularidade e as regras por trás deles.

> Um conceito chave para a governança é a **linhagem de dados**. Pense nela como um mapa detalhado que mostra a jornada de cada informação. Se você vê um número em um relatório, a linhagem permite saber exatamente de onde ele veio, por quais transformações passou e como chegou até ali. Isso é vital para entender as regras de negócio aplicadas e para investigar rapidamente se algo parece errado.

A linhagem também nos ajuda a garantir a qualidade dos dados. Não importa quão bem construído seja o nosso armazém; se os dados dentro dele não forem de boa qualidade, todo o esforço perde o sentido. A qualidade precisa ser monitorada continuamente em diversos aspectos:

- **Completude**: Garantir que campos essenciais não estejam vazios.
- **Consistência**: Assegurar que os números "fechem" e não se contradigam.
- **Acurácia**: Verificar se os dados representam fielmente os eventos reais.
- **Integridade**: Evitar duplicações e garantir que as relações entre os dados estejam corretas.

> Para manter essa qualidade, é fundamental que os processos de carga de dados (ETL) incorporem controles automáticos. Isso significa validar volumes, identificar duplicidades e garantir que as regras de versionamento de dados históricos sejam seguidas.

Além disso, a documentação é um pilar essencial. É como ter um manual de instruções completo para o nosso armazém de dados. Cada tabela, cada coluna, cada regra de cálculo de indicadores precisa estar claramente explicada. Uma boa documentação torna o sistema transparente, fácil de manter e de auditar.

Por fim, a governança de dados está intrinsecamente ligada à compliance e à segurança. Em muitos setores, não é apenas uma boa prática, mas uma exigência legal. Isso envolve controlar o acesso com base em funções, separar ambientes de desenvolvimento e produção, mascarar dados sensíveis e manter trilhas de auditoria para registrar quem fez o quê.

Com todos esses elementos em prática, nosso armazém de dados se torna um ativo estratégico, confiável e pronto para apoiar as decisões mais importantes da organização.
