use [DBName] 
/* refactor @category_name and-or @category_id and @Names */

-- DECLARE @category_name and add it if not EXISTS
DECLARE @category_name varchar(255) = 'colors'
SELECT @category_name as category_name 

BEGIN 
IF EXISTS (
    SELECT
      category_name
    FROM
      enum_categories
    where
      category_name = @category_name
  ) 

 --SELECT 'true' as 'Was EXISTS'
BEGIN 

SELECT
  'true' as 'Was EXISTS',
  *
FROM
  enum_categories

END
ELSE 
BEGIN 

--SELECT 'false' as 'Was EXISTS'
INSERT INTO
  enum_categories (category_name)
VALUES
  (@category_name);

SELECT
  'false' as 'Was EXISTS',
  *
FROM
  enum_categories
END

END 

-- get @category_id by category_name
-- DECLARE @category_id int = 1
DECLARE @category_id int = (
  SELECT
    category_id
  FROM
    enum_categories
  WHERE
    category_name = @category_name
)

SELECT @category_id as category_id 

BEGIN 

-- get @Max_status_id by category_id
DECLARE @Max_status_id int = (
    SELECT
      max(status_id) as max_status_id
    FROM
      enum_category_status
    WHERE
      category_id = @category_id
  )

SELECT
  @Max_status_id as Max_status_id 
  
-- get @status_id by @Max_status_id
DECLARE @status_id int = isnull(@Max_status_id, 0)

SELECT
  @status_id as status_id

END 

-- INSERT new status to category with new status_id

DECLARE @Names TABLE (name varchar(255))
INSERT INTO
  @Names (name)
values
  ('Green'),
  ('Blue'),
  ('Red') 

SELECT *
from @Names 
  
BEGIN 
IF not EXISTS (
    SELECT
      category_id
    FROM
      enum_category_status
    where
      category_id = @category_id
  ) 
BEGIN
INSERT INTO enum_category_status 
(category_id, status_id, status_name) 
( SELECT
      @category_id,
      @status_id + row_number() over (
        order by name
      ),
      name
    from @Names
  )
END

END

SELECT *
from enum_category_status;