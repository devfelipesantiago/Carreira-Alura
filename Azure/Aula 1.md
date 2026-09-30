# Preparando o ambiente e o Data Lake

## Resource Group: Organização de Recursos na Azure

### O que é um Resource Group?

- Contêiner ou pasta para organizar e reunir todos os serviços de um projeto na Azure.
- Permite gerenciar e monitorar serviços de forma conjunta.
- Facilita a aplicação de políticas de permissão a múltiplos serviços.
- Simplifica a exclusão de todos os serviços de um projeto ao remover o Resource Group, evitando custos.

---

### Criando um Resource Group

1. **Acesso**:
   1. Na tela inicial do Azure, procurar por "Grupo de Recursos" na barra de pesquisa ou na lista de serviços.
2. **Configuração**:
   1. Assinatura: Geralmente "Azure Subscription 1" (conta gratuita).
   2. Nome: Definir um nome único para o grupo (ex: 'primeiro-pipeline-de-dados'). Não pode conter espaços.
   3. Região: Selecionar a região (ex: 'US2'). Considerar fatores como permissão de trânsito de dados e custo.
   4. Tags (Opcional): Adicionar etiquetas para organização lógica. Não obrigatório.
3. **Revisão e Criação**:
   1. Revisar os detalhes informados.
   2. Clicar em "Criar".
4. **Verificação**:
   1. Após a criação, o Resource Group aparecerá listado na seção "Grupo de Recursos", inicialmente vazio.

---

### Criando a Storage Account

#### O que é a Conta de Armazenamento (Storage Account)?

- Serviço base de armazenamento no Azure.
- Porta de entrada para armazenamento de diversos tipos de dados: logs, vídeos, imagens, data lakes.
- No curso, será usada para armazenar logs a serem processados no pipeline de dados.
- Permite criar estruturas mais específicas, como o Data Lake Storage Gen2 (abordado futuramente).

#### Processo de Criação no Portal do Azure

- Acessar o serviço "Contas de armazenamento" (pesquisar se não estiver visível).
- Clicar em "Criar".

#### Configurações Essenciais

- **Assinatura**: Selecionar a assinatura da conta.
- **Grupo de Recursos**: Escolher o grupo de recursos criado anteriormente (ex: "Primeiro Pipeline de Dados").
- **Nome da Conta de Armazenamento**:
  - Deve ser único globalmente.
  - Adotar convenção de nomenclatura (ex: "ST" + nome do projeto + número).
  - Exemplo: stpipedadosalura001
- **Região**: Manter "West US 2" para fins de estudo.
- **Tipo de Armazenamento**: Selecionar "Armazenamento de blobs do Azure" ou "Azure Data Lake Storage Gen2".
- **Desempenho**:
  - **Standard**: Uso geral, suficiente para o curso.
  - **Premium**: Para baixa latência (não necessário aqui).
- **Redundância**:
  - `LRS` (Redundância local): Suficiente para o curso.
  - Outras opções: geográfica, por zona, zona geográfica.
- **Namespace Hierárquico**: Habilitar para uso futuro do Azure Data Lake Storage Gen2.
- **Acesso à Rede Pública**: Manter habilitado para todas as redes (para fins de estudo).
- **Criptografia**: Manter as configurações padrão.
- **Etiquetas**: Opcional, podem ser adicionadas posteriormente.

#### Revisão e Implantação

- Revisar todas as configurações preenchidas.
- Clicar em "Criar" para iniciar a implantação do recurso.
- Acompanhar o status da implantação até a conclusão.

#### Confirmação

- Após a implantação, a conta de armazenamento (ex: STPipeDadosAlura001) estará visível na lista de recursos.
- O recurso estará vazio inicialmente, mas pronto para uso.

---

## Estruturando as camadas bronze e silver

### Arquitetura Medallion

- Utilização da arquitetura Medallion para organizar dados em um Data Lake.
- Camadas comuns: Bronze, Silver e Gold.

### Camada Bronze

- Armazenamento de dados em seu formato bruto, sem tratamento.

### Camada Silver

- Armazenamento de dados já tratados após passarem pelo pipeline.

### Prática: Criação dos Contêineres

- Acessar a conta de armazenamento criada na aula anterior (ex: "stp dados Alura 001").
- Navegar até "Navegar no Armazenamento" e selecionar "Contêiner de blobs".
- Criar o contêiner "bronze".
- Criar o contêiner "silver".

### Organização

As camadas "bronze" e "silver" são criadas como contêineres dentro da conta de armazenamento para organizar e separar os dados.
