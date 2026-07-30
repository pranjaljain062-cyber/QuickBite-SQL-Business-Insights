-- Restaurants above average rating

SELECT
restaurant_name,
rating
FROM restaurants
WHERE rating >
(
SELECT AVG(rating)
FROM restaurants
);


-- Customers who placed orders

SELECT
customer_name
FROM customers
WHERE customer_id IN
(
SELECT customer_id
FROM orders
);


-- Restaurants having orders

SELECT
restaurant_name
FROM restaurants r
WHERE EXISTS
(
SELECT 1
FROM orders o
WHERE r.restaurant_id = o.restaurant_id
);