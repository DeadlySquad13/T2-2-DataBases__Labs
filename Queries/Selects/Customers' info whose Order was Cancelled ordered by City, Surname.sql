USE Sales;
SELECT Surname, CustomerName, CustomerAddress, PhoneNumber FROM Customers
WHERE IdCustomer IN (
	SELECT IdCustomer FROM ORDERS
	WHERE [Status] = 'C'
)
ORDER BY City, Surname;