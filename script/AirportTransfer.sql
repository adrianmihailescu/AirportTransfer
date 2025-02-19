USE [AirportTransfer]
GO
/****** Object:  ForeignKey [FK_Delegation_CostCenter]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_CostCenter]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] DROP CONSTRAINT [FK_Delegation_CostCenter]
GO
/****** Object:  ForeignKey [FK_Delegation_Employee]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] DROP CONSTRAINT [FK_Delegation_Employee]
GO
/****** Object:  ForeignKey [FK_Flight_Airline]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airline]
GO
/****** Object:  ForeignKey [FK_Flight_Airport]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airport]
GO
/****** Object:  ForeignKey [FK_Flight_Airport1]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airport1]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_Delegation]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Delegation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_Delegation]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_Flight]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Flight]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_Flight]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_TaxiCompany]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_TaxiCompany]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_TaxiCompany]
GO
/****** Object:  Table [dbo].[TaxiBooking]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Delegation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_Delegation]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Flight]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_Flight]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_TaxiCompany]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] DROP CONSTRAINT [FK_TaxiBooking_TaxiCompany]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxiBooking]') AND type in (N'U'))
DROP TABLE [dbo].[TaxiBooking]
GO
/****** Object:  StoredProcedure [dbo].[GetScheduledDelegationsForToday]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetScheduledDelegationsForToday]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetScheduledDelegationsForToday]
GO
/****** Object:  Table [dbo].[Delegation]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_CostCenter]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] DROP CONSTRAINT [FK_Delegation_CostCenter]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] DROP CONSTRAINT [FK_Delegation_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delegation]') AND type in (N'U'))
DROP TABLE [dbo].[Delegation]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airline]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airport]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Airport1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Flight]') AND type in (N'U'))
DROP TABLE [dbo].[Flight]
GO
/****** Object:  StoredProcedure [dbo].[GetAirLinePreviewImage]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAirLinePreviewImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAirLinePreviewImage]
GO
/****** Object:  StoredProcedure [dbo].[GetAirLinePreviewImageByName]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAirLinePreviewImageByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAirLinePreviewImageByName]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeePreviewImage]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEmployeePreviewImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetEmployeePreviewImage]
GO
/****** Object:  Table [dbo].[TaxiCompany]    Script Date: 06/10/2013 14:55:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxiCompany]') AND type in (N'U'))
DROP TABLE [dbo].[TaxiCompany]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[AirLine]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AirLine]') AND type in (N'U'))
DROP TABLE [dbo].[AirLine]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Airport]') AND type in (N'U'))
DROP TABLE [dbo].[Airport]
GO
/****** Object:  Table [dbo].[CostCenter]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CostCenter]') AND type in (N'U'))
DROP TABLE [dbo].[CostCenter]
GO
/****** Object:  StoredProcedure [dbo].[LogError]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LogError]
GO
/****** Object:  StoredProcedure [dbo].[LogOperation]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogOperation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LogOperation]
GO
/****** Object:  Table [dbo].[_AppError]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_AppError]') AND type in (N'U'))
DROP TABLE [dbo].[_AppError]
GO
/****** Object:  Table [dbo].[_OperationsLog]    Script Date: 06/10/2013 14:55:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_OperationsLog]') AND type in (N'U'))
DROP TABLE [dbo].[_OperationsLog]
GO
/****** Object:  User [AirportTransfer]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'AirportTransfer')
DROP USER [AirportTransfer]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [AirportTransfer]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'AirportTransfer')
DROP LOGIN [AirportTransfer]
GO
/****** Object:  Login [BookManagement]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BookManagement')
DROP LOGIN [BookManagement]
GO
/****** Object:  Login [ENDAVA\amihailescu]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ENDAVA\amihailescu')
DROP LOGIN [ENDAVA\amihailescu]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [NT SERVICE\MSSQL$SQL2008R2]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQL$SQL2008R2')
DROP LOGIN [NT SERVICE\MSSQL$SQL2008R2]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$SQL2008R2]    Script Date: 06/10/2013 14:55:43 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLAgent$SQL2008R2')
DROP LOGIN [NT SERVICE\SQLAgent$SQL2008R2]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 06/10/2013 14:55:43 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'yìW¹ðYÏè ïþctw´±nzËyÏ×h6h±ï', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 06/10/2013 14:55:43 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Jx¹w¨V`ui?]¡!ø
à;?!²õ¥þU', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [AirportTransfer]    Script Date: 06/10/2013 14:55:43 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'AirportTransfer')
CREATE LOGIN [AirportTransfer] WITH PASSWORD=N'ß@j]«O}åê>Ñ+ÑpitÝM%Bj´I', DEFAULT_DATABASE=[AirportTransfer], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [AirportTransfer] DISABLE
GO
/****** Object:  Login [BookManagement]    Script Date: 06/10/2013 14:55:43 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BookManagement')
CREATE LOGIN [BookManagement] WITH PASSWORD=N'L8æàé)=Û@Ê>~¨ïÉYÇ´!¼T ]ãi', DEFAULT_DATABASE=[BookManagement], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [BookManagement] DISABLE
GO
/****** Object:  Login [ENDAVA\amihailescu]    Script Date: 06/10/2013 14:55:43 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ENDAVA\amihailescu')
CREATE LOGIN [ENDAVA\amihailescu] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 06/10/2013 14:55:43 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQL$SQL2008R2]    Script Date: 06/10/2013 14:55:43 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQL$SQL2008R2')
CREATE LOGIN [NT SERVICE\MSSQL$SQL2008R2] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$SQL2008R2]    Script Date: 06/10/2013 14:55:43 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLAgent$SQL2008R2')
CREATE LOGIN [NT SERVICE\SQLAgent$SQL2008R2] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
USE [AirportTransfer]
GO
/****** Object:  User [AirportTransfer]    Script Date: 06/10/2013 14:55:43 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'AirportTransfer')
CREATE USER [AirportTransfer] FOR LOGIN [AirportTransfer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[_OperationsLog]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_OperationsLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_OperationsLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[UserName] [nvarchar](1000) NULL,
	[HostName] [nvarchar](100) NULL,
	[Query] [nvarchar](max) NULL,
	[Table] [nvarchar](1000) NULL,
 CONSTRAINT [PK_OperationsLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_AppError]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_AppError]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_AppError](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Url] [varchar](max) NULL,
	[Message] [varchar](max) NULL,
	[InnerException] [varchar](max) NULL,
	[StackTrace] [varchar](max) NULL,
	[Source] [varchar](max) NULL,
 CONSTRAINT [PK__AppErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[LogOperation]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogOperation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[LogOperation]
(
@operation varchar(1000)
, @table varchar(1000)
, @message varchar(max)
)
as
begin
		select
					getdate() [Date]
		, suser_sname() UserName
		, host_name() HostName
	, @operation + '' '' + @table +  '': '' + @message [Query]
	, @table [Table]
	
	into #t1
	-- from inserted a
	
	-- from inserted a)
	
	-- update [Airport] set FlagDel = 0 where FlagDel is null
	
	insert into _OperationsLog
	select * from #t1
	
	drop table #t1
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[LogError]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[LogError]
(
	@ErrorNumber int output
	, @Date datetime
	, @Url varchar(max)
	, @Message varchar(max)
	, @InnerException varchar(max)
	, @StackTrace varchar(max)
	, @Source varchar(max)
)

as
begin
	insert into _AppError
	values
	(
		getdate()
		, @Url
		, @Message
		, @InnerException
		, @StackTrace
		, @Source
	)
	
	set @ErrorNumber = @@identity
end' 
END
GO
/****** Object:  Table [dbo].[CostCenter]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CostCenter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CostCenter](
	[IDCostCenter] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[ProjectCode] [nvarchar](1000) NOT NULL,
	[BusinessUnit] [nvarchar](1000) NOT NULL,
	[Reason] [nvarchar](1000) NOT NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_CostCenter] PRIMARY KEY CLUSTERED 
(
	[IDCostCenter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Airport]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Airport](
	[IDAirport] [int] IDENTITY(1,1) NOT NULL,
	[FullName]  AS (([code]+' - ')+[name]),
	[Code] [varchar](100) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[City] [varchar](1000) NOT NULL,
	[Address] [varchar](1000) NOT NULL,
	[ContactPhone] [varchar](1000) NULL,
	[Remarks] [varchar](1000) NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [IDAirport] PRIMARY KEY CLUSTERED 
(
	[IDAirport] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AirLine]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AirLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AirLine](
	[IDAirLine] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[Picture] [image] NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IDAirLine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[IDEmployee] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[PhoneNumber] [varchar](1000) NOT NULL,
	[CNP] [varchar](1000) NOT NULL,
	[Email] [varchar](1000) NOT NULL,
	[Picture] [image] NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxiCompany]    Script Date: 06/10/2013 14:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxiCompany]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaxiCompany](
	[IDTaxiCompany] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[PhoneNumber] [varchar](1000) NOT NULL,
	[Address] [varchar](1000) NOT NULL,
	[Rating] [varchar](1000) NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_TaxiCompany] PRIMARY KEY CLUSTERED 
(
	[IDTaxiCompany] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [t2_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t2_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t2_instead_of_delete] on [dbo].[CostCenter] instead of delete
as
begin
	update [CostCenter]
	
	set FlagDel = 1
	
	from [CostCenter] a
	
	inner join deleted b
	on a.IDCostCenter = b.IDCostCenter
	
			-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDCostCenter as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[CostCenter]''
		, @message
end
'
GO
/****** Object:  Trigger [t2_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t2_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t2_after_update] on [dbo].[CostCenter] after UPDATE
as
begin
		declare @message varchar(max)
	select @message = cast(a.IDCostCenter as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ProjectCode, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.BusinessUnit, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Reason, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[CostCenter]''
		, @message
	
end
'
GO
/****** Object:  Trigger [t2_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t2_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t2_after_insert] on [dbo].[CostCenter]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDCostCenter as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ProjectCode, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.BusinessUnit, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Reason, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[CostCenter]''
		, @message
	
	update [CostCenter] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Trigger [t1_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t1_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t1_instead_of_delete] on [dbo].[Airport] instead of delete
as
begin
	update [Airport]
	
	set FlagDel = 1
	
	from [Airport] a
	
	inner join deleted b
	on a.IDAirport = b.IDAirport
	
	declare @message varchar(max)
	select @message = cast(a.IDAirport as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[Airport]''
		, @message
end
'
GO
/****** Object:  Trigger [t1_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t1_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t1_after_update] on [dbo].[Airport] after UPDATE
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDAirport as nvarchar(1000))
	+ '', '' + cast (isnull(a.FullName, '''') as nvarchar(1200))
	+ '', '' + cast (isnull(a.Code, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.City, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.[Address], '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ContactPhone, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Remarks, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[Airport]''
		, @message
	
end
'
GO
/****** Object:  Trigger [t1_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t1_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t1_after_insert] on [dbo].[Airport]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDAirport as nvarchar(1000))
	+ '', '' + cast (isnull(a.FullName, '''') as nvarchar(1200))
	+ '', '' + cast (isnull(a.Code, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.City, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.[Address], '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ContactPhone, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Remarks, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[Airport]''
		, @message
	
	update [Airport] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Trigger [t8_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t8_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t8_instead_of_delete] on [dbo].[AirLine] instead of delete
as
begin
			update [AirLine]
	
	set FlagDel = 1
	
	from [AirLine] a
	
	inner join deleted b
	on a.IDAirLine = b.IDAirLine
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDAirLine as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[AirLine]''
		, @message
end
'
GO
/****** Object:  Trigger [t8_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t8_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t8_after_update] on [dbo].[AirLine] after UPDATE
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDAirLine as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[AirLine]''
		, @message
end
'
GO
/****** Object:  Trigger [t8_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t8_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t8_after_insert] on [dbo].[AirLine]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDAirLine as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[AirLine]''
		, @message
	
	update [AirLine] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Trigger [t7_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t7_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t7_instead_of_delete] on [dbo].[TaxiCompany] instead of delete
as
begin
			update [TaxiCompany]
	
	set FlagDel = 1
	
	from [TaxiCompany] a
	
	inner join deleted b
	on a.IDTaxiCompany = b.IDTaxiCompany
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDTaxiCompany as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[TaxiCompany]''
		, @message
end
'
GO
/****** Object:  Trigger [t7_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t7_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t7_after_update] on [dbo].[TaxiCompany] after UPDATE
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDTaxiCompany as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PhoneNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.[Address], '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Rating, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[TaxiCompany]''
		, @message
end
'
GO
/****** Object:  Trigger [t7_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t7_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t7_after_insert] on [dbo].[TaxiCompany]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDTaxiCompany as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PhoneNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.[Address], '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Rating, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[TaxiCompany]''
		, @message
	
	update [TaxiCompany] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Trigger [t4_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t4_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t4_instead_of_delete] on [dbo].[Employee] instead of delete
as
begin
		update [Employee]
	
	set FlagDel = 1
	
	from [Employee] a
	
	inner join deleted b
	on a.IDEmployee = b.IDEmployee
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDEmployee as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[Employee]''
		, @message
end
'
GO
/****** Object:  Trigger [t4_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t4_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t4_after_update] on [dbo].[Employee] after UPDATE
as
begin
			declare @message varchar(max)
	select @message = cast(a.IDEmployee as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PhoneNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.CNP, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Email, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[Employee]''
		, @message
	
end
'
GO
/****** Object:  Trigger [t4_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t4_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t4_after_insert] on [dbo].[Employee]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast(a.IDEmployee as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PhoneNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.CNP, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Email, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[Employee]''
		, @message
	
	update [Employee] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeePreviewImage]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEmployeePreviewImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetEmployeePreviewImage](@id int)
-- returns varbinary(max)
as
begin

declare @result varbinary(max)
	
	set @result = (select top 1 [Picture] from [Employee] where IDEmployee = @id)	
	select @result result
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAirLinePreviewImageByName]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAirLinePreviewImageByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAirLinePreviewImageByName](@airline_name varchar(1000))
-- returns varbinary(max)
as
begin

declare @result varbinary(max)
	
	set @result = (select top 1 [Picture] from [AirLine] where name = @airline_name)	
	select @result result
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAirLinePreviewImage]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAirLinePreviewImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetAirLinePreviewImage](@id int)
-- returns varbinary(max)
as
begin

declare @result varbinary(max)
	
	set @result = (select top 1 [Picture] from [AirLine] where IDAirLine = @id)	
	select @result result
end
' 
END
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 06/10/2013 14:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Flight]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Flight](
	[IDFlight] [int] IDENTITY(1,1) NOT NULL,
	[IDAirline] [int] NOT NULL,
	[IDAirportFrom] [int] NOT NULL,
	[IDAirportTo] [int] NOT NULL,
	[FlightNumber] [varchar](1000) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[DepartureTime] [time](0) NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[ArrivalTime] [time](0) NOT NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[IDFlight] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delegation]    Script Date: 06/10/2013 14:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delegation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Delegation](
	[IDDelegation] [int] IDENTITY(1,1) NOT NULL,
	[IDCostCenter] [int] NOT NULL,
	[IDEmployee] [int] NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Country] [varchar](1000) NOT NULL,
	[City] [varchar](1000) NOT NULL,
	[Details] [varchar](4000) NULL,
	[TaxiReservationMade] [bit] NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_Delegation] PRIMARY KEY CLUSTERED 
(
	[IDDelegation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetScheduledDelegationsForToday]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetScheduledDelegationsForToday]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[GetScheduledDelegationsForToday]
(
@data datetime
)
as
begin
	select
	d.EndDate
	, d.IDDelegation
	into #t	
	from delegation d

	where
	cast(d.EndDate as date) = cast(@data as date) and isnull(d.FlagDel, 0) = 0
	
	
	select
	EndDate
	, count(IDDelegation) [total] from #t
	group by EndDate
	
	drop table #t
end' 
END
GO
/****** Object:  Trigger [t5_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t5_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t5_instead_of_delete] on [dbo].[Flight] instead of delete
as
begin
	update [Flight]
	
	set FlagDel = 1
	
	from [Flight] a
	
	inner join deleted b
	on a.IDFlight = b.IDFlight
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.[IDFlight] as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[Flight]''
		, @message
end
'
GO
/****** Object:  Trigger [t5_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t5_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t5_after_update] on [dbo].[Flight] after UPDATE
as
begin
				declare @message varchar(max)
	select @message = cast(a.IDFlight as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDAirportFrom, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDAirportTo, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlightNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DepartureDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DepartureTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ArrivalDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ArrivalTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[Flight]''
		, @message
	
end
'
GO
/****** Object:  Trigger [t5_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t5_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t5_after_insert] on [dbo].[Flight]
after insert
as
begin
		declare @message varchar(max)
	select @message = cast(a.IDFlight as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDAirportFrom, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDAirportTo, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlightNumber, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DepartureDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DepartureTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ArrivalDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ArrivalTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[Flight]''
		, @message
	
	update [Flight] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Trigger [t3_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t3_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t3_instead_of_delete] on [dbo].[Delegation] instead of delete
as
begin
	update [Delegation]
	
	set FlagDel = 1
	
	from [Delegation] a
	
	inner join deleted b
	on a.IDDelegation = b.IDDelegation
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDDelegation as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[Delegation]''
		, @message
end
'
GO
/****** Object:  Trigger [t3_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t3_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t3_after_update] on [dbo].[Delegation] after UPDATE
as
begin
			declare @message varchar(max)
	select @message = cast (isnull(a.IDDelegation, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDCostCenter, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDEmployee, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.StartDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.EndDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Country, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.City, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Details, '''') as nvarchar(4000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[Delegation]''
		, @message
end
'
GO
/****** Object:  Trigger [t3_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t3_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t3_after_insert] on [dbo].[Delegation]
after insert
as
begin
	declare @message varchar(max)
	select @message = cast (isnull(a.IDDelegation, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDCostCenter, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDEmployee, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Name, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.StartDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.EndDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Country, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.City, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Details, '''') as nvarchar(4000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[Delegation]''
		, @message

	
	update [Delegation] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  Table [dbo].[TaxiBooking]    Script Date: 06/10/2013 14:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxiBooking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaxiBooking](
	[IDTaxiBooking] [int] IDENTITY(1,1) NOT NULL,
	[IDTaxiCompany] [int] NOT NULL,
	[IDDelegation] [int] NOT NULL,
	[IDFlight] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[ReservationTime] [time](0) NOT NULL,
	[PickupAddress] [varchar](1000) NOT NULL,
	[DropAddress] [varchar](1000) NOT NULL,
	[NumberOfPersons] [int] NOT NULL,
	[PassengersName] [varchar](4000) NOT NULL,
	[Cost] [float] NULL,
	[Currency] [varchar](100) NULL,
	[Remarks] [varchar](4000) NULL,
	[FlagDel] [bit] NULL,
 CONSTRAINT [PK_TaxiBooking] PRIMARY KEY CLUSTERED 
(
	[IDTaxiBooking] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [t6_instead_of_delete]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t6_instead_of_delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t6_instead_of_delete] on [dbo].[TaxiBooking] instead of delete
as
begin
		update [TaxiBooking]
	
	set FlagDel = 1
	
	from [TaxiBooking] a
	
	inner join deleted b
	on a.IDTaxiBooking = b.IDTaxiBooking
	
	-- log operation
	
		declare @message varchar(max)
	select @message = cast(a.IDTaxiBooking as nvarchar(1000))
	from deleted a
	
		-- log operation
			exec LogOperation
		''delete from''
		, ''[TaxiBooking]''
		, @message
end
'
GO
/****** Object:  Trigger [t6_after_update]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t6_after_update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t6_after_update] on [dbo].[TaxiBooking] after UPDATE
as
begin
					declare @message varchar(max)
	select @message = cast(a.IDTaxiBooking as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDTaxiCompany, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDDelegation, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDFlight, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ReservationDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ReservationTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PickupAddress, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DropAddress, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.NumberOfPersons, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Cost, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Currency, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PassengersName, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Remarks, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a
	
		exec LogOperation
		''update''
		, ''[TaxiBooking]''
		, @message
end
'
GO
/****** Object:  Trigger [t6_after_insert]    Script Date: 06/10/2013 14:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[t6_after_insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[t6_after_insert] on [dbo].[TaxiBooking]
after insert
as
begin
			declare @message varchar(max)
	select @message = cast(a.IDTaxiBooking as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDTaxiCompany, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDDelegation, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.IDFlight, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ReservationDate, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.ReservationTime, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PickupAddress, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.DropAddress, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.NumberOfPersons, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Cost, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Currency, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.PassengersName, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.Remarks, '''') as nvarchar(1000))
	+ '', '' + cast (isnull(a.FlagDel, '''') as nvarchar(1000))
	from inserted a

	exec LogOperation
		''insert into''
		, ''[TaxiBooking]''
		, @message
		
	update d
	set TaxiReservationMade = 1

	from Delegation d

	inner join TaxiBooking r
	on d.IDDelegation = r.IDDelegation
	
	update [Flight] set FlagDel = 0 where FlagDel is null
end
'
GO
/****** Object:  ForeignKey [FK_Delegation_CostCenter]    Script Date: 06/10/2013 14:55:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_CostCenter]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation]  WITH CHECK ADD  CONSTRAINT [FK_Delegation_CostCenter] FOREIGN KEY([IDCostCenter])
REFERENCES [dbo].[CostCenter] ([IDCostCenter])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_CostCenter]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] CHECK CONSTRAINT [FK_Delegation_CostCenter]
GO
/****** Object:  ForeignKey [FK_Delegation_Employee]    Script Date: 06/10/2013 14:55:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation]  WITH CHECK ADD  CONSTRAINT [FK_Delegation_Employee] FOREIGN KEY([IDEmployee])
REFERENCES [dbo].[Employee] ([IDEmployee])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Delegation_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Delegation]'))
ALTER TABLE [dbo].[Delegation] CHECK CONSTRAINT [FK_Delegation_Employee]
GO
/****** Object:  ForeignKey [FK_Flight_Airline]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airline] FOREIGN KEY([IDAirline])
REFERENCES [dbo].[AirLine] ([IDAirLine])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airline]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airline]
GO
/****** Object:  ForeignKey [FK_Flight_Airport]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport] FOREIGN KEY([IDAirportFrom])
REFERENCES [dbo].[Airport] ([IDAirport])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport]
GO
/****** Object:  ForeignKey [FK_Flight_Airport1]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport1] FOREIGN KEY([IDAirportTo])
REFERENCES [dbo].[Airport] ([IDAirport])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Flight_Airport1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Flight]'))
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport1]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_Delegation]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Delegation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_TaxiBooking_Delegation] FOREIGN KEY([IDDelegation])
REFERENCES [dbo].[Delegation] ([IDDelegation])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Delegation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] CHECK CONSTRAINT [FK_TaxiBooking_Delegation]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_Flight]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Flight]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_TaxiBooking_Flight] FOREIGN KEY([IDFlight])
REFERENCES [dbo].[Flight] ([IDFlight])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_Flight]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] CHECK CONSTRAINT [FK_TaxiBooking_Flight]
GO
/****** Object:  ForeignKey [FK_TaxiBooking_TaxiCompany]    Script Date: 06/10/2013 14:55:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_TaxiCompany]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_TaxiBooking_TaxiCompany] FOREIGN KEY([IDTaxiCompany])
REFERENCES [dbo].[TaxiCompany] ([IDTaxiCompany])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxiBooking_TaxiCompany]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxiBooking]'))
ALTER TABLE [dbo].[TaxiBooking] CHECK CONSTRAINT [FK_TaxiBooking_TaxiCompany]
GO
