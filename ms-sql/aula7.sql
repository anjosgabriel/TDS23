/*
AULA 7
29/05/2023

- COMANDO DE MANIPULAÇÃO DE TEXTO
- COMANDO DE REPLAYS DE TEXTO
- VIEW
*/

USE AdventureWorks2012

SELECT * FROM Person.Person

-- QUERO APENAS OS PRIMEIROS NOMES QUE ESTEJAM EM LETRA MAIÚSCULA
SELECT FirstName, UPPER(FirstName) FROM Person.Person

-- AGORA, OS PRIMEIROS NOMES EM LETRA MAIÚSCULA, MAS EU QUERO OS ÚLTIMOS NOMES QUE ESTEJAM EM LETRA MINÚSCULA
SELECT FirstName, UPPER(FirstName), LastName, LOWER(LastName) FROM Person.Person

-- Lenght ( Tamanho ) - SIGLA : LEN

SELECT FirstName, LEN(FirstName) FROM Person.Person

-- QUANDO O PRIMEIRO NOME TEM DE DOIS CARACTERES PARA BAIXO
SELECT FirstName, LEN(FirstName) FROM Person.Person
WHERE LEN(FirstName) <= 2

-- OBS: SUBSTRING (é utilizada quando queremos extrair um pequeno trecho de uma string de tamanho maior) --
-- QUERO OS SEGUNDO CARACTERES DE CADA NOME :
SELECT FirstName, SUBSTRING(FirstName,2,1) FROM Person.Person

SELECT FirstName, SUBSTRING(FirstName,2,1) FROM Person.Person
WHERE SUBSTRING(FirstName,2,1) = '.'

SELECT FirstName, SUBSTRING(FirstName,1,1) FROM Person.Person

-- REPLACE --

SELECT * FROM Production.Product

SELECT ProductNumber, REPLACE(ProductNumber, '-', '-2023-') FROM Production.Product

-- VIEW --

SELECT FirstName, MiddleName, LastName FROM Person.Person

CREATE VIEW NOMES AS 
SELECT FirstName, MiddleName, LastName FROM Person.Person
WHERE Title = 'Mr.'

SELECT * FROM NOMES 
ORDER BY 3 DESC 

CREATE OR ALTER VIEW NOMES AS 
SELECT FirstName, MiddleName, LastName FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM Person.Person
SELECT * FROM Person.EmailAddress

CREATE OR ALTER VIEW EMAILS AS 
SELECT A.BusinessEntityID, A.FirstName, B.EmailAddress 
FROM Person.Person AS A 
INNER JOIN Person.EmailAddress AS B 
ON A.BusinessEntityID = B.BusinessEntityID

SELECT * FROM EMAILS

SELECT Person.Person.*, EMAILS.* FROM Person.Person, EMAILS 
WHERE Person.BusinessEntityID = EMAILS.BusinessEntityID

-- PARA APAGAR A VIEW : DROP VIEW + NOME DA VIEW --

SELECT * FROM NOMES 

DROP VIEW NOMES 