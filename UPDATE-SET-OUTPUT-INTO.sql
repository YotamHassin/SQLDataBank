-- the table going to be changed (UPDATE) - (DELETED - INSERTED)
DECLARE @NotTmpTable TABLE (
	EmpID INT IDENTITY (1, 1) PRIMARY KEY,
    VacationHours INT);

-- insert base data
insert into @NotTmpTable (VacationHours) values 
(5),
(5),
(5),
(5),
(5),
(5),
(4),
(5),
(5),
(5)

-- will save changed data
DECLARE @MyTableVar TABLE (
	ID INT,
    OldVacationHours INT,
    NewVacationHours INT);

-- UPDATE and save changed (DELETED - INSERTED) data in tmp table
UPDATE TOP (15) @NotTmpTable
SET VacationHours = VacationHours * 1.25
OUTPUT INSERTED.EmpID,
       DELETED.VacationHours,
       INSERTED.VacationHours
INTO @MyTableVar;

-- show saved data
select * from @MyTableVar