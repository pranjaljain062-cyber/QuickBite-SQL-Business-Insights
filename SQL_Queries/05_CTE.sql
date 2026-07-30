-- Top 5 restaurants by revenue

WITH revenue_table AS
(
SELECT
r.restaurant_name,
SUM(p.total_amount) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY r.restaurant_name
)

SELECT *
FROM revenue_table
ORDER BY total_revenue DESC
LIMIT 5;


-- Customers spending above average

WITH customer_spending AS
(
SELECT
c.customer_id,
c.customer_name,
SUM(p.total_amount) AS total_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY c.customer_id,c.customer_name
)

SELECT *
FROM customer_spending
WHERE total_spend >
(
SELECT AVG(total_spend)
FROM customer_spending
);