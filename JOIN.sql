
CREATE TYPE IdNames AS TABLE 
(Id INT IDENTITY (1, 1) PRIMARY KEY, Name varchar(255))
--DROP TYPE IdNames

GO

DECLARE @Table IdNames

INSERT INTO @Table (name)
values
  ('Green'),
  ('Blue'),
  ('Red')


--select 0 as id, '@Table' as Name 
--UNION
SELECT * from @Table 

DECLARE @Table2 IdNames

INSERT INTO @Table2 (name)
values
  ('Green'),
  ('Blue'),
  ('Red'),
  ('Black')

select 0 as id, '@Table2' as Name
UNION
SELECT * from @Table2


select 0 as id, '@Table left JOIN @Table2' as Name, 0 as id, '' as Name  
UNION
(SELECT * 
from @Table t1
left JOIN @Table2 t2 
on t1.Id = t2.Id)

select 0 as id, '@Table inner JOIN @Table2' as Name, 0 as id, '' as Name  
UNION
(SELECT * 
from @Table t1
JOIN @Table2 t2 
on t1.Id = t2.Id)

select 0 as id, '@Table full outer JOIN @Table2' as Name, 0 as id, '' as Name 
UNION
(SELECT * 
from @Table t1
full outer JOIN @Table2 t2 
on t1.Id = t2.Id)

select 0 as id, '@Table right JOIN @Table2' as Name, 0 as id, '' as Name 
UNION
(SELECT * 
from @Table t1
right JOIN @Table2 t2 
on t1.Id = t2.Id)


DROP TYPE IdNames