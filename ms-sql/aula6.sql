/*
26/05/2023

AULA DE EXERCÍCIOS

REVISÃO

*/

SELECT FirstName, Title, MiddleName FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, MiddleName, LastName FROM Person.Person
WHERE MiddleName = 'A'
AND Title IS NOT NULL
AND MiddleName IS NOT NULL
ORDER BY FirstName ASC


USE Pubs

SELECT * FROM dbo.employee

SELECT DISTINCT F1.fname, DATEPART(YEAR, F1.hire_date) AS [ANO ADMISSÃO]
FROM employee F1, employee F2 
WHERE DATEPART(YEAR, F1.hire_date) = DATEPART(YEAR, F2.hire_date)

USE AdventureWorks2012
-- MOSTRA A MEDIA MENSAL DE VALORES VENDIDOS

SELECT * FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue), DATEPART(MONTH, OrderDate) MES  FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY 2

SELECT AVG(TotalDue), DATEPART(YEAR, OrderDate) ANO  FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YEAR, OrderDate)
ORDER BY 2

-- QUAIS OS PRODUTOS ESTÃO ACIMA DA MEDIA DE VENDAS 
-- PRODUCTION.PRODUCT - ID, LISTPRICE
-- SUB SELECT - PRODUCTION.PRODUCT

SELECT ProductID, ListPrice FROM Production.Product AS P
WHERE ListPrice > (SELECT  AVG(ListPrice) FROM Production.Product)
ORDER BY 2