# Qualidade de dados

## Relevância da Qualidade de Dados

### Cenário de Problema

- Diretor de vendas de distribuidora de filmes.
- Consolidação de vendas de 3 canais: Aplicativo, Telefone, Site.
- Necessidade de bater os números de vendas com o financeiro.
- Problema: Números não batem = Problema de Qualidade de Dados.

### O que é Qualidade de Dados?

- Sub-área da Governança de Dados (**DAMA**).
- Definição: Dados que representam fielmente a realidade e estão disponíveis quando necessários.

### Causas de Problemas de Qualidade

- Não representam a realidade: Vendas duplicadas que não ocorreram.
- Não estão disponíveis: Dados não consolidados ou não inseridos pelas equipes.

### Impacto da Má Qualidade de Dados

- Decisões erradas: Excluir um canal de vendas performático por dados incorretos.
- Ineficiência e retrabalho: Refazer relatórios após correção dos dados.

### Objetivo da Qualidade de Dados

- Tornar as operações eficientes.

## Responsabilidade pela Qualidade dos Dados

### Cenário

- A qualidade dos dados é crucial para o negócio, como visto no problema da empresa de distribuição de filmes com relatórios de faturamento inconsistentes.

### Quem é o responsável?

Não há uma única área responsável. A responsabilidade pela qualidade dos dados é compartilhada por uma tríade:

1. **Governança de Dados**:
   - Conhece a disciplina de qualidade de dados.
   - Ajuda a definir processos, ferramentas e o número de regras necessárias para cada base.
   - Exemplo: Uma equipe de governança pode não ter o conhecimento específico de negócio para identificar que o DDD de uma compra por telefone deve corresponder ao estado do comprador.

2. **Entidade Proprietária (Owner) dos Dados**:
   - Possui o maior conhecimento de negócio sobre os dados.
   - Fundamental para propor regras de qualidade específicas.
   - Exemplo: A área de vendas sabe que, em compras por telefone, o DDD deve ser do mesmo estado do comprador.

3. **Pessoa Usuária dos Dados**:
   - É a maior interessada na qualidade dos dados, pois dados de qualidade economizam tempo na análise.
   - Trabalha com os dados no dia a dia e conhece suas características.
   - Contribui com regras importantes para o consumo dos dados.
   - Exemplo: Como diretora de vendas, é importante que as bases dos canais de venda tenham uma coluna para o canal e um ID de venda. Isso leva a uma regra de qualidade: a coluna de canais nunca deve vir vazia.

A colaboração entre essas três partes garante uma abordagem completa e eficaz para a qualidade dos dados.

## Framework FMI para Qualidade de Dados

* **O que é**? Uma solução para garantir a qualidade de dados, estabelecendo princípios importantes a serem seguidos.
* **Contexto**: Ajuda a assegurar que os dados reflitam a realidade, mesmo para quem não é especialista na área.
* **Princípios** (ou Etapas) da Qualidade de Dados pelo FMI:

1. **Pré-requisitos de Qualidade**:
   - **Ambiente Legal e Institucional**: Permissão para trabalhar com os dados (ex: LGPD) e escopo das atribuições.
   - **Recursos**: Necessidade de investimento em ferramentas e profissionais capacitados (ambiente de desenvolvimento, catálogo de dados, governança de dados).
   - **Relevância**: Focar os esforços de qualidade nos dados mais relevantes para a organização, considerando o custo das ações.
2. **Garantias de Integridade**:
   - **Profissionalismo**: Atuação profissional na gestão dos dados.
   - **Transparência**: Clareza nas etapas e processos de coleta e transformação dos dados.
   - **Ética de Uso**: Preocupação com o uso ético dos dados da organização.
3. **Solidez Metodológica**:
   - **Conceitos e Definições**: Essencial para estabelecer clareza nos termos usados, como nomes de colunas e informações em gráficos, assegurando que todos os usuários compreendam as definições.
   - **Escopo do Projeto**: A definição clara do escopo é crucial para a entrega de valor ao final do processo.
   - **Classificação e Setorização**: Identificar quais partes da organização ou pessoas se beneficiarão mais dos dados disponíveis.
   - **Vieses**: Tratamento de influências não intencionais ou preconceitos aplicados durante a coleta de dados, para garantir uma representação fiel e ética da realidade.
4. **Precisão e Confiabilidade**:
   - **Manutenibilidade**: O processo de dados deve ser fácil de manter. Assim como na engenharia de software, onde programas são escritos para serem lidos e alterados por outros, os processos de coleta e tratamento de dados precisam ser claros e bem definidos. Isso permite que, se necessário, alterações sejam feitas facilmente, seja por meio de documentação ou do código utilizado.
5. **Acessibilidade**:
   - **Interpretação e Disponibilidade**: Garantir que os dados sejam acessíveis e compreensíveis para o público-alvo. Um exemplo prático é evitar o uso de termos em inglês em conjuntos de dados se a organização opera majoritariamente em português, facilitando a compreensão para um número maior de pessoas.

## Framework DAMA (Data Management Association): Dimensões de Qualidade de Dados

* **O que é**: Um framework que oferece seis dimensões para avaliar a qualidade dos dados, permitindo criar regras simples para verificar se os dados possuem qualidade. Um dado de qualidade atende a todas as dimensões.
* **Contexto**: Diferente do framework do FMI, que é mais principiológico, o DAMA ajuda a aplicar esses princípios em organizações específicas.
* **Cenário de Exemplo**: Uma diretora de vendas de uma empresa de distribuição de filmes.

### Dimensões de Qualidade de Dados

As seis dimensões são:

1. **Acurácia**: Mede o quão próximos os dados estão da realidade material.
2. **Completude**: Mede o quão completos estão os dados.
3. **Consistência**: Mede o quão consistentes estão os dados.
4. **Unicidade**: Mede o quão únicos estão os dados.
5. **Validade**: Mede o quão válidos estão os dados.
6. **Temporalidade**: Mede o quão temporeais estão os dados.

#### 1. Dimensão da Acurácia

- **Definição**: Mede o quão próximos os dados estão da realidade material.
- **Exemplo**:
    - **Problema**: Na base de dados, o filme Titanic tem 132 minutos.
    - **Realidade**: O filme Titanic tem 145 minutos.
    - **Conclusão**: Há um problema de acurácia, pois os dados da base não refletem a realidade fielmente.

#### 2. Dimensão da Completude

- **O que é**: Refere-se à presença de todos os dados necessários. Dados faltantes indicam um problema de completude.
- **Exemplo**: Em um banco de dados de filmes, se a informação sobre a pessoa diretora está faltando para alguns registros, há um problema de completude.
    - **Medição**: Pode ser expressa em termos percentuais. Se 9 de 100 filmes não têm o diretor registrado, a completude é de 91%.
    - **Regra**: Pode-se definir uma regra como "trabalhar apenas com dados com 100% de completude" para uma coluna específica, como a de pessoa diretora.

#### 3. Dimensão da Consistência

- **O que é**: Mede se um dado é coerente e esperado em relação ao restante do banco de dados, especialmente ao longo do tempo.
- **Exemplo**: Se a empresa só trabalha com longas-metragens (80 minutos a 3 horas) e uma nova base de dados de filmes iranianos mostra uma média de duração de 4 horas, isso levanta uma questão de consistência. A média de 240 minutos é muito diferente da média de 200 minutos dos filmes já existentes.
    - **Problema**: Indica que pode haver um erro nos dados ou que eles não são coerentes com o padrão estabelecido.

#### 4. Dimensão da Unicidade

- **O que é**: Garante que registros que deveriam ser únicos são, de fato, únicos, sem repetições.
- **Exemplo**: Se cada filme no catálogo deve ter um ID único, mas um agrupamento revela dois filmes com o mesmo ID, isso é um problema de unicidade.

#### 5. Dimensão da Validade

- **O que é**: Preocupa-se se o dado é válido ou não, ou seja, se está dentro de um conjunto de valores aceitáveis ou da realidade.
- **Exemplo 1**: Um filme não pode ter zero atores, então um dado zero para atores seria inválido.
- **Exemplo 2**: Um filme não pode ter 8 bilhões de atores, pois isso está fora da validade do mundo real.
- **Similaridade**: Possui pontos parecidos com a consistência, mas foca mais na aceitabilidade do valor em si.

#### 6. Dimensão da Temporalidade

- **O que é**: Refere-se à disponibilidade dos dados no tempo certo, ou seja, se estão atualizados e disponíveis quando deveriam estar.
- **Exemplo**: Se um relatório de vendas mostra dados de duas semanas atrás, enquanto a diretora precisa de dados diários para tomar decisões rápidas, há um problema de temporalidade.
- **Regra**: Pode-se estabelecer regras como "os dados devem ser atualizados no final de cada dia útil" para garantir que estejam sempre disponíveis e atualizados para o negócio.

## Pydeequ

### Conhecendo a Biblioteca Pydeequ

- **Premissa**: Criar testes unitários para dados.
- **Função**: Aplicar testes nos dados para garantir qualidade, desde o dataset inteiro até colunas específicas.

### Arquitetura do Pydeequ

- **Base**: Biblioteca baseada em Spark (com implementação PySpark para Python).
- **Origem**: Incluída na biblioteca Deequ (originalmente em Scala), mantida e usada pela AWS (ex: Glue Data Quality).
- **Classes Principais**:
    - **Profilers**
    - **Analysers**
    - **Checks**
- **Objetivo**: Criar restrições para aferir a qualidade de dados e gerar métricas.
- **Benefício**: Verificar métricas de qualidade ao longo do tempo para entender melhorias ou pioras.

### Três objetos principais: Profiles, Analyzers e Checks.

- **Analyzers**: Interagem com os dados fazendo perguntas específicas (tamanho do dataset, completude de colunas, comparações).

   * **Tipos de Análises (Analyzers)**
   1. **Do dataset todo**: Métricas para o conjunto de dados completo.
   2. **De colunas específicas**: Métricas para uma única coluna.
   3. **De comparação**: Métricas que comparam duas colunas.

- **Padrão de Uso do PyDeequ**

   - Definir objeto de resultado: `resultado_analise = (...)`
   - Especificar dados: `.onData(df)`
   - Adicionar análises: `.addAnalyzer(...)`
   - Rodar a análise: `.run()`

- Criando o Primeiro Analyzer (Exemplo de Código)
```js
resultado_analise = (
    AnalysisRunner(spark)
    .onData(df)
    .addAnalyzer(Size())
    .addAnalyzer(Completeness('NOME_SALA'))
    .addAnalyzer(Completeness('PUBLICO'))
    .addAnalyzer(Mean('PUBLICO'))
    .addAnalyzer(CountDistinct('MUNICIPIO_SALA_COMPLEXO'))
    .addAnalyzer(Compliance('PUBLICO', 'PUBLICO > 10'))
    .run()
)
```
- `Size()`: Tamanho do dataset.
- `Completeness('NOME_SALA')` / `Completeness('PUBLICO')`: Completude de colunas específicas.
- `Mean('PUBLICO')`: Média de uma coluna numérica.
- `CountDistinct('MUNICIPIO_SALA_COMPLEXO')`: Contagem de valores distintos.
- `Compliance('PUBLICO', 'PUBLICO > 10')`: Verifica se uma regra (SQL-like) é atendida.

**Acessando os Resultados**

`resultado_analise` retorna um `JavaObject id=o122` (não legível diretamente).

**Converter para dataframe para visualização**:
```js
resultado_df = AnalyzerContext.successMetricsAsDataFrame(spark, resultado_analise)
resultado_df.show()
```
#### Interpretação dos Resultados (Exemplo de Saída)

| entity | instance | name | value |
|---------|----------|--------------|---------------------|
| Column | PUBLICO | Completeness | 1.0 |
| Column | PUBLICO | Mean | 44.088970640254686 |
| Dataset | * | Size | 141350.0 |
| Column | PUBLICO | Compliance | 0.6735267067562788 |
| Column | NOME_SALA| Completeness | 1.0 |

- **entity**: O que está sendo avaliado (Coluna, Dataset).
- **instance**: Coluna específica (se aplicável).
- **name**: Nome da análise (Completeness, Mean, Size, Compliance).
- **value**: O resultado da métrica.

#### Conclusão
Não foram identificados problemas de qualidade nos dados analisados inicialmente.

