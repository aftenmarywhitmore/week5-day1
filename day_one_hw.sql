--How many actors are there with the last name 'Wahlberg'?
--2
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
HAVING COUNT(actor) > 0;

--How many payments were made between $3.99 and $5.99?
--5607
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99; 


--What film does the store have the most of? (search inventory) 
--Multiple films are tied at 8
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY count(film_id) DESC;

--How many customers have the last name 'William'?
--0
SELECT first_name, last_name 
FROM actor
WHERE last_name = 'William'; 

--What store employee(get the id) sold the most rentals? 
--1 - 8040
SELECT COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;

--How many different district names are there?
--378
SELECT DISTINCT district
FROM address
GROUP BY district
ORDER BY district;

--What film has the most actors in it? (use film_actor table and get film_id) 
--film_id 508 - 15 actors
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

--From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
--13
SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es' 
GROUP BY last_name, store_id
ORDER BY store_id;

--How many payment amounts(4.99, 5.99, etc.) had a number of rentals above 250 for customers with 
--ids between 380 and 430? (use ground by and having > 250) 
--3
SELECT amount, customer_id
FROM payment
GROUP BY amount, customer_id
HAVING customer_id between 380 and 430 
order by customer_id, amount;
--I can't figure this one out...hmm...


--Within the film table, how many rating categories are there? And what rating. hasthe most movies total? 
--5 ratings, PG-13 has the most 
SELECT distinct rating FROM film;
SELECT rating, count(rating)
FROM film
GROUP BY rating
ORDER BY count(rating) desc;
