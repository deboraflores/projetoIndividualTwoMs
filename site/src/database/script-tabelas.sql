create database twoMs;
use twoMs;
create table usuario (
idUsuario int primary key auto_increment,
nome varchar(30),
email varchar(70),
senha varchar(45)
);

INSERT INTO usuario VALUES
(2, 'jp', 'jp@jp.com', '123');

create table aviso (
idAviso int primary key auto_increment,
descricao varchar(300),
fkUsuario int,
	foreign key (fkUsuario) references usuario(idUsuario)
);
select * from aviso;
truncate table aviso;


CREATE TABLE musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    musica VARCHAR(60),
	fkEnquete INT,
	FOREIGN KEY (fkEnquete) references enquete(idEnq)
);
INSERT INTO musica (musica, fkEnquete) VALUES
('We are Never Ever Getting Back Together - Taylor Swift', 1),('Home - Gabrielle Aplin', 1),('Knockin on Heavens Door - Guns N Roses', 2),
('Velha Infância - Trabalhistas', 2),('Happier Than Ever - Billie Eilish', 3), ('Set Fire to the Rain - Adele', 3), ('A Cor é Rosa - Silva', 4), 
('10 Things I Hate About You - Leah Kate', 4), ('Amor Incendiário - Yago Oproprio', 5), ('Dark Necessities - Red Hot Chili Peppers', 5)
;

CREATE TABLE enquete (
	idEnq INT PRIMARY KEY AUTO_INCREMENT,
    pergunta VARCHAR(255)
);
INSERT INTO enquete (pergunta) VALUES 
('Qual seria o seu mood musical com esse look?'),
('Qual música ele estaria ouvindo no metrô?'),
('O que estaria no seu fone, caso você estivesse:'),
('Qual a música ideal para esse look de primavera?'),
('Para você, o que esse skatista estaria escutando?')
;

CREATE TABLE respostas (
	idResposta INT PRIMARY KEY AUTO_INCREMENT,
    resposta VARCHAR(45),
	fkUsuario INT,
	FOREIGN KEY (fkUsuario) references usuario(idUsuario),
    fkEnquete INT,
    FOREIGN KEY (fkEnquete) REFERENCES enquete(idEnq)
);

INSERT INTO respostas (resposta, fkUsuario, fkEnquete) VALUES 
(1, 1, 1),(1, 1, 2),(1, 1, 3),(1,1, 4),(1, 1, 5);

SELECT * FROM usuario;
SELECT * FROM enquete;
SELECT * FROM respostas;
select * from musica;
SELECT * FROM musica JOIN enquete ON fkEnquete = idEnq;
SELECT resposta, nome, idEnq, pergunta FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON fkEnquete = idEnq;
SELECT resposta, nome, idEnq, pergunta, musica FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON respostas.fkEnquete = idEnq JOIN musica ON musica.fkEnquete = idEnq;

SELECT resposta, nome, idEnq, pergunta FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON respostas.fkEnquete = idEnq;
SELECT resposta, nome, idEnq, pergunta FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON respostas.fkEnquete = idEnq WHERE resposta = 2;
SELECT resposta, nome, idEnq, pergunta FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON respostas.fkEnquete = idEnq WHERE resposta = 1;

SELECT resposta, nome, idEnq, pergunta FROM respostas JOIN usuario ON fkUsuario = idusuario JOIN enquete ON respostas.fkEnquete = idEnq WHERE resposta = 2 AND idEnq = 3; -- usar esse --