create database if not exists db_livraria ;
use db_livraria; 

create table tb_livro (
Id_livro VARCHAR(10) PRIMARY KEY,
titulo VARCHAR (50) , 
ISBN VARCHAR (13),
FOREIGN KEY (Id_livro) REFERENCES tb_autor(Id_autor),
Editora VARCHAR (50)
); 

create table tb_autor(
Id_autor VARCHAR(10) primary key,
Nome VARCHAR(50),
Email VARCHAR(50) ,
FOREIGN KEY (Id_autor) REFERENCES tb_livro(Id_livro)
); 