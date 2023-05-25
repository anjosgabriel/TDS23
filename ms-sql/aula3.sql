SELECT * FROM PERSON.PERSON
WHERE BusinessEntityID = 12
OR BusinessEntityID = 19
OR BusinessEntityID = 123

/*

LEGENDAS

AND - E
OR - OU 
NOT - ACOMPANHANDO

=
>
<
<>
>=
<=

*/

SELECT * FROM Production.Product
WHERE Weight > 500  
AND Weight <= 700

SELECT Production.Product.Weight FROM Production.Product
WHERE Weight > 500  
AND Weight <= 700

SELECT * from HumanResources.Employee
where MaritalStatus = 'M'
AND SalariedFlag = 1

SELECT * FROM HumanResources.Employee
where BirthDate <= '1983/01/01'

SELECT * FROM Person.Person
where FirstName = 'Peter'
And LastName = 'Krebs'

SELECT * FROM Person.EmailAddress
where BusinessEntityID = '26'

SELECT Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress
FROM Person.Person, Person.EmailAddress
WHERE PERSON.BusinessEntityID = EmailAddress.BusinessEntityID
AND Person.BusinessEntityID = 26

SELECT COUNT(*) From Production.Product

SELECT DISTINCT NAME From Production.Product

SELECT distinct title FROM Person.Person

SELECT COUNT(TITLE) FROM Person.Person
WHERE Title = 'Ms.'
SELECT DISTINCT TITLE FROM Person.Person

SELECT ListPrice FROM Production.Product
WHERE ListPrice >= 1000
AND ListPrice <= 1500

SELECT LISTPRICE FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500

SELECT * FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009' AND '2010'

SELECT * FROM Person.Person
WHERE BusinessEntityID IN (5, 111, 23)

SELECT * FROM Person.Person
WHERE FirstName LIKE 'G%A'
AND LastName LIKE 'O%'

-- QUANTOS PRODUTOS TEMOS NO BD ACIMA DE 1500 --
SELECT COUNT (*) FROM Production.Product

--QUANTAS PESSOAS TEM O SOBRENOME QUE COMEÇA COM A LETRA P--
SELECT COUNT(*) FROM Person.Person
WHERE LastName LIKE 'P%'

-- EM QUANTAS CIDADES UNICAS ESTAO OS CLIENTES --
SELECT  COUNT (DISTINCT CITY) FROM Person.Address 
