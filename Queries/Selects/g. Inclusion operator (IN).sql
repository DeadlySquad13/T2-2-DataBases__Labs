USE Sales;
SELECT * FROM Orders
WHERE Orders.IdCustomer IN (
	SELECT IdCustomer FROM Customers
	WHERE ZIP LIKE '100%'
);