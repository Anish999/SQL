

--------STORED PROCEDURE--------

--EXAMPLE ONE--
CREATE PROCEDURE MyTestProc
AS
SET NOCOUNT ON
SELECT * FROM [dbo].[Orders]

EXECUTE MyTestProc

--EXAMPLE TWO--
CREATE PROCEDURE MyTestProc2
AS
SET NOCOUNT OFF
SELECT * FROM [dbo].[Orders]

EXECUTE MyTestProc2


--DROP PROCEDURES--

DROP PROC MyTestProc
DROP PROC MyTestProc2
DROP PROC MyFirstParamProc
DROP PROC MyFirstParamProc2
DROP PROC MyOutputSP
DROP PROC mySumReturnSP


-----------------------------
------PARAMETERIZED----------
-----------------------------

CREATE PROCEDURE MyFirstParamProc2
@Param_Name int = 500
AS
SET NOCOUNT ON
SELECT * FROM [dbo].[Orders]
WHERE Amount>@Param_Name

EXECUTE MyFirstParamProc2 @Param_Name = 2000

--OutPUT Parameters
CREATE PROCEDURE MyOutputSP
@TopAmount varchar(50) OUTPUT
AS
SET @TopAmount = ( SELECT TOP(1) Amount FROM [dbo].[Orders])

DECLARE @outputresult VARCHAR(50)
EXECUTE MyOutputSP @outputresult output
SELECT @outputresult


--RETURN OUTPUT--
CREATE PROC myFirstReturnSP
AS
RETURN 12

DECLARE @returnvalue INT
EXEC @returnvalue = myFirstReturnSP
SELECT @returnvalue

---RETURN SUM OF PARAMETERS--
CREATE PROC mySumReturnSP
@Param_X int = 500,
@Param_Y int = 500
AS
RETURN @Param_X + @Param_Y

DECLARE @returnvalue INT
EXEC @returnvalue = mySumReturnSP @Param_X=20, @Param_Y=30
SELECT @returnvalue
