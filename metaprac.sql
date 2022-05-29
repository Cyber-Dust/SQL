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
MIN(budget) AS smallest_budget,
MAX(budget) AS biggest_budget
FROM movies
GROUP BY 1
-- use the name of the max budget to order in descending order
ORDER BY biggest_budget DESC

