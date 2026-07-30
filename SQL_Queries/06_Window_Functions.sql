-- Top customer spending

WITH spending AS
(
SELECT
c.customer_name,
SUM(p.total_amount) AS total_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.payment_id = p.payment_id
GROUP BY c.customer_name
),

ranked AS
(
SELECT
customer_name,
total_spend,
DENSE_RANK() OVER(ORDER BY total_spend DESC) AS spend_rank
FROM spending
)

SELECT *
FROM ranked
WHERE spend_rank <= 2;


-- Highest rated restaurant in each city

WITH ranked_restaurants AS
(
SELECT
city,
restaurant_name,
rating,
RANK() OVER(PARTITION BY city ORDER BY rating DESC) AS city_rank
FROM restaurants
)

SELECT *
FROM ranked_restaurants
WHERE city_rank = 1;