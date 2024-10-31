CREATE DATABASE IF NOT EXISTS LojaDB; 

USE LojaDB; 

CREATE TABLE IF NOT EXISTS tb_vendas (
id_NF INT, 
id_Item INT,
Cod_Produto INT, 
Valor_Unit DECIMAL (5, 2), 
quantidade INT, 
Desconto INT
); 

INSERT INTO tb_vendas (id_NF, id_Item, Cod_Produto,valor_Unit, quantidade, Desconto) VALUES
(1, 1, 1, 25.00, 10, 5), 
(1, 2, 2, 13.00, 3, NULL), 
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 5, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL), 
(3, 4, 2, 13.50, 7, NULL),
(4, 1, 5, 30.00, 10, 15),
(4, 1, 5, 10.00, 12, 5), 
(4, 3, 1, 25.00, 13, 5), 
(4, 4, 2, 13.50, 15, 5), 
(5, 1, 3, 15.00, 3, NULL), 
(5, 2, 5, 30.00, 6, NULL),
(6, 1, 1, 25.00, 22, 15), 
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3) ,
(7, 2, 2, 13.50, 10, 4), 
(7, 3, 3, 15.00, 10, 4), 
(7, 4, 5, 30.00, 10, 1); 

SELECT * FROM tb_vendas ; 

/* ATIVIDADE 1*/
SELECT id_NF, id_Item, Cod_Produto, Valor_Unit FROM tb_vendas
WHERE Desconto  IS NULL ; 

/* ATIVIDADE 2*/ 
SELECT id_NF, id_Item, Cod_Produto, Valor_Unit, Valor_Unit - (Valor_Unit*(Desconto/100)) as "Valor_Vendido"
FROM tb_vendas 
WHERE Desconto > 0; 

/* ATIVIDADE 3 */ 
UPDATE tb_vendas 
SET Desconto = 0 
WHERE Desconto IS NULL ; 

SELECT * FROM tb_vendas ; 

/* ATIVIDA 4 */ 
SELECT id_NF, id_Item,Cod_Produto, Valor_Unit * quantidade as valor_total, Desconto, valor_Unit-(Valor_Unit*(Desconto/100)) as valor_vendido FROM tb_vendas ; 

/* ATIVIDADE 5*/ 
SELECT id_NF , 
Sum(quantidade*valor_Unit)
as valor_total 
FROM tb_vendas 
GROUP BY id_NF
ORDER BY id_NF DESC; 

/*ATIVIDADE 6 */ 
SELECT id_NF , 
Valor_Unit - (Valor_Unit*(Desconto/100)) 
AS"valor_vendido" , 
SUM(quantidade*valor_Unit)
as "valor_total" 
FROM tb_vendas 
GROUP BY id_NF
ORDER BY id_NF DESC;  

/*ATIVIDADE 7 */ 
SELECT Cod_Produto, quantidade 
ORDER BY Cod_Produto ; 

/* ATIVIDADE 8 */ 
SELECT id_NF, Cod_Produto,
COUNT(quantidade)
FROM tb_vendas
WHERE quantidade > 10
GROUP BY id_NF, Cod_Produto;

/*ATIVIDADE 9 */ 
SELECT id_NF AS valor_total FROM tb_vendas
WHERE id_NF > 500
GROUP BY id_NF, valor_total
ORDER BY id_NF DESC; 

/*ATIVIDADE 10 */ 
SELECT Cod_Produto, 
AVG  (Desconto)
as media 
FROM tb_vendas 
GROUP BY Cod_Produto ; 

/*ATIVIDADE 11 */ 
SELECT Cod_Produto, 
AVG  (Desconto)
as media ,
AVG (min) 
as Menor , 
AVG (max) 
as Maior 
FROM tb_vendas 
GROUP BY  Menor ;

/*ATIVIDADE 12 */ 
SELECT id_NF ,
count (id_NF) as quantidade 
FROM tb_vendas 
WHERE quantidade 
GROUP BY id_NF;