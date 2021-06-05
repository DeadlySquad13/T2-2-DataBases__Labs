USE Sales;
SELECT IdCustomer, COUNT(*) AS OrdersNumber FROM Orders
GROUP BY IdCustomer
HAVING COUNT(*) > 1;