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


-- EXERCÍCIOS 
-- ID, FIRSTNAME, LASTNAME, EMAIL --


SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress FROM Person.Person P 
INNER JOIN Person.EmailAddress PE
ON P.BusinessEntityID = PE.BusinessEntityID

-- ALÉM DAS INFORMAÇÕES PRESENTES, AGORA TAMBÉM QUERO AS PROFISSÕES --

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress FROM Person.Person P 
INNER JOIN Person.EmailAddress PE
ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN HumanResources.Employee HR
ON P.BusinessEntityID = HR.BusinessEntityID
WHERE HR.JobTitle LIKE '%DESI%'


-- NOME DOS PRODUTOS E AS INFORMAÇÕES DE SUBCATEGORIA 
-- LISTPRICE NAME NOME SUBCATEGORIA
-- PRODUCT / PRODUCTSUBCATEGORY

SELECT * FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID

-- TRAZER O CLIENTE ID, TIPO DE TELEFONE, O ID DO TELEFONE, O NUMERO DO TELEFONE
-- PERSONPHONE E PHONENUMERTYPE --
 
SELECT * FROM Person.PersonPhone
SELECT * FROM Person.PhoneNumberType


SELECT PP.BusinessEntityID, PN.FirstName AS NOME, PT.Name, PP.PhoneNumberTypeID, PP.PhoneNumber FROM Person.PersonPhone AS PP
INNER JOIN Person.PhoneNumberType PT
ON PP.PhoneNumberTypeID = PT.PhoneNumberTypeID
INNER JOIN Person.Person AS PN 
ON PP.BusinessEntityID = PN.BusinessEntityID


-- PESSOAS QUE TEM O CARTAO DE CREDITO REGISTRADO --

SELECT PP.BusinessEntityID, PP.FirstName, CC.CreditCardID FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard CC
ON PP.BusinessEntityID = CC.BusinessEntityID

SELECT PP.BusinessEntityID, PP.FirstName, CC.CreditCardID, PE.EmailAddress FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard CC
ON PP.BusinessEntityID = CC.BusinessEntityID
INNER JOIN Person.EmailAddress PE
ON PP.BusinessEntityID = PE.BusinessEntityID
WHERE CC.CreditCardID IS NULL




-- SUBSELECT (QUANDO FAZ UM SELECT DENTRO DO OUTRO) --

SELECT * FROM Production.Product ORDER BY ListPrice DESC

SELECT AVG(LISTPRICE) FROM Production.Product

-- MEDIA = 438.6662 --

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice > 438.6662

-- FAZENDO O MESMO COMANDO QUE O DE CIMA, PORÉM USANDO O SUBSELECT --

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice > (SELECT AVG(LISTPRICE) FROM Production.Product)


-- Nome dos funcionarios que sao DesignEngineer --

SELECT * FROM Person.Person

SELECT * FROM HumanResources.Employee
WHERE JobTitle = 'DESIGN ENGINEER'

SELECT FirstName FROM Person.Person
WHERE BusinessEntityID IN (5,6,15)



SELECT FirstName FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'DESIGN ENGINEER')