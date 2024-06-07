CREATE TABLE Tasks
(
    Row_Id [int] IDENTITY(1,1),
    Issue_ID [int] NOT NULL,
    Issue_Sub_ID [int] NOT NULL,
    --Task_Id AS GenerateTaskId(Row_Id, Issue_Id, Issue_Sub_Id), 
    CONSTRAINT PK_Tasks PRIMARY KEY (Row_Id)
)
-- drop FUNCTION GenerateTaskId;

CREATE FUNCTION GenerateTaskId
(
    @Row_Id int,
    @Issue_Id int,
    @Issue_Sub_Id int
)
RETURNS Int
AS
BEGIN

    RETURN 
    (
        SELECT COUNT(*)
        FROM Tasks
        WHERE Issue_Id = @Issue_Id
        AND Issue_Sub_ID = @Issue_Sub_ID
        AND Row_Id <= @Row_Id
    )
END

-- Task_Id AS dbo.GenerateTaskId(Row_Id, Issue_Id, Issue_Sub_Id), 
ALTER TABLE Tasks
ADD Task_Id AS GenerateTaskId(Row_Id, Issue_Id, Issue_Sub_Id);
