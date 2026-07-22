SELECT * FROM Alunos;
SELECT * FROM Disciplinas;
SELECT * FROM Notas;
SELECT * FROM Professores;
SELECT * FROM Turmas;
SELECT * FROM Turma_Alunos;
SELECT * FROM Turma_Disciplinas;

SELECT * FROM Alunos ORDER BY nome_aluno;

SELECT * FROM Disciplinas WHERE carga_horaria > 40;

SELECT * FROM Notas WHERE valor_nota > 6 AND valor_nota < 8;