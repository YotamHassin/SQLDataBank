--DECLARE @MyVar boolean
DECLARE @MyVar bit

Set @MyVar = 1  /* True */
--Set @MyVar = 0  /* False */

if (@MyVar = 1) 
begin
select 1 as True
end

else 
begin
select 0 as False
end
