
--Q.1
select manf from Beers group by manf having count(name) >= 3;
-- +----------------+
-- | manf           |
-- +----------------+
-- | Anheuser-Busch |
-- +----------------+
--Q.2
select name from Drinkers where name not in (select drinker from Frequents);
--empty set, all drinkers frequent a bar
--Q.3
 select count(beer), bar from Sells where price >= 2 group by bar;
-- +-------------+------------+
-- | count(beer) | bar        |
-- +-------------+------------+
-- |           2 | Bob's bar  |
-- |           4 | Joe's bar  |
-- |           2 | Mary's bar |
-- +-------------+------------+
--Q.4
select bar from Sells where price = (select max(price) from Sells); 
-- +-----------+
-- | bar       |
-- +-----------+
-- | Joe's bar |
-- +-----------+
--Q.5
select drinker from Likes where beer = 'Bud' and beer != ‘Summerbrew';
-- +----------+
-- | drinker  |
-- +----------+
-- | Bill     |
-- | Jennifer |
-- | Steve    |
-- +----------+
––Q.6
select * from employees where first_name like '%mary%' and last_name like '%o_';
-- +--------+------------+------------+----------------+--------+------------+
-- | emp_no | birth_date | first_name | last_name      | gender | hire_date  |
-- +--------+------------+------------+----------------+--------+------------+
-- |  16021 | 1964-06-04 | Mary       | Ananiadou      | F      | 1994-05-21 |
-- |  21756 | 1962-01-11 | Mary       | Geffroy        | M      | 1985-06-12 |
-- |  52983 | 1958-06-15 | Mary       | Litzkow        | F      | 1985-11-23 |
-- |  73998 | 1963-10-06 | Mary       | Ananiadou      | M      | 1993-03-31 |
-- |  78783 | 1960-07-29 | Mary       | Litvinov       | M      | 1985-04-18 |
-- |  88698 | 1954-11-01 | Mary       | Lundstrom      | F      | 1985-12-09 |
-- | 101753 | 1956-12-03 | Mary       | Biron          | M      | 1987-01-26 |
-- | 216534 | 1962-03-30 | Mary       | Pillow         | M      | 1985-09-22 |
-- | 263268 | 1960-07-01 | Mary       | Katalagarianos | M      | 1995-10-25 |
-- | 410311 | 1960-05-15 | Mary       | Poujol         | F      | 1987-01-23 |
-- | 423386 | 1964-03-23 | Mary       | Stavenow       | F      | 1990-03-22 |
-- | 459548 | 1952-05-01 | Mary       | Meszaros       | F      | 1986-12-26 |
-- | 491899 | 1957-01-16 | Mary       | Ananiadou      | F      | 1987-06-20 |
-- +--------+------------+------------+----------------+--------+------------+
--Q.7
select first_name, last_name from employees join salaries on employees.emp_no = salaries.emp_no where salaries.salary >= 150000;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Tokuyasu   | Pesch     |
| Ibibia     | Junet     |
| Xiahua     | Whitcomb  |
| Lansing    | Kambil    |
| Willard    | Baca      |
| Tsutomu    | Alameldin |
| Charmane   | Griswold  |
| Weicheng   | Hatcliff  |
| Mitsuyuki  | Stanfel   |
| Sanjai     | Luders    |
| Honesty    | Mukaidono |
| Weijing    | Chenoweth |
| Shin       | Birdsall  |
| Mohammed   | Moehrke   |
| Lidong     | Meriste   |
+------------+-----------+
--Q.8
select departments.dept_no, count(emp_no) as number_of_employees from dept_emp join departments on dept_emp.dept_no = departments.dept_no where from_date like '1988-10-20' group by dept_no order by count(emp_no) desc;
-- +---------+---------------------+
-- | dept_no | number_of_employees |
-- +---------+---------------------+
-- | d005    |                  20 |
-- | d004    |                   9 |
-- | d007    |                   9 |
-- | d001    |                   4 |
-- | d006    |                   4 |
-- | d008    |                   3 |
-- | d002    |                   2 |
-- | d003    |                   2 |
-- | d009    |                   1 |
-- +---------+---------------------+
--Q.9
select dept_no from dept_manager group by dept_no having count(dept_no) >= 3;
-- +---------+
-- | dept_no |
-- +---------+
-- | d004    |
-- | d006    |
-- | d009    |
-- +---------+
--Q.10
select employees.first_name, employees.last_name, titles.title from employees join titles on employees.emp_no = titles.emp_no where title like '%engineer%' and from_date = '2000-3-23';
-- +------------+---------------+-----------------+
-- | first_name | last_name     | title           |
-- +------------+---------------+-----------------+
-- | Nahla      | Silva         | Engineer        |
-- | Uli        | Lichtner      | Senior Engineer |
-- | Matk       | Schlegelmilch | Senior Engineer |
-- | Mayuko     | Luff          | Engineer        |
-- | Masami     | Panienski     | Senior Engineer |
-- | Tzvetan    | Brodie        | Senior Engineer |
-- | Kerhong    | Pappas        | Senior Engineer |
-- | Xiaoshan   | Keirsey       | Senior Engineer |
-- | Jiakeng    | Baaleh        | Senior Engineer |
-- | Fox        | Begiun        | Senior Engineer |
-- +------------+---------------+-----------------+
