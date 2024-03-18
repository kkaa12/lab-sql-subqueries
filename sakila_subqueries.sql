-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT film_id FROM sakila.film 
WHERE title = 'Hunchback Impossible';

SELECT film_id, COUNT(inventory_id) AS Number_of_copies FROM sakila.inventory
GROUP BY film_id
HAVING film_id IN (SELECT film_id FROM sakila.film 
WHERE title = 'Hunchback Impossible');

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT ROUND(AVG(length),2) AS Average FROM sakila.film;

SELECT title, length AS Average FROM sakila.film
WHERE length > (SELECT ROUND(AVG(length),2) AS Average FROM sakila.film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT film_id FROM sakila.film 
WHERE title = 'Alone Trip';

SELECT a.first_name, a.last_name FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
JOIN(SELECT film_id FROM sakila.film 
WHERE title = 'Alone Trip') AS f
ON fa.film_id = f.film_id;

