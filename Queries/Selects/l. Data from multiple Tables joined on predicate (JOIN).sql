USE Sales;
SELECT Surname, CustomerName, OrderDate, [Status]
FROM Customers JOIN Orders
ON (Customers.IdCustomer = Orders.IdCustomer)
WHERE LTRIM(CustomerName) LIKE '�%' AND LEN(LTRIM(CustomerName)) > 5;