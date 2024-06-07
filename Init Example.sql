/*
params: 
database [DBName]
TABLE [TableName]
*/
-- CREATE database DBName
create database DBName

-- CREATE TABLE TableName
USE [DBName]
GO
/****** Object:  Table [dbo].['Olympic']    Script Date: 12/12/2021 20:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableName](
	[ID] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[Sex] [nvarchar](255) NULL,
	[Age] [float] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[Team] [nvarchar](255) NULL,
	[NOC] [nvarchar](255) NULL,
	[Games] [nvarchar](255) NULL,
	[Year] [float] NULL,
	[Season] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Sport] [nvarchar](255) NULL,
	[Event] [nvarchar](255) NULL,
	[Medal] [nvarchar](255) NULL
) ON [PRIMARY]
GO

-- INSERT to TABLE TableName
USE [DBName]
GO
INSERT [dbo].[TableName] ([ID], [Name], [Sex], [Age], [Height], [Weight], [Team], [NOC], [Games], [Year], [Season], [City], [Sport], [Event], [Medal]) 
VALUES 
(5516, N'Gashaw Asfaw Melese', N'M', 29, 168, 51, N'Ethiopia', N'ETH', N'2008 Summer', 2008, N'Summer', N'Beijing', N'Athletics', N'Athletics Men''s Marathon', N'NA'),
(5517, N'Erla sgeirsdttir', N'F', 20, 174, NULL, N'Iceland', N'ISL', N'2014 Winter', 2014, N'Winter', N'Sochi', N'Alpine Skiing', N'Alpine Skiing Women''s Giant Slalom', N'NA')
