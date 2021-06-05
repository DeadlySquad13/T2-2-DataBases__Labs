USE Sales;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;

CREATE TABLE Orders
(
	IdOrder INT IDENTITY(1,1) CONSTRAINT pk_order PRIMARY KEY,
	IdCustomer INT NOT NULL,
	OrderDate DATE NOT NULL,
	ShipDate DATE NULL, PaidDate DATE NULL,
	[Status] char(1)
);
		