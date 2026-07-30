-- ===========================================
-- QuickBite SQL Business Analytics Project
-- Database Schema
-- Author: Pranjal Jain
-- ===========================================

CREATE DATABASE QuickBite_DB;

USE QuickBite_DB;

-- Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50)
);

-- Restaurants Table

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    cuisine_type VARCHAR(50),
    rating DECIMAL(3,2)
);

-- Menu Table

CREATE TABLE menu (
    menu_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurants(restaurant_id)
);

-- Payments Table

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),
    total_amount DECIMAL(10,2)
);

-- Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    payment_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (restaurant_id)
    REFERENCES restaurants(restaurant_id),

    FOREIGN KEY (payment_id)
    REFERENCES payments(payment_id)
);