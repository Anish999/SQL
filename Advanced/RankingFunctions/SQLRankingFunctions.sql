use CDC
-----------RANKNG FUNCTIONS---------
------------------------------------

SELECT UserEmail, UserZip FROM [dbo].[RaUser]
WHERE UserZip IN ('70112', '70122', '70458')


SELECT UserEmail, UserZip ,
ROW_NUMBER() OVER (ORDER BY UserZip) AS 'ROW NUMBER',
RANK() OVER (ORDER BY UserZip) AS 'RANK',
DENSE_RANK() OVER (ORDER BY UserZip) AS 'DENSE RANK',
NTILE(10) OVER (ORDER BY UserZip) AS 'NTILE'
FROM [dbo].[RaUser]
WHERE UserZip IN ('70112', '70122', '70458')