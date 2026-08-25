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
