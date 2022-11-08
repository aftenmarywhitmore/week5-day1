--SELECT all records from the actor table
-- * means all 
-- make sure you have ; at the end of your SELECT statements 
--Using ALL CAPS is a great way to keep things separated but just do it and don't look back 
SELECT * 
FROM actor; 

--Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

--Query for a first_name that equals Nick using the WHERE clause 
	--we're looking for Nick but we will pull back all last_names for Nick
--QUOTES MATTER: 
--Double quotes is a string literal (the thing we are searching for has double quotes)
--Single quotes will look for the name as a name not as a string
--WHERE just makes our search more specific 
SELECT first_name, last_name 
FROM actor
WHERE first_name = 'Nick'; 

--Query for all first_name data that is like Nick using the LIKE and WHERE clauses
--LIKE is a little more broad than = 
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick'; 

--Query for all first_name data that starts with J using the LIKE and WHERE clause and the wildcard: % 
--This will mean will pull names that start with a J and any letters after that is fine 
SELECT first_name, actor_id
FROM actor 
WHERE first_name LIKE 'J%';

--Query for all first_name data that starts with a K and has 2 letter following the K with underscores 
-- LIKE and WHERE
--Our first name will start with a K and there will be two letters after(however many underscores is how many letters will follow) 
SELECT first_name, actor_id
FROM actor
Where first_name LIKE 'K__';

--Query for all first_name data tha tstarts with a K and evnds with th
--using the LIke and Where clauses -- using BOTH wildcard AND underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

--Comparing operators: 
--Greater Than > 
--Less Than < 
--Greater or Equal >=
--Less or Equal <=
--Not Equal <>

--Explore data with SELECT * query (Specific to changing into a new table)
SELECT * 
FROM payment; 

--Query for data that shows customers who paid and amount Greater Than than $2
--Greater Than operator in a WHERE clause
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00; 

--Query for data that shows customers who paid an amount Less Than $7.99
--Less Than operator in a WHERE clause (often times that's where we will find our <, >)
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--Query for data that shows an amount Less Than or Equal to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--Query data for customer who paid an amount
--Greater Than or Equal to $2
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;  

--Query for data that shows customers who paid and amount BETWEEN $2 and $7.99
--Do this using the BETWEEN clause & the AND clause 
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99; 

--Query for data that shows customers who paid and amount NOT EQUAL to $0 ordered in Descending Order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC; 

--SQL Aggregate functions: 
--SQL Aggregations --> SUM(), AVG(), COUNT(), MIN(), MAX() 
--Query to display sum of amounts paid that are Greater Than $5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99; 

--Query to display AVERAGE amounts paid that are greater than $5.99
SELECT AVG(amount)
FROM payment 
WHERE amount > 5.99;

--Query to display the count of amounts paid that are Greater Than $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

--DISTINCT -- returns unique values
	--aka will not return duplicates 
--Query to display the count of DISTINCT amounts paid Greater Than $5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--Query to display the smallest(MIN) amount Greater Than $7.99
	--aka what is the smallest amount bigger than $7.99
	--MIN(amount) will come back as Min_Num_Payments- we can assign our own name  
SELECT MIN(amount) AS Min_Num_Payment
FROM payment
WHERE amount > 7.99;

--Query to display the largest(MAX) amount Greater Than $7.99
	--aka the largest number that is bigger than $7.99
SELECT MAX(amount) AS Max_Num_Payment
FROM payment
WHERE amount > 7.99;

--Query to display all amounts
SELECT amount 
FROM payment
WHERE amount = 7.99; 

--Query to display different amounts grouped together & count those amounts 
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount 
ORDER BY amount ASC;

--Query to display customer_ids with the summed amounts for each customer_id
	--aka showing how much a customer_id has paid total 
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
ORDER BY customer_id DESC; 

SELECT customer_id, amount 
FROM payment 
WHERE customer_id = 5.99;

--Query to display customer_ids with the summed amouts for eachcustomer_id 
--Separate example andn a different way to use GROUP BY 
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC; 

--Query to explore the data inside for the customer table
SELECT * 
FROM customer; 

--Query to display customer_id that show up more than 0 times and WHERE the email starts with a j and ends with a %
--GROUP by email 
SELECT COUNT(customer_id), email
FROM customer 
WHERE email LIKE 'j____.w%'
GROUP BY email 
HAVING COUNT(customer_id) > 0;

--How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
HAVING COUNT(actor) > 0;