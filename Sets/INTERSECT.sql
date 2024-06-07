 BEGIN
DECLARE @Table TABLE (Name varchar(255), num int)

INSERT INTO @Table (name, num)
values
  ('Green', 5),
  ('Blue', 3),
  ('Red', 7)



select '@Table' as Name, null as num 
UNION
SELECT * from @Table 

 END


  BEGIN
DECLARE @Table2 TABLE (Name varchar(255), num int)

INSERT INTO @Table2 (name, num)
values
-- in intersect the ('Green', 5) in @Table2 is same as @Table so it appear
  ('Green', 5),
  ('Green', 6),
--  ('Blue', 3),
-- same as ('Green', 5)
  ('Red', 7)

select '@Table2' as Name, null as num 
UNION
SELECT * from @Table2 

 END

 select '@Table INTERSECT @Table2' as Name, null as num 
UNION
SELECT *
FROM @Table
INTERSECT
SELECT *
FROM @Table2

