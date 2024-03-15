USE sakila;


-- First Task : Listing the number of films per category:

SELECT c.name AS Category, COUNT(fc.film_id) AS `Number of Films`
FROM film_category AS fc
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY `Number of Films` DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------
-- Second Task : Displaying the first and last names along with the addresses of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff AS s
JOIN address AS a ON s.address_id = a.address_id;

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Third Task : Displaying the total amount rung up by each staff member in August 2005.

SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_amount DESC;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4th Task :  Listing all films and the number of actors who are listed for each film.

SELECT f.title, COUNT(fa.actor_id) AS `Number of Actors`
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
GROUP BY f.title
ORDER BY `Number of Actors` DESC, f.title;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5th Task : Utilizing the payment and customer tables to list the total amount paid by each customer.

SELECT c.last_name, c.first_name, SUM(p.amount) AS `Total Amount Paid`
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name, c.first_name;





























