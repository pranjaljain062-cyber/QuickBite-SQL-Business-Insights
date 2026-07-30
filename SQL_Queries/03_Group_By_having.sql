-- Orders per restaurant

SELECT
r.restaurant_name,
COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_name;


-- Revenue per restaurant

SELECT
r.restaurant_name,
SUM(p.total_amount) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.restaurant_name;


-- Restaurants with more than 100 orders

SELECT
r.restaurant_name,
COUNT(o.order_id) AS total_orders,
AVG(p.total_amount) AS avg_order_value
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.restaurant_name
HAVING COUNT(o.order_id) > 100;