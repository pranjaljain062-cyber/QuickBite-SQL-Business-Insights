-- Orders with customer names

SELECT
o.order_id,
c.customer_name,
o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;


-- Orders with restaurant names

SELECT
o.order_id,
r.restaurant_name,
o.order_date
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id;


-- Revenue by restaurant

SELECT
r.restaurant_name,
SUM(p.total_amount) AS total_revenue
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC;