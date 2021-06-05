ALTER TABLE dbo.Items
DROP CONSTRAINT FK_Items_Prod
ALTER TABLE dbo.Items
ADD 
	IdOrder INT NOT NULL, 
	CONSTRAINT FK_Items_Orders
		FOREIGN KEY (IdOrder) REFERENCES Orders (IdOrder),
	CONSTRAINT FK_Items_Prod
		FOREIGN KEY (IdProduct) REFERENCES Products (IdProduct)