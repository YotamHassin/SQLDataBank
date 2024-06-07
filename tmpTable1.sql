
-- read only
WITH tmpTable as
(
	-- *not working*
    --select 5

	-- working well
    select 5 as num
)

/*
Update or insert of view or function 'tmpTable' failed, 
because it contains a derived or constant field. */
--INSERT INTO tmpTable (num) (SELECT 7)
--INSERT INTO tmpTable (num) values (7), (9) 

-- working well
select * from tmpTable
select 5
select 5 as num

