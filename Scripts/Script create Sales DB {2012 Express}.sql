USE [master]
GO
/****** Object:  Database [Sales]    Script Date: 25.03.21 12:05:44 AM ******/
CREATE DATABASE [Sales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sales', FILENAME = N'E:\Projects\Educational\SQL\Data Bases\Sales.mdf' , SIZE = 10240KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sales_log', FILENAME = N'E:\Projects\Educational\SQL\Data Bases\Logs\Sales_log.ldf' , SIZE = 10240KB , MAXSIZE = 102400KB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales] SET RECOVERY FULL 
GO
ALTER DATABASE [Sales] SET  MULTI_USER 
GO
ALTER DATABASE [Sales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sales', N'ON'
GO
USE [Sales]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25.03.21 12:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[IdCustomer] [int] IDENTITY(1,1) NOT NULL,
	[Firm] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](300) NULL,
	[ZIP] [char](6) NULL,
	[PhoneNumber] [varchar](15) NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY CLUSTERED 
(
	[IdCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 25.03.21 12:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[IdItem] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Quantity] [int] NULL,
	[TotalSum] [int] NULL,
	[IdOrder] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[IdItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.03.21 12:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ShipDate] [date] NULL,
	[PaidDate] [date] NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [pk_order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.03.21 12:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[PrName] [nvarchar](100) NOT NULL,
	[PrPrice] [smallmoney] NULL,
	[InStock] [int] NULL,
	[ReOrder] [bit] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([IdOrder])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Orders]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Prod] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([IdProduct])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Prod]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Ord_Cust] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customers] ([IdCustomer])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Ord_Cust]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [CK_ZIP] CHECK  (([ZIP] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [CK_ZIP]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Status] CHECK  (([Status]='P' OR [Status]='C'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_InStock] CHECK  (([InStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_InStock]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_PrPrice] CHECK  (([PrPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_PrPrice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allow only ciphers in zip code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'CONSTRAINT',@level2name=N'CK_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'< 0 is not allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Items', @level2type=N'CONSTRAINT',@level2name=N'CK_Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P - Processed, C - Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'< 0 is not allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'CK_InStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'< 0 is not allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'CK_PrPrice'
GO
USE [master]
GO
ALTER DATABASE [Sales] SET  READ_WRITE 
GO
