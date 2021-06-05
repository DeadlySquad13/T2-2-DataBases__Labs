CREATE PROCEDURE SelectCustomersWithoutOrders
AS SELECT * FROM Customers
WHERE IdCustomer NOT IN (
	SELECT IdCustomer FROM Orders
);