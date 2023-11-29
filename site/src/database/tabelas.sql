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
fkAluno int,
tecnica char(10),
forca char(10),
resistencia char(10),
foreign key (fkAluno) references aluno(id),
primary key(id,fkAluno)
);

select * from desempenho;

select nome, tecnica, forca, resistencia from desempenho 
	join aluno on aluno.id = desempenho.fkAluno
    where aluno.id = 5;

INSERT INTO desempenho VALUES
	(1,'3','4','7','3'),
	(2,'4','5','5','3'),
	(3,'5','6','6','6');
	

CREATE TABLE sugestao (
id int auto_increment,
titulo varchar(100),
descricao varchar(250),
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
    JOIN turma on a.id = fkAluno
    where p.id = 1;
    
update aluno set tipo = 'user' 
	where id = 6;

