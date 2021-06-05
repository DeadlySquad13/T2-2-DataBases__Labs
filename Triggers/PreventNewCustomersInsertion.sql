IF EXISTS(
	SELECT *
	FROM sys.triggers
	WHERE name = N'PreventNewCustomersInsertion'
    AND parent_class_desc = N'DATABASE'
)
DROP TRIGGER PreventNewCustomersInsertion ON DATABASE
GO

CREATE TRIGGER PreventNewCustomersInsertion
	ON Customers
	AFTER INSERT	
AS 
BEGIN
   PRINT 'You cant insert new customers!' 
   ROLLBACK TRANSACTION
END
GO


