# Metadados

> **O que são Metadados?**

- **Definição**: Metadados são informações que descrevem e fornecem contexto sobre outros dados. São "dados sobre os dados".
- **Função**: Ajudam a interpretar, organizar e navegar de forma mais eficiente em um conjunto de dados.
Importância dos Metadados
- **Contexto**: Sem metadados, é difícil entender o que os dados representam.

**Exemplo**: Um conjunto de dados sem nomes de colunas ou ordem clara é complexo de trabalhar, pois falta o contexto que os metadados fornecem.

- **Organização**: Permitem categorizar e relacionar dados.

**Exemplos do Dia a Dia**

**Ingresso de Cinema:**

- **Dado**: O filme que você vai assistir.
- **Metadados**: Tipo da sessão (2D, 3D), poltrona, sala, data e horário. Essas informações ajudam a encontrar seu lugar e entender a sessão.

**Livro:**
- **Dado**: O conteúdo do livro (o texto).
- **Metadados**: Título, subtítulo, autor, editora, ano de publicação, local de publicação, categoria (ficção científica, romance). Essas informações ajudam a entender o livr o e a organizá-lo em uma biblioteca.

Metadados estão presentes em boa parte do que consumimos e são cruciais para a compreensão e interação com os dados.

---------------

## Tipos de Metadados por Função

- **Metadados Administrativos**: Auxiliam na administração do recurso de informação. Ligados à aquisição da informação (ex: data de compra de um livro pela biblioteca) e direitos de reprodução.

- **Metadados Descritivos**: Descrevem os dados. Exemplos: gênero de um livro (romance, poesia), título.

- **Metadados de Preservação**: Ajudam a preservar a informação da melhor forma ou pelo máximo de tempo.
    - **Exemplos para um livro digitalizado**: data da digitalização, tipo de scanner usado, cuidados com a cópia física.

- **Metadados Técnicos Comuns em dados digitais**, descrevem a estrutura.
    - **Exemplos em uma tabela**: tipo do dado (string, número inteiro, ponto flutuante, categórico), banco de dados a que pertence. Essenciais para entender como lidar com os dados do ponto de vista da tecnologia da informação.

- **Metadados de Uso**: Informações sobre quem acessou ou interagiu com o dado.
    - **Exemplos**: lista de pessoas que leram um livro em uma biblioteca, nomes de pessoas com acesso a um dado digital, quem interagiu com um dado via query em um database.

- **Metadados de Negócio**: Possivelmente os mais importantes. Ajudam a entender as regras de negócio nas quais o dado está inserido.
    - **Exemplo**: saber se dados de livros são de vendas de uma empresa ou de estoque de um sebo virtual, explicando o "porquê" do armazenamento.

-------------------

## Dicionário de dados

Mesmo com nomes de colunas e alguns valores, a compreensão completa dos dados ainda pode ser limitada sem informações adicionais.

Utilizando um dicionário de dados
O dicionário de dados fornece descrições detalhadas para cada coluna, facilitando a interpretação.

### Importância do dicionário de dados

O dicionário de dados é um documento crucial que descreve colunas, tipos de dados e regras, tornando os dados desconhecidos mais fáceis de trabalhar e interpretar. Ele pode estar embutido nos dados ou ser um documento separado.

### Criando um Dicionário de Dados

**Objetivo Principal**
- Tornar o conhecimento sobre um conjunto de dados acessível a outros usuários, criando novos metadados para facilitar a compreensão.

> Passos para Criar o Dicionário de Dados
1. **Criando o Dataframe Vazio**
- Inicia-se com a criação de um dataframe vazio que servirá como o dicionário.
`dicionario = pd.DataFrame()`

2. **Adicionando Nomes das Colunas**
- Preenche-se o dicionário com os nomes das colunas do dataset original.
```py
dicionario['coluna'] = dados.columns
```
Resultado:
|   | coluna   |
|---|----------|
| 0 | Season   |
| 1 | DateTime |
| 2 | Home     |
| 3 | Away     |
| 4 | HG       |
| 5 | AG       |
| 6 | Res      |

3. **Adicionando Descrições das Colunas**
- Define-se uma lista de descrições para cada coluna e as adiciona ao dicionário.
```py
descricoes = [
    'Temporada na qual a partida foi disputada',
    'Data e hora na qual a partida foi disputada',
    'Time da casa',
    'Time visitante',
    'Quantidade de gols marcados pelo time da casa em tempo regular',
    'Quantidade de gols marcados pelo time visitante em tempo regular',
    'Resultado da partida'
]
dicionario['descricoes'] = descricoes
```

4. **Analisando Valores Possíveis**
- Realiza-se uma análise rápida para identificar os valores permitidos para cada coluna.

- **Season**: `dados.Season.value_counts()` revela dados de 2012 a 2022.
- **DateTime**: Intervalo de 2012 a 2022.
- **Home/Away**: `dados.Home.unique()` e `dados.Away.unique()` listam os times.
- **HG/AG**: `dados.AG.max()` e `dados.HG.max()` mostram que o máximo de gols é 8 (intervalo 0-8).
- **Res**: `dados.Res.unique()` mostra 'A' (visitante ganha), 'H' (casa ganha), 'D' (empate).

5. **Incorporando Valores Possíveis ao Dicionário**
- Cria-se uma nova coluna valores_possiveis no dicionário com as informações analisadas.
```py
dicionario['valores_possiveis'] = [
    "2012-2022",
    "2012-2022",
    """'Gamba Osaka', 'Sanfrecce Hiroshima', 'Nagoya Grampus', 'Sagan Tosu', 'Hokkaido Consadole Sapporo', 'Vegalta Sendai', 'Kawasaki Frontale', 'Omiya Ardija', 'Kashiwa Reysol', 'Albirex Niigata', 'Cerezo Osaka', 'Kashima Antlers', 'Urawa Reds', 'Yokohama F. Marinos', 'Shimizu S-Pulse', 'Iwata', 'Vissel Kobe', 'FC Tokyo', 'Oita Trinita', 'Kofu', 'Shonan Bellmare', 'Tokushima', Yamaga', 'Montedio Yamagata', 'Avispa Fukuoka', 'V-Varen Nagasaki', 'Yokohama FC', 'Kyoto'""",
    """'Vissel Kobe', 'Urawa Reds', 'Shimizu S-Pulse', 'Cerezo Osaka', 'Iwata', 'Kashima Antlers', 'Albirex Niigata', 'FC Tokyo', 'Yokohama F. Marinos', 'Omiya Ardija', 'Gamba Osaka', 'Kawasaki Frontale', 'Kashiwa Reysol', 'Vegalta Sendai', 'Sanfrecce Hiroshima', 'Sagan Tosu', 'Hokkaido Consadole Sapporo', 'Nagoya Grampus', 'Kofu', 'Shonan Bellmare', 'Oita Trinita', 'Tokushima', 'Yamaga', 'Montedio Yamagata', 'Avispa Fukuoka', 'V-Varen Nagasaki', 'Verdy', 'Yokohama FC', 'Kyoto'""",
    "0-8",
    "0-8",
    "A: time visitante ganha, H: time da casa ganha, D: empate"
]
```

Resultado Final do Dicionário:
| | coluna | descricoes | valores_possiveis |
|---|---|---|---|
| 0 | Season | Temporada na qual a partida foi disputada | 2012-2022 |
| 1 | DateTime | Data e hora na qual a partida foi disputada | 2012-2022 |
| 2 | Home | Time da casa | [Lista de times] |
| 3 | Away | Time visitante | [Lista de times] |
| 4 | HG | Quantidade de gols marcados pelo time da casa em tempo regular | 0-8 |
| 5 | AG | Quantidade de gols marcados pelo time visitante em tempo regular | 0-8 |
| 6 | Res | Resultado da partida | A: time visitante ganha, H: time da casa ganha, D: empate |

---------------

### Dicionários de Dados: Anotações Rápidas

**O que são?**

- Repositório centralizado de metadados (dados sobre os dados).
- Descrevem elementos de dados em detalhes.

**Conteúdo Típico:**

- **Nome do Campo**: ID_Cliente
- **Tipo de Dado**: INTEGER
- **Formato**: NNNNN (5 dígitos numéricos)
- **Descrição**: Identificador único para cada cliente.
- **Origem**: Sistema CRM.
- **Regras** de Validação: Não nulo, valor > 0.
- **Relações**: Chave primária na tabela Clientes, chave estrangeira na tabela Pedidos.
- **Contexto de Uso**: Usado para rastrear pedidos e histórico de compras.

**Importância Fundamental:**

1. Integridade e Qualidade dos Dados:
    - Garante que os dados sejam consistentes e confiáveis.
    - Ajuda a identificar e corrigir erros, redundâncias.

2. Comunicação Clara:
    - Cria uma linguagem comum entre equipes (negócio, TI, analistas).
    - Evita ambiguidades e mal-entendidos.

3. Governança de Dados:
    - Base para políticas e procedimentos de gestão de dados.
    - Essencial para conformidade regulatória (ex: LGPD, HIPAA).

4. Suporte ao Desenvolvimento de Sistemas:
    - Guia para desenvolvedores na criação e estruturação de bancos de dados.
    - Facilita a manutenção e evolução de sistemas.

## Acessando Metadados de Imagens

**Dados Não Estruturados**: Diferente dos dados estruturados, que possuem uma estrutura rígida, dados não estruturados (como imagens e vídeos) não têm uma estrutura fixa.

**Preparação para Acesso:**

- Instalação da biblioteca Pillow: `pip install Pillow`
- Importação de funções necessárias:
```py
from PIL import Image
from PIL.ExifTags import TAGS
```

**Carregando a Imagem:**

Criação de um objeto de imagem, passando o caminho do arquivo:
```py
foto = Image.open('/content/20240314_225158.jpg')
```

**Acessando Metadados Básicos**:
```py
Caminho do arquivo: foto.filename
Exemplo: '/content/20240314_225158.jpg'

Tamanho da imagem (largura, altura): foto.size
Exemplo: (4000, 3000)

Altura da imagem: foto.height
Exemplo: 3000

Largura da imagem: foto.width
Exemplo: 4000

Formato da imagem: foto.format
Exemplo: 'JPEG'

Modo de cores: foto.mode
Exemplo: 'RGB'
```

### Aprofundando na Extração de Metadados de Imagens

> Contexto: Extração de metadados de imagens (dados não estruturados), incluindo informações sobre o dispositivo de captura.

**Acessando Metadados:**

```py
# Obtenção dos metadados da imagem:
metadados = foto.getexif()

# Iteração e exibição dos metadados conhecidos:
for tag_id, tag_name in TAGS.items():
    if tag_id in metadados:
        print(tag_name, metadados[tag_id])

```
**Exemplos de Metadados Extraídos**:
```shell
ImageWidth 4000
ImageLength 3000
Make samsung
Model Galaxy S23 Ultra
DateTime 2024:03:14 22:51:57
Outros: Orientação, Resolução (X e Y), Unidades de Resolução, Software.
```

**Importância dos Metadados:**

Fornecem contexto e informações descritivas para dados não estruturados.
Essenciais para a compreensão de características técnicas e o contexto de captura (dispositivo, data/hora).

------------------

### Acessando Metadados de Vídeos

- **Ferramenta**: Utilização do site MW Metadata (https://mattw.io/youtube-metadata/) para extrair metadados.
- **Processo**: Copiar o link do vídeo (ex: https://www.youtube.com/watch?v=-CbFz9cvWhE) e colar no site, clicando em "Submit".

**Exploração dos Metadados:**

- **Informações visuais**: Thumbnail, título, canal, data e hora de publicação, tempo desde a publicação.
- **Detalhes do conteúdo**: Tags associadas, categoria, idioma (identificado pelo YouTube).
- **Identificação**: ID único do vídeo.
- **Estatísticas**: Visualizações, curtidas, favoritos, comentários.
- **Outros dados**: Geolocalização, status do vídeo (público/privado), adequação para crianças.

**Integração no Notebook:**

- **Formato**: Metadados brutos da seção "Snippet" do site, apresentados em formato semelhante a JSON.
- **Estrutura**: Dicionário de dados com informações estruturadas.
Importância dos Metadados:

- **Organização**: O YouTube utiliza dicionários de dados para cada vídeo, contendo metadados sobre descrição, aspectos técnicos (resolução, thumbnail), tags e contexto de negócios.
- **Extração avançada**: Detalhes técnicos extraídos por inteligência artificial ou aprendizado de máquina (ex: identificação automática da linguagem).
- **Dados não estruturados**: Essenciais para organizar e estruturar informações de vídeos, facilitando a compreensão e interpretação.

>Conclusão:
A prática de analisar metadados de vídeos do YouTube, combinada com o conhecimento do conteúdo, proporciona uma compreensão mais completa e detalhada.
A integração entre conhecimento de negócios e metadados bem estruturados permite uma compreensão abrangente do conteúdo.

## Acessando o Schema do Dataset

### Metadados em Dados Estruturados: Arquivos Parquet

- **Objetivo**: Compreender metadados em dados estruturados para identificação e compreensão eficientes.
- **Foco**: Metadados de arquivos `.parquet`.

#### Trabalhando com PyArrow

Importação da biblioteca:
`import pyarrow.parquet as pq`

Leitura dos dados:
`dados = pq.read_table('/content/results.parquet')`

- `dados` armazena o conteúdo do arquivo `results.parquet`.

#### Schema do Arquivo Parquet

- **Comportamento**: Arquivos `.parquet` contêm metadados do esquema, colunas e partições.
- **Armazenamento de metadados**: O `schema` é a forma mais simples de armazenamento, com informações técnicas da base.
```py
# Criação do objeto schema:
schema = dados.schema

# Acesso ao schema:
schema

# Retorno (exemplo):
Season: string
DateTime: timestamp[us, tz=GMT]
Home: string
Away: string
HG: int32
AG: int32
Res: string
## Informações: Coluna e tipo de dado (ex: Season: string, HG: int32).

# Metadados do Schema

# Acesso aos metadados do schema:
print(schema.metadata)

# Retorno: None (indica que este esquema específico não possui metadados adicionais, mas poderia ter).
```

#### Schemas: Organização e Gerenciamento de Dados

> Schemas são estruturas fundamentais para definir a organização dos dados, com aplicações distintas em bancos de dados e arquivos Parquet.

1. **Schemas em Bancos de Dados**
   1. **Função**: Estrutura que define a organização dos dados em tabelas.
   2. **Componentes**:
      1. Tipos de dados (ex: INT, VARCHAR(255), DATE).
      2. Relações entre tabelas (chaves primárias e estrangeiras).
      3. Restrições (ex: NOT NULL, UNIQUE).
   3. **Propósito**:
      1. Plano ou modelo para armazenamento e estrutura de dados.
      2. Garantia de integridade e consistência dos dados.
      3. Eficiência em consultas transacionais.
      4. Base para normalização (eliminação de redundâncias).
```sql
-- Exemplo (SQL - Criação de Tabela):
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    DataNascimento DATE
);
-- Este schema define a estrutura da tabela Clientes.
```

2. **Schemas em Arquivos Parquet**
   1. **Função**: Define a estrutura dos dados armazenados em formato colunar.
   2. **Propósito**:
      1. Otimização para armazenamento e consulta de grandes volumes de dados (Big Data).
      2. Compressão eficiente de dados.
      3. Leitura seletiva de colunas (melhora o desempenho).
      4. Flexibilidade para evolução dos dados (adições/modificações sem reescrita completa).

```py
# Exemplo (PySpark - Definição de Schema)
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("nome", StringType(), True),
    StructField("cidade", StringType(), True)
])
# Este schema seria aplicado ao ler ou escrever um arquivo Parquet.
# Este schema define a estrutura de dados para um arquivo Parquet, especificando colunas e seus tipos.
```

3. **Principais Diferenças**

| Característica | Schemas de Bancos de Dados | Schemas de Arquivos Parquet |
| :-------------------- | :------------------------------------------------------- | :--------------------------------------------------------- |
| Contexto de Uso | Dados relacionais, consultas transacionais. | Análise de dados em larga escala (Big Data). |
| Foco Principal | Integridade, consistência, normalização. | Performance de leitura, economia de armazenamento. |
| Formato | Geralmente tabular (linhas e colunas). | Colunar (dados de uma coluna armazenados juntos). |
| Flexibilidade | Mais rígidos, planejamento detalhado. | Mais flexíveis, suportam evolução de dados. |
| Complexidade | Frequentemente mais complexos para requisitos de integridade. | Mais focados na eficiência de armazenamento e leitura. |

### Metadados em Arquivos Parquet: Alteração e Persistência

Trabalhando com o atributo de metadados do schema: O arquivo `.parquet` permite atribuir metadados diretamente, sem a necessidade de um dataset separado. É possível adicionar metadados no schema, colunas e partições.

#### Criando novos metadados: Os metadados são criados como um dicionário Python.

```py
# Exemplo de criação de metadados

metadados_parquet = { 'autor':'Pedro', 'origem': 'Dados de resultados da liga japonesa de futebol masculino', 'data_de_ingestao': '04/05/2024', 'palavras_chave': 'Esportes, Futebol, Japão, Liga Japonesa, Resultados por temporada', 'descricao': 'Esse conjunto de dados informa sobre resultados das partidas da liga japonesa de futebol masculino entre os anos de 2012 a 2022.' }

# Observação importante: As chaves do dicionário (como 'descricao' e 'data_de_ingestao') devem ser mantidas sem acentos, pois o arquivo .parquet não os processa corretamente.

# Substituindo os metadados existentes: A função replace_schema_metadata() é utilizada para aplicar os novos metadados ao schema.

# Exemplo de substituição:
dados = dados.replace_schema_metadata(metadados_parquet)

# Verificando as alterações: Após a substituição, os metadados podem ser verificados acessando o atributo metadata do schema.

# Exemplo de verificação: dados.schema.metadata
# Retorno esperado (exemplo):
{b'autor': b'Pedro', b'origem': b'Dados de resultados da liga japonesa de futebol masculino', b'data_de_ingestao': b'04/05/2024', b'palavras_chave': b'Esportes, Futebol, Jap\xc3\xa3o, Liga Japonesa, Resultados por temporada', b'descricao': b'Esse conjunto de dados informa sobre resultados das partidas da liga japonesa de futebol masculino entre os anos de 2012 a 2022.'}

# Sobrescrevendo as alterações no arquivo .parquet: Para que as alterações nos metadados sejam persistidas no arquivo, é necessário sobrescrevê-lo usando a função pq.write_table().

# Exemplo de sobrescrita:
pq.write_table(dados, 'novos_dados_liga_japonesa.parquet')

# Isso cria um novo arquivo .parquet com os metadados atualizados.
```

## Gestão de Metadados e Repositório Centralizado

- **Desafio da Gestão de Metadados**: Ao lidar com múltiplas bases de dados, a gestão de metadados pode ser complexa. Dicionários de dados separados ou metadados embutidos (como em arquivos Parquet) podem gerar o dobro de arquivos ou não ser aplicáveis a todos os formatos.
- **Solução Proposta**: Criar um único repositório centralizado para todos os metadados das bases de dados. Isso simplifica a gestão e permite que pesquisadores encontrem e interpretem dados de forma eficiente.

### Trabalhando com Dados da ONU

- **Contexto**: Introdução a uma nova base de dados sobre refugiados da ONU, utilizada para entender a aplicação prática da gestão de metadados.

**Importação dos Dados**: O arquivo dataset.txt é importado usando a biblioteca pandas.
```py
import pandas as pd
dados_onu = pd.read_csv('/content/dataset.txt', sep=';')
```

**Exploração Inicial dos Dados:**
- Visualização das primeiras linhas para compreender a estrutura e o contexto das informações.
```py
dados_onu.head()
```

**Exemplo de resultado:**

| Country or territory of asylum or residence | Country or territory of origin| Year| Refugees*| Refugees assisted by UNHCR| Total refugees and people in refugee-like situations**| Total refugees and people in refugee-like situations assisted by UNHCR|
| -------- | -------- | -------- | ----- | --|---|--|
| Afghanistan | Iran (Islamic Rep. of) | 2021.0 |38.0 |38.0 | 38.0 | 38.0 |
| Afghanistan |Pakistan | 2021.0 |72188.0 |123.0 | 72188.0 | 123.0 | | Albania |China | 2021.0 |5.0 |0.0 |5.0 | 0.0 | | Albania |Iraq | 2021.0 |5.0 |0.0 |5.0 | 0.0 |

------------------------

#### Entendimento das Colunas:

- **Country or territory of asylum or residence:** País de asilo ou residência.
- **Country or territory of origin**: País de origem.
- **Year**: Ano da coleta do dado.
- **Refugees***: Quantidade de pessoas refugiadas (com asterisco indicando definição da Convenção das Nações Unidas de 1951 e Protocolo de 1967, e Estatuto do ACNUR).
- **Refugees assisted by UNHCR**: Refugiados assistidos pelo ACNUR.
- **Total refugees and people in refugee-like situations**: Total de refugiados e pessoas em situação de refúgio (com asterisco indicando definição da categoria).
- **Total refugees and people in refugee-like situations assisted by UNHCR**: Total de refugiados e pessoas em situação de refúgio assistidos pelo ACNUR.

**Tipos de Dados Observados**: Colunas com informações de países (texto), ano (numérico), e quantidade de pessoas (números inteiros).

### Repositório Central de Metadados

- Criação de um DataFrame para o repositório: `metadados = pd.DataFrame()`

- Adição de metadados para a base "Dados sobre pessoas refugiadas":
    - nome_fisico: 'dataset.txt' (nome do arquivo)

    - nome_logico: 'Dados sobre pessoas refugiadas' (nome mais amigável)

    - descricao: 'Essa base possui informações sobre refugiados e pessoas em situação de refúgio coletadas pelo ACNUR, órgão da ONU especializado no tema'

    - palavras_chave: 'Relações Internacionais, ONU, Refugiados, Direitos Humanos'

```py
Exemplo de código:
metadados['nome_fisico'] = ['dataset.txt']
metadados['nome_logico'] = ['Dados sobre pessoas refugiadas']
metadados['descricao'] = ['Essa base possui informações sobre refugiados e pessoas em situação de refúgio coletadas pelo ACNUR, órgão da ONU especializado no tema']
metadados['palavras_chave'] = ['Relações Internacionais, ONU, Refugiados, Direitos Humanos']
```
Resultado:
| nome_fisico | nome_logico | descricao | palavras_chave |
|---|---|---|---|
| dataset.txt | Dados sobre pessoas refugiadas | Essa base possui informações sobre refugiados e pessoas em situação de refúgio coletadas pelo ACNUR, órgão da ONU especializado no tema | Relações Internacionais, ONU, Refugiados, Direitos Humanos |

> Objetivo do Repositório Central: Ter um único local para pesquisar e encontrar informações sobre diversas bases de dados disponíveis. Garantir que pesquisadores possam encontrar dados ou solicitar a adição de novas bases. Centralizar o acesso à informação sobre as bases de dados do laboratório.

## Metodologias de Gestão de Metadados

**Repositório Central de Metadados**

- Um único lugar para pesquisadores buscarem metadados de diversas bases.
- A eficácia depende da organização, suas competências, capacidades e objetivos.

**Metadados Ativos**

- **Proposta**: metadados presentes em todos os lugares onde os dados são importantes.
- **Objetivo**: resolver a ineficiência de metadados em locais de difícil acesso.
- **Princípio**: "Metadados devem ir em todos os lugares em que uma base for importante."

### Comparativo: Metadados Passivos vs. Metadados Ativos

**Metadados Passivos**

- Ficam escondidos em catálogos de dados e repositórios centrais.
- Foco em metadados técnicos e descritivos.

**Metadados Ativos**

- Acompanham os dados onde quer que sejam utilizados.
Foco em metadados de negócio, para auxiliar usuários na navegação e compreensão do contexto.

#### **Exemplos das Metodologias**

**Metadados Passivos**

- Para acessar metadados de uma base, é preciso primeiro acessar o computador onde estão armazenados e depois comparar com os dados no servidor.

**Metadados Ativos**

- Metadados já estão disponíveis diretamente dentro da ferramenta de uso. Por exemplo, ao usar uma ferramenta de Business Intelligence (BI), os metadados necessários já estariam acessíveis na própria ferramenta ao importar os dados.

**Benefícios dos Metadados Ativos**

- Melhora a qualidade de vida dos usuários dos dados.
- Voltada para o usuário final, que utilizará os dados para pesquisa ou análise.
- Acesso aos metadados em qualquer etapa da pesquisa, da extração à análise de resultados.

### características principais dos metadados ativos:

- **Always On**(Sempre Ativos): Metadados ativos estão sempre disponíveis e novos metadados são gerados continuamente com base no uso das bases de dados. Um exemplo é a identificação das colunas mais utilizadas em consultas.

- **Inteligência**: A geração de metadados ativos é inteligente, ou seja, eles são criados conforme a necessidade da base de dados. Isso ajuda a destacar informações relevantes, especialmente para novos usuários.

- **Orientados para ação**: Os metadados ativos são criados para ajudar o usuário final a atingir seus objetivos. Um exemplo é a alteração de um metadado para indicar se uma base de dados está atualizada ou desatualizada.

- **Abertos por padrão**: Metadados ativos são acessíveis por qualquer pessoa e ferramenta que possa utilizá-los, geralmente por meio de APIs que conectam repositórios de metadados a ferramentas de Business Intelligence (BI).

