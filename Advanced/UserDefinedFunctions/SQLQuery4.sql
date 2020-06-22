use Test
------User Defined Functions-----
---------------------------------
SELECT * FROM [dbo].[Orders]

CREATE FUNCTION PRODUCT()
RETURNS INT
AS 
BEGIN
DECLARE @PRODUCT INT
SELECT @PRODUCT = SUM(CustomerID) FROM [dbo].[Orders]
RETURN @PRODUCT
END

DECLARE @PRODUCT AS INT
SELECT @PRODUCT = dbo.PRODUCT()
PRINT @PRODUCT



-------DROP FUNCTIONS------
DROP FUNCTION PRODUCT
DROP FUNCTION NewProduct



---Parameterized Functions-----
SELECT * FROM [dbo].[Orders]

CREATE FUNCTION NewProduct(@GROUP INT)

RETURNS INT
AS
BEGIN
DECLARE @PRODUCT AS INT
SELECT @PRODUCT = SUM(SalespersonID) FROM [dbo].[Orders]
WHERE [CustomerID]>@GROUP
RETURN @PRODUCT
END

DECLARE @RESULTS INT
SELECT @RESULTS = dbo.NewProduct(2)
PRINT @RESULTS



-----FUNCTIONS RETURNING TABLES------
CREATE FUNCTION EXAMPLE(@NUMBER INT)
RETURNS TABLE
AS RETURN
SELECT [OrderId], [OrderDate], [Amount] FROM [dbo].[Orders]
WHERE CustomerID = @NUMBER

SELECT * FROM EXAMPLE(1)
