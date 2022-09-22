beers-tables.database

SELLS
+------------+------------+-------+
| bar        | beer       | price |
+------------+------------+-------+
| Bob's bar  | Bud        |     3 |
| Bob's bar  | Summerbrew |     3 |
| Joe's bar  | Bud        |     3 |
| Joe's bar  | Bud Lite   |     3 |
| Joe's bar  | Michelob   |     3 |
| Joe's bar  | Summerbrew |     4 |
| Mary's bar | Bud        |  NULL |
| Mary's bar | Bud Lite   |     3 |
| Mary's bar | Budweiser  |     2 |
+------------+------------+-------+  

LIKES
+----------+------------+
| drinker  | beer       |
+----------+------------+
| Bill     | Bud        |
| Jennifer | Bud        |
| Steve    | Bud        |
| Steve    | Bud Lite   |
| Steve    | Michelob   |
| Steve    | Summerbrew |
+----------+------------+

BARS
+------------+-----------+
| name       | addr      |
+------------+-----------+
| Bob's bar  | Maple St. |
| Joe's bar  | Maple St. |
| Mary's bar | Sunny Dr. |
+------------+-----------+

DRINKERS
+----------+---------------+--------------+
| name     | addr          | phone        |
+----------+---------------+--------------+
| Bill     | Jefferson St. | 213-555-0101 |
| David    | Vermont Ave.  | 310-384-3829 |
| Jennifer | Maple St.     | 626-552-1234 |
| Steve    | Vermont St.   | 213-555-1234 |
+----------+---------------+--------------+

FREQUENTS
+----------+------------+
| drinker  | bar        |
+----------+------------+
| Steve    | Bob's bar  |
| David    | Joe's bar  |
| Jennifer | Joe's bar  |
| Steve    | Joe's bar  |
| Bill     | Mary's bar |
+----------+------------+

BEERS
+------------+----------------+
| name       | manf           |
+------------+----------------+
| Bud        | Anheuser-Busch |
| Bud Lite   | Anheuser-Busch |
| Budweiser  | Heineken       |
| Michelob   | Anheuser-Busch |
| Summerbrew | Pete's         |
+------------+----------------+
