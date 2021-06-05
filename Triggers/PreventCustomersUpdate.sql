IF EXISTS(
	SELECT *
	FROM sys.triggers
	WHERE name = N'PreventCustomersUpdate'
    AND parent_class_desc = N'DATABASE'
)
DROP TRIGGER PreventCustomersUpdate ON DATABASE
GO

CREATE TRIGGER PreventCustomersUpdate
	ON Customers
	AFTER UPDATE	
AS 
BEGIN
   PRINT 'You cant update customers table!' 
   ROLLBACK TRANSACTION
END
GO
