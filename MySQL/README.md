# MySQL

**Evolução e Impacto do MySQL**

- Surgiu nos anos 90, tornando-se o banco de dados preferido para desenvolvimento web (Linux, Apache, MySQL, PHP - LAMP).
- Passou pela Sun Microsystems e foi adquirido pela Oracle.
- O fork MariaDB surgiu por receio de que o MySQL se tornasse proprietário, mas ele permaneceu aberto (versões Community e Enterprise).
- Evoluiu com excelente desempenho, administração mais simples e suporte massivo para a nuvem.
- Possui uma comunidade gigantesca e é testado em milhões de implementações.
- Utilizado em sistemas transacionais de alto volume, ETL, APIs, microsserviços e dados semiestruturados (tipo JSON).
- Funções poderosas de data e tempo para auditorias e rastreamento de eventos.

**O Padrão SQL ANSI (SQL11)**

- É o ponto de partida e padrão base da linguagem SQL.
- Define o núcleo comum que todas as implementações de bancos de dados devem ter.
- Padroniza comandos como SELECT, INSERT, UPDATE, DELETE, JOINs básicos e funções essenciais.

---

## Organização de Dados no MySQL

- **Database vs. Schema**: No MySQL, ambos os termos são sinônimos e representam um contêiner organizado para armazenar objetos de banco de dados.
- **Estrutura do Schema**: Um schema pode conter tabelas, views, procedimentos, funções e permissões.
- **Organização Empresarial**: Schemas são frequentemente organizados por domínio de negócio (clientes, operações), ambiente (desenvolvimento, produção) ou sistema (aplicativo web, CRM).
- **Visualização no Workbench**: O MySQL Workbench permite explorar os componentes de um schema, como tabelas, colunas, chaves, índices e metadados.


## Tipos de Dados Essenciais

```sql
Numéricos:
int: Números inteiros.
bigint: Números inteiros grandes.
decimal, float, double: Números com casas decimais. Evitar float para dados financeiros, preferindo double pela precisão.
Texto:
varchar: Texto de comprimento variável.
char: Texto de comprimento fixo.
text: Para textos longos.
Data e Tempo:
date: Apenas data.
datetime: Data e hora.
timestamp: Data e hora com fuso horário.
year: Apenas ano.
Outros Tipos:
JSON: Suporte nativo para dados JSON (MySQL 8+).
enum, set: Tipos especiais para categorias predefinidas.
```

## Integridade dos Dados

- **Chave Primária (Primary Key)**: 
    - Identifica unicamente cada linha em uma tabela.
    - Fundamental para consultas rápidas, atualizações corretas e manutenção da integridade do modelo.
- **Chave Estrangeira (Foreign Key)**:
    - Estabelece a conexão e o relacionamento entre tabelas.
    - Garante que as relações não se rompam.
- **Regras de Integridade Referencial**:
    - **onDeleteRestrict**: Impede a exclusão de um registro se houver dependências.
    - **onDeleteCascade**: Exclui registros relacionados automaticamente.
    - **onUpdate**: Controla atualizações em cascata.
- **Restrições de Integridade Adicionais**:
    - **not null**: Garante que um campo não pode ter valor nulo.
    - **unique**: Garante que os valores em um campo são únicos na tabela.
    - **default**: Define um valor padrão para um campo.
    - **check**: Permite definir condições para os valores de um campo (suportado no MySQL 8+).
- **Motor de Armazenamento InnoDB**
    - **Importância**: O motor InnoDB é crucial para ambientes corporativos e sistemas de missão crítica.
    - **Funcionalidades**: Suporta transações, chaves estrangeiras, bloqueio a nível de linha e integridade relacional completa.

---

## Comandos de leitura

```sql
SELECT *: Recupera todas as colunas de uma tabela. Embora prático para exploração inicial, evite em produção para otimizar o desempenho.
SELECT coluna1, coluna2: Seleciona apenas as colunas de interesse, melhorando a eficiência.
FROM tabela: Indica a tabela de onde os dados serão extraídos.
Filtragem de Dados com WHERE
A cláusula WHERE é crucial para refinar os resultados, aplicando condições específicas.

Comparação de Igualdade (=): Filtra registros onde uma coluna corresponde a um valor exato. Lembre-se de usar aspas simples para textos e datas, e números diretamente.
Ex: WHERE status = 'ATIVO'
Ex: WHERE id_tipo_conta = 1
Comparação de Diferença (!=): Seleciona registros que não correspondem a um valor.
Ex: WHERE status != 'ATIVO'
Comparação de Maior/Menor (>, <, >=, <=): Útil para filtrar datas ou valores numéricos.
Ex: WHERE data_nascimento > '1990-01-01'
Busca por Padrão (LIKE): Essencial para buscas textuais parciais. O caractere % atua como um curinga para qualquer sequência de caracteres.
Ex: WHERE numero_conta LIKE '10%' (começa com '10')
Intervalo (BETWEEN ... AND ...): Filtra valores dentro de um determinado intervalo (inclusivo).
Ex: WHERE saldo_inicial BETWEEN 500 AND 2000
Múltiplos Valores (IN): Seleciona registros onde uma coluna corresponde a qualquer um dos valores listados.
Ex: WHERE id_status IN (1, 3)
Ordenação de Resultados com ORDER BY
A cláusula ORDER BY organiza a saída da consulta de acordo com uma ou mais colunas.

ASC (Ascendente): Ordena do menor para o maior (padrão se não especificado). Para textos, segue a ordem alfabética.
Ex: ORDER BY nome ASC
DESC (Descendente): Ordena do maior para o menor.
Ex: ORDER BY saldo_inicial DESC
Importante: A ordem dos resultados não é garantida sem o uso explícito de ORDER BY.
Limitação e Paginação com LIMIT e OFFSET
Para controlar o número de registros retornados, especialmente em grandes conjuntos de dados.

LIMIT número: Retorna apenas o número especificado de linhas.
Ex: LIMIT 5
LIMIT quantidade OFFSET início: Pula um número de linhas (OFFSET) e então retorna a quantidade de linhas.
Ex: LIMIT 5 OFFSET 5 (pula 5, pega os próximos 5)
Sintaxe Simplificada (LIMIT início, quantidade): No MySQL, pode-se usar uma sintaxe mais concisa.
Ex: LIMIT 5, 5 (equivalente a OFFSET 5 LIMIT 5)
Combinação de Cláusulas
É possível e comum combinar todas essas cláusulas para criar consultas poderosas e precisas. A ordem das cláusulas em uma consulta SELECT é geralmente: SELECT, FROM, WHERE, ORDER BY, LIMIT.

Ex: SELECT nome, data_cadastro FROM clientes WHERE status = 'ATIVO' ORDER BY data_cadastro DESC LIMIT 10;
```

---

## Agregando dados

As funções de agregação são ferramentas poderosas para resumir, totalizar e consolidar dados, fundamentais para análises financeiras, relatórios e auditorias.

- **SUM**: Calcula a soma dos valores em uma coluna.
- **AVG**: Determina a média dos valores em uma coluna.
- **COUNT**: Conta o número de linhas ou valores não nulos.
- **MIN**: Encontra o menor valor em uma coluna.
- **MAX**: Encontra o maior valor em uma coluna.

**Agrupamento de Dados com GROUP BY**
O `GROUP BY` é crucial para aplicar funções de agregação a subconjuntos de dados. Ele permite agrupar linhas que têm os mesmos valores em uma ou mais colunas, e então as funções de agregação operam dentro de cada um desses grupos.

- Exemplo: Contar o número de contas por cliente ou somar o saldo por agência.
- Agrupamento Múltiplo: É possível agrupar por várias colunas, separando-as por vírgula no GROUP BY.

**Filtrando Dados Agregados com HAVING**
O `HAVING` é utilizado para filtrar os resultados após a aplicação das funções de agregação e do GROUP BY. Diferente do WHERE, que filtra linhas individuais antes da agregação, o HAVING filtra os grupos já formados com base nos valores agregados.

- **Sintaxe**: O HAVING sempre vem depois do GROUP BY na consulta.
- **Exemplo**: Selecionar agências cuja soma total de saldos seja maior que um determinado valor, ou clientes com mais de uma conta.

**Ordem de Execução e Estrutura da Consulta**
Ao construir consultas com agregação e agrupamento, a ordem das cláusulas é importante:

- **SELECT**: Define as colunas a serem exibidas (incluindo as funções de agregação).
- **FROM**: Especifica a tabela de origem.
- **WHERE**: Filtra linhas individuais (opcional, antes do agrupamento).
- **GROUP** BY: Agrupa as linhas.
- **HAVING**: Filtra os grupos (opcional, após o agrupamento).
- **ORDER BY**: Ordena os resultados finais.

___

## JOINS
