1.1
SELECT f.title AS film_title, f.length AS duration, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

1.2
SELECT f.title AS film_title, r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.customer_id = 1;

1.3
SELECT f.title AS film_title, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

2.1
INSERT INTO customer (first_name, last_name, address_id, store_id, active, create_date)
VALUES ('Alice', 'Cooper', 
    (SELECT address_id FROM address WHERE address = '123 Main St'), 1, 1, NOW());

2.2
UPDATE address
SET address = '456 Elm St'
WHERE address_id = (
    SELECT address_id FROM customer 
    WHERE first_name = 'Alice' AND last_name = 'Cooper'
);

2.3
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';