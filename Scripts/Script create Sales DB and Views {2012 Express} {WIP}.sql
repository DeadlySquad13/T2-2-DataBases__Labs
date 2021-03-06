USE [master]
GO
/****** Object:  Database [Sales]    Script Date: 02.04.21 12:35:29 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 02.04.21 12:35:29 PM ******/
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
/****** Object:  Table [dbo].[Items]    Script Date: 02.04.21 12:35:29 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 02.04.21 12:35:29 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 02.04.21 12:35:29 PM ******/
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
/****** Object:  View [dbo].[vCustomers]    Script Date: 02.04.21 12:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCustomers] (
	IdCustomer, Firm, Surname, CustomerName, City, CustomerAddress
)
AS SELECT IdCustomer, Firm, Surname, CustomerName, City, CustomerAddress FROM Customers
WHERE Firm = 'Газпром';
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (1, NULL, N'Пакало', N'Александр', NULL, NULL, N'199999', NULL)
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (3, N'Газпром', N'Иванов', N'Алексей', N'Москва', N'ул. Ладожская, д. 39', N'100002', N'89033472534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (4, N'Газпром', N'Смирнов', N'Артём', N'Москва', N'ул. Ладожская, д. 53', N'100003', N'89433472534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (5, N'Лента', N'Кузнецов', N'Владимир', N'Рязань', N'ул. Ленина, д. 29', N'100004', N'89733472534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (6, N'Лента', N'Попов', N'Роман', N'Рязань', N'ул. Ленина, д. 22', N'100024', N'89033482534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (7, N'Газпром', N'Васильев', N'Валентин', N'Рязань', N'ул. Ленина, д. 59', N'130004', N'89033472544')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (8, N'Газпром', N'Петров', N'Данил', N'Челябинск', N'ул. Пушкина, д. 63', N'100404', N'89033972534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (9, N'Пятёрочка', N'Соколов', N'Денис', N'Москва', N'ул. Пушкина, д. 68', N'103004', N'89033479734')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (10, N'Пятёрочка', N'Михайлов', N'Дмитрий', N'Рязань', N'ул. Пушкина, д. 3', N'120004', N'89633472534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (11, N'Газпром', N'Новиков', N'Егор', N'Москва', N'ул. Ладожская, д. 50', N'100044', N'89033472634')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (12, N'Газпром', N'Романова', N'Татьяна', N'Челябинск', N'ул. Ленина, д. 79', N'190004', N'89043472534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (13, N'Лента', N'Волкова', N'София', N'Москва', N'ул. Ленина, д. 9', N'100344', N'89033474534')
INSERT [dbo].[Customers] ([IdCustomer], [Firm], [Surname], [CustomerName], [City], [CustomerAddress], [ZIP], [PhoneNumber]) VALUES (14, N'Пятёрочка', N'Степанов', N'Сергей', N'Челябинск', N'ул. Пушкина, д. 15', N'170004', N'89033402534')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (2, 4, 1, 3000, 2)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (3, 5, 2, 24000, 6)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (4, 6, 3, 90000, 7)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (5, 7, 2, 30000, 8)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (6, 8, 1, 2000, 9)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (7, 9, 2, 800, 10)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (8, 10, 3, 15000, 11)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (9, 11, 3, 18000, 12)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (10, 12, 5, 2500, 13)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (11, 13, 10, 80000, 14)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (12, 14, 5, 1000, 15)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (13, 15, 1, 12000, 16)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (14, 16, 100, 20000, 17)
INSERT [dbo].[Items] ([IdItem], [IdProduct], [Quantity], [TotalSum], [IdOrder]) VALUES (15, 17, 20, 100000, 18)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (2, 1, CAST(N'2021-03-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (6, 1, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12' AS Date), CAST(N'2021-02-14' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (7, 3, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-27' AS Date), CAST(N'2021-02-28' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (8, 4, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-11' AS Date), CAST(N'2021-02-13' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (9, 5, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-10' AS Date), CAST(N'2021-02-12' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (10, 6, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (11, 7, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-11' AS Date), CAST(N'2021-02-12' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (12, 8, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-24' AS Date), CAST(N'2021-03-25' AS Date), N'P')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (13, 9, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-23' AS Date), CAST(N'2021-02-24' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (14, 10, CAST(N'2021-03-08' AS Date), CAST(N'2021-03-23' AS Date), CAST(N'2021-03-24' AS Date), N'P')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (15, 11, CAST(N'2021-01-09' AS Date), CAST(N'2021-02-03' AS Date), CAST(N'2021-02-06' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (16, 12, CAST(N'2021-01-13' AS Date), CAST(N'2021-01-23' AS Date), CAST(N'2021-01-28' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (17, 13, CAST(N'2021-01-12' AS Date), CAST(N'2021-01-13' AS Date), CAST(N'2021-01-14' AS Date), N'C')
INSERT [dbo].[Orders] ([IdOrder], [IdCustomer], [OrderDate], [ShipDate], [PaidDate], [Status]) VALUES (18, 14, CAST(N'2021-01-17' AS Date), CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), N'C')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (3, N'Яблоко', 40.0000, 2, NULL, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (4, N'Компьютерная мышь', 3000.0000, 100, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (5, N'Клавиатура', 12000.0000, 10, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (6, N'Видеокарта', 30000.0000, 20, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (7, N'Монитор', 15000.0000, 120, 0, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (8, N'Очки', 2000.0000, 1000, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (9, N'Видеокамера', 800.0000, 300, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (10, N'Колонки', 5000.0000, 100, 0, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (11, N'ОЗУ', 6000.0000, 200, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (12, N'Вентилятор', 500.0000, 300, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (13, N'Процессор', 8000.0000, 50, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (14, N'Кабель', 200.0000, 2000, 1, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (15, N'Материнская плата', 12000.0000, 30, 0, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (16, N'Батарейка', 200.0000, 100, 0, NULL)
INSERT [dbo].[Products] ([IdProduct], [PrName], [PrPrice], [InStock], [ReOrder], [Description]) VALUES (17, N'Жёсткий диск', 5000.0000, 250, 0, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
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
