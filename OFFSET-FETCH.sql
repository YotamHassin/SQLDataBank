-- init 
 BEGIN
DECLARE @FirstTable TABLE (Name varchar(255))

INSERT INTO @FirstTable (name)
values
  ('Green'),
  ('Blue'),
  ('Red'),
  ('Black') 

 END


  BEGIN
-- take all [order by] name
SELECT * from @FirstTable 
order by name

-- start from 0 take 3 [order by] name
SELECT * from @FirstTable 
order by name
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY

-- start from 3 take all [order by] name
SELECT * from @FirstTable 
order by name
OFFSET 3 ROWS 

END

