USE Sales;
SELECT * FROM Customers
WHERE EXISTS (
	SELECT IdCustomer FROM Orders
	WHERE IdCustomer = Customers.IdCustomer AND [Status] = 'C'
);