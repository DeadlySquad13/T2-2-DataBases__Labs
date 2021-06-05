USE Sales;
SELECT *, IIF (FIRM IS NOT NULL, 'True', 'False') AS Employed FROM Customers