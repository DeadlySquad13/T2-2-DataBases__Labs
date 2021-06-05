CREATE PROCEDURE SelectItemsInRange
@min Real,
@max Real AS
SELECT *
FROM Items
WHERE
Items.TotalSum > @min AND Items.TotalSum < @max