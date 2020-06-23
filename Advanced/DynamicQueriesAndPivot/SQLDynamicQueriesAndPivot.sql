use Test

-------Dynamic  Queries and Pivot--------
-----------------------------------------

SELECT * FROM orders

----PIVOT-----
SELECT CountryCode, [3], [4]
FROM orders
pivot
(
	sum(amount) for CustomerID
	in ([3],[4],[9])
)
AS pvt

---Dynamic Queries-----
DECLARE @sqlstring varchar(2000)
SET @sqlstring = 'Select CountryCode, [CustomerID], '
SET @sqlstring = @sqlstring + 'Amount FROM orders'
PRINT @sqlstring

EXEC (@sqlstring)