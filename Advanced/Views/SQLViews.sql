SELECT * FROM [Test].[dbo].[Orders]

--VIEWS--

--Creating Views from the Orders Table where country code is 'US'
CREATE VIEW OrdersView
AS 
SELECT * FROM [Test].[dbo].[Orders]
WHERE CountryCode LIKE 'US'
--displaythe OrdersView
SELECT * FROM OrdersView


--Create Views by joining tables Orders and SalesPersons where the SalesPersonsIdMatch
CREATE VIEW SalespersonView
AS
SELECT [OrderID],[OrderDate], [Amount], [Name], [DateHired]
FROM [Test].[dbo].[Orders] A INNER JOIN [dbo].[Salesperson] B
ON A.SalespersonID = B.SalesPersonID
--Display SalespersonView 
SELECT * FROM SalespersonView