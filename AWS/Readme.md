# Pipeline de dados na AWS

## Problema de Negócio: Lumarte E-commerce

- **Empresa**: Lumarte (fictícia), e-commerce com múltiplos canais de entrada.
- **Sistema Atual**: ERP genérico.

## Dores Identificadas

- **Faturamento**: Não é possível visualizar o faturamento real sem esperar três dias (problema de disponibilidade).
- **Canal de Venda**: Dificuldade em avaliar qual canal funciona melhor devido a dados desorganizados.
- **Marketing e Ticket Médio**: Impossibilidade de avaliar o desempenho do ticket médio em campanhas como Black Friday.
- **Qualidade de Dados**: Relatórios com erros (ex: valores negativos de venda).
- **Automação**: Processos manuais de extração de planilhas.
- **Banco de Dados de Origem**: PostgreSQL.

## Estratégia de Solução (Pipeline de Dados)

1. **Configuração de Ambiente:**
   1. Provisionar ambiente na AWS.
   2. Configurar Amazon RDS (simular banco de dados da Lumarte).
2. **Ingestão**:
   1. Construir função AWS Lambda para buscar dados no PostgreSQL.
   2. Armazenar dados no Amazon S3 (Data Lake) em formato Parquet.
3. **Governança e Qualidade de Dados**:
   1. Aplicar governança na camada Silver.
   2. Implementar processo de qualidade (semântica, consistência de tipos) antes da camada Raw.
4. **Camada Analítica**:
   1. Trabalhar na camada Gold.
   2. Transformar dados em modelo OLAP (fatos e dimensões) para consumo por ferramentas de visualização.
5. **Orquestração, Monitoramento e Consumo**:
   1. Orquestrar processos com AWS Step Functions.
   2. Monitorar com Amazon CloudWatch.
   3. Consumir dados via ferramentas de visualização ou consultas ad hoc (ex: IDE SQL).

## Arquitetura Geral (Componentes e Camadas)

![Arquitetura AWS para projeto de dados](/arquiteturaAWS.png)

- `AWS Cloud`: Tudo dentro de uma conta AWS.
- `Região`: Única região (*Ohio*).
- `Orquestração`: **AWS Step Functions Workflow** (para orquestrar funções Lambda).
- `Base de Dados de Origem`: **Amazon RDS** (simulação do banco de dados da Lumarte).
- `Extração`: **AWS Lambda Extractor**(script Python para extrair dados do e-commerce para S3).
- `Camada Bronze`: Dados brutos no **Amazon S3**.
- `Camada Silver`: **AWS Lambda** para aplicar transformações, governança e qualidade (dados tratados).
- `Camada Gold`: **AWS Lambda Gold** para transformar dados da Silver em modelo OLAP (fatos e dimensões).
- `Consulta`: **AWS Athena** (para ler dados do Data Lake e permitir consultas SQL).
- `Governança e Observabilidade`: Ferramentas para acompanhamento, logging e notificação de falhas (ex: **Amazon SNS** para e-mail).

## Custos AWS

- **Atenção**: Projeto pode gerar custos (referência: 8 a 15 dólares).
- **Práticas**: Desativar recursos após testes, desligar bases de dados, não deixar nada executando automaticamente, excluir serviços provisionados ao final.
- **Free Tier**: Verificar elegibilidade (12 meses gratuitos, depende de conta nova ou não utilizada).

## Estruturando o Data Lake (Bronze, Silver, Gold)

### O que é um Data Lake na AWS?

- Na AWS, um Data Lake é uma estrutura de Object Store (armazenamento de objetos) no serviço S3.
- Consiste em uma organização de pastas e camadas para separar a maturidade dos dados

### Acessando e Criando um Bucket no S3

- No console da AWS, pesquisar por "S3" na barra de busca.
- Clicar no ícone verde com um cubo.
- Dentro do S3, clicar em "Criar bucket" (botão verde no canto superior direito).
- O bucket é o agrupador principal que organiza os diretórios.

### Configurações do Bucket

- **Propósito**: Manter como propósito geral.
- **Bucket name**:
- Escolher "Account Regional Namespace".
- Definir um prefixo único, como Alumart-Datalink-SeuNome.
- **Propriedade do objeto**: Manter ACL desabilitado (recomendado pela AWS para cenários comuns).
- **Configurações de bloqueio**: Sempre manter "Bloquear todo o acesso público" habilitado para segurança dos dados da empresa. Exceções são extremamente raras.
- **Versionamento**:
  - Útil para evitar exclusão acidental ou sobrescrita de arquivos, mantendo versões anteriores.
  - Importante ter uma política de ciclo de vida para limpar versões antigas e evitar que o bucket fique muito pesado.
- **Tags**:
  - Usadas para rastrear custos.
  - **Exemplo**: Chave: "projeto", Valor: "Data Lake AluMart".
- **Criptografia padrão**:
  - Sempre deve haver criptografia para garantir a segurança dos dados.
  - Manter a criptografia padrão do Amazon S3 (mais simples e comum). KMS é mais avançado e caro, para requisitos específicos.
  - **Bloqueio de objetos**: Deixar desativado.
  - **Clicar no botão laranja na parte inferior para "Criar bucket".**

### Organizando as Camadas do Data Lake (Modelo Medallion)

- Após criar o bucket, abri-lo e criar as pastas.
- As pastas representam as camadas de maturidade dos dados:
  - **Bronze**: Dados brutos, exatamente como saem da base de dados, sem modificações. (Data Lake Bronze)
  - **Silver**: Camada para qualidade e governança de dados. (Data Lake Silver)
  - **Gold**: Camada para análise, com dados enriquecidos, modelagem de negócio, combinações e agrupamentos. (Data Lake Gold)

## Criando a Lambda de Ingestão (Extract)

### Objetivo Principal

- Ingestão de dados para a camada bronze do Data Lake utilizando AWS Lambda. Extração de dados do Amazon RDS (PostgreSQL) e armazenamento no S3.

### Camada Bronze

- **Princípio**: Manter os dados fiéis à origem.
- **Características**: Sem filtragens, sem modificações de estrutura ou características.

### Escolha do AWS Lambda

- **Motivo**: Volume pequeno de dados, simplicidade na conexão e extração.
- **Modelo**: Serverless (sem servidor) – executa código sem gerenciar infraestrutura.
- **Alternativas**: AWS Glue, Amazon EMR (com CDC, autoescalonamento, computação distribuída).
- **Outro uso comum**: Consumo de APIs.

### Criando a Lambda de Ingestão (Extract)

- **Acesso**: AWS Management Console > pesquisar "Lambda".
- **Iniciar**: "Criar função".
- **Opção**: "Criar uma função do zero".
- **Configurações Básicas**:
  - **Nome da função**: lambdaExtractBronze
  - **Runtime**: Python 3.14 (versão mais recente).
  - **Arquitetura**: x86_64.
Acesso: AWS Management Console > pesquisar "Lambda".
  - **Permissões**: Manter role padrão (AWS cria uma role IAM automaticamente). Em ambientes corporativos, usar role pré-configurada.
  - **URL da função**: Opcional, expõe a função como endpoint HTTPS.
  - **Limites**: Tempo de execução (máx. 15 min), CPU, memória, armazenamento. Funções devem ser específicas.
  - **VPC**: Habilitar para conectar ao Amazon RDS.
  - **Selecionar VPC e sub-redes**.
  - **Grupo de segurança**: Usar default ou criar um específico (ex: porta PostgreSQL).
  - **Tags**: Chave: projeto, Valor: data-lake-lumart.
  - **Finalizar**: "Criar função".

### Painel da Função Lambda

- **Overview**: Visualiza serviços que invocam a função e serviços invocados.
- **Gatilhos (Triggers)**: Configura eventos para invocar o Lambda (ex: Amazon S3 - evento "put" em um bucket).
- **Destinos**: Configura serviços que o Lambda pode invocar (ex: Amazon SNS, SQS, outro Lambda, EventBridge, S3).

### Ambiente de Codificação (IDE Online)

- **Arquivo principal**: lambda_function.py.
- **handler**: Função principal, equivalente ao main do código. Padrão: lambda_function.lambda_handler.
- **Parâmetros do handler**:
  - **event**: Informações passadas para alterar o comportamento da função.
  - **context**: Contexto de execução do código.

### Exemplo de Código

```python
import json

def lambda_handler(event, context):
    # Orquestração das chamadas
    hello_world()
    soma = soma_exemplo()
    print(soma)
    print(event) # Exibe o JSON passado no evento de teste
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

def hello_world():
    print("Hello World")

def soma_exemplo():
    a = 1
    b = 2
    c = a + b
    return c
```

### Publicação e Teste

1. **Deploy**: Salva e envia as alterações para o ambiente do Lambda.
2. **Test**: Criar evento de teste (ex: "teste de exemplo").
3. **Conteúdo do evento (JSON)**:

```json
{
  "nome": "oscar"
}
// Invocar para executar a função.
```

4. **Resultados**:

    - **Resposta**: Retorno programado no lambda_handler (ex: `statusCode: 200, body: "Hello from Lambda!"`).
    - **Logs**: Ordem de execução das funções, saída dos print (ex: `"Hello World", "3", {'nome': 'oscar'}`).

## Configurando o VPC Endpoint e o Secret Maneger

### Revisão da Arquitetura e Objetivos

- Contexto: Extrair dados do Amazon RDS para o Data Lake (Amazon S3) usando AWS Lambda.
- Camadas do Data Lake:
- Bronze: Dados brutos.
- Silver: Dados processados.
- Gold: Dados modelados para consumo analítico.
- Fluxo: Amazon RDS (fonte) -> AWS Lambda (extratora) -> Amazon S3 (Data Lake).

### Uso do AWS Secrets Manager e Conectividade de Rede

- AWS Secrets Manager: Centraliza o gerenciamento de credenciais (usuário, senha, endpoint do banco de dados).
- Benefícios: Evita credenciais no código, aumenta a segurança, facilita o compartilhamento e a rotação de credenciais.
- Comunicação de Rede: A função Lambda precisa se comunicar com o S3 e o Secrets Manager.
- VPC Endpoint: Mecanismo para permitir a comunicação privada entre a Lambda e os serviços AWS (S3 e Secrets Manager).

### Configurando o Segredo no AWS Secrets Manager

- Acesso: Pesquisar "Secrets Manager" na barra de busca da AWS.

- **Criação de Segredo**:

  1. Clicar em "Segredos" no menu lateral.
  2. Clicar em "Armazenar novo segredo".
  3. Selecionar "Credencial do tipo Amazon RDS".
  4. Inserir usuário (ex: Postgres) e senha (ex: Alura#12).
  5. Selecionar a base de dados (ex: Alura Pipeline Alumart).

- Nome do Segredo: Seguir o padrão AMBIENTE/APLICACAO/RECURSO.

  - Exemplo: `DEV/Alumart/Database` (ou `dev/alumart/database1` para evitar duplicidade).
- Tags: Adicionar tags para rastreamento.

  Exemplo: _`Key: projeto, Value: datalake-alumart`_.
- Rotação: Opção de habilitar rotação de segredos (não habilitado nesta aula).

- Recuperação do Valor do Segredo: Na seção "Valor do segredo", clicar em "Recuperar valor do segredo" para ver os detalhes (username, password, engine, host, port, database).

#### Exemplo de Código Python para Recuperar Segredo:

```py
import boto3
from botocore.exceptions import ClientError

def get_secret():
    secret_name = "dev/alumart/database1"
    region_name = "us-east-2"

    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        raise e
```

- Controle de Acesso: O acesso ao segredo é controlado por permissões, permitindo listar, mas não necessariamente recuperar o valor.

### Criando o VPC Endpoint para o S3 (Data Lake)

- **Acesso**: Pesquisar "VPC" na barra de busca da AWS.
- **Criação de Endpoint**:
  1. No menu lateral, ir em "PrivateLink" -> "Endpoints".
  2. Clicar em "Criar endpoint".
  3. Nome: vpc-endpoint-datalake-alumart.
  4. Tipo: "Serviço da AWS".
  5. Serviço: com.amazonaws.us-east-2.s3.
  6. Tipo de Endpoint: "Gateway".
  7. Configuração de Rede: Selecionar a VPC do projeto e a tabela de rotas padrão.
  8. Política: "Acesso total".
  9. Tags: Key: projeto, Value: datalake-alumart.
  10. Clicar em "Criar endpoint".

### Configurando o VPC Endpoint para o Secrets Manager

1. Clicar em "Criar endpoint".
2. Nome: vpc-endpoint-secretmanager-alumart.
3. Tipo: "Serviço da AWS".
4. Serviço: com.amazonaws.us-east-2.secretsmanager.
5. Tipo de Endpoint: "Interface".
6. VPC: Selecionar a VPC do projeto.
7. Configurações Adicionais: Manter Private DNS habilitado e IPv4.
8. Sub-redes: Selecionar as três sub-redes.
9. Grupo de Segurança: Selecionar o grupo de segurança padrão.
10. Política: "Acesso total".
11. Tags: Key: projeto, Value: datalake-alumart.
12. Clicar em "Criar endpoint".

### Verificação dos Endpoints

- Os endpoints criados (Data Lake e Secrets Manager) aparecerão na lista de Endpoints. O status do Secrets Manager pode ficar "pendente" por alguns minutos.
- Preparação do ambiente concluída para que a Lambda possa se conectar ao S3 e ao Secrets Manager.

## Entendendo o código do Lambda de Extração

### Bibliotecas Essenciais

- **`json`**: Para trabalhar com dados JSON em Python.
- **`logging`**: Gerenciamento eficiente de logs.
- **`psycopg2`**: Conexão com PostgreSQL (Amazon RDS).
- **`boto3`**: SDK oficial da AWS para Python, para interagir com APIs da AWS.

### Exemplo de importação

```python
import json
import logging
import psycopg2
import boto3
```

### Dependências e Empacotamento com AWS SAM

- Bibliotecas Padrão: Python e boto3 já vêm instalados no runtime do Lambda.
- Dependências Externas: Bibliotecas como psycopg2 precisam ser incluídas no pacote de deploy.
- AWS SAM: Facilita o empacotamento de dependências, garantindo compatibilidade com o ambiente Linux do Lambda.
- requirements.txt: Arquivo para especificar bibliotecas e suas versões, como psycopg2-binary==2.9.10, para evitar problemas de compatibilidade.

### Variáveis de Ambiente e Clientes AWS

- **`Logger`**: Instância configurada para gerenciar logs, substituindo print.
- **`Variáveis de Ambiente`**: SECRET_NAME e S3_BUCKET são definidas para flexibilidade, permitindo alterações sem novo deploy.
- **`Clientes Boto3`**: s3_client e secrets_client são criados para interagir com os serviços S3 e Secrets Manager.

#### Exemplo

```python
SECRET_NAME = os.environ['SECRET_NAME']
S3_BUCKET = os.environ['S3_BUCKET']

s3_client = boto3.client('s3')
secrets_client = boto3.client('secretsmanager')
```

### Recuperando Segredos do Banco de Dados

- **get_db_secret()**: Função para buscar credenciais do banco no AWS Secrets Manager.
Cache em Memória: Utiliza a variável global _db_secret para armazenar o segredo e evitar chamadas repetidas ao Secrets Manager durante a execução da Lambda.
- **Processamento do JSON**: O valor retornado pelo Secrets Manager é uma string JSON, convertida para dicionário Python com json.loads().
- **Permissões**: A função Lambda precisa de uma política de acesso (secretsmanager:GetSecretValue) para ler o segredo.
- **Exemplo da função get_db_secret**:

```python
def get_db_secret():
    global _db_secret
    if _db_secret is None:
        response = secrets_client.get_secret_value(SecretId=SECRET_NAME)
        _db_secret = json.loads(response['SecretString'])
    return _db_secret
```

### Conexão e Extração de Dados

- **TABLES**: Lista de tabelas a serem extraídas (idealmente, passada como parâmetro).
- **get_connection()**: Estabelece a conexão com o PostgreSQL no RDS usando as credenciais obtidas de get_db_secret().
- **extract_table(cursor, table_name)**: Executa um SELECT * na tabela especificada, retornando as colunas e as linhas.

#### Exemplo de conexão

```python
def get_connection():
    secret = get_db_secret()
    return psycopg2.connect(
        host=secret['host'],
        port=secret['port'],
        dbname=secret['database'],
        user=secret['username'],
        password=secret['password'],
        connect_timeout=10
    )
```

#### Exemplo de extração

```python

def extract_table(cursor, table_name):
    cursor.execute(f'SELECT * FROM {table_name}')
    columns = [desc[0] for desc in cursor.description]
    rows = cursor.fetchall()
    return columns, rows
```

### Gravação no S3

- **write_csv_to_s3(columns, rows, table_name, timestamp)**: Função para formatar os dados como CSV e enviá-los para o S3.
- **io.StringIO**: Usado para criar um buffer em memória para a escrita CSV.
- **Chave do S3**: O arquivo é salvo no formato bronze/<nome_tabela>/<nome_tabela>_<timestamp>.csv.
- **s3_client.put_object**: Método do Boto3 para enviar o arquivo CSV para o S3.

#### Exemplo de escrita no S3

```python

def write_csv_to_s3(columns, rows, table_name, timestamp):
    output = io.StringIO()
    writer = csv.writer(output)
    writer.writerow(columns)
    writer.writerows(rows)
    s3_key = f"bronze/{table_name}/{table_name}_{timestamp}.csv"

    s3_client.put_object(
        Bucket=S3_BUCKET,
        Key=s3_key,
        Body=output.getvalue(),
        ContentType='text/csv'
    )
    return s3_key
```

### Orquestração com o Handler da Lambda

- **handler(event, context)**: Função principal (entrypoint) da Lambda.
- **Fluxo**:
  1. Gera um timestamp.
  2. Abre a conexão com o banco de dados.
  3. Itera sobre as tabelas definidas em TABLES.
  4. Para cada tabela, extrai os dados e os escreve no S3.
  5. Registra o volume de linhas e o caminho do S3.
  6. Retorna um status de sucesso (200) com detalhes da execução.

- **Tratamento de Erros**: Bloco `try/except/finally` para gerenciar exceções e garantir o fechamento da conexão.

### Preparando o Template do AWS SAM

- **template.yaml**: Arquivo YAML que descreve a infraestrutura serverless a ser implantada.
- **Globals**: Define configurações padrão para as funções (ex: Timeout, MemorySize, Runtime).
- **Parameters**: Variáveis configuráveis no momento do deploy (ex: SecretName, S3Bucket, SubnetIds, LambdaSecurityGroupId).
- **Resources**: Declara a função Lambda (LambdaExtract) e suas propriedades:
  - **FunctionName**: Nome da função.
  - **CodeUri**: Caminho do código-fonte.
  - **Handler**: lambda_function.handler (arquivo e função principal).
  - **Environment.Variables**: Variáveis de ambiente passadas para a função.
  - **VpcConfig**: Configurações de rede (sub-redes e grupos de segurança).
  - **Policies**: Permissões necessárias (ex: S3CrudPolicy para S3 e AWSSecretsManagerGetSecretValuePolicy para Secrets Manager).

## Deploy da Lambda

### Para gerar o pacote da função Lambda, utilize o comando no terminal:

```bash
sam build
```

### Início do Deploy Guiado

O processo de implantação é iniciado de forma interativa com o comando:

```bash
sam deploy --guided
```

### Configurações do Assistente Interativo

Durante o deploy guiado, são inseridos os seguintes valores:

- **Nome do stack**: data-lake-alumart-dev (salvo como datalake-alumart-dev)
- **Região**: us-east-2
- **Nome do segredo (Secrets Manager)**: dev-alumart-database (salvo como dev/alumart/database)
- **Bucket S3**: Exemplo: alumart-datalake-oscar-576355729000-us-east-2-an
- **Subnet IDs**: Lista separada por vírgulas. Exemplo: subnet-f90b2c91,subnet-8952cff3,subnet-cf975383
- **Security Group ID**: Exemplo: sg-6cadc501
- **Confirmação de mudanças, criação de role e habilitação de Disable rollback**.
- **Salvamento das respostas em samconfig.toml**.

#### Geração do samconfig.toml.

> **O arquivo samconfig.toml é gerado automaticamente com as configurações definidas, como:**

```yaml
version = 0.1

[default.deploy.parameters]
stack_name = "datalake-alumart-dev"
# ... outras configurações
parameter_overrides = "SecretName=\"dev/alumart/database\" S3Bucket=\"alumart-datalake-oscar-576355729000-us-east-2-an\""
# ...
```

### Verificação da Implantação

> **Após o deploy, a função extract-bronze é verificada no console da AWS Lambda.**

- Confirmação do código e bibliotecas carregadas.
- Verificação das variáveis de ambiente (bucket S3 e nome do segredo).
- Confirmação dos VPC Endpoints para S3 e Secrets Manager.

## Criando o Glue Crawler da Bronze

### Introdução à Camada Silver

- **Objetivo**: Melhorar a qualidade dos dados, converter para formato Parquet e trabalhar a semântica para facilitar o uso.
- **Contexto**: Resolver problemas de negócio como valores inconsistentes em dashboards e dificuldade de entendimento dos dados por usuários de negócio.
- **Função da Camada Silver**: Limpar dados, remover inconsistências e traduzir nomes de objetos e colunas para um consumo mais amigável.

> ### Categorias de Qualidade de Dados
>
> - **Completude**: Verificar se campos obrigatórios não estão vazios ou nulos.
> - **Unicidade**: Garantir que dados não estejam duplicados, usando chaves primárias para desduplicação.
> - **Validade**: Checar se os valores estão dentro do domínio esperado e respeitam o formato (ex: sem valores negativos onde não deveria haver).
> - **Integridade Referencial**: Verificar relações entre tabelas para evitar registros órfãos (ex: venda de produto inexistente). No data lake, não há restrição, mas sim validação.
> - **Consistência**: Assegurar que dados relacionados são coerentes (ex: total da venda coincide com a soma dos itens).
> - **Temporalidade**: Validar se as datas são válidas e fazem sentido no tempo (ex: sem vendas futuras indevidas).

### Configuração na AWS para Validações com Athena

- **Ferramenta**: AWS Athena para consultar dados no S3 com SQL.
- **Região**: Ohio, us-east-2.
- **Serviço Principal**: AWS Glue.

### Criando o Database Bronze no Glue

- **Caminho**: Data Catalog > Databases > Add database.
- **Nome do Database**: bronze
- **Objetivo**: Expor os dados do data lake para consumo no Athena.

### Ajustando Configurações do Lake Formation

- **Desabilitação**: Não usar Lake Formation para este projeto, mas sim permissões do IAM.
- **Configuração**: Acessar AWS Lake Formation > Data Catalog Settings e habilitar:
- Use only IAM access control for new database
- Use only IAM access control for new tables in new database
- Importância: Garantir que o controle de acesso seja feito exclusivamente pelo IAM.

### Criando o Crawler do Glue para a Camada Bronze

- **Caminho**: Data Catalog > Crawlers > Create crawler.
- **Nome do Crawler**: alumart-bronze
Função do Crawler: Examinar o bucket S3 na pasta "bronze", identificar arquivos e sua - estrutura automaticamente, criando tabelas no Data Catalog.
Configuração S3 Path: `s3://alumart-datalake-oscar-576355729000-us-east-2-an/bronze/` - (exemplo de URI).
- **Permissões**: Criar uma nova função IAM: `AWSGlueServiceRole-alumart-crawler`.
- **Database de Destino**: Selecionar bronze.
- **Agendamento**: Sob demanda (On demand) para controle manual e evitar custos desnecessários.
- **Execução**: Clicar em Run crawler e aguardar a conclusão (ex: 43 segundos para 5 tabelas).

#### Contextualizando o Serviço Glue

- Funções: ETL com Spark (serverless), catalogação de dados (equivalente a Hive metastore), registro de tabelas e esquemas.

### Configurando o Athena para Consultas

- **Acesso**: Pesquisar Athena na barra de busca.
- **Configuração Inicial**: Definir um local no S3 para salvar os resultados das consultas.
- **Caminho** para Resultados: Adicionar athena-results ao bucket do data lake (ex: `s3://alumart-datalake-oscar-576355729000-us-east-2-an/athena-results/`).
- **Verificação**: No menu lateral esquerdo do Athena, o catálogo, o database bronze e as tabelas com suas colunas e tipos já devem estar visíveis.

#### Testando a Consulta no Athena

- **Exemplo de Consulta**: Clicar nos três pontos ao lado do nome da tabela e escolher "View table".
- **Sintaxe**: `SELECT * FROM "bronze"."erp_fn_pgto" limit 10;`
- **Resultado**: Valida a funcionalidade da consulta e a exibição dos dados.

Próximos Passos

- Explorar os dados no Athena.
- Realizar as validações de qualidade.
- Implementar as validações em consultas SQL no processo de transformação.

## Contextualização da Análise Exploratória e Governança de Dados

A importância de dados de qualidade para evitar decisões prejudiciais. Dados ruins são piores do que a ausência de dados, pois geram uma falsa confiança. A governança de dados é crucial para garantir consistência, integridade e validade.

### Inspecionando Colunas no Athena e Mapeando Tipos

- O primeiro passo é analisar as colunas das tabelas no Athena para identificar tipos de dados inadequados.

  **Exemplo**: `dtpagamento` como `string` em vez de `date`. A conversão para o tipo date é importante para particionamento e melhor uso em ferramentas de visualização.

- Executando Checagens Iniciais de Duplicidade e Custo no Athena

  Consultas SQL são usadas para validar a qualidade dos dados.

#### Exemplo de checagem de duplicidade:

```sql
SELECT COUNT(*) as total,
    COUNT(DISTINCT nr_ov) as distintos
FROM bronze.erp_ov_cabe

-- Resultado: total: 2500, distintos: 500. Isso indica um fator de duplicação de 5 vezes.
```

O custo do Athena é determinado pela quantidade de dados varridos (5 dólares por TB varrido). Estratégias como particionamento podem reduzir custos e acelerar consultas.

### Verificando Unicidade com Chave Composta em Pagamentos

Para tabelas com chaves compostas, a verificação de unicidade é feita combinando os campos da chave.

**Exemplo**:

```sql
SELECT COUNT(*) as total,
    COUNT(DISTINCT id_pgto) as distintos,
    COUNT(DISTINCT CONCAT(CAST(nr_ov AS VARCHAR), '-',
    CAST(nr_parcela AS VARCHAR))) as distintos_ov_parcela
FROM bronze.erp_fn_pgto
```

### Consolidando Checagens de Qualidade em Produtos

Consultas podem consolidar várias checagens de qualidade em uma única execução.

**Exemplo**:

```sql
SELECT COUNT(*) as total,
    COUNT(DISTINCT cod_prod) as distintos,
    SUM(CASE WHEN ds_prod IS NULL OR ds_prod = '' THEN 1 ELSE 0 END) as nome_nulo,
    SUM(CASE WHEN vl_preco IS NULL THEN 1 ELSE 0 END) as preco_nulo,
    SUM(CASE WHEN vl_custo IS NULL THEN 1 ELSE 0 END) as custo_nulo,
    SUM(CASE WHEN qt_estq < 0 THEN 1 ELSE 0 END) as estoque_negativo,
    SUM(CASE WHEN vl_preco < vl_custo THEN 1 ELSE 0 END) as preco_menor_custo,
    SUM(CASE WHEN st_ativo NOT IN (0,1) THEN 1 ELSE 0 END) as st_invalido
FROM bronze.erp_it_prod
```

### Orquestrando Validações com o Assistente e Refinando o Prompt

> Assistentes de IA podem acelerar a análise de qualidade de dados. É fundamental refinar o prompt para especificar o database e a engine (AWS Athena).

**Exemplo de prompt refinado**:

```md
Você é um engenheiro de dados especialista, que deve realizar uma análise exploratória nos dados do datalake alumart disponíveis no database bronze no AWS ATHENA na conta AWS e deve identificar problemas de qualidade nos dados. Sejam de campos com tipos indevidos ou problemas de:

Completude, Unicidade, Validade, Intrigridade referencial, Consistencia, Temporalidade.

Retorne um relatório trazendo as informações organizadas por criticidade e a referencia para que eu possa validar as informações do relatório.
```

### Acompanhando a Execução no Athena e Sumarizando Duplicidades

O assistente executa múltiplas consultas no Athena para verificar a qualidade dos dados.

- Exemplo de sumarização de duplicidades em todas as tabelas:

```sql
SELECT 'erp_hp_clie' as tabela, COUNT(*) as total, COUNT(DISTINCT cod_clie) as unicos FROM bronze.erp_hp_clie
UNION ALL SELECT 'erp_it_prod', COUNT(*), COUNT(DISTINCT cod_prod) FROM bronze.erp_it_prod
-- ... e assim por diante para as outras tabelas
```

### Avaliando o Relatório e Diagnosticando Duplicações por Reprocessamento

O relatório do assistente detalha problemas de qualidade. A duplicação sistêmica (ex: fator de 5 vezes) pode ser causada por reprocessamento, onde múltiplos arquivos com o mesmo conteúdo são gerados.

Evidência: `s3://alumart-datalake-oscar-576355729000-us-east-2-an/bronze/*/ -- 5 arquivos por prefixo, todos com timestamp diferente e mesmo conteúdo.`

### Padronizando Domínios de Pagamento e Status

Problemas de consistência, como variações de grafia em campos de pagamento (Boleto/boleto) ou status, exigem padronização.

- Exemplo de inspeção de cd_pgto:

```sql
SELECT cd_pgto, COUNT(*) as total
FROM bronze.erp_ov_cabe
GROUP BY cd_pgto ORDER BY total DESC;
```

### Verificando Integridade Referencial entre Itens e Produtos

A integridade referencial verifica se os dados em uma tabela têm correspondência em outra.

- Exemplo de checagem de itens órfãos:

```sql
SELECT i.nr_ov, i.cod_prod, i.qt_item, i.vl_unit
FROM bronze.erp_ov_item i
WHERE NOT EXISTS (SELECT 1 FROM bronze.erp_it_prod p WHERE p.cod_prod = i.cod_prod)
LIMIT 50;
```

### Detectando Quantidades e Valores Inválidos e Pagamentos Inconsistentes

Validade de dados, como quantidades negativas ou nulas em itens, e valores unitários inconsistentes, são verificadas.

Exemplo de quantidades inválidas:

```sql
SELECT nr_ov, cod_prod, qt_item, vl_unit, vl_tot_item
FROM bronze.erp_ov_item
WHERE qt_item IS NULL OR qt_item <= 0
GROUP BY nr_ov, cod_prod, qt_item, vl_unit, vl_tot_item;
```

### Mapeando Campos de Data e Outras Criticidades Médias

Campos de data armazenados como string são uma criticidade média que exige conversão.

- Mapeamento de campos de data:

| Tabela | Campo | Tipo atual | Tipo correto |
| --- | --- | --- | --- |
| erp_ov_cabe | dt_ov | string | date |
| erp_fn_pgto | dt_pgto | string | date |

### Aplicando Validações com Expressões Regulares

Expressões regulares são úteis para validar formatos de dados, como e-mails e CPF/CNPJ.

- Exemplo de validação de e-mails:

```sql
SELECT cod_clie, nm_clie, ds_email
FROM bronze.erp_hp_clie
WHERE ds_email IS NOT NULL
AND NOT REGEXP_LIKE(ds_email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
GROUP BY cod_clie, nm_clie, ds_email;
```

### Resumindo Recomendações e Definindo Próximos Passos

As recomendações incluem:

- Implementar deduplicação.
- Normalizar domínios.
- Converter tipos de dados.
- Investigar inconsistências com a área de negócio.
- A decisão é não passar registros inválidos para a camada Silver, garantindo 100% de consistência. O próximo passo é implementar essas regras em um AWS Lambda.
