
WITH tmpTable as
(
	-- *not working*
    --select 5

	-- working well
    select 5 as num
)

-- working well
select * from tmpTable
select 5
select 5 as num

select * 
into #tmpTable1
from tmpTable


select * from #tmpTable1
