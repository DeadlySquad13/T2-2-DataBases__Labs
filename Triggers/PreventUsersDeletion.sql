IF EXISTS(
	SELECT *
	FROM sys.triggers
	WHERE name = N'PreventCustomersDeletion'
    AND parent_class_desc = N'DATABASE'
)
DROP TRIGGER PreventCustomersDeletion ON DATABASE
GO

CREATE TRIGGER PreventCustomersDeletion
	ON Customers
	AFTER DELETE	
AS 
BEGIN
   PRINT 'You cant delete any customers!' 
   ROLLBACK TRANSACTION
END
GO
