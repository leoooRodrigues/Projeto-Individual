CREATE DATABASE individual;
USE individual;

CREATE TABLE professor (
id int primary key auto_increment,
nome varchar(45),
email varchar(45),
cpf char(14),
senha varchar(20),
dtNasc date,
celular char(11)
)auto_increment = 100;

CREATE TABLE turma (
id int,
nome varchar(45),
fkProfessor int,
foreign key (fkProfessor) references professor(id),
primary key (id,fkProfessor)
);

CREATE TABLE aluno (
id int primary key auto_increment,
nome varchar(45),
email varchar(45),
cpf char(14),
senha varchar(20),
dtNasc date,
fkTurma int,
foreign key (fkTurma) references turma(id),
fkProfessor int,
foreign key (fkProfessor) references professor(id)
);


CREATE TABLE analytics (
id int,
diasPraticados datetime,
desempenho char(10),
fkAluno int,
foreign key (fkAluno) references aluno(id),
primary key(id,fkAluno)
);


