-- SQL CHEATSHEET

SELECT 
  column_name,
  another_column_name,
  SUM (yet_another_column_name) AS SUM
FROM 
  table_name
WHERE 
  another_column_name != 'ABCD'
GROUP BY 
  column_name, another_column_name
HAVING 
  SUM(yet_another_column_name) <= 20
ORDER BY 
  column_name DESC
LIMIT 5

JOINS: JOIN, LEFT/RIGHT JOIN, FULL JOIN 
  e.g. FROM Table_A AS A JOIN Table_B AS B ON A.id = B.id
  
UNIONS: UNION (this one is distinct), UNION ALL
  e.g. SELECT id, name FROM Table_A UNION SELECT id, name FROM Table_B

Create / Delete Databases
Create / Delete Table(s) in a database
SELECT particular data from table(s)
INSERT data into tables
UPDATE data in tables
DELETE data from tables
Create Views in the database
Execute various aggregate functions

SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index

-- How to list all character that BEGIN with a certain letter
SELECT
  first_name
FROM patients
where first_name LIKE 'c%';
