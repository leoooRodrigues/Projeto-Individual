CREATE DATABASE individual;
USE individual;


CREATE TABLE aluno (
id int primary key auto_increment,
nome varchar(45),
email varchar(45) unique,
senha varchar(20),
dtNasc date,
tipo varchar(5),
check(tipo in('adm','user')),
fkProfessor int,
foreign key (fkProfessor) references aluno(id)
);

CREATE TABLE turma (
id int,
nome varchar(45),
fkAluno int,
foreign key (fkAluno) references aluno(id),
primary key (id,fkAluno)
);


CREATE TABLE desempenho (
id int,
diasPraticados datetime,
desempenho char(10),
fkAluno int,
foreign key (fkAluno) references aluno(id),
primary key(id,fkAluno)
);

CREATE TABLE sugestao (
id int auto_increment,
sugestao varchar(250),
fkAluno int,
foreign key (fkAluno) references aluno(id),
primary key(id,fkAluno)
);
    
INSERT INTO aluno VALUES
	(null,'Leonardo Rodrigues','leonardo@gmail.com','123123*','2001-08-18','adm',null),
    (null,'Igor Melo','Igor@gmail.com','123123*','2002-05-20','adm',null),
	(null,'Felipe Almeida','felipe@gmail.com','123123*','2015-11-02','user',1),
	(null,'Claudia Arraia','claudia@gmail.com','123123*','2013-08-10','user',1),
	(null,'Matheus Ferreira','theus@gmail.com','123123*','1984-03-13','user',2);
    
    
INSERT INTO turma VALUES
	(1,'Turma A',3),
	(1,'Turma A',4),
	(2,'Turma B',5);
    
select * from aluno;

-- Exibir alunos e seus professores
select a.nome as aluno, p.nome as professor from aluno as a
	JOIN aluno as p
    ON a.fkProfessor = p.id;
    
-- Exibir alunos, seus professores e suas turmas
select a.nome as aluno, p.nome as professor, turma.nome as turma from aluno as a
	JOIN aluno as p
    ON a.fkProfessor = p.id
    JOIN turma on a.id = fkAluno;

