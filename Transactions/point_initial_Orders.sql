USE Sales;

BEGIN TRAN
-- 1 --
SAVE TRAN point_initial_Orders

-- 2 --
-- Dealing with reference constraint.
ALTER TABLE Items
   DROP CONSTRAINT FK_Items_Orders

ALTER TABLE Items
   ADD CONSTRAINT FK_Items_Orders
   FOREIGN KEY (IdOrder) REFERENCES Orders(IdOrder) ON DELETE CASCADE

DELETE FROM Orders 
WHERE [Status] <> 'C'
SAVE TRAN point_Orders_without_completed

-- 3 --
DELETE FROM Orders 
WHERE [Status] <> 'C' AND IdOrder < 10
SAVE TRAN point_Orders_without_C_l10

-- 4 --
DELETE FROM Orders
SAVE TRAN point_Orders_deleted

-- 5 --
ROLLBACK TRAN point_Orders_without_C_l10

COMMIT
Select * FROM Orders



