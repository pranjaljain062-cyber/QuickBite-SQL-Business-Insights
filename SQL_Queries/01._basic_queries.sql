-- Show all customers
SELECT * FROM customers;

-- Show all restaurants
SELECT * FROM restaurants;

-- Show all menu items
SELECT * FROM menu;

-- Show all orders
SELECT * FROM orders;

-- Show all payments
SELECT * FROM payments;

-- Orders placed after a specific date
SELECT *
FROM orders
WHERE order_date >= '2024-03-01';

-- Restaurants with rating above 4.5
SELECT *
FROM restaurants
WHERE rating > 4.5;

-- Top 10 expensive menu items
SELECT *
FROM menu
ORDER BY price DESC
LIMIT 10;