USE Sales;
SELECT * FROM Orders
WHERE Orders.IdCustomer IN (
	SELECT O.IdCustomer FROM Orders as O JOIN Customers AS C
	ON (O.IdCustomer = C.IdCustomer)
	WHERE C.Firm = 'Газпром'
)
ORDER BY OrderDate;
