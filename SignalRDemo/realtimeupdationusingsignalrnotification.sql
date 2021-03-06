USE [master]
GO
/****** Object:  Database [mydatabase]    Script Date: 6/15/2021 5:01:35 PM ******/
CREATE DATABASE [mydatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mydatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mydatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mydatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mydatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mydatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mydatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mydatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mydatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mydatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mydatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [mydatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mydatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mydatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mydatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mydatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mydatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mydatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mydatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mydatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mydatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mydatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mydatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mydatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mydatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mydatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mydatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mydatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mydatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mydatabase] SET  MULTI_USER 
GO
ALTER DATABASE [mydatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mydatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mydatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mydatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [mydatabase]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 6/15/2021 5:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([ID], [Name], [AddedOn]) VALUES (1, N'abcd', CAST(N'2021-06-15T16:48:32.847' AS DateTime))
INSERT [dbo].[tblEmployee] ([ID], [Name], [AddedOn]) VALUES (2, N'abcd', CAST(N'2021-06-15T16:53:22.913' AS DateTime))
INSERT [dbo].[tblEmployee] ([ID], [Name], [AddedOn]) VALUES (3, N'acde', CAST(N'2021-06-15T16:53:31.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a]    Script Date: 6/15/2021 5:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a') > 0)   DROP SERVICE [SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a]; if (OBJECT_ID('SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-d9e56b58-2fcb-42c0-8f10-1a4b08b24c5a]; END COMMIT TRANSACTION; END
GO
USE [master]
GO
ALTER DATABASE [mydatabase] SET  READ_WRITE 
GO
