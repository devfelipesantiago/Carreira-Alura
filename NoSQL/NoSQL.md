# NoSQL

## Fundamentos e Tipos de Bancos NoSQL

É essencial entender que, ao contrário do SQL que é visto como uma categoria única, os bancos NoSQL se dividem em diferentes tipos, cada um otimizado para desafios específicos em sistemas modernos. O objetivo é compreender essas distinções e como tecnologias como Redis, MongoDB e Cassandra se encaixam em arquiteturas eficientes.

As bases NoSQL são agrupadas em três categorias principais:

- **Key-Value**: Este é o modelo mais simples e eficiente. Ele armazena dados em pares chave-valor, onde a chave é única e o valor pode ser desde um dado simples até uma estrutura complexa. Exemplos como o Redis são extremamente rápidos, operando em memória, sendo ideais para cache, gestão de sessões e cenários que exigem baixa latência e alto desempenho.
- **Document**: Bases como o MongoDB armazenam dados em documentos semiestruturados, geralmente em formatos JSON ou BSON. Isso oferece grande flexibilidade, sendo perfeito para dados que evoluem com o tempo ou que não se encaixam em esquemas rígidos de tabelas, como em e-commerce com produtos de atributos variados ou logs de aplicações.
- **Wide Column**: Representado pelo Cassandra, este tipo é projetado para alta escalabilidade horizontal e grandes volumes de dados distribuídos. Ele permite que cada linha tenha um conjunto variável de colunas, sendo muito usado para dados de séries temporais, métricas de desempenho e logs em tempo real, destacando-se em cenários de monitoramento com milhões de registros por segundo.

Todos esses tipos de NoSQL compartilham o objetivo de processar grandes volumes de dados com eficiência e escalabilidade.

### Comparativo com Bancos de Dados Relacionais

Bancos de dados relacionais, com sua normalização e uso de joins, podem ter dificuldades de desempenho com grandes volumes de dados e em ambientes distribuídos. Além disso, são menos flexíveis para lidar com estruturas de dados que mudam frequentemente.

Os bancos NoSQL abordam esses desafios de forma diferente, reduzindo a necessidade de relações complexas e joins em múltiplas tabelas. Eles permitem armazenar dados de maneira mais direta, otimizando as operações de leitura e escrita para alto desempenho.

### A Escolha do Banco de Dados

A decisão sobre qual banco de dados usar deve ser guiada pelo problema a ser resolvido e pelas exigências do sistema, e não por preferências pessoais. Para velocidade extrema, o Redis é uma excelente opção. Para flexibilidade com dados semiestruturados, o MongoDB se destaca. E para grandes volumes e escalabilidade distribuída, o Cassandra é a escolha ideal. Conhecer os pontos fortes e as limitações de cada tecnologia é crucial para construir uma arquitetura eficiente.

---

## Entendendo a Arquitetura de Ports e Adaptadores

Essa abordagem arquitetural é crucial porque permite que o núcleo da aplicação seja independente da tecnologia de armazenamento de dados. Em um sistema simples, a regra de negócio frequentemente se acopla diretamente ao banco de dados, tornando a mudança de tecnologia um desafio. Com Ports e Adaptadores, o núcleo da aplicação não tem conhecimento do mundo externo (como Redis, MongoDB, Cassandra ou mesmo armazenamento em memória); ele interage apenas com interfaces.

- **Ports** são os contratos ou interfaces que definem o que a aplicação precisa fazer (ex: guardar uma sessão, registrar um evento, armazenar uma métrica), mas não como isso será feito. Eles estabelecem as "necessidades" do sistema.

- **Adaptadores** são as implementações concretas desses contratos. Eles vêm de fora do núcleo da aplicação e são responsáveis por se comunicar com a tecnologia específica (seja um banco de dados, um sistema de arquivos, etc.). A grande vantagem é que, ao mudar a tecnologia, apenas o adaptador precisa ser alterado, mantendo o núcleo da aplicação intacto.

Para futuras implementações com bancos de dados NoSQL, o processo envolve:

- Criar um adaptador específico para a nova tecnologia, onde a lógica de comunicação com o banco de dados será implementada.
- Ajustar os ports, se necessário, para incluir novas cláusulas contratuais que aproveitem as capacidades do novo banco de dados.
- Modificar ou criar novos services para utilizar as novas capacidades dos contratos.
- Eventualmente, ajustar o app para refletir novas ações ou opções. No arquivo main, declarar qual adaptador será utilizado para cada tipo de implementação, permitindo uma fácil troca de infraestrutura. A essência é que a aplicação mantém seu comportamento, mas a forma como os dados são armazenados e gerenciados muda, permitindo escalar e evoluir o sistema sem grandes reescritas no core.

---

## Redis

O Redis é um banco de dados NoSQL em memória, otimizado para velocidade e eficiência, armazenando dados diretamente na RAM para acessos quase instantâneos. Sua arquitetura de fio único simplifica a execução de operações, contribuindo para seu alto desempenho ao evitar problemas de concorrência.

Para garantir a durabilidade dos dados, mesmo sendo em memória, o Redis oferece mecanismos de persistência: o **RDB (Redis Database)**, que cria snapshots dos dados em intervalos, e o **AOF (Append-Only File)**, que registra todas as operações de escrita. Ambos podem ser usados em conjunto para diferentes níveis de segurança.

Um recurso importante é o **TTL (Time to Live)**, que permite definir um tempo de expiração para os dados, *ideal para informações temporárias como sessões de usuário ou tokens de autenticação*, garantindo o uso eficiente da memória.

Entre os casos de uso práticos, o Redis se destaca como **cache** para dados frequentemente acessados, na gestão de **sessões de usuários** com expiração automática, no **rate limiting** para prevenir abusos e na criação de **contadores** para eventos como cliques.

> **Importante**: O Redis possui limitações. Ele não é recomendado para armazenar dados críticos que exigem consistência total, para modelar relações complexas como em bancos de dados relacionais, ou para guardar dados históricos de longo prazo. Ele é mais adequado para dados temporários e de alta frequência de consulta.

---

### Redis: Fundamentos e Operações Essenciais

O Redis é um banco de dados NoSQL do tipo chave-valor, conhecido por sua velocidade e eficiência, pois armazena os dados em memória. A interação com o Redis é feita através do Redis CLI, uma interface de linha de comando.

#### Armazenamento e Recuperação de Dados

- **SET**: Utilizado para armazenar um valor associado a uma chave. Se a chave já existir, o valor é atualizado.
  Exemplo: 

  ```shell
  set nome "Felipe"
  ```

- **GET**: Permite recuperar o valor associado a uma chave específica.
  Exemplo: 

  ```shell
  get nome
  ```

- **KEYS**: Exibe todas as chaves armazenadas no banco de dados. Pode-se usar padrões (como KEYS *) para filtrar chaves.
  Exemplo: 

  ```shell
  keys *
  ```

#### Dados Temporários e Expiração

Uma característica importante do Redis é a capacidade de definir um tempo de vida para as chaves, tornando os dados temporários.

- **EXPIRE [chave] [segundos]**: Define um tempo de expiração para uma chave em segundos. Após esse período, a chave é automaticamente removida.
  Exemplo: 

  ```shell
  expire status 60
  ```

- **TTL [chave]**: Retorna o tempo restante para a expiração de uma chave, também em segundos. Se a chave não tiver expiração, pode retornar -1.
  Exemplo: 

  ```shell
  ttl status
  ```

**Contadores Atômicos**

O Redis é excelente para implementar contadores, garantindo que as operações de incremento e decremento sejam atômicas (seguras mesmo com múltiplos acessos simultâneos).

- **INCR [chave]**: Incrementa o valor numérico de uma chave em 1. Se a chave não existir, ela é criada com o valor 0 e depois incrementada para 1.
  Exemplo:

  ```shell
  incr acessos
  ```

- **DECR [chave]**: Decrementa o valor numérico de uma chave em 1.

**Remoção de Chaves**

- **DEL [chave]**: Apaga uma ou mais chaves do banco de dados.
  Exemplo: 

  ```shell
  del acessos
  ```

**Padrões de Nomenclatura**

É uma boa prática adotar padrões para nomear as chaves, utilizando prefixos e sufixos (como status:sistema) para organizar e agrupar dados de forma lógica, facilitando a busca e o gerenciamento.

---

#### Hashes, Listas e Organização de Chaves

- **Hashes**: Um hash pode ser entendido como um conjunto de campos e valores agrupados sob uma única chave. É como um objeto ou registro com vários atributos. Em vez de criar várias chaves separadas para informações relacionadas, podemos agrupá-las em um único hash.

  - **Criação e Atualização**: Para criar ou atualizar um hash, utiliza-se o comando HSET. Por exemplo:

    ```shell
    hset usuario:100 nome "Carlos" email "carlos@gmail.com" status "ATIVO"
    ```

  - **Visualização**: Para ver um campo específico, usa-se HGET chave campo. Para ver todos os campos e valores de um hash, o comando é HGETALL chave.
    Exemplo:
    
    ```shell
    hget usuario:100 nome
    hgetall usuario:100
    ```

  - **Incremento Numérico**: É possível incrementar valores numéricos dentro de um hash usando HINCRBY chave campo valor_a_incrementar.
    Exemplo:

    ```shell
    hincrby usuario:100 saldo 50
    ```

- **Listas**: As listas permitem armazenar valores mantendo uma ordem definida, sendo ideais para representar filas, pilhas ou históricos.

  - **Adição de Elementos**: Para adicionar elementos a uma lista, utiliza-se o comando LPUSH chave valor. Os elementos são adicionados no início da lista.
    Exemplo:

    ```shell
    lpush historico:acoes "Compra de Ação" "Venda de Ação" "Divíde" "Aporte" "Saque"
    ```
  
  - **Visualização**: Para visualizar os elementos de uma lista, usa-se LRANGE chave inicio fim. Por exemplo, LRANGE historico:acoes 0 -1 mostra todos os elementos da lista historico:acoes.
    Exemplo:

    ```shell
    lrange historico:acoes 0 -1
    ```

- **Organização de Chaves**: A organização das chaves é crucial, pois a base de dados não possui um esquema. É fundamental criar padrões claros de nomenclatura para as chaves, como o uso de prefixos e separadores (ex: usuario:100, historico:acoes). Isso torna o ambiente mais legível e fácil de manter.

- **Considerações Importantes**: É importante lembrar que esta base de dados não é feita para armazenar grandes volumes históricos, pois tudo está em memória. Também não permite operações de joins e não deve ser usada como base de dados principal para guardar dados a longo prazo.

---

## MongoDB

### Conceitos Fundamentais Documentos, Collections e JSON

Os bancos de dados orientados a documentos, como o MongoDB, *se destacam por armazenar dados em documentos*, oferecendo uma estrutura muito mais flexível em comparação com as tabelas rígidas dos bancos de dados relacionais.

A unidade básica de armazenamento é o documento, que geralmente utiliza o formato `JSON` ou `BSON`. Essa estrutura permite que os campos variem dentro dos documentos de uma mesma coleção, e é possível incluir novos documentos ou arrays sem a necessidade de um esquema global. Isso significa que um documento pode conter informações detalhadas e variadas, como dados de usuário, preferências, histórico de compras e múltiplos endereços, tudo em um único lugar.

> A flexibilidade é a principal vantagem dessa abordagem, pois a estrutura de um documento pode evoluir ao longo do tempo sem impactar outros documentos ou exigir mudanças globais no banco de dados.

> Os documentos são organizados em collections (coleções), que são agrupamentos lógicos de documentos. Uma collection é semelhante a uma tabela, mas não exige uma estrutura fixa para todos os documentos que a compõem. Essa característica facilita a adição ou eliminação de campos sem a necessidade de migrações complexas.

Embora a flexibilidade seja um grande benefício, ela também exige responsabilidade na organização e consistência dos dados. O modelo orientado a documentos é ideal para cenários que demandam flexibilidade e escalabilidade, como o registro de eventos, logs de aplicação, históricos de transações e catálogos de e-commerce, onde os atributos dos itens podem variar bastante.

### Comandos

```js
// Seleciona o banco de dados.
// Aqui estou dizendo para o Playground que os próximos comandos vão ser executados dentro do database "minishop". Isso é como “entrar” no banco.

use("minishop");

// Limpando o ambiente.

db.events.drop();

// Recriando a collection.

db.createCollection("events");

// Incluindo documentos.

use("minishop");

// Evento 1: inicialização da aplicação.

db.events.insertOne({
  event_type: "APP_STARTED",
  message: "MiniShop iniciada",
  user_id: null,
  session_id: "s-001",
  created_at: new Date("2026-01-28T10:00:00Z")
});

// Evento 2: login do usuário.
// Aqui nós registramos o evento de login.
// Repare que agora o campo user_id já possui um valor,
// indicando que um usuário foi autenticado.

db.events.insertOne({
  event_type: "LOGIN",
  message: "Usuário autenticado",
  user_id: "u-100",
  session_id: "s-001",
  created_at: new Date("2026-01-28T10:02:10Z")
});

// Evento 3: adição de item ao carrinho.
// Neste terceiro evento, além dos campos que já vimos antes, aparece um novo campo chamado meta. Esse campo é um objeto JSON aninhado, com informações específicas desse tipo de evento, como o SKU do produto e a quantidade.

db.events.insertOne({
  event_type: "ADD_TO_CART",
  message: "Adicionou item ao carrinho",
  user_id: "u-100",
  session_id: "s-001",
  created_at: new Date("2026-01-28T10:03:25Z"),
  meta: { sku: "SKU-001", qty: 2 }
});

// Buscar eventos de login
// Aqui fazemos um filtro simples. Estamos pedindo ao MongoDB todos os documentos cujo campo event_type seja igual a LOGIN.

use("minishop");

db.events.find({ event_type: "LOGIN" });

// Eventos relacionados a um SKU específico
// Neste caso, o filtro é feito em um campo aninhado.  Usamos a notação de ponto para acessar o campo sku dentro do objeto meta.

use("minishop");

db.events.find({ "meta.sku": "SKU-001" });

// Buscando mais de um tipo de evento ao mesmo tempo

use("minishop");

db.events.find({
  event_type: { $in: ["LOGIN", "ADD_TO_CART"] }
});

// Combinando filtros
// Quando colocamos mais de um campo no filtro, o MongoDB aplica automaticamente um AND lógico. Ou seja, ambos os critérios precisam ser verdadeiros.

use("minishop");

db.events.find({
  user_id: "u-100",
  event_type: "ADD_TO_CART"
});

// Filtrando eventos por período de tempo.
// Aqui filtramos os eventos com base em um intervalo de datas. Usamos $gte para "maior ou igual" e $lte para "menor ou igual".

use("minishop");

db.events.find({
  created_at: {
    $gte: new Date("2026-01-28T10:02:00Z"),
    $lte: new Date("2026-01-28T10:04:00Z")
  }
});

// Listando eventos ordenando pelo tempo.
// Agora listamos todos os eventos ordenados pelo campo created_at.
// O valor -1 indica ordenação decrescente, do mais recente para o mais antigo.

use("minishop");

db.events.find().sort({ created_at: -1 });

// Listar campos relevantes
// Neste último exemplo usamos projeção.
// Estamos dizendo quais campos queremos ver no resultado, deixando a visualização mais limpa e focada em logs.

use("minishop");

db.events.find(
  {},
  {
    event_type: 1,
    message: 1,
    user_id: 1,
    created_at: 1
  }
);

// Atualizar um documento.
// Agora vamos atualizar um único documento específico.
// Para isso, usamos o método updateOne, que altera apenas o primeiro documento que corresponder ao filtro informado. Aqui usamos o campo _id para identificar exatamente qual documento deve ser atualizado.
// O ObjectId garante que estamos apontando para um documento único.
// O operador $set indica quais campos devem ser criados ou atualizados dentro do documento. Neste caso, estamos adicionando o campo status com o valor confirmed.

use("minishop");

db.events.updateOne(
  { _id: ObjectId("697abbe90565f31c96052380") },
  { $set: { status: "confirmed" } }
);

// Após o update, fazemos uma consulta para verificar o resultado da alteração nos eventos de ADD_TO_CART.

db.events.find({ event_type: "ADD_TO_CART" });

// Atualizar vários documentos.
// O filtro seleciona todos os eventos que pertencem à sessão s-001.

use("minishop");

db.events.updateMany(
  { session_id: "s-001" },
  { $set: { session_tag: "aula-4-3" } }
);

// Apagando documentos.
// Aqui estamos removendo todos os eventos do tipo APP_STARTED, simulando uma limpeza de logs antigos.

use("minishop");

db.events.deleteMany(
  { event_type: "APP_STARTED" }
);
```
