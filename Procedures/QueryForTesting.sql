-- EXEC MeanValue 24000, 200, 100;
-- SELECT * FROM Customers;
-- EXEC SearchInfoByFirmName 'Газпром';
-- EXEC SelectItemsInRange 24000, 100000;
-- SELECT * FROM Orders;
-- EXEC SelectOrdersByOrderDate '2021-03-18';
-- EXEC SelectOrdersInOrderDateRange '2021-03-08', '2021-03-18';
-- EXEC SelectOrdersInShipDateRange '2021-02-12', '2021-02-27';
-- EXEC SelectCustomersWithoutORders;

-- GetSumOfOrdersByCity 'Москва';

--INSERT INTO Customers
--VALUES ('Test', 'TestSurname', 'TestCustomerName', 'TestCity', 'TestAdress', '123456', 'TestNumber')

--INSERT INTO Customers
--VALUES ('Test', 'TestSurname', 'TestCustomerName', 'TestCity', 'TestAdress', '123456', 'TestNumber');

--DELETE FROM Customers
--WHERE IdCustomer = 2;

--UPDATE Customers
--SET Firm = 'WRONGVALUE'
--WHERE IdCustomer = 3;

-- SELECT * FROM Products;
-- DELETE FROM Products
-- WHERE IdProduct = 3;
-- SELECT * FROM Products;

SELECT * FROM Products;
INSERT INTO Products (PrName, PrPrice, InStock, ReOrder)
VALUES ('Компьютерная мышь', 3000, 10, 1) 
SELECT * FROM Products;


