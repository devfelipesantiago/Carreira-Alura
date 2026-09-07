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

#### Analyzers
Interagem com os dados fazendo perguntas específicas (tamanho do dataset, completude de colunas, comparações).

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

--------

#### Profiles

**O que são Profiles?** Profiles são perfis estatísticos dos dados, um conjunto de informações que ajuda a entender rapidamente o comportamento de um conjunto de dados, especialmente útil ao trabalhar com dados desconhecidos.

Criando um Profile Para criar um profile, é necessário importar as funções da biblioteca Pydeequ e, em seguida, usar o ColumnProfilerRunner para gerar perfis por coluna.

```py
# importação
from pydeequ.profiles import *

# Criação do profile para colunas expecíficas
profile = ColumnProfilerRunner(spark) \
    .onData(df.select('TITULO_ORIGINAL', 'PUBLICO')) \
    .run()
```
Este código cria um objeto `ColumnProfilerRunner` que roda o perfil para as colunas `TITULO_ORIGINAL` e `PUBLICO` do DataFrame df, utilizando a sessão spark.

**Acessando o Perfil das Colunas**: Os resultados dos perfis são armazenados em um dicionário. Para visualizá-los, pode-se iterar sobre os itens do dicionário.

```py
for col, profile in profile.profiles.items():
    print(profile)
```

**Exemplo de Resultados:**

- **TITULO_ORIGINAL (StandardProfiles):**

   - `completeness`: 1.0 (100%)
   - `approximateNumDistinctValues`: 150
   - `dataType`: "String"
   - `typeCounts`: Indica que todos os registros são do tipo "String".

- **PUBLICO (NumericProfiles):**

   - `completeness`: 1.0 (100%)
   - `approximateNumDistinctValues`: 582
   - `dataType`: "Integral"
   - `mean`: 44.08 (média de público)
   - `maximum`: 906.0 (público máximo)
   - `minimum`: 1.0 (público mínimo)
   - `sum`: 6231976.0
   - `stdDev`: 61.57 (desvio padrão)

**Importância dos Profiles**: Os profiles permitem compreender o comportamento estatístico dos dados, como a completude, tipos de dados, valores distintos, média, máximo, mínimo e desvio padrão. Essa compreensão é fundamental para criar testes e regras de qualidade de dados eficazes, auxiliando na decisão sobre a usabilidade do conjunto de dados.

------------

#### Checks ou testes de qualidades

- **Objetivo:** Avaliar a qualidade dos dados impondo condições específicas.
- **Conceito:** Checks são condições que, se satisfeitas, indicam que os dados possuem qualidade para um propósito específico.

**Importação de Funções**

Para usar os checks, é necessário importar as funções da Pydeequ:
```py
from pydeequ.checks import *
from pydeequ.verification import *

# Criação de um Check Padrão
# Um check padrão é um construtor genérico onde as condições serão adicionadas.
teste = Check(spark, CheckLevel.Warning, 'Meu primeiro teste')
```

**Parâmetros:**

- `spark`: Variável de ambiente Spark.
- `CheckLevel`: Nível do teste (ex: `Warning` para aviso, `Error` para erro).
- `Nome do teste` (ex: 'Meu primeiro teste').

**Criação e Execução de um Teste com Checks**
Utiliza-se VerificationSuite para agrupar e executar os checks sobre os dados.
```py
teste1 = (
   VerificationSuite(spark)
   .onData(df)
   .addCheck(
      teste.isUnique('PUBLICO', hint='Falha quando há valores iguais')
      .isNonNegative('PUBLICO', hint='Falha quando há valores negativos')
   ).run()
)
```

**Métodos importantes:**

- `.onData(df)`: Define o DataFrame (df) sobre o qual o teste será executado.
- `.addCheck(teste.<condição>)`: Adiciona as condições de teste ao check genérico.
- `isUnique('coluna', hint='mensagem')`: Verifica se os valores na coluna são únicos.
- `isNonNegative('coluna', hint='mensagem')`: Verifica se os valores na coluna não são negativos.
- `.run()`: Executa o teste.

**Análise dos Resultados de um Teste**

Os resultados são armazenados e podem ser visualizados como um DataFrame.

```py
resultado_teste1 = VerificationResult.checkResultsAsDataFrame(spark, teste1)
resultado_teste1.show()
```

**Colunas do resultado:**

- **check**: Nome do teste genérico.
- **check_level**: Nível do teste (Warning/Error).
- **check_status**: Status geral do check (Success/Failure/Warning).
- **constraint**: A condição específica aplicada.
- **constraint_status**: Status da condição (Success/Failure).
- **constraint_message**: Mensagem detalhada em caso de falha, incluindo o hint.

| check             | check_level | check_status | constraint          | constraint_status | constraint_message  |
|-------------------|-------------|--------------|---------------------|-------------------|---------------------|
| Meu primeiro teste| Warning     | Warning      | UniquenessConstraint| Failure           | Value: 6.29642730...|
| Meu primeiro teste| Warning     | Warning      | ComplianceConstraint| Success           |                     |

**Para ver o primeiro resultado detalhado:**

`resultado_teste1.first()`

**Exemplo de retorno**: 
- `Row(check='Meu primeiro teste'`,
`check_level='Warning'`,
`check_status='Warning'`,
`constraint='UniquenessConstraint(Uniqueness(List(PUBLICO),None))'`, `constraint_status='Failure'`,
`constraint_message='Value`: 6.29642730810046E-4 does not meet the constraint requirement! Falha quando há valores iguais'

-------------

> Aplicação do Framework DAMA: Teste de Acurácia

Os checks podem ser usados para implementar as dimensões de qualidade de dados do framework DAMA.

>**Acurácia**: O quanto o dado reflete a realidade.

**Exemplo de função para verificar acurácia (tamanho do dataset)**:
```py
def verifica_acuracia(spark, df):
   tamanho = 150000
   teste_generico = Check(spark, CheckLevel.Error, 'Acuracia')
   teste = (VerificationSuite(spark)
      .onData(df)
         .addCheck(
            teste_generico.hasSize(lambda size: size >= 0.5 * tamanho and size <= 2.5 * tamanho)
        )
      .run()
   )
   return teste.checkResults[0]

resultado_acuracia = verifica_acuracia(spark, df)
```

**Condição hasSize**: Verifica se a quantidade de registros (linhas) do dataset está dentro de um intervalo definido.

**Exemplo de retorno de sucesso:**
```py
{'check_status': 'Success',
 'check_level': 'Error',
 'constraint_status': 'Success',
 'check': 'Verificando Acurária',
 'constraint_message': '',
 'constraint': 'SizeConstraint(Size(None))'}
```

#### Validade
> **Conceito**: Avalia se os rótulos de uma coluna estão de acordo com o esperado.

**Exemplo**: Verificar se as siglas de estados em uma coluna `UF_SALA_COMPLEXO` correspondem a uma lista predefinida.

**Sintaxe para lista de siglas**:
```py
siglas_estados = [
   "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS","MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"
]

# Função de verificação (verifica_validade):

def verifica_validade(spark, df, teste_generico):
    siglas_estados = [...] # Lista de siglas aqui
    verificacao = (
        VerificationSuite(spark)
        .onData(df)
        .addCheck(
            teste_generico.isContainedIn('UF_SALA_COMPLEXO', siglas_estados)
        ).run()
    )
    return verificacao.checkResults[0]
```

> **Aplicação**: `resultado_validade = verifica_validade(spark, df, cria_check(spark))`

**Resultado esperado (sucesso)**: `'check_status': 'Success'`

#### Completude

> **Conceito**: Avalia a quantidade percentual de registros não nulos em uma coluna.

**Exemplo**: Garantir que todas as colunas de um DataFrame tenham pelo menos 90% de completude.

> **Função de verificação (verifica_completude)**:
```py
def verifica_completude(spark, df, teste_generico):
    verificacao = (
        VerificationSuite(spark)
        .onData(df)
        .addCheck(
            teste_generico.haveCompleteness(df.columns, lambda comp : comp >= 0.9)
        ).run()
    )
    return verificacao.checkResults[0]
```

> **Aplicação**: `resultado_completude = verifica_completude(spark, df, cria_check(spark))`

**Resultado esperado (falha, exemplo)**: 
`'check_status': 'Error', 'constraint_message': 'Value: 0.6618747789175805 does not meet the constraint requirement!'`(indicando que uma coluna tem 66% de completude, abaixo do 90% exigido).

#### Unicidade
> **Conceito**: Verifica se uma coluna (ou dataset) possui valores repetidos. Útil para IDs ou CPFs.

**Exemplo**: Verificar a unicidade de uma coluna como PUBLICO (mesmo sabendo que terá valores repetidos para fins de demonstração).

> **Função de verificação (verifica_unicidade):**
```py
def verifica_unicidade(spark, df, teste_generico, coluna):
    verificacao = (
        VerificationSuite(spark)
        .onData(df)
        .addCheck(
            teste_generico.isUnique(coluna)
        ).run()
    )
    return verificacao.checkResults[0]
```
**Aplicação**: `verifica_unicidade(spark, df, cria_check(spark), 'PUBLICO')`

**Resultado esperado (falha, exemplo)**: `'check_status': 'Error', 'constraint_message': 'Value: 6.29642730810046E-4 does not meet the constraint requirement!'` (indicando que a coluna não é totalmente única).

Função Auxiliar `cria_check()`

**Propósito:** Agilizar a criação de objetos Check para os testes.

**Sintaxe**:
```py
def cria_check(spark):
    return Check(spark, CheckLevel.Error, 'Teste Generico')
```

### Sugestão de regras de qualidade

Para começar a usar as sugestões de regras, é preciso importar a parte específica da biblioteca PyDeequ:
```py
from pydeequ.suggestions import *
```

> Criando as Sugestões

As sugestões são geradas utilizando o `ConstraintSuggestionRunner`. É necessário informar o DataFrame (df) e adicionar as regras desejadas, como a DEFAULT() para sugestões básicas:
```py
sugestoes = (
    ConstraintSuggestionRunner(spark)
    .onData(df)
    .addConstraintRule(DEFAULT())
    .run()
)
```
O `ConstraintSuggestionRunner()` é o construtor responsável por sugerir as restrições mais adequadas. onData() define os dados a serem trabalhados e `addConstraintRule(DEFAULT())` adiciona o tipo de regra padrão. O `.run()` executa a geração das sugestões.

> Acessando e Interpretando as Sugestões

As sugestões podem ser acessadas e impressas em um loop, mostrando o nome da coluna e a descrição da sugestão:
```py
for sugestao in sugestoes['constraint_suggestions']:
    print(f"Sugestão : {sugestao['column_name']} : {sugestao['description']}")

# Exemplos de Sugestões:

Sugestão : REGISTRO_COMPLEXO : 'REGISTRO_COMPLEXO' has no negative values
Sugestão : PAIS_OBRA : 'PAIS_OBRA' is not null
Sugestão : PAIS_OBRA : 'PAIS_OBRA' has value range 'ESTADOS UNIDOS', 'BRASIL', 'INGLATERRA' for at least 94.0% of values
```
> Gerando o Código da Sugestão

Além da descrição, a PyDeequ também pode fornecer o código correspondente à sugestão, o que facilita a implementação dos testes:
```py
for sugestao in sugestoes['constraint_suggestions']:
    print(f"Sugestão : {sugestao['column_name']} : {sugestao['description']}")
    print(f"teste sugerido: {sugestao['code_for_constraint']}")
```
**Exemplos de Código Sugerido**:

- Para `'REGISTRO_COMPLEXO'` has no negative values: teste sugerido:
`.isNonNegative("REGISTRO_COMPLEXO")`.

- Para `'PAIS_OBRA'` has value range 'ESTADOS UNIDOS', 'BRASIL', 'INGLATERRA' for at least 94.0% of values: teste sugerido: `.isContainedIn("PAIS_OBRA", ["ESTADOS UNIDOS", "BRASIL", "INGLATERRA"], lambda x: x >= 0.94, "It should be above 0.94!")`

É crucial realizar uma interpretação humana das sugestões para ajustar os valores e as condições conforme a necessidade real do negócio, pois a biblioteca oferece um ponto de partida, mas a decisão final sobre a regra ideal é do usuário.
