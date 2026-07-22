/*Consulta 1: Retornar a média de Notas dos Alunos em história.*/
SELECT round(Avg(Nota)) as Media from Notas WHERE id_disciplina = 2;

/*Consulta 2: Retornar as informações dos alunos cujo Nome começa com 'A'.*/
SELECT * from Alunos Where nome_aluno LIKE 'A%';

/*Consulta 3: Buscar apenas os alunos que fazem aniversário em fevereiro.*/
SELECT * from Alunos Where data_nascimento LIKE '%-02-%';
SELECT * FROM Alunos WHERE STRFTIME('%m', data_nascimento) = '02';

/*Consulta 4: Realizar uma consulta que calcula a idade dos Alunos.*/
SELECT nome_aluno, data_nascimento, round((julianday (CURRENT_DATE) - julianday (data_nascimento)) / 365) as idade from Alunos;
SELECT nome_aluno,
      data_nascimento,
      (strftime('%Y', CURRENT_DATE) - strftime('%Y', data_nascimento)) - 
      (strftime('%m-%d', CURRENT_DATE) < strftime('%m-%d', data_nascimento)) AS idade
FROM Alunos;

/*Consulta 5: Retornar se o aluno está ou não aprovado. Aluno é considerado aprovado se a sua nota foi igual ou maior que 6.*/
SELECT 
ID_Aluno As aluno, 
nota,
CASE WHEN nota >= 6 THEN 'APROVADO' 
ELSE 'REPROVADO' END 
AS Resultado
FROM Notas;