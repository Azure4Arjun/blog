Use Master
Create Database RowLevelSecurity

USE [master]
GO
CREATE LOGIN [user1] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [RowLevelSecurity]
GO
CREATE USER [user1] FOR LOGIN [user1]
GO
USE [RowLevelSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user1]
GO

USE [master]
GO
CREATE LOGIN [user2] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [RowLevelSecurity]
GO
CREATE USER [user2] FOR LOGIN [user2]
GO
USE [RowLevelSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user2]
GO


USE [master]
GO
CREATE LOGIN [user3] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [RowLevelSecurity]
GO
CREATE USER [user3] FOR LOGIN [user3]
GO
USE [RowLevelSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user3]
GO


USE [master]
GO
CREATE LOGIN [user4] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [RowLevelSecurity]
GO
CREATE USER [user4] FOR LOGIN [user4]
GO
USE [RowLevelSecurity]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user4]
GO


Use Master
Drop database RowLevelSecurity

USE [master]
GO

/****** Object:  Login [user1]    Script Date: 10/9/2015 8:22:50 AM ******/
DROP LOGIN [user1]
GO
DROP LOGIN [user2]
GO
DROP LOGIN [user3]
GO
DROP LOGIN [user4]
GO