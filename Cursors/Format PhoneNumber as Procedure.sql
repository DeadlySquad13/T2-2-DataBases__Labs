USE Sales;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE FormatPhonenumber
AS
BEGIN
	DECLARE @phone_number VARCHAR(15);
	DECLARE cursor_customer CURSOR GLOBAL SCROLL
	KEYSET FOR 
		SELECT PhoneNumber 
		FROM Customers
	FOR UPDATE;

	OPEN cursor_customer;
	FETCH NEXT FROM cursor_customer
		INTO @phone_number;
	WHILE @@FETCH_STATUS = 0
	-- Set + at the beginning for each number.
	BEGIN
		IF @phone_number LIKE '[1-9]%'
			UPDATE Customers
			SET PhoneNumber = '+' + @phone_number
			WHERE CURRENT OF cursor_customer;

		FETCH NEXT FROM cursor_customer
		INTO @phone_number
	END
	CLOSE cursor_customer
	DEALLOCATE cursor_customer
	SELECT * FROM Customers;
END