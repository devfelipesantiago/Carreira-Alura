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

