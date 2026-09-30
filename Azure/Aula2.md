# Transformação de dados com Azure Function

## Criando a Function App

### Azure Functions: O que é e para que serve

- É como um "robô" que executa um pedacinho de código sem precisar de um servidor. Pense nele como um serviço "sem servidor" (serverless), onde o Azure cuida de toda a parte chata de infraestrutura.
- No nosso projeto, ele vai ser o "processador de dados". Quando um dado novo chegar na camada bronze (lembra da nossa primeira camada de dados brutos?), o Azure Function é ativado, trata esse dado e o move para a camada silver (onde os dados já estão mais organizados). É aqui que a mágica da transformação acontece!

### Montando a Function App no Azure

- No portal do Azure, procure por "Aplicações de funções".
- Escolha o modelo "Consumo flexível". Se você tem uma conta gratuita, os créditos cobrem o uso.
- Mantenha a assinatura padrão.
No grupo de recursos, selecione aquele que criamos lá na Aula 1.

### Dando um nome à nossa aplicação

- Existe um padrão para nomear: func- (obrigatório), seguido do nome do projeto e do ambiente.
- Exemplo: func-etlecommerce-prd.
- func-
- func-etl- (ETL é o tipo da solução, de Extração, Transformação e Carga)
- func-etl-ecommerce (nome do nosso projeto de e-commerce)
- func-etl-ecommerce-prd (indicando que é o ambiente de produção)
- No final, optamos por func-etlecommerce-prd (sem o hífen entre "etl" e "ecommerce").

### Ajustes de Configuração

- Região: Escolha a mesma que usamos para todos os outros recursos: East US 2.
- Linguagem: Python 3.11.
- Tamanho: 512 (nossa tarefa não será pesada).
- Armazenamento: Crie uma conta de armazenamento que será ligada ao nosso pipeline de dados.

### Criando a Função no Visual Studio Code

- A função em si é criada no VS Code.
- Instale a extensão "Azure Functions" no VS Code.
- Faça login na sua conta Azure dentro do VS Code.
- Crie um novo projeto de função e escolha uma pasta para ele (ex: "ETL eCommerce").
- Selecione Python como linguagem.

### O "Gatilho" da Função: Blob Trigger

- **Este é o ponto chave**: vamos definir o que "dispara" nossa função.
- **Escolha "Blob Trigger**". Isso significa que a função será ativada sempre que um arquivo (blob) for salvo em um local específico.
- **Nome da função**: func_etlecommerceprd.
- **Caminho do blob**: stpipedadosalura001/bronze. Isso indica que a função será acionada quando algo for salvo na pasta "bronze" do nosso contêiner de armazenamento stpipedadosalura001.
- **Conexão de armazenamento**: Use a conta de armazenamento "stp dados" para os testes.

### O Código Básico Gerado

- O VS Code já cria um código inicial para a função. Ele já vem com tudo configurado para o gatilho de Blob:

```py
import azure.functions as func
import logging

app = func.FunctionApp()

@app.blob_trigger(arg_name="myblob", path="stpipedadosalura001/bronze", connection="stpipedadosalura001_STORAGE")
def func_etlecommerceprd(myblob: func.InputStream):
    logging.info(f"Python blob trigger function processed blob"
                f"Name: {myblob.name}"
                f"Blob Size: {myblob.length} Bytes")
```

- Esse código já:
- Prepara o aplicativo (FunctionApp).
- Define o gatilho (@app.blob_trigger) apontando para a pasta bronze e usando a conexão de armazenamento que configuramos.
- Cria a função func_etlecommerceprd.
- Registra informações básicas do arquivo processado (nome e tamanho).
