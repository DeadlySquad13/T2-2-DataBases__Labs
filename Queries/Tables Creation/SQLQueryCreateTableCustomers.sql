USE Sales;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;

CREATE TABLE Customers
(
IdCustomer INT IDENTITY(1,1) CONSTRAINT pk_customer PRIMARY KEY,
Firm nvarchar(50) NULL,
Surname nvarchar(50) NOT NULL,
CustomerName nvarchar(50) NOT NULL,
City nvarchar(50) NULL,
CustomerAddress nvarchar(300) NULL,
ZIP char(6) NULL,
PhoneNumber varchar(15) NULL
);
		