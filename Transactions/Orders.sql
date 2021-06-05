USE Sales;
-- 1 --
BEGIN TRAN
SAVE TRAN point_initial_Orders
-- 2 --
-- Dealing with reference constraint.
ALTER TABLE Items
   DROP CONSTRAINT FK_Items_Orders

ALTER TABLE Items
   ADD CONSTRAINT FK_Items_Orders
   FOREIGN KEY (IdOrder) REFERENCES Orders(IdOrder) ON DELETE CASCADE
-- 
DELETE FROM Orders 
WHERE [Status] <> 'C'
SAVE TRAN point_Orders_without_completed

