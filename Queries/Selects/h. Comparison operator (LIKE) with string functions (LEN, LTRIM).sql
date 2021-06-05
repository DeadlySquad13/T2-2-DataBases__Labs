USE Sales;
SELECT * FROM Customers
WHERE LTRIM(CustomerName) LIKE 'À%' AND LEN(LTRIM(CustomerName)) > 5;