# Posts LinkedIn — Jornada em Engenharia de Dados

> **Estratégia narrativa**: Transição intencional de dev fullstack → Engenharia de Dados.
> O background em desenvolvimento é tratado como **diferencial**, não como desvio.
> Tom: honesto, técnico sem ser hermético, humano.

---

## Sequência de publicação

| # | Tema | Projeto/Base |
|---|------|-------------|
| 1 | Apresentação — a transição | Narrativa pessoal |
| 2 | SQL com MySQL | Curso MySQL |
| 3 | Arquiteturas de dados | Curso Arquiteturas |
| 4 | Modelagem Multidimensional e DW | Curso Modelagem |
| 5 | NoSQL — Redis, MongoDB, Cassandra | Curso NoSQL |
| 6 | Pipeline de dados com Python | Curso Pipeline |
| 7 | Governança e qualidade de dados | Curso Governança |
| 8 | Orquestração com Apache Airflow | Projeto Vende+ |
| 9 | Pipeline completo na AWS | Projeto Lumarte |
| 10 | Reflexão — o que aprendi sobre a área | Síntese |
| Bônus | Pipeline ETL local end-to-end com SCD Tipo 2 | Projeto Zoop |

> [!TIP]
> Sugestão de cadência: 1 post por semana. Os posts 8 e 9 (projetos reais) são os mais fortes — poste-os após ter o GitHub organizado com READMEs profissionais.

---

## Post 1 — Apresentação: a transição

```
Fui desenvolvedor fullstack por alguns anos.

Há 2 anos, saí da área.

Não porque não gostava de desenvolvimento — mas porque percebi que o que me 
fascinava mesmo era entender de onde vêm os dados, como eles se movem, se 
transformam e viram decisões de negócio.

Hoje estou na pós-graduação em Engenharia de Dados e AI na PUCMG.

E nesta série de posts vou compartilhar o que aprendi em cada etapa dessa transição.

Por que compartilhar?

Porque quando decidi mudar, senti falta de ver outras pessoas contando essa jornada 
de forma honesta. Não só os acertos — mas o que foi difícil, o que surpreendeu, 
o que eu faria diferente.

A série vai cobrir:
→ SQL avançado com MySQL
→ Arquiteturas de dados: DW, Data Lake, Lakehouse
→ Modelagem Multidimensional
→ NoSQL: Redis, MongoDB e Cassandra
→ Pipelines de dados com Python
→ Governança e qualidade de dados
→ Orquestração com Apache Airflow
→ Pipeline completo na AWS

Uma coisa que aprendi rápido: o background de dev fullstack não atrapalha.

Na verdade, ajuda bastante — mas isso conto nos próximos posts.

Vem junto se você está nessa trilha ou pensando em entrar.

#EngenhariaeDados #DataEngineering #TransiçãoDeCarreira #PUCMG #Estudos
```

---

## Post 2 — SQL com MySQL: o que eu achei que já sabia

```
SQL foi a primeira surpresa da minha pós-graduação.

Eu achei que já sabia SQL.

Afinal, como desenvolvedor fullstack eu usava banco de dados todo dia — 
escrevia queries, fazia JOINs, tinha domínio básico do modelo relacional.

Errado.

O que eu usava era o suficiente pra aplicação funcionar.
O que aprendi estudando MySQL a fundo foi outra coisa:

🔹 Como o otimizador de consultas decide o plano de execução — e como você 
   influencia essa decisão
🔹 Quando criar índices resolve problemas de performance e quando piora
🔹 CTEs para substituir subqueries aninhadas e deixar a lógica legível
🔹 Views, Stored Procedures e Colunas Geradas para encapsular regras de negócio
🔹 Suporte nativo a JSON no MySQL 8+ (muito útil em pipelines com dados 
   semiestruturados)
🔹 Controle de transações e DML — essencial quando você está carregando dados 
   em lote e precisa garantir consistência

A virada de chave foi entender a diferença entre escrever SQL e entender como 
o banco executa sua query.

Para desenvolvimento de aplicações, o primeiro basta.
Para engenharia de dados, o segundo é obrigatório.

#SQL #MySQL #EngenhariaeDados #DataEngineering #Estudos
```

---

## Post 3 — Arquiteturas de dados: o problema que eu vi mas não sabia nomear

```
"Por que não deixar o time de BI consultar direto o banco de produção?"

Essa pergunta resume um dos maiores aprendizados que tive.

A resposta: porque isso pode derrubar a operação inteira.

Uma query analítica pesada rodando no mesmo banco que processa pedidos de 
clientes concorre por recursos com as transações críticas do sistema.

Vi isso acontecer em sistemas que desenvolvi como dev. 
Só não sabia o nome do problema — nem a solução arquitetural para ele.

Estudando arquiteturas de dados modernas, entendi:

🏗️ OLTP — sistema operacional, otimizado para transações rápidas e simultâneas
📊 OLAP — sistema analítico, otimizado para consultas pesadas sobre dados históricos
🏛️ Data Warehouse — separa analítico de operacional, com dados integrados e histórico
🌊 Data Lake — armazena dados brutos de qualquer formato, antes de transformar
🏠 Lakehouse — combina a flexibilidade do Data Lake com a governança do DW

O que ficou mais claro: cada arquitetura existe para resolver um problema específico.

Não existe "melhor tecnologia".
Existe a tecnologia certa para o problema certo.

E descobri que muitos dos problemas que eu enfrentava como dev tinham nome 
e solução no mundo de dados.

#Arquitetura #DataWarehouse #DataLake #Lakehouse #EngenhariaeDados #DataEngineering
```

---

## Post 4 — Modelagem Multidimensional: a arte por trás do Data Warehouse

```
Dados num Data Warehouse não ficam "jogados" lá dentro.

Eles seguem uma estrutura cuidadosamente projetada.
E entender essa estrutura foi uma das partes mais elegantes da minha pós-graduação.

A ideia central da Modelagem Multidimensional:

Você separa os dados em dois tipos:

📊 Fatos — o que você quer medir (valor de venda, quantidade, custo)
📋 Dimensões — as perspectivas de análise (tempo, produto, cliente, região)

Isso cria o Modelo Estrela: uma tabela de fatos no centro, 
rodeada pelas dimensões. Simples de entender, poderoso na prática.

No curso, construí um DW completo com:
→ Levantamento das dimensões do negócio
→ ETL para extração, transformação e carga dos dados
→ Consultas analíticas sobre o modelo final

O que mais me surpreendeu: a dificuldade não é técnica.

Definir o que é fato e o que é dimensão exige entender o negócio.
Um dado pode ser fato em um contexto e dimensão em outro.

Exemplo: "desconto" pode ser uma medida (quanto foi descontado numa venda)
ou uma dimensão (categoria de desconto aplicada).

Essa distinção é o que separa quem "move dados" de quem resolve problemas de negócio.

#ModelagemDeDados #DataWarehouse #ETL #ModeloEstrela #EngenhariaeDados
```

---

## Post 5 — NoSQL: Redis, MongoDB e Cassandra — quando usar cada um

```
"NoSQL é quando o SQL não dá conta."

Essa definição existe. É terrível.

Aprendi que NoSQL não é uma tecnologia — é uma família de tecnologias, 
cada uma projetada para resolver um problema diferente.

As três que estudei em profundidade:

⚡ Redis (Key-Value)
Armazena dados em memória. Incrivelmente rápido.
Ideal para: cache, sessões de usuário, rate limiting, contadores.
Não usar para: dados críticos que exigem consistência total ou relações complexas.

📄 MongoDB (Document)
Armazena dados em documentos JSON/BSON. Flexível, sem schema rígido.
Ideal para: dados que evoluem com o tempo, catálogos de e-commerce, logs.
Não usar para: quando você precisa de transações complexas entre coleções.

📈 Cassandra (Wide Column)
Projetado para escala horizontal massiva e dados distribuídos.
Ideal para: séries temporais, métricas, logs em tempo real, IoT.
Não usar para: consultas ad hoc complexas ou dados altamente relacionais.

Implementei os três com Python, aplicando a arquitetura de Ports e Adaptadores —
onde a regra de negócio não conhece qual banco está por baixo.

Isso me ensinou algo importante:
a escolha do banco de dados é uma decisão arquitetural, não uma preferência pessoal.

Você usa o que resolve o problema — não o que você mais conhece.

#NoSQL #Redis #MongoDB #Cassandra #EngenhariaeDados #DataEngineering
```

---

## Post 6 — Pipeline de dados com Python: da teoria à prática

```
Estudar conceitos de pipeline é uma coisa.

Construir um funciona diferente.

No curso de Pipeline de Dados, saí do zero e construí pipelines reais em Python —
e algumas coisas que aprendi na teoria ficaram muito mais claras na prática.

O que implementei:

🔄 Ingestão via API com a biblioteca Requests
   → Consumo de endpoints externos, tratamento de paginação e erros de rede

📁 Separação de dados brutos e processados
   → Estrutura raw/processed para rastrear cada estágio da transformação

🧹 Transformação e limpeza dos dados
   → Tipagem correta, tratamento de nulos, normalização antes de persistir

O que o background de dev ajudou:
Eu já tinha familiaridade com código Python, estruturas de dados e boas práticas
de organização de projeto. O foco ficou na lógica de engenharia de dados em si.

O que aprendi que não esperava:
A parte mais difícil de um pipeline não é a transformação — é a confiabilidade.

Garantir que o pipeline se recupere de falhas, que não processe dados duplicados,
que você saiba exatamente o que falhou quando algo dá errado.

Isso exige pensar em idempotência desde o início.

#PipelineDeDados #Python #DataEngineering #EngenhariaeDados #Estudos
```

---

## Post 7 — Governança de dados: o que ninguém fala nos cursos de DE

```
Aprendi a construir pipelines.
Aprendi a modelar Data Warehouses.
Aprendi a orquestrar fluxos com Airflow.

Mas o curso que mais me diferenciou foi o de Governança de Dados.

Por quê? Porque quase ninguém fala sobre isso na formação técnica.

O que estudei:

📋 Metadados — catalogar de onde vêm os dados, o que significam e quem é 
   responsável por eles. Sem isso, ninguém confia nos dados.

♻️ Ciclo de vida dos dados — dados têm nascimento, transformação, uso e 
   descarte. Tratar isso de forma planejada reduz custo e risco.

✅ Qualidade de dados — aprendi sobre dimensões de qualidade:
   completude, consistência, precisão, unicidade, validade.
   E estudei o PyDeequ para validação automatizada de qualidade em pipelines.

O insight que ficou:

Um pipeline tecnicamente perfeito que entrega dados errados não vale nada.

E dados errados não aparecem com um erro de sistema — eles aparecem como 
uma decisão de negócio equivocada tomada com confiança.

Governança é o que garante que os dados que chegam no dashboard 
são os dados que a empresa pode confiar.

Isso é o que transforma engenharia de dados em valor real.

#GovernançaDeDados #QualidadeDeDados #DataEngineering #EngenhariaeDados #PyDeequ
```

---

## Post 8 — Apache Airflow: quando o pipeline precisa de um maestro

```
Um pipeline que roda uma vez é um script.

Um pipeline que roda todo dia, na hora certa, 
na ordem certa, com retry automático quando falha —
isso é orquestração.

No curso de Apache Airflow, construí a plataforma de dados da Vende+:
um ambiente completo rodando localmente via Docker Compose.

Dois pipelines em produção:

📦 Pipeline de Vendas
Processa o arquivo de pedidos diário do time comercial e gera um resumo 
por categoria para a área de Operações.

💱 Pipeline de Cotação
Mantém um histórico atualizado da cotação USD-BRL para a área Financeira.

O que aprendi na prática:

🔹 DAGs não são só código — são contratos com o negócio.
   Cada DAG representa um processo que alguém depende.

🔹 Separar a lógica de negócio das DAGs é essencial.
   Criei uma pasta helpers/ com as funções reais — as DAGs só orquestram.

🔹 Configuração por ambiente (dev/prod) evita surpresas em produção.

🔹 O PYTHONPATH no Docker precisa de atenção — aprendi isso da forma difícil,
   com ModuleNotFoundError que só aparecia no container.

O que o background de dev ajudou:
Configurar Docker, entender variáveis de ambiente e estruturar o projeto
foram partes que fluíram naturalmente.

Orquestração com Airflow + projeto no GitHub (link nos comentários).

#ApacheAirflow #DataEngineering #Orquestração #Docker #EngenhariaeDados
```

---

## Post 9 — Pipeline completo na AWS: do banco de dados ao modelo analítico

```
Esse foi o projeto mais completo que construí até agora.

Um pipeline de dados de ponta a ponta na AWS, baseado no cenário de 
um e-commerce fictício com problemas reais de negócio:

❌ Faturamento disponível só após 3 dias
❌ Dados de vendas desorganizados por canal
❌ Relatórios com erros — valores negativos de venda
❌ Processos manuais de extração de planilhas

A solução que implementei:

🗄️ Amazon RDS (PostgreSQL) — simulação do banco operacional do e-commerce
⚙️ AWS Lambda — funções Python para extração e transformação
🪣 Amazon S3 — Data Lake estruturado em três camadas:
   Bronze → dados brutos
   Silver → dados tratados, com governança e qualidade aplicada
   Gold → modelo OLAP (fatos e dimensões) pronto para análise
🔍 AWS Athena — consultas SQL sobre o Data Lake
🔀 AWS Step Functions — orquestração das funções Lambda
📊 Amazon CloudWatch — monitoramento e logs
📧 Amazon SNS — notificação de falhas por e-mail

O que mais aprendi nesse projeto:

Arquitetura Bronze/Silver/Gold não é só organização de pastas.
Cada camada tem uma responsabilidade clara — e pular etapas gera dívida técnica.

Projeto completo no GitHub (link nos comentários).

#AWS #Lambda #S3 #DataLake #EngenhariaeDados #DataEngineering #Cloud
```

---

## Post 10 — Reflexão: o que aprendi sobre Engenharia de Dados além da técnica

```
Comecei essa série falando sobre transição de carreira.

Termino com o que aprendi que vai além das tecnologias.

📌 Dados sem contexto de negócio são só bytes

O maior erro que eu poderia cometer seria aprender todas as ferramentas 
sem entender para que servem no negócio.
Pipeline para quê? Modelagem que responde qual pergunta? Dashboard para quem?

Essa pergunta muda tudo.

📌 O background de dev é um ativo subestimado

Entender como os dados são gerados na origem — APIs, bancos transacionais, 
microsserviços — é raro em profissionais que vieram pelo lado analítico.
Esse contexto acelera muito o diagnóstico de problemas.

📌 A área é muito mais ampla do que parece de fora

Modelagem, orquestração, qualidade, governança, cloud, NoSQL — 
cada um desses temas é uma especialização possível.
Saber um pouco de cada e se aprofundar em alguns é a estratégia certa no começo.

📌 Consistência bate intensidade

Estudar um pouco todo dia, documentar o que aprendeu, construir projetos reais —
isso acumula mais do que uma semana intensa de maratona.

Estou no meio dessa jornada ainda.
Mas olhar para trás e ver o que aprendi nos últimos meses é motivador.

Se você está no começo dessa trilha: vale a pena.

#EngenhariaeDados #DataEngineering #TransiçãoDeCarreira #Carreira #Estudos #PUCMG
```

---

## Post BÔNUS — Projeto Zoop: pipeline ETL do zero ao Star Schema

```
Construí um pipeline ETL end-to-end do zero.

Sem cloud. Sem serviços gerenciados. Só Python, PostgreSQL e Docker.

O objetivo era resolver um problema clássico de engenharia de dados:
a empresa Zoop (fictícia) tinha o time analítico consultando diretamente
o banco de produção — e isso estava degradando o sistema operacional.

A solução que implementei:

🏗️ Dois bancos PostgreSQL isolados via Docker Compose:
   → OLTP (porta 5432): banco transacional normalizado em 3NF
   → DW (porta 5433): Data Warehouse dimensional em Star Schema

🪣 Data Lake local em três camadas (Parquet):
   → Bronze: dados extraídos do OLTP sem transformação
   → Silver: limpeza, deduplicação, tipagem e regras de qualidade
   → Gold: indicadores pré-agregados por mês e categoria

📋 Regras de qualidade aplicadas na camada Silver:
   → Rejeição de valores negativos de quantidade e valor
   → Descarte de pedidos sem cliente rastreável
   → Deduplicação de cadastros
   → Auditoria de pedidos em atraso com log automático

⭐ O que mais me desafiou: o SCD Tipo 2

Quando um cliente muda de cidade, o histórico precisa ser preservado.
A compra feita antes da mudança deve continuar apontando para o endereço antigo.

Implementei isso com `valid_from`, `valid_to` e `flag_vigencia` na `dim_cliente`.
A tabela de fatos busca a versão do cliente vigente na data exata da compra.

É um detalhe que parece pequeno mas muda completamente a confiabilidade
dos relatórios históricos.

O projeto completo está no GitHub — com README, catálogo de dados,
documentação de linhagem e instruções para rodar localmente.
Link nos comentários.

#EngenhariaeDados #DataEngineering #ETL #DataWarehouse #Python #PostgreSQL #Docker
```

---

## Checklist antes de publicar cada post

- [ ] Revisar se o tom está pessoal (não corporativo demais)
- [ ] Confirmar que não há métricas inventadas
- [ ] Adicionar link do GitHub nos comentários (posts 8 e 9)
- [ ] Publicar num horário de pico: **terça a quinta, entre 7h–9h ou 12h–13h**
- [ ] Responder todos os comentários nas primeiras 2 horas (algoritmo do LinkedIn)
- [ ] Marcar a Alura e a PUCMG quando relevante

## Hashtags por frequência de uso

- Sempre: `#EngenhariaeDados #DataEngineering`
- Rotacionar: `#Estudos #Carreira #TransiçãoDeCarreira`
- Específicas por post: conforme o tema técnico
