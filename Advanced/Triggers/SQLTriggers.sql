SELECT * FROM [dbo].[Orders]

------------------TRIGGERS----------------

CREATE TRIGGER Demo_Trigger
ON [dbo].[Orders]
AFTER INSERT
AS
BEGIN
PRINT ' INSERT is not allowed, you need APPROVAL '
ROLLBACK TRANSACTION
END 
GO


----Test Trigger---
INSERT INTO [dbo].[Orders]
([OrderID],[OrderDate],[CustomerID],[SalespersonID],[Amount],[CountryCode])
VALUES
(14, GETDATE(),1, 4, 200.00, 'UK')


---Database level Trigger ----
Create TRIGGER Demo_DbTrigger
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
PRINT 'CREATION OF NEW TABLES NOT ALLOWED'
ROLLBACK TRANSACTION
END
GO
---- Test Trigger 2 ----
CREATE TABLE MyDemoTable(Col1 varchar(10))
