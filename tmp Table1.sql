
DECLARE @FirstTable TABLE (Name varchar(255))

INSERT INTO @FirstTable (name)
values
  ('Green'),
  ('Blue'),
  ('Red') 

INSERT INTO @FirstTable (name)
(SELECT 'Black')

SELECT * from @FirstTable 
