USE Sales;
SELECT Quantity, TotalSum, IdOrder FROM Items
WHERE Quantity = 5
ORDER BY TotalSum;