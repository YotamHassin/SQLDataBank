 -- DECLARE @Table
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

 -- DECLARE @Table2
  BEGIN
DECLARE @Table2 TABLE (Name varchar(255), num int)

INSERT INTO @Table2 (name, num)
values
-- in EXCEPT the ('Green', 5) in @Table2 is same as @Table so will not appear
  ('Green', 5),
  ('Green', 6),
-- same as ('Green', 5)
  ('Red', 7)


select '@Table2' as Name, null as num 
UNION
SELECT * from @Table2 

 END



select '@Table EXCEPT @Table2' as Name, null as num 
UNION
SELECT *
FROM @Table
EXCEPT
SELECT *
FROM @Table2

