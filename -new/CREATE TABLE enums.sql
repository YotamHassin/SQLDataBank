/*
CREATE TABLE enum 
with category (id + name)
and multyple statuses per category
*/

use [DBName]

-- enum title (id + name)
CREATE TABLE enum_categories (
	category_id INT IDENTITY (1, 1) PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL
);

--drop TABLE enum_categories
SELECT * from enum_categories


-- from enum title, has status (id + name)
CREATE TABLE enum_category_status (
	category_id INT,
	status_id INT,
	status_name VARCHAR (255) NOT NULL

	PRIMARY KEY (category_id, status_id),
	FOREIGN KEY (category_id) 
        REFERENCES enum_categories (category_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
);

--drop TABLE enum_category_status
SELECT * from enum_category_status
