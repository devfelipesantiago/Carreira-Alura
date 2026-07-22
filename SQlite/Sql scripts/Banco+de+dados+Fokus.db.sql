SELECT * FROM HistoricoEmprego
where datatermino ISNULL
ORDER by salario DESC
LIMIT 5;

/*Prosurar texto no começo da frase*/
SELECT * from Treinamento
WHERE curso like 'O poder%';

/*Prosurar texto no meio da frase*/
SELECT * from Treinamento
WHERE curso like '%realizar%';

/*Prosurar texto no fim da frase*/
SELECT * from Treinamento
WHERE curso like '%facilmente';

SELECT * FROM HistoricoEmprego
where cargo = 'Professor' 
and datatermino NOtNULL;

SELECT * FROM HistoricoEmprego
where cargo = 'Dermatologista'
OR cargo = 'Oftalmologista';

SELECT * FROM HistoricoEmprego
where cargo IN ('Oftalmologista', 'Dermatologista', 'Professor');

SELECT * FROM HistoricoEmprego
where cargo NOT IN ('Oftalmologista', 'Dermatologista', 'Professor');

SELECT * FROM Treinamento
WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha')
OR (curso LIKE 'O conforto%' AND instituicao = 'das Neves')

SELECT mes, MAX(faturamento_bruto) FROM faturamento;
SELECT mes, MIN(faturamento_bruto) FROM faturamento;
SELECT AVG(despesas) FROM faturamento;
SELECT AVG(lucro_liquido) FROM faturamento;

SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' 
FROM Faturamento
WHERE mes LIKE '%2023';

SELECT COUNT(*) FROM HistoricoEmprego
WHERE datatermino NOTNULL;

SELECT COUNT(*) from Licencas
WHERE tipolicenca = 'férias';

SELECT parentesco, COUNT(*) FROM Dependentes
GROUP BY parentesco;

SELECT instituicao, COUNT(curso) 
FROM Treinamento
GROUP BY instituicao
HAVING COUNT(curso) > 2;

SELECT cargo, COUNT(*) qtd
FROM HistoricoEmprego
GROUP BY cargo
HAVING qtd >=2;

/*Funções de String, datas, numericas e de conversão*/
/*Length*/
SELECT nome, length(cpf) qtd
from Colaboradores
WHERE qtd = 11;

SELECT COUNT(*), length(cpf) qtd
from Colaboradores
WHERE qtd = 11;

/*Concatenar*/
SELECT ('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' || endereco) as texto
FROM Colaboradores

/*Upper e Lower*/
SELECT UPPER('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' 
        || endereco) as texto
        from Colaboradores;
     
SELECT LOWER('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' 
        || endereco) as texto
        from Colaboradores;

/*Formatacao de datas*/
SELECT DATE('now');
SELECT DATE('now', '-10 days');
SELECT TIME('now');
SELECT DATETIME('now');
SELECT DATETIME('now', '+1 year');
SELECT CURRENT_TIMESTAMP;

SELECT id_colaborador, STRFTIME('%Y/%m', datainicio) FROM Licencas;

/*Função JULIANDAY*/
SELECT id_colaborador, julianday (datatermino) - JULIANDAY (datacontratacao) as Dias
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL
ORDER by Dias DESC;

SELECT AVG(faturamento_bruto), ROUND (AVG(faturamento_bruto),2) FROM faturamento;
SELECT CEIL(faturamento_bruto), CEIL(despesas) FROM faturamento;
SELECT FLOOR(faturamento_bruto), FLOOR(despesas) FROM faturamento;

SELECT (' O faturamento bruto médio foi ' || CAST(ROUND (AVG(faturamento_bruto),2) AS TEXT))
FROM faturamento;

/*
Função TRIM
Funcionalidade: A função TRIM remove espaços (ou outro conjunto especificado de caracteres) do início e do fim de uma string.
Sintaxe Básica: TRIM(string, [caractere_para_trimar])
Exemplo de Uso: Para remover espaços do início e do fim da coluna nome:
*/
SELECT TRIM(nome) FROM tabela;

/*
Função INSTR
Funcionalidade: INSTR retorna a posição de uma substring dentro de uma string. Equivalente ao CHARINDEX em alguns outros sistemas.
Sintaxe Básica: INSTR(string, substring)
Exemplo de Uso: Para encontrar a posição da substring 'abc' dentro da coluna descricao:
*/
SELECT INSTR(descricao, 'abc') FROM tabela;

/*
Função REPLACE
Funcionalidade: REPLACE substitui todas as ocorrências de uma substring específica por outra substring dentro de uma string.
Sintaxe Básica: REPLACE(coluna, substring_a_substituir, substring_para_substituir)
Exemplo de Uso: Para substituir 'hello' por 'hi' na coluna saudacao:
*/
SELECT REPLACE(saudacao, 'hello', 'hi') FROM tabela;

/*
Função SUBSTR (ou SUBSTRING em alguns sistemas)
Funcionalidade: SUBSTR extrai uma parte de uma string com base em um ponto de início e um comprimento especificados.
Sintaxe Básica: SUBSTR(string, inicio[, comprimento])
Exemplo de Uso: Para extrair os primeiros 5 caracteres da coluna comentario:
*/
SELECT SUBSTR(comentario, 1, 5) FROM tabela;

/*
Função POWER
Funcionalidade: POWER é usada para elevar um número a uma potência específica.
Sintaxe Básica: POWER(base, expoente)
Exemplo de Uso: Para elevar 2 à 3ª potência:
*/
SELECT POWER(2, 3);

/*
Função SQRT
Funcionalidade: SQRT retorna a raiz quadrada de um número.
Sintaxe Básica: SQRT(numero)
Exemplo de Uso: Para encontrar a raiz quadrada de 16:
*/
SELECT SQRT(16);

/*
Função RANDOM
Funcionalidade: RANDOM gera um número inteiro aleatório entre -9223372036854775808 e +9223372036854775807.
Sintaxe Básica: RANDOM()
Exemplo de Uso: Para gerar um número aleatório:
*/
SELECT RANDOM();

/*Função ABS
Funcionalidade: ABS retorna o valor absoluto de um número, que é o número sem seu sinal.
Sintaxe Básica: ABS(numero)
Exemplo de Uso: Para obter o valor absoluto de -5:*/
SELECT ABS(-5);

/*
Função HEX
Funcionalidade: HEX converte um número ou uma string para a sua forma hexadecimal.
Sintaxe Básica: HEX(string)
Exemplo de Uso: Para converter 255 para hexadecimal:
Isso retornará 'FF'. E para converter a string 'hello':
*/
SELECT HEX('hello');

/*
1. CAST
Funcionalidade: Converte um tipo de dados de uma expressão para outro tipo especificado.

SGBDs Compatíveis: Quase todos os SGBDs principais, incluindo MySQL, PostgreSQL, SQL Server, SQLite e Oracle. Única função de conversão disponível no SQLite online.

Sintaxe: CAST(expressao AS tipo)

2. CONVERT
Funcionalidade: Semelhante ao CAST, mas com uma sintaxe ligeiramente diferente e, em alguns SGBDs, recursos adicionais.

SGBDs Compatíveis: Principalmente SQL Server e MySQL. A função CONVERT no MySQL é usada mais comumente para conversão de codificação de caracteres, não tipos de dados.

Sintaxe (SQL Server): CONVERT(tipo, expressao [, estilo])

3. TO_NUMBER, TO_CHAR, TO_DATE (Funções específicas do Oracle)
Funcionalidade: Converte strings para números (TO_NUMBER), números ou datas para strings (TO_CHAR), e strings para datas (TO_DATE).

SGBDs Compatíveis: Oracle.

Sintaxe: TO_NUMBER(string [, formato [, 'nlsparam']]), TO_CHAR(valor [, formato [, 'nlsparam']]), TO_DATE(string [, formato [, 'nlsparam']])

4. PARSE, TRY_PARSE, TRY_CONVERT (SQL Server)
Funcionalidade: PARSE tenta converter uma string para um tipo de dados numérico ou de data/hora com um estilo de cultura opcional. TRY_PARSE e TRY_CONVERT são versões mais seguras que retornam NULL em vez de um erro se a conversão falhar.

SGBDs Compatíveis: SQL Server.

Sintaxe: PARSE(string AS tipo USING cultura), TRY_PARSE(string AS tipo USING cultura), TRY_CONVERT(tipo, expressao [, estilo])

5. STR_TO_DATE (MySQL)
Funcionalidade: Converte uma string em um formato de data especificado para uma data.

SGBDs Compatíveis: MySQL.

Sintaxe: STR_TO_DATE(string, formato)

6. TO_NUMBER, TO_CHAR (PostgreSQL)
Funcionalidade: TO_NUMBER converte uma string para um número, e TO_CHAR converte um número ou data para uma string, ambos com base em um formato especificado.

SGBDs Compatíveis: PostgreSQL.

Sintaxe: TO_NUMBER(string, formato), TO_CHAR(valor, formato)
*/

/*Utilizando a expressão CASE*/
SELECT *, 
CASE 
	WHEN salario < 3000 then 'Baixo'
	WHEN salario BETWEEN 3000 and 6000 then 'Médio'
ELSE 'Alto'
	end as categorias_salarios
from HistoricoEmprego

/*Renomeando com a cláusula RENAME*/
ALTER TABLE HistoricoEmprego RENAME to CargoColaboradores;