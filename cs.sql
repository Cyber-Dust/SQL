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
