USE Sales;
SELECT * FROM Customers
WHERE LTRIM(CustomerName) LIKE '�%' AND LEN(LTRIM(CustomerName)) > 5;