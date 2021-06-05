CREATE PROCEDURE SelectOrdersInShipDateRange
@ship_date_min DATE,
@ship_date_max DATE AS
SELECT *
FROM Orders
WHERE
Orders.ShipDate >= @ship_date_min AND Orders.ShipDate <= @ship_date_max;