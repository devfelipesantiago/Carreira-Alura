# Governança de dados

## Ciclo de vida dos dados

### Por que estudar o ciclo de vida dos dados?

- **Preocupações com dados**: Ao lidar com dados em organizações, surgem questões como:
    - Quais dados são importantes?
    - Como serão armazenados?
    - Quem pode acessá-los?
    - Como e para que serão usados?
    - **Necessidade de diferentes competências**: Essas preocupações exigem profissionais e competências variadas.
    - **Solução**: Estudar o ciclo de vida dos dados ajuda a identificar todas essas necessidades e características.

### O que é um ciclo de vida?

- **Analogia com a biologia**: O ciclo de vida das borboletas é um bom exemplo:
    - **Larva**: Foco em consumir folhas e angariar nutrientes.
    - **Casulo**: Foco na metamorfose.
    - **Borboleta**: Foco em buscar néctar e acasalamento.
    - **Mudança de características e preocupações**: Em cada fase, as características e preocupações são diferentes.

### O ciclo de vida dos dados

- **Etapas distintas**: Assim como na biologia, os dados também possuem diferentes etapas onde as características e preocupações mudam.
- **Importância estratégica**:
    - Facilita a identificação de atores e capacidades envolvidas em cada etapa.
- **Importância operacional**:
    - Ajuda a desenvolver uma visão sistêmica para quem foca em apenas uma etapa.
    - Melhora a percepção de como o trabalho individual contribui para a gestão completa dos dados, desde a coleta até o descarte.

## Características Fundamentais dos Dados

**O que são dados?** Dados são uma coletânea de registros, que podem ser físicos (como revistas) ou digitais (como bases de dados do IBGE).

**Dados como Ativos**

- Dados são um ativo valioso para organizações, pois permitem extrair valor.
- Diferente de ativos como dinheiro ou petróleo, dados não são consumidos após o uso. Eles podem ser utilizados múltiplas vezes, o que permite que tenham um ciclo de vida contínuo.

**Dados são Contextuais**

- O significado dos dados depende do contexto em que estão inseridos.
- Exemplo: "1958, 1962, 1970, 1994, 2002" não significam muito isoladamente. Mas, ao adicionar o contexto "anos em que a seleção brasileira ganhou a Copa do Mundo", eles ganham significado.

**Dados são Temporais**

- A relação dos dados com o tempo ocorre de duas formas:
    - **Disponibilidade**: Dados só geram valor se estiverem disponíveis quando necessários. Se dados do IBGE sobre a população não forem divulgados por meses, eles perdem valor para um relatório mensal.
    - **Relevância**: A utilidade dos dados pode ser limitada por um recorte temporal. Dados de times da Copa do Mundo de 1966 para trás podem não ser relevantes se o interesse for apenas a partir de 1966.

## Coleta de Dados: O Início do Ciclo de Vida

**Ponto de Partida**: A coleta é a primeira fase do ciclo de vida dos dados, onde as organizações começam a interagir com as informações.

**Exemplo Prático**: Pesquisadores de universidade coletam dados sobre intenção de compra de um produto (ex: garrafa), perguntando sobre preço ideal, pechincha e valor caro.

**Etapa de Coleta**: Detalhes Importantes

**Atores Envolvidos**:

- **Demandante**: Pessoa ou sistema que solicita e necessita dos dados (ex: professor na pesquisa, ou um sistema que precisa ser alimentado).
- **Governança de Dados**: Garante que a coleta esteja em conformidade com regulamentações e políticas.

**Departamentos Relacionados**:

- **Engenharia de Dados**: Cria pipelines (fluxos) para coletar os dados.
- **Modelagem de Dados**: Define como os dados serão representados (visual ou em sistemas).

**Competências (Formas de Coleta)**:

- **ETL** (Extract, Transform, Load): Extrair, Transformar e Carregar dados.
- **ELT** (Extract, Load, Transform): Extrair, Carregar e Transformar dados.
    - São métodos, principalmente automatizados, para extrair dados e armazená-los na organização.

**Perguntas Essenciais na Coleta**:

- Quais dados são realmente necessários?
- Como esses dados serão coletados (métodos, ferramentas)?
- Existe o direito de coletar esses dados (legalidade, regulamentação)?

## Armazenamento de Dados

- Após a coleta, os dados precisam ser armazenados.

**Atores Envolvidos**:

- Pessoas da organização que garantem a segurança e integridade dos dados.
- Governança de dados.
- Responsabilidade compartilhada: provedores de nuvem (parcial) ou time de infraestrutura (on-premises).
- Times de modelagem, engenharia de dados e responsáveis por data lake.

**Departamentos Chave**:

- Engenharia de dados
- Modelagem de dados
- Segurança da informação
- Arquitetura de dados
    - Esses departamentos colaboram para criar um ambiente de armazenamento seguro, eficiente e confiável.

**Competências Essenciais**:

- Manter os dados armazenados seguros.
- Armazenar os dados na infraestrutura correta e confiável para o tipo de dado.

**Perguntas Importantes para o Armazenamento**:

- Qual é o tipo de dado a ser armazenado?
- Quais são os tipos possíveis de armazenamento para esse dado (ex: banco de dados relacional, não relacional, arquivo)?
- Como será a estrutura física e lógica dos dados?
- Qual é o custo de armazenamento?
- Quais são os riscos associados ao armazenamento desses dados? (Lembre-se que todos os dados apresentam riscos, alguns com maior nível de privacidade e, portanto, maior risco).
- Os dados serão facilmente buscados e acessados no futuro?

## Recuperação de Dados

A fase de recuperação é a terceira etapa do ciclo de vida dos dados, vindo após a coleta e o armazenamento.

**Exemplos de Recuperação:**

- **Cenário Simples**: Um professor acessando dados de pesquisa armazenados em seu próprio computador. A recuperação é direta, pois ele é o proprietário e os dados estão localizados em seu dispositivo.
- **Cenário Complexo (Empresarial)**: Uma equipe de marketing buscando a média de idade de clientes da marca.
    - **Desafio**: Os dados pertencem ao departamento de vendas.
    - **Ação Necessária**: Solicitar acesso à base de clientes do departamento de vendas.

**Aspectos Cruciais na Recuperação:**

- **Localização**: É fundamental saber se o dado que se deseja recuperar realmente existe.
- **Acesso/Direito**: É preciso ter permissão para acessar o dado. Se o dado não for seu, o acesso precisa ser concedido.

**Atores Envolvidos:**

- **Pessoa Interessada**: Quem precisa do dado (ex: departamento de marketing).
- **Pessoa Anuente (Owner do Dado)**: O responsável por permitir ou negar o acesso ao dado (ex: departamento de vendas).
- **Governança de Dados**: Atua como mediadora entre a pessoa interessada e a dona do dado, garantindo que o processo ocorra de forma adequada.

**Departamentos Envolvidos:**

- O departamento ao qual o dado pertence (ex: Vendas).
- O departamento que solicita o dado (ex: Marketing).

**Competências Importantes:**

- **Extração de Dados**: Habilidades técnicas para extrair dados usando ferramentas como APIs, SQL ou outras linguagens de programação.
- **Duplicação de Dados**: Capacidade de criar cópias dos dados, caso o acesso direto não seja permitido e seja necessário trabalhar com uma réplica.

**Perguntas Essenciais na Fase de Recuperação:**

- **Quais dados específicos serão recuperados?**
- **O acesso será direto ou indireto (ex: via API)?**
- **Há necessidade de replicar os dados (criar cópias)?**
- **Quem terá permissão para acessar os dados (apenas o solicitante ou toda a equipe)?**
- **O acesso será pontual (para um estudo único) ou contínuo (mensal, por exemplo)?**
- **Qual a finalidade do acesso (importante para conformidade com a LGPD)?**
- **Por quanto tempo o acesso será permitido?**
- **Quais são os riscos envolvidos na recuperação desses dados?**

A fase de recuperação é complexa e exige a consideração de muitos fatores, sendo por isso uma etapa muito relevante no ciclo de vida dos dados.

## Uso dos Dados

**Contexto**: Etapa do ciclo de vida dos dados após coleta, armazenamento e recuperação.

**Exemplo do Professor**:
- **Transformação**: Áudios transcritos para texto.
- **Análise**: Sumarização em Excel e aplicação de algoritmo para análise de sentimento (positivo/negativo) sobre comentários da garrafa.

**Atores e Departamentos Envolvidos:**

- **Atores**: Analistas de dados, cientistas de dados, analistas de negócio, pesquisadores. Qualquer pessoa que extraia valor dos dados.
- **Departamentos**: Todos que envolvem os atores mencionados.

**Competências Essenciais:**

- **Conhecimento Técnico**: Para transformar dados e torná-los usáveis.
- **Capacidade de Resposta**: Usar dados para responder a questões de negócio.
- **Temporalidade**: Habilidade de realizar as tarefas em tempo hábil (ex: relatório do mês anterior não pode ser entregue daqui a seis meses).

**Perguntas Cruciais na Fase de Uso:**

- **Qual é o objetivo?**
- **O que se espera extrair dos dados?**
- **Os dados atuais são suficientes ou é preciso combiná-los com outras bases?**
- **É ético usar os dados para o fim desejado?**

## Descarte de Dados

Após a coleta, armazenamento, recuperação e uso, os dados podem ser descartados ou reiniciar o ciclo. O descarte, embora pareça simples, envolve considerações importantes.

**Atores e Preocupações Essenciais:**

- **Privacidade de Dados**: A Lei Geral de Proteção de Dados (LGPD) exige que os dados sejam mantidos apenas pelo tempo necessário para sua finalidade. Uma vez cumprida a finalidade, o descarte é mandatório.
- **Governança de Dados**: Essencial para definir processos padronizados para o descarte definitivo e expurgo dos dados da organização.

**Departamentos Envolvidos:**

- **Infraestrutura de TI**: Responsável por saber como realizar o expurgo efetivo dos dados.
- **Área de Armazenamento**: A equipe responsável por essa área precisa ser notificada sobre o descarte, pois a responsabilidade pelos dados cessa quando eles são expurgados.

**Competência Chave:**

- **Exclusão Efetiva**: A capacidade de excluir de fato todos os dados necessários é crucial e mais complexa do que parece.

**Descarte x Lixeira:**

- Jogar dados na lixeira não garante sua exclusão definitiva, tanto em computadores pessoais quanto em ambientes organizacionais.

**Questões para Reflexão:**

- Quais dados serão excluídos: todos ou apenas um período específico?
- Como garantir que todas as cópias dos dados na instituição sejam excluídas?
- Existem processos que dependem desses dados e que podem ser impactados ou "quebrar" com a exclusão?

O descarte é uma fase delicada que exige um processo bem definido para expurgar dados, notificar usuários e liberar os "owners" da responsabilidade.

## Exemplo de ponta a ponta

**Uma Compra no Ciclo de Vida dos Dados**
Exploração de como um dado percorre as fases do ciclo de vida, utilizando o cenário de uma compra online de um tênis de corrida.

**Dados Gerados por uma Compra Online**
Uma compra online origina diferentes categorias de dados.

**Dados diretamente relacionados à transação:**

- Item adquirido
- Tamanho
- Nome do produto
- Marca
- Endereço de entrega
- Valor do frete
- Quantidade em estoque após a compra

Essas informações são fundamentais para a operação da empresa, desde a separação do produto até a entrega.

**Dados de comportamento do consumidor:**

- Intervalo de tempo entre adicionar um item ao carrinho e finalizar a compra.
- Padrões de navegação após colocar um item no carrinho (ex: visualização de outros produtos, saída da página).

Esses dados são valiosos para equipes de marketing e análise de comportamento, auxiliando na identificação de tendências e recomendações de produtos.

**O Início da Coleta de Dados**

A compra funciona como o evento que dispara a geração de dados. O ponto em que os dados são coletados representa a **etapa inicial do ciclo de vida dos dados**.

---

### Armazenamento de Dados de uma Compra de Tênis

**Formas de Armazenamento**

- **Arquivo CSV**: Formato simples para dados tabulares.
- **Banco de Dados Relacional**: Ideal para dados com estrutura bem definida, como os dados de compra.
- **Banco de Dados Não Relacional**: Usado para dados com estrutura mais flexível.

**Estrutura Proposta com Banco de Dados Relacional**

Para a compra de um tênis, são propostas três tabelas principais para organizar os dados:

**Tabela de Pedidos (PEDIDOS)**

- **Id_pedido**: Identificador único do pedido.
- **Id_item1, Id_item2, Id_item3**: Identificadores dos itens comprados.
- **endereco**: Endereço de entrega.
- **data_compra**: Data em que a compra foi realizada.
- **Id_cliente**: Identificador da pessoa cliente.

```sql
CREATE TABLE PEDIDOS (
    Id_pedido int PRIMARY KEY,
    Id_item1 int,
    Id_item2 int,
    Id_item3 int,
    endereco varchar(255),
    data_compra date,
    Id_cliente int,
);
```

**Tabela de Clientes (CLIENTES)**

- **Id_cliente**: Identificador único da pessoa cliente (ex: CPF).
- **nome**: Nome da pessoa cliente.
- **e-mail**: E-mail de contato.
- **endereco**: Endereço padrão cadastrado.
- **data_nascimento**: Data de nascimento da pessoa cliente.

```sql
CREATE TABLE CLIENTES (
    Id_cliente int PRIMARY KEY,
    nome varchar(255),
    email varchar(255),
    endereco varchar(255),
    data_nascimento date,
);
```

**Tabela de Comportamento (COMPORTAMENTO)**

- **Id_comp**: Identificador único do comportamento.
- **tempo_do_item_no_carrinho**: Duração do item no carrinho.
- **itens_abertos_antes_da_compra**: Quais itens foram visualizados antes da compra.
- **cliente_saiu_do_site_durante_navegacao**: Indica se a pessoa cliente saiu da aba.
- **cliques_para_compra**: Número de cliques até a finalização da compra.
- **Id_item**: Identificador do item relacionado ao comportamento.
- **Id_cliente**: Identificador da pessoa cliente.

```sql
CREATE TABLE COMPORTAMENTO (
    Id_comp int PRIMARY KEY,
    tempo_do_item_no_carrinho int,
    itens_abertos_antes_da_compra int,
    cliente_saiu_do_site_durante_navegacao int,
    cliques_para_compra int,
    Id_item int,
    Id_cliente int
);
```

**Conexões entre as Tabelas**: Os IDs (Id_pedido, Id_cliente, Id_item) permitem fazer ligações entre as tabelas, mantendo a integridade dos dados.

**Definição de Proprietários (Owners)**

Cada base de dados deve ter um proprietário responsável pela qualidade e acesso aos dados.

- **Time de Operações**: Proprietário das tabelas PEDIDOS e CLIENTES.
- **Equipe de Marketing**: Proprietária da tabela COMPORTAMENTO.

Essa organização conclui a etapa de armazenamento no ciclo de vida dos dados.

---

### Recuperando Dados

A recuperação de dados é uma etapa crucial no ciclo de vida dos dados, especialmente quando se trata de analisar informações de compras online.

#### Como Recuperar Dados de Compra?

Esta etapa é dividida em duas fases principais:

**Localizando e Obtendo Acesso aos Dados**

- **Catálogo de Dados**: Um repositório central de metadados que contém informações sobre os ativos de dados da empresa. É a primeira ferramenta para localizar bases de dados.
- **Exemplo**: Para um estudo de comportamento de compras, busca-se por bases de dados de "clientes" e "comportamento de compras" no catálogo.
- **Identificação de Responsáveis**: Após localizar as bases, é fundamental identificar o owner (proprietário) dos dados, pois somente ele pode conceder acesso.
- **Conformidade com a LGPD**: Para dados pessoais (como dados de compra e clientes), é necessário definir a finalidade do acesso. No exemplo, a finalidade é "realizar um estudo do comportamento dos clientes".

**Obtendo a Posse dos Dados**

- **Solicitação de Acesso**: Após a anuência do owner, o acesso é solicitado e liberado.
- **Extração dos Dados**: Com a permissão concedida, os dados podem ser extraídos.
- **Métodos de Extração**:
    - Via API.
    - Duplicar os dados e baixar uma planilha .csv.
    - **Exemplo**: Download de planilhas .csv com informações de compra e comportamento de compra, após a anuência do owner.

---

### Usando os Dados da Compra: Entendendo o Perfil de Compra por Faixa Etária

**Objetivo Principal**: Entender o perfil de compra de pessoas entre 20 e 40 anos, utilizando duas bases de dados: comportamento de compra e clientes.

**Como Usar os Dados de Comportamento de Compras?**

**Seleção e Transformação de Dados**

- **Junção de Tabelas**: Unir a base de COMPORTAMENTO com a base de CLIENTES usando uma coluna em comum, como o Id_cliente.
- **Seleção de Colunas**: Focar em informações relevantes, como a quantidade de cliques (do carrinho à finalização da compra) e a idade.
- **Transformação**: A idade não está diretamente disponível, mas pode ser extraída da data_nascimento através de um cálculo.
- **Processo**: Selecionar colunas, criar cálculos (como a idade), unir as duas tabelas em uma única base para o estudo.

**Extração de Informações das Tabelas**

- Após as transformações, o foco é comparar a quantidade de cliques com a idade.
- As informações podem ser visualizadas em ferramentas de BI, como o Power BI, para criar relatórios interativos.

**Extraindo Valor das Informações**

- A análise revelou que o comportamento de compras (quantidade de cliques) depende da idade, sendo maior em pessoas mais velhas.
- **Aplicação Prática**: Com essa informação, a empresa pode moldar o site e as estratégias de vendas para otimizar o processo de compra, buscando reduzir o número de cliques após o item ser adicionado ao carrinho.
- **O objetivo é fazer com que as pessoas comprem mais rapidamente, gerando valor para a empresa.**

---

### Descartando os Dados

O descarte de dados é a etapa final do ciclo de vida dos dados, ocorrendo após o uso e análise. Existem duas possibilidades para os dados após o uso:

- **Retornar o dado**: Manter o dado armazenado por mais tempo.
- **Descartar o dado**: Remover o dado permanentemente.

**Motivos para o descarte**:

- Os dados não fazem mais sentido para a organização.
- Regulações exigem o descarte (como a LGPD para dados pessoa   is).
- Os dados não são mais usados, e o armazenamento gera custos.

**Descarte de dados de comportamento de compra**:

- Dados de comportamento de compra são dados pessoais e, pela LGPD, só devem existir enquanto sua finalidade é cumprida.
- Se a finalidade foi cumprida e os dados não são mais relevantes (por exemplo, o site mudou e os dados antigos não refletem o comportamento atual), eles devem ser descartados.

**Processo de descarte**:

- Conversar com o time de marketing: Como os dados de comportamento são responsabilidade do marketing, é crucial verificar se eles ou outras áreas ainda fazem uso desses dados para relatórios ou ferramentas de BI.
- Fase de expurgo: Se não houver dependências, os dados podem ser excluídos. Caso contrário, é preciso identificar se as ferramentas que os utilizam ainda são relevantes ou se podem usar outra fonte de dados.
- Excluir os dados: Realizar a exclusão dos dados, garantindo a conformidade com a LGPD e sem quebrar processos internos da organização.

**Ciclo de vida completo**:

- O descarte conclui o ciclo de vida dos dados, que inclui coleta, armazenamento, recuperação, uso e, finalmente, o descarte.

**Processo de descarte**:

- Conversar com o time de marketing: Como os dados de comportamento são responsabilidade do marketing, é crucial verificar se eles ou outras áreas ainda fazem uso desses dados para relatórios ou ferramentas de BI.
- Fase de expurgo: Se não houver dependências, os dados podem ser excluídos. Caso contrário, é preciso identificar se as ferramentas que os utilizam ainda são relevantes ou se podem usar outra fonte de dados.
- Excluir os dados: Realizar a exclusão dos dados, garantindo a conformidade com a LGPD e sem quebrar processos internos da organização.

O descarte conclui o ciclo de vida dos dados, que inclui coleta, armazenamento, recuperação, uso e, finalmente, o descarte.

## Benefícios do ciclo de vida

**Consciência e Interligação**: Ações individuais no ciclo de vida dos dados estão interligadas a diversas etapas, departamentos e pessoas. O objetivo é sempre gerar valor a partir dos dados.

**Melhoria de Processos**: A qualidade dos dados é uma preocupação constante em todas as etapas do ciclo de vida, não se restringindo a uma única fase.

**Qualidade na Coleta**: Verificações iniciais de qualidade podem ser realizadas durante a coleta. Exemplos: Identificar valores nulos. Detectar valores fora do padrão esperado. Gerar gatilhos para interromper a coleta e corrigir problemas antes de prosseguir.

**Qualidade no Armazenamento**: Ao mover dados para diferentes tecnologias ou bancos de dados, é crucial verificar sua qualidade.

**Qualidade no Uso dos Dados**: Usuários dos dados são atores importantes na detecção de problemas de qualidade, especialmente aqueles mais específicos ao negócio. 
**Exemplo**: Dados de comportamento de compra indicando 10 mil cliques entre adicionar ao carrinho e finalizar a compra podem ser um sinal de baixa qualidade, pois não correspondem à ordem de grandeza esperada. Problemas de qualidade devem ser reportados à governança de dados ou ao proprietário dos dados.

> A qualidade é trabalhada em diversas etapas do ciclo de vida, o que contribui para a melhoria contínua dos processos de gestão de dados.

---

### Controle de Custos com o Ciclo de Vida dos Dados

O ciclo de vida dos dados não só melhora a qualidade dos dados, mas também é crucial para o controle de custos.

### Ineficiência no Armazenamento de Dados

**Dados Inativos**: Muitos ativos de dados podem estar inativos, sem acesso ou atualização por longos períodos (ex: dados de 3-4 anos atrás, sem atualização há 2-3 anos).
**Custo de Armazenamento**: Manter dados que não são mais consumidos ou que não trazem valor para a organização gera um custo desnecessário, mesmo que o armazenamento seja considerado barato. Isso representa uma ineficiência.

---

### O Papel do Descarte e Gerenciamento de Armazenamento

**Etapa de Descarte**: A etapa de descarte no ciclo de vida dos dados é fundamental para aumentar a eficiência e reduzir custos.

**Otimização do Armazenamento**:

- **Modificação do Tipo de Armazenamento**: Dados armazenados na nuvem com acesso imediato são mais caros. Para reduzir custos, é possível mover esses dados para um armazenamento com maior latência ou tempo de recuperação.
- **Descarte de Dados Sem Uso**: Dados que não são mais atualizados ou utilizados são bons candidatos ao descarte.

### Impacto a Longo Prazo

- **Em empresas com muitos anos de mercado**, a constante criação de novas bases de dados pode levar ao acúmulo de bases antigas e não utilizadas.
- **Essas bases antigas** podem gerar custos significativos, tornando-se um problema de eficiência para o negócio.
- **Gerenciar os custos de forma eficiente** é um benefício importante do uso da metodologia do ciclo de vida dos dados para trabalhar e gerir os ativos de uma instituição.

---

### Melhor Usabilidade dos Dados

#### Benefícios do Ciclo de Vida dos Dados

- **Melhoria dos processos**: Foco na qualidade.
- **Eficiência nos custos**: Economia em diversas etapas.
- **Usabilidade**: Terceiro benefício crucial.

#### Redução de tempo na preparação de dados

- **Cientistas de dados** gastam menos tempo corrigindo problemas de qualidade.
- **Qualidade já abordada** em etapas anteriores do ciclo de vida.
- **Dados chegam** com nível de qualidade maior.

#### Facilidade de encontrar dados

- **Descrições dos dados**: Claras e informativas.
- **Tags**: Palavras-chave para categorizar e localizar dados.
- **Geração na coleta**: Automática, buscando palavras frequentes.
- **Propostas por usuários**: Na fase de uso, por quem já conhece a base.
- **Exemplo de tags**: Para "sapatilhas de atletismo", poderíamos ter: `Equipamentos esportivos`, `Equipamentos de atletismo`, `Equipamentos específicos`.

### Ganhos Finais

- **Menos tempo gasto** para encontrar os dados.
- **Dados com nível de qualidade** que permite extrair valor rapidamente.
- **Combinação de qualidade** e facilidade de localização melhora a usabilidade geral. 

---

### Conformidade e Accountability

**Conexão com a Governança de Dados**

- **Objetivo principal da governança**: Atingir a conformidade.
- **Conformidade**: Seguir legislações (ex: LGPD para dados pessoais) ou regulamentações específicas de setores (ex: Banco Central para bancos).
- **Papel do ciclo de vida dos dados**: Ajuda na conformidade ao estabelecer etapas e responsabilidades claras.

#### Segurança dos Dados e a Fase de Recuperação

- **Fase crucial**: Recuperação.
- **Responsável**: Owner da base de dados.
- **Função do owner**: Garantir ou negar o acesso de terceiros à base.
- **Exemplo de segurança**:
    - Hacker invade o sistema, mas não tem acesso direto a uma base com dados sensíveis (endereço, CPF, e-mail).
    - Hacker precisa pedir acesso ao owner.
    - Owner nega o acesso por finalidade suspeita e usuário não reconhecido.
    - **Resultado**: Evita-se um vazamento de dados.

#### Accountability: Entendendo e Mitigando Erros

- **Definição**: Entender por que um erro aconteceu, como mitigá-lo e como evitar que se repita.
- **Não é sobre apontar culpados**: O foco é na melhoria do processo.
- **Rastreabilidade**: O histórico de anuência de dados permite identificar a brecha.
- **Exemplo de Accountability (se o acesso fosse concedido indevidamente)**:
    - Identificar a brecha que permitiu o acesso.
    - Ações possíveis:
        - Treinamento melhor para o responsável.
        - Substituição do responsável.
        - Aumento das medidas de segurança para acesso à base.

### Benefícios Finais

- **O ciclo de vida dos dados** é uma ferramenta guia na gestão de dados.
- **Garante a conformidade** e permite a **Accountability**.

## Objetivo do Ciclo de Vida dos Dados: Do Big Data ao Good/Smart Data

O principal objetivo do ciclo de vida dos dados é transformar o uso de dados nas organizações, saindo de um estado de grande volume e variedade (**Big Data**) para um estado de dados de qualidade e inteligentes (**Good** ou **Smart Data**).

**Diferença entre Big Data e Good Data**

- **Cenário sem o ciclo de vida (Big Data)**:
    - Dificuldade para localizar os dados, exigindo conversas com várias pessoas e setores.
    - Necessidade de conferir diversas bases para encontrar a correta.
    - Gasto de tempo significativo para corrigir problemas de qualidade nos dados encontrados.
    - Etapas: Localizar dados -> Olhar base a base -> Corrigir problemas.
    
- **Cenário com o ciclo de vida (Good/Smart Data)**:
    - Facilidade para encontrar os dados, utilizando recursos como tags.
    - Garantia de que a base de dados possui um nível de qualidade, pois foi tratada desde a coleta e armazenamento.
    - Etapas: Localizar dados com facilidade (tags) -> Base com nível de qualidade.
    
**Impacto do Good Data**

O Good Data torna o processo de uso e extração de valor dos dados muito mais rápido e eficiente. Ele transforma um ambiente onde os dados são desorganizados e abundantes em um ambiente onde são facilmente encontrados e já possuem garantias de qualidade. A palavra-chave é eficiência na extração de valor.

Alcançar o Good Data exige investimento em pessoas qualificadas, ferramentas e, principalmente, uma mudança cultural que envolve todos na organização, desde quem coleta e armazena até os proprietários e usuários dos dados.

**Características do Good ou Smart Data**

Para saber se o estado de Good Data foi alcançado, observe estas características:

- **Qualidade dos dados**: Fundamental para um uso eficiente e rápido.
- **Ativos facilmente encontrados**: Ligado à qualidade dos metadados (descrição da base, tags, etc.).
- **Dados facilmente acessados por quem necessita**: Facilidade para encontrar o proprietário e solicitar acesso, garantindo que o acesso seja concedido para finalidades corretas.

- **Facilidade na Interpretação**: Dados devem ser fáceis de entender.
  - **Ferramentas e Atores**:
    - **Profiles (perfis estatísticos)**: Ajudam a entender o comportamento e tipo de dados e colunas.
    - **Data Stewards (guardiões de dados)**: Pessoas com conhecimento profundo das bases, auxiliam na interpretação técnica ou de negócio.
    - **Pessoas usuárias de dados**: Colegas que já trabalham com a base podem validar usos e interpretações.
- **Interoperabilidade**: Dados devem ser facilmente combináveis entre diferentes bases.
  - **Exemplo**: Bases de comportamento de compra, clientes e vendas.
    - **Base de comportamento de compra**: ID de comportamento, ID do cliente, ID da compra.
    - **Esses IDs únicos** permitem conectar as bases.
  - **Facilita a comparação de dados de forma eficiente**.
  - **Requer**: Boa qualidade de dados e metadados, além de padronização da arquitetura (nomes de IDs, referências, modelagem).

**As Cinco Características do Good/Smart Data**

- **Qualidade dos dados**: Precisos e refletem a realidade.
- **Facilmente encontrados**: Não é difícil localizar a base necessária.
- **Facilmente acessados**: É possível identificar responsáveis e solicitar acesso.
- **Facilmente interpretáveis**: Compreensão clara dos dados, com apoio de ferramentas e pessoas.
- **Interoperabilidade**: Capacidade de juntar diferentes bases de forma fácil e eficiente, usando padrões de identificadores.

**Objetivo**: Alcançar o estado de Good Data, transformando Big Data em dados mais próximos do negócio e da geração de valor.

---