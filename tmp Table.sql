SET nocount ON
 
DECLARE @FirstTable TABLE (RandomInteger INT)
DECLARE @SecondTable TABLE (RandomInteger INT)
DECLARE @WhenWeStarted DATETIME
DECLARE @ii INT
 
BEGIN TRANSACTION
-- fill @FirstTable with VALUES (RAND() * 10000)
SET @ii = 0
WHILE @ii < 100000 
  BEGIN
    INSERT  INTO @FirstTable (RandomInteger)
    VALUES  (RAND() * 10000)
    SET @ii = @ii + 1
  END

-- fill @SecondTable with VALUES (RAND() * 10000)
SET @ii = 0
WHILE @ii < 100000 
  BEGIN
    INSERT  INTO @SecondTable
    VALUES  (RAND() * 10000)
    SET @ii = @ii + 1
  END
COMMIT TRANSACTION

--SET  @WhenWeStarted = GETDATE()
SELECT  @WhenWeStarted = GETDATE()

SET STATISTICS PROFILE ON
SELECT  COUNT(*)
FROM    @FirstTable first
        INNER JOIN @SecondTable second 
        ON first.RandomInteger = second.RandomInteger OPTION (RECOMPILE)
  -- 153Ms  as opposed to 653Ms without the hint
SET STATISTICS PROFILE OFF
SELECT  'That took ' 
    + CONVERT(VARCHAR(8), DATEDIFF(ms, @WhenWeStarted, GETDATE())) 
    + ' ms'
go