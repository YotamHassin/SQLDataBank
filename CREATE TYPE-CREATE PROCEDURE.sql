/* First you need to create a table type. */
CREATE TYPE Names AS TABLE 
(
--Id INT IDENTITY (1, 1) PRIMARY KEY, 
Name VARCHAR(10));
GO
 
/* Next, Create a procedure to receive data for the table-valued parameter, the table of names and select one item from the table*/
CREATE PROCEDURE ChooseAName
  @CandidateNames Names READONLY
AS 
DECLARE @candidates TABLE (NAME VARCHAR(10),
                           theOrder UNIQUEIDENTIFIER)
INSERT  INTO @candidates (name, theorder)
        SELECT  name, NEWID()
        FROM    @CandidateNames

SELECT TOP 1
        NAME
FROM    @Candidates
ORDER BY theOrder
GO
 
/* Declare a variable that references the type for our list of cows. */
DECLARE @MyFavouriteCowName AS Names ;
 
/* Add data to the table variable. */
INSERT  INTO @MyFavouriteCowName (Name)
 SELECT 'Bossy' UNION SELECT 'Bessy' UNION SELECT 'petal' UNION SELECT 'Daisy' UNION SELECT 'Lulu' UNION SELECT 'Buttercup' UNION SELECT 'Bertha' UNION SELECT 'Bubba' UNION SELECT 'Beauregard' UNION SELECT 'Brunhilde' UNION SELECT 'Lore' UNION SELECT 'Lotte' UNION SELECT 'Rosa' UNION SELECT 'Thilde' UNION SELECT 'Lisa' UNION SELECT 'Peppo' UNION SELECT 'Maxi' UNION SELECT 'Moriz' UNION SELECT 'Marla'
 
/* Pass the table with the list of traditional nemes of cows to the stored procedure. */
EXEC chooseAName @MyFavouriteCowName
GO