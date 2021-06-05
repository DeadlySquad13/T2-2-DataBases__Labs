CREATE PROCEDURE SelectOrdersInOrderDateRange
@order_date_min DATE,
@order_date_max DATE AS
SELECT *
FROM Orders
WHERE
Orders.OrderDate >= @order_date_min AND Orders.OrderDate <= @order_date_max;