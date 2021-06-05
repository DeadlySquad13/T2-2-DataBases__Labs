ALTER TABLE dbo.Orders
ADD CONSTRAINT FK_Ord_Cust
	FOREIGN KEY (IdCustomer) REFERENCES Customers (IdCustomer)