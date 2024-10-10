create database db_livraria ;  

CREATE TABLE tb_clientes (
id_cliente int PRIMARY KEY NOT NULL ,
nome varchar (45),
cpf varchar (11),
rg varchar (11),
email varchar (45)
);  

CREATE TABLE telefone_clentes (
id_telefone int PRIMARY KEY NOT NULL ,
telefone varchar (15),
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_clientes (id_cliente)
);  

CREATE TABLE endereco_clientes(
id_endereco int,
rua varchar(45),
numero int ,
cidade varchar(45),
estado varchar(45),
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_clientes (id_cliente)
); 

CREATE TABLE tb_livro(
id_livro int PRIMARY KEY NOT NULL ,
titulo varchar (45),
categoria varchar (45),
isbn varchar (45),
ano DATE ,
valor DECIMAL(10,2),
autor varchar(45),
EDITORA_id_editora int ,
FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_editora(id_editora)
); 

CREATE TABLE tb_editora(
id_editora int PRIMARY KEY NOT NULL ,
nome_editora varchar(45),
nome_contato varchar (45),
email varchar(45) ,
contato varchar(45)
); 

CREATE TABLE tb_estoque(
quantidade int,
LIVRO_id_livro int ,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro)
); 

CREATE TABLE tb_pedido(
id_pedido int PRIMARY KEY NOT NULL , 
valor decimal (10,2),
data date ,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_item_pedidos(
quantidade int,
valor decimal(10,2),
PEDIDO_id_pedido int,
LIVRO_id_livro int,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_pedido(id_pedido),
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro (id_livro)
);

