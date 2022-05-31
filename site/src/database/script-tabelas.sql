-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
create database twoMs;
use twoMs;
create table usuario (
idUsuario int primary key auto_increment,
nome varchar(30),
email varchar(70),
senha varchar(45)
);
create table aviso (
idAviso int primary key auto_increment,
descricao varchar(300),
fkUsuario int,
	foreign key (fkUsuario) references usuario(idUsuario)
);
select * from aviso;

create table enquetes (
idEnq int primary key auto_increment,
pergunta varchar(60),
resp1 char(1),
resp2 char(1)
);