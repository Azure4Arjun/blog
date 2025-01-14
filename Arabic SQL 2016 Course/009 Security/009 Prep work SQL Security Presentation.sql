----Prep for presentation

CREATE DATABASE SecurityTest

USE SecurityTest

CREATE TABLE RestrictedLogons
(login sysname not null,
timestamp datetime not null)


DECLARE @counter INT = 1
declare @sql varchar(max) = ''

WHILE @counter <> 100
BEGIN 

set @sql=''
set @sql= 'CREATE PROCEDURE PR_00'+CAST(@counter AS VARCHAR(10))+'_PROCEDURE as select 1 go'
exec (@sql)

SET @counter = @counter + 1

END


--clean up

USE SecurityTest

DECLARE @counter INT = 1
declare @sql varchar(max) = ''

WHILE @counter <> 100
BEGIN 

set @sql=''
set @sql= 'drop PROCEDURE PR_00'+CAST(@counter AS VARCHAR(10))+'_PROCEDURE'
exec (@sql)

SET @counter = @counter + 1

END