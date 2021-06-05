IF EXISTS(
	SELECT *
	FROM sys.triggers
	WHERE name = N'ProductsDelete'
    AND parent_class_desc = N'DATABASE'
)
DROP TRIGGER ProductsDelete ON DATABASE
GO

CREATE TRIGGER ProductsDelete
	ON Products
	INSTEAD OF DELETE
AS	
BEGIN
	DELETE FROM Items
	WHERE IdProduct IN (
		SELECT IdProduct FROM deleted
	);
	DELETE FROM Products 
	WHERE IdProduct IN (
		SELECT IdProduct FROM deleted
	);
END
GO