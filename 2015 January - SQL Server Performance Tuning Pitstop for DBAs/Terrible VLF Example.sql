Set Statistics Time ON

CREATE DATABASE [FireMeVLF]
 ON  PRIMARY 
( NAME = N'FireMeVLF', FILENAME = N'Z:\SQLDATA\FireMeVLF.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FireMeVLF_log', FILENAME = N'Y:\SQLLOGS\FireMeVLF_log.ldf' , SIZE = 1MB , MAXSIZE = 400MB,FILEGROWTH = 1KB)
GO

ALTER database FiremeVLF SET RECOVERY FULL



USE FireMEVLF
GO

BACKUP DATABASE FireMeVLF to DISK = 'NUL'

Create Table WorstTable
(Data char(8000))
GO

SET NOCOUNT ON

Insert into WorstTable Values ('Terrible DBA')
Go 1000

declare @counter int = 1
Declare @counter2 int = 0

While @counter < 100000
BEGIN
Delete from WorstTable

	WHILE @counter2<1000
	BEGIN
		Insert into WorstTable Values ('Terrible DBA')
		set @counter2 +=1
	END

set @counter2=0
set @counter +=1
END
---takes 2 minutes
DBCC LOGINFO
---1600 VLFs


CREATE DATABASE [FireMeVLF2]
 ON  PRIMARY 
( NAME = N'FireMeVLF2', FILENAME = N'Z:\SQLDATA\FireMeVLF2.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FireMeVLF2_log', FILENAME = N'Y:\SQLLOGS\FireMeVLF2_log.ldf' , SIZE = 400MB , MAXSIZE = 400MB,FILEGROWTH = 1KB)
GO
---takes 4 seconds

ALTER database FiremeVLF2 SET RECOVERY FULL

USE FireMEVLF2
GO

BACKUP DATABASE FireMeVLF2 to DISK = 'NUL'

Create Table WorstTable
(Data char(8000))
GO


SET NOCOUNT ON

Insert into WorstTable Values ('Terrible DBA')
Go 1000

declare @counter int = 1
Declare @counter2 int = 0

While @counter < 100000
BEGIN
Delete from WorstTable

	WHILE @counter2<1000
	BEGIN
		Insert into WorstTable Values ('Terrible DBA')
		set @counter2 +=1
	END
set @counter2=0
set @counter +=1
END
---Takes 10 seconds

DBCC LOGINFO
---8 VLFs

USE master
BACKUP LOG FIREMEVLF
TO DISK = 'X:\SQLBACKUPS\FIREMEVLF.bak'
WITH COMPRESSION
---Takes 9 seconds

USE master
BACKUP LOG FIREMEVLF2
TO DISK = 'X:\SQLBACKUPS\FIREMEVLF2.bak'
WITH COMPRESSION
---Takes 3 seconds

---Create an open transaction to demonstrate longer recovery time
USE FireMeVLF

SET NOCOUNT ON
Begin Transaction

declare @counter int = 1
Declare @counter2 int = 0

While @counter < 100000
BEGIN
Delete from WorstTable

	WHILE @counter2<1000
	BEGIN
		Insert into WorstTable Values ('Terrible DBA')
		set @counter2 +=1
	END

set @counter2=0
set @counter +=1
END
---Takes 25-28 Seconds
---No end
--ROLLBACK Transaction

---Take this to a new window
DBCC LOGINFO
DBCC SQLPERF (LOGSPACE)


USE FireMeVLF2

SET NOCOUNT ON
Begin Transaction

declare @counter int = 1
Declare @counter2 int = 0

While @counter < 100000
BEGIN
Delete from WorstTable

	WHILE @counter2<1000
	BEGIN
		Insert into WorstTable Values ('Terrible DBA')
		set @counter2 +=1
	END

set @counter2=0
set @counter +=1
END

--Takes 20-25 seconds

--ROLLBACK TRANSACTION


EXEC sp_cycle_errorlog ;
GO
exec sp_readerrorlog

alter database FireMeVLF SET OFFLINE 
alter database FireMeVLF2 SET OFFLINE

alter database FireMeVLF SET ONLINE
--4 seconds
alter database FireMeVLF2 SET ONLINE
--~0 seconds

----CLEAN UP
USE master
DROP database [FireMeVLF]
DROP database [FireMeVLF2]