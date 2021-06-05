USE Sales;
GO
ALTER VIEW vCustomers (
	IdCustomer, Firm, Surname, CustomerName, City, CustomerAddress
)
AS SELECT IdCustomer, Firm, Surname, CustomerName, City, CustomerAddress FROM Customers
WHERE Firm = 'Газпром';