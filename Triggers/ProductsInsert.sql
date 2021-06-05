IF EXISTS(
	SELECT *
	FROM sys.triggers
	WHERE name = N'ProductsInserted'
    AND parent_class_desc = N'DATABASE'
)
DROP TRIGGER ProductsInsert ON DATABASE
GO

CREATE TRIGGER ProductsInsert
	ON Products
	INSTEAD OF INSERT
AS	
BEGIN
	IF EXISTS( -- Product already exists in the table.
		SELECT PrName
		FROM Products
		WHERE PrName IN (
			SELECT PrName
			FROM inserted
		)
	)
		UPDATE Products
		SET InStock = ISNULL(InStock, 0) + 1 -- ISNULL returns alternative value.
	ELSE
		INSERT INTO Products 
		SELECT * FROM inserted;
END
GO