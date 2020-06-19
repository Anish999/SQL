USE Test

--show all customers
SELECT * FROM [dbo].[Customer]

--show all orders
SELECT * FROM [dbo].[Orders]

--show distinct salespersonid from orders table
SELECT DISTINCT SalespersonID FROM [dbo].[Orders]

--show name of salesperson that has a letter 'd' in it
SELECT Name FROM [dbo].[Salesperson]
WHERE Name LIKE '%D%'

SELECT * FROM [dbo].[Salesperson]

SELECT * FROM [dbo].[Salesperson]
WHERE Salary > 40000

--Give all salesperson who are hired after Jan 01 1995
SELECT * FROM [dbo].[Salesperson] where DateHired > '1/1/1999'

--Give all salesperson who are hired after Jan 01 1995 and before jan 01 1998
SELECT * FROM [dbo].[Salesperson] where DateHired > '1/1/1995' AND DateHired< '1/1/1998'
SELECT * FROM [dbo].[Salesperson] where DateHired BETWEEN '1/1/1995' AND '1/1/1998'

---CALCULATED COLUMNS
SELECT CustomerID, Amount, CustomerId*Amount as Total FROM [dbo].[Orders]

--INTO -> Creates new table Orders_2 which will have columns CustomerId, Amount and Total which is CustomerId*Amount
SELECT CustomerID, Amount, CustomerId*Amount as Total INTO [dbo].[Orders_2] FROM [dbo].[Orders]

--permanent table
SELECT * from [dbo].[Orders_2]

--temp tables
SELECT CustomerID, Amount, CustomerId*Amount as Total INTO #tempName FROM [dbo].[Orders]

SELECT Amount FROM #tempName


---DELETE DATA From TABLE

DELETE FROM [dbo].[Orders_2]
WHERE CustomerID = 1


---UPDATE

UPDATE [dbo].[Orders_2]
SET CustomerID = 10
WHERE CustomerID = 4