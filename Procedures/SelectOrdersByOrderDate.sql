CREATE PROCEDURE SelectOrdersByOrderDate
@order_date DATE AS
SELECT *
FROM Orders
WHERE
Orders.OrderDate = @order_date;