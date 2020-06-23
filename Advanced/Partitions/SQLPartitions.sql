----------PARTITIONS-----------
-------------------------------

-----create partition functions-----
CREATE PARTITION FUNCTION cust_part_func(int)
AS RANGE right
FOR VALUES (1000,2000,3000,4000,5000)

----create partition scheme-------
CREATE PARTITION scheme cust_part_scheme
AS PARTITION cust_part_func
TO (fgp1, fgp2, fgp3, fgp4, fgp5, fgp6)

----create table-----
CREATE TABLE partition
(EMPID int identity (1,1) not null,
EMPDate datetime null)
on cust_part_scheme(empid)

--While loop to fill in some data----
declare @i int
set @i=0
while @i<10000
begin
insert into [partition] (empdate) values (GETDATE())
set @i = @i + 1
end


----select table and show partition number-----
SELECT $partition.cust_part_func(empid) as 'partition number', * from [partition]