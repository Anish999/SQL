

---------CommonTableExpressions---------------------
----------------------------------------------------

SELECT * FROM [dbo].[Orders]

WITH CTE_ORDERS
AS
(
	SELECT OrderId, OrderDate,CustomerID, Amount FROM [dbo].[Orders]
)

SELECT * FROM CTE_ORDERS
WHERE Amount>600



-------------GROUP BY ------------------------
----------------------------------------------

SELECT * FROM [dbo].[Orders]

SELECT OrderId, OrderDate, SUM(Amount)
FROM [dbo].[Orders]
GROUP BY OrderId, OrderDate


-----------GROUPING SETS----------
----------------------------------

SELECT OrderId, OrderDate, SUM(Amount)
FROM [dbo].[Orders]
GROUP BY GROUPING SETS
(
	(OrderID),
	(OrderID, OrderDate)
)


----------ROLL UP -------------
-------------------------------
SELECT OrderId, OrderDate, SUM(Amount)
FROM [dbo].[Orders]
GROUP BY ROLLUP
(
	(OrderID, OrderDate)
)


-------------CUBE-----------------
----------------------------------

SELECT OrderId, OrderDate, SUM(Amount)
FROM [dbo].[Orders]
GROUP BY CUBE
(
	(OrderID, OrderDate)
)