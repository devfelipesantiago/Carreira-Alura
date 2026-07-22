CREATE TABLE Alunos (
  Id_aluno INT PRIMARY KEY,
  nome_aluno VARCHAR (250),
  data_nascimento date,
  genero varchar (15),
  endereco varchar (50),
  telefone varchar (11),
  email varchar (50)
  );
  
CREATE TABLE Professores (
    Id_professor int PRIMARY key,
    nome_professor varchar (250),
    data_nascimento date,
    genero varchar (15),
    telefone varchar (11),
    email varchar (50)
   );
   
create TABLE Disciplinas (
     Id_disciplina int PRIMARY KEY,
     nome_disciplina varchar (250),
     descricao text,
     carga_horaria int,
     id_professor int,
     FOREIGN key (id_professor) REFERENCES Professores (Id_professor)
     );
     
CREATE TABLE Turmas (
  Id_turma Int PRIMARY key,
  nome_turma varchar (250),
  ano_letivo INT,
  ID_Professor_Orientador int,
  FOREIGN key (ID_Professor_Orientador) REFERENCES Professores (id_professor)
  );

CREATE TABLE Turma_Alunos (
  Id_turma int,
  Id_aluno int,
  FOREIGN key (id_turma) REFERENCES Turnmas (id_turma),
  FOREIGN key (id_aluno) REFERENCES alunos (id_aluno)
);

CREATE TABLE Turma_Disciplinas  (
  Id_turma int,
  Id_disciplina int,
  FOREIGN key (id_turma) REFERENCES Turnmas (id_turma),
  FOREIGN key (Id_disciplina) REFERENCES Disciplinas (Id_disciplina)
);

CREATE TABLE Notas (
  Id_nota int PRIMARY key,
  Id_aluno int,
  Id_disciplina int,
  valor_nota decimal,
  data_avaliacao date,
  FOREIGN key (id_aluno) REFERENCES Alunos (id_aluno),
  FOREIGN key (Id_disciplina) REFERENCES Disciplinas (Id_disciplina)
);