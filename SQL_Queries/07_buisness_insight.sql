-- Top customers by spending

SELECT
c.customer_name,
SUM(p.total_amount) AS total_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY c.customer_name
ORDER BY total_spend DESC
LIMIT 5;


-- Top restaurants by revenue

SELECT
r.restaurant_name,
SUM(p.total_amount) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC;


-- Monthly revenue

SELECT
MONTH(o.order_date) AS month,
SUM(p.total_amount) AS revenue
FROM orders o
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY MONTH(o.order_date)
ORDER BY month;


-- Revenue by city

SELECT
r.city,
SUM(p.total_amount) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.city
ORDER BY total_revenue DESC;


-- Payment method analysis

SELECT
payment_method,
COUNT(payment_id) AS transactions,
SUM(total_amount) AS total_revenue
FROM payments
GROUP BY payment_method
ORDER BY transactions DESC;