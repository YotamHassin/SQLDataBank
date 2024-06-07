/* Scalar functions: 
- can be used almost anywhere in T-SQL statements.
- accept one or more parameters but return only one value, therefore, they must include a RETURN statement.
- can use logic such as IF blocks or WHILE loops.
- cannot update data. They can access data but this is not a good practice.
- can call other functions.
*/

CREATE or ALTER FUNCTION sales_udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN

/*
-- Declare the variable to be used.
DECLARE @MyCounter INT;

-- Initialize the variable.
SET @MyCounter = 0;
*/

	--DECLARE @discountReversed1 dec = (1 - @discount); 
	DECLARE @discountReversed DEC(4,2) = (1 - @discount); 
    RETURN (SELECT @quantity) * @list_price * @discountReversed;
END;

--SELECT sales_udfNetSale(10,100,0.1) net_sale;

--DROP FUNCTION sales_udfNetSale;