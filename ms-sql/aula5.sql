/*
25/05/2023

AULA DE JOINS

INNER JOIN
LEFT JOIN (ou LEFT OUTER JOIN)
RIGHT JOIN (ou RIGHT OUTER JOIN)
FULL JOIN (ou FULL OUTER JOIN)
CROSS JOIN

*/


CREATE DATABASE AulaJoin

USE AulaJoin 

CREATE TABLE TabelaA(
    ID int,
    Nome varchar(10)
);

CREATE TABLE TabelaB(
    ID int,
    Nome varchar(10)
);

INSERT INTO TabelaA(ID, Nome)
VALUES (1, 'Robo');

INSERT INTO TabelaA(ID, Nome)
VALUES (2, 'Macaco');

INSERT INTO TabelaA(ID, Nome)
VALUES (3, 'Samurai');

INSERT INTO TabelaA(ID, Nome)
VALUES (4, 'Mario');


INSERT INTO TabelaB(ID, Nome)
VALUES (1, 'Robo');

INSERT INTO TabelaB(ID, Nome)
VALUES (2, 'Macaco');

INSERT INTO TabelaB(ID, Nome)
VALUES (3, 'Samurai');

INSERT INTO TabelaB(ID, Nome)
VALUES (4, 'Mario');

SELECT * FROM TabelaA
SELECT * FROM TabelaB

-- INNER JOIN --
SELECT * FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

-- FULL OUTER JOIN --
SELECT * FROM TabelaA A
FULL OUTER JOIN TabelaB B
ON A.Nome = B.Nome

-- LEFT JOIN --
SELECT * FROM TabelaA A
LEFT JOIN TabelaB B
ON A.Nome = B.Nome
WHERE B.Nome IS NULL

-- UNION --
USE AdventureWorks2012

SELECT ProductID, name, ProductNumber FROM Production.Product
WHERE Name LIKE '%CHAI%'
UNION
SELECT ProductID, name, ProductNumber FROM Production.Product
WHERE Name LIKE '%DECAL%'
ORDER BY Name DESC