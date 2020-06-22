
------TRANSACTIONS AND ERROR HANDLING-------
--------------------------------------------
SELECT * FROM [dbo].[Orders]

BEGIN TRANSACTION
	UPDATE dbo.Orders
	SET Amount = 500.00
	WHERE CustomerID<5
COMMIT TRANSACTION

----@@error 0=success, >0 means error----
DECLARE @ERRORRES VARCHAR(50)
BEGIN TRANSACTION
INSERT INTO [dbo].[Orders](
	[OrderID],
	[OrderDate],
	[CustomerID],
	[SalespersonID],
	[Amount],
	[CountryCode]
)
	VALUES(
	1,
	GETDATE(),
	3,
	7,
	900.00,
	'CA'
	)
SET @ERRORRES = @@ERROR

IF(@ERRORRES = 0)
BEGIN
	PRINT 'SUCCESS'
	COMMIT TRANSACTION
END

ELSE
BEGIN
	PRINT 'STATEMENT FAILED!!!'
	ROLLBACK TRANSACTION
END


------CUSTOM ERROR MESSAGES------

DECLARE @ERRORRES VARCHAR(50)
BEGIN TRANSACTION
INSERT INTO [dbo].[Orders](
	[OrderID],
	[OrderDate],
	[CustomerID],
	[SalespersonID],
	[Amount],
	[CountryCode]
)
	VALUES(
	1,
	GETDATE(),
	3,
	7,
	900.00,
	'CA'
	)
SET @ERRORRES = @@ERROR

IF(@ERRORRES = 0)
BEGIN
	PRINT 'SUCCESS'
	COMMIT TRANSACTION
END

ELSE
BEGIN
	RAISERROR('STATEMENT FAILED- THIS IS A CUSTOM MESSAGE', 16, 1)
	ROLLBACK TRANSACTION
END


--------TRY AND  CATCH----------
--------------------------------
BEGIN TRY
BEGIN TRANSACTION

	INSERT INTO [dbo].[Orders](
	[OrderID],
	[OrderDate],
	[CustomerID],
	[SalespersonID],
	[Amount],
	[CountryCode]
)
	VALUES(
	1,
	GETDATE(),
	3,
	7,
	900.00,
	'CA'
	)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	PRINT 'CATCH STATEMENT ENTERED'
	ROLLBACK TRANSACTION
END CATCH
