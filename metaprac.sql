/*
 movies                                  actor_credits
+--------------+---------------+        +--------- +--------+
| movie_id     | int           |---+--->| movie_id | int    |
| name         | string        |   |    | actor_id | int    |
| budget       | int           |   |    | name     | int    |
| release_year | int           |   |    | gender   | string |
| revenue      | int           |   |    | role     | string |
| runtime      | int           |   |    +--------- +--------+
| rating       | int           |   |
| genre        | string        |   |     director_credits
+--------------+---------------+   |    +-------------+--------+
                                   +--->| movie_id    | int    |
                                        | director_id | int    |
                                        | name        | int    |
                                        | gender      | string |
                                        +-------------+--------+

Only 1 director per movie, 1 or more actors per movie
Actor's role is either "lead" or "supporting", only 1 lead per movie
*/

-- Q1. What are the names of all the movies released in 2016 with a rating above 7 and are at least an hour and a half long?
SELECT name AS movie
FROM movies
WHERE release_year = 2016
AND rating > 7
AND runtime >= 90


-- Q2. Who are the top 3 actors in terms of number of lead roles?

SELECT name,
COUNT(1) AS number_of_roles
FROM actor_credits
WHERE role = 'lead'
-- use GROUP BY to: ...
GROUP BY 1
-- use ORDER BY to: ...
ORDER BY 2 DESC
LIMIT 3

-- Q3. How many movies with a male director and female lead have made more than $100M in revenue?

-- count() aggregate function selects the desired column numerically
SELECT COUNT(1) AS number_of_movies
FROM movies
-- adding the desired tables with the primary key "movie_id"
-- in order to retrieve desire "AND" junction
INNER JOIN director_credits ON (movies.movie_id = director_credits.movie_id)
INNER JOIN actor_credits ON (movies.movie_id = actor_credits.movie_id)
WHERE director_credits.gender = 'M'
AND actor_credits.gender = 'F'
AND actor_credits.role = 'lead'
AND movies.revenue > 100000000

-- Q4. What is the average length (in hours) of movies with less than a $10M budgets?

-- use avg() aggregate function on int datatypes to find the average
-- divide by 60.0 to compute into hours
SELECT AVG(runtime) / 60.0 AS average_length
FROM movies
WHERE budget < 10000000


-- Q.5 What 10 actors have been in the most number of movies, and how many movies have they each been in?

SELECT name,
COUNT(1) AS number_of_roles
FROM actor_credits
GROUP BY 1
-- ORDER BY must come after GROUP BY, there is an order of calls
ORDER BY 2 DESC
LIMIT 10

-- Q.6 In each genre, what are the largest and smallest budgets any movie had, ordered by the largest budget?

SELECT genre,
-- min goes first, make sure to include comma
-- remember, budget is an INT datatype
MIN(budget) AS smallest_budget,
MAX(budget) AS biggest_budget
FROM movies
GROUP BY 1
-- use the name of the max budget to order in descending order
ORDER BY biggest_budget DESC


-- Q.7 What % of movies have a female lead actor?

SELECT 
-- To calculate %, x100 and divide by the count of the desired table
SUM(IF(gender = 'F', 1, 0)) * 100.0 / COUNT(1) AS perc_female
FROM actor_credits
WHERE role = 'lead'



-- Q.8 What are the average profits (revenue - budget) of movies with either Robert Downey Jr. or Scarlett Johansson in them?

-- Profit = revenue - budget

SELECT 
-- You have to snakecase '_' or SQL will error
AVG(movies.revenue - movies.budget) AS Average_Profit
FROM movies
INNER JOIN (
  SELECT movie_id 
  FROM actor_credits
  WHERE name IN ('Scarlett Johansson', 'Robert Downey Jr.')
  GROUP BY 1
)a
ON movies.movie_id = a.movie_id

-- A.
-- +----------------+
-- | Average_Profit |
-- +----------------+
-- | 476223712.5714 |
-- +----------------+


--  9.  Do male or female directors tend to make longer movies on average?

SELECT director_credits.gender,
AVG(runtime) AS avg_runtime
FROM movies
INNER JOIN director_credits
ON movies.movie_id = director_credits.movie_id
GROUP BY 1

-- A.
-- +--------+-------------+
-- | gender | avg_runtime |
-- +--------+-------------+
-- | M      |    111.2166 |
-- | F      |    108.2500 |
-- +--------+-------------+

-- Q10. What are all the movies that made 4x more revenue than the average movie in the same genre released in the same year?

SELECT name
from movies
INNER JOIN (
SELECT release_year,
genre,
AVG(revenue) AS avg_rev
FROM movies
GROUP BY 1,2) AS avg_revs
LIMIT 5

-- A.
-- +--------------------------------+
-- | name                           |
-- +--------------------------------+
-- | Shrek Forever After            |
-- | Inception                      |
-- | Skyfall                        |
-- | Transformers: Dark of the Moon |
-- | The Kings Speech               |
-- | The Dark Knight Rises          |
-- | The Great Gatsby               |
-- | Iron Man 3                     |
-- | Ted                            |
-- | Noah                           |
-- | Inside Out                     |
-- | Captain America: Civil War     |
-- +--------------------------------+


-- 11.  For each horror film with a rating of at least 6.5, what percent of their supporting cast are men?
 
SELECT
m.name,
SUM(IF(a.gender = 'M', 1, 0)) * 100.0 / COUNT(1) AS perc_male
FROM movies m
INNER JOIN actor_credits a
ON m.movie_id = a.movie_id
WHERE
m.genre = 'horror'
AND m.rating >= 6.5
AND a.role = 'supporting'
GROUP BY 1
 
-- 12.  What actor-director pair have made the most number of commercially successful (profit > 0) movies together?

SELECT
a.name AS actor,
d.name AS director,
COUNT(1) AS num_movies
FROM movies m
INNER JOIN actor_credits a
ON m.movie_id = a.movie_id
INNER JOIN director_credits d
ON m.movie_id = d.movie_id
WHERE m.revenue - m.budget > 0
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1



When you know what language you'd like to use for your interview,
simply choose it from the dropdown in the top bar.

You can also change the default language your pads are created with
in your account settings: https://app.coderpad.io/settings

Enjoy your interview!

daily_content
date       | userid | content_id | timestamp  | content_type | target_id
2020-01-01 | 1      | 101        | 1503814659 | photo        | null
2020-01-01 | 2      | 102        | 1503815817 | comment      | 101
2020-01-01 | 3      | 103        | 1503818238 | share        | null
2020-01-01 | 4      | 104        | 1503820134 | status       | null
2020-01-01 | 4      | 105        | 1503823129 | comment      | 101
2020-01-01 | 5      | 106        | 1503834921 | comment      | 104

How many people have published a post today, broken down by content type?

SELECT COUNT (DISTINCT(userid)) AS number_of_users,
content_type
FROM daily_content
GROUP BY content_type
WHERE content_type <> 'comment'
AND date = 2020-01-01

Can you generate a distribution of comments per photo post? or in other words, how many photo posts had 1 comment, how many had 2, and so on?

id, comment_count
101, 1
102, 3
103, 4



SELECT COUNT(comment), conent_id 
FROM daily_content

 


