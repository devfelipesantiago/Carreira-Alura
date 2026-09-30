# Preparando o ambiente e o Data Lake

## Resource Group: Organização de Recursos na Azure

### O que é um Resource Group?

- Contêiner ou pasta para organizar e reunir todos os serviços de um projeto na Azure.
- Permite gerenciar e monitorar serviços de forma conjunta.
- Facilita a aplicação de políticas de permissão a múltiplos serviços.
- Simplifica a exclusão de todos os serviços de um projeto ao remover o Resource Group, evitando custos.

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

