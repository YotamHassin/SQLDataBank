/* Scalar functions: 
- can be used almost anywhere in T-SQL statements.
- accept one or more parameters but return only one value, therefore, they must include a RETURN statement.
- can use logic such as IF blocks or WHILE loops.
- cannot update data. They can access data but this is not a good practice.
- can call other functions.
*/

CREATE or ALTER FUNCTION boolToText(
    @myBoolean bit
)
RETURNS varchar(5)
AS 
BEGIN

    RETURN (select
    case
      WHEN @myBoolean=1 then 'TRUE'
      WHEN @myBoolean=0 then 'FALSE'
      ELSE NULL
    end);
END;

--SELECT boolToText(1) [bool Text];
--exec boolToText 1
--DROP FUNCTION boolToText;