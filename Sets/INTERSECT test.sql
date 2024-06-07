 BEGIN
DECLARE @Table TABLE (Name varchar(255), antherVarchar varchar(255))

INSERT INTO @Table (name, antherVarchar)
values
  ('Green', '5'),
  ('Blue', 3),
  ('Red', 7)



select '@Table' as Name, null as antherVarchar 
UNION
SELECT * from @Table 

 END


  BEGIN
DECLARE @Table2 TABLE (Name varchar(255), antherVarchar varchar(255))

INSERT INTO @Table2 (name, antherVarchar)
values
-- in intersect the ('Green', 5) in @Table2 is same as @Table so it appear
  ('Green', 5),
  ('Green', 6),
--  ('Blue', 3),
-- same as ('Green', 5)
  ('Red', 7)

select '@Table2' as Name, null as antherVarchar 
UNION
SELECT * from @Table2 

 END

 select '@Table INTERSECT @Table2' as Name, null as antherVarchar 
UNION
SELECT *
FROM @Table
INTERSECT
SELECT *
FROM @Table2



 select '@Table UNION @Table2 cross colomns' as Name, null as antherVarchar 
UNION
SELECT Name, antherVarchar
FROM @Table
UNION
SELECT antherVarchar, Name
FROM @Table2

 select '@Table INTERSECT @Table2 cross colomns' as Name, null as antherVarchar 
UNION
SELECT Name, antherVarchar
FROM @Table
INTERSECT
SELECT antherVarchar, Name
FROM @Table2
