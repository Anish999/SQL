
------COMPUTED COLUMN-----
CREATE TABLE EmployerTable(
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	fullname AS (firstname+ ' '+lastname) PERSISTED
)

SELECT * FROM EmployerTable