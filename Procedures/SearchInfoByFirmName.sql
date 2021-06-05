CREATE PROCEDURE SearchInfoByFirmName
@Firm nvarchar(50) AS
SELECT IdCustomer, Surname, CustomerName, City, CustomerAddress, ZIP, PhoneNumber
FROM Customers
WHERE
Customers.Firm = @Firm