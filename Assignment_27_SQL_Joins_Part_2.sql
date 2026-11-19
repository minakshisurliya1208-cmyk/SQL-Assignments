/*
Assignment 27: SQL JOINs Part 2 - Advanced SQL JOINs
Database: PostgreSQL
Prerequisite: Run Assignment_26_SQL_Joins.sql first.
This assignment uses the customers and orders tables created in Assignment 26.
*/

-- Q1. RIGHT JOIN
-- Display all orders with customer names.
SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.amount
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;


-- Q2. FULL OUTER JOIN
-- Display all customers and all orders, including customers without orders.
SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.amount
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;


-- Q3. SELF JOIN
-- Create an employees table and insert sample employee records.
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id)
VALUES
    (1, 'Amit', NULL),
    (2, 'Rahul', 1),
    (3, 'Priya', 1),
    (4, 'Sneha', 2),
    (5, 'Karan', 2);

-- Display each employee with their manager's name.
SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id;


-- Q4. CROSS JOIN
-- Create colors and sizes tables and insert sample values.
CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);

CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(20)
);

INSERT INTO colors (color_id, color_name)
VALUES
    (1, 'Red'),
    (2, 'Blue'),
    (3, 'Green'),
    (4, 'Black');

INSERT INTO sizes (size_id, size_name)
VALUES
    (1, 'Small'),
    (2, 'Medium'),
    (3, 'Large');

-- Generate every possible color and size combination.
SELECT
    c.color_name,
    s.size_name
FROM colors c
CROSS JOIN sizes s;


-- Q5. MULTIPLE TABLE JOIN
-- Create a products table and insert sample products.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price NUMERIC(10,2)
);

INSERT INTO products (product_id, product_name, product_price)
VALUES
    (1, 'Laptop', 55000.00),
    (2, 'Mobile', 25000.00),
    (3, 'Keyboard', 1500.00),
    (4, 'Mouse', 800.00),
    (5, 'Monitor', 12000.00);

-- Add product_id to the existing orders table and assign products.
ALTER TABLE orders
ADD COLUMN product_id INT;

UPDATE orders
SET product_id = CASE
    WHEN order_id = 101 THEN 1
    WHEN order_id = 102 THEN 2
    WHEN order_id = 103 THEN 3
    WHEN order_id = 104 THEN 4
    WHEN order_id = 105 THEN 5
    WHEN order_id = 106 THEN 1
    WHEN order_id = 107 THEN 2
    WHEN order_id = 108 THEN 3
    WHEN order_id = 109 THEN 4
    WHEN order_id = 110 THEN 5
END;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- Display customer names, order IDs, product names and product prices.
SELECT
    c.name AS customer_name,
    o.order_id,
    p.product_name,
    p.product_price
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_id;


-- Q6. JOIN WITH WHERE
-- Display orders where the amount is greater than 2000.
SELECT
    c.name AS customer_name,
    o.order_id,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount > 2000
ORDER BY o.order_id;


-- Q7. JOIN WITH GROUP BY
-- Count the total number of orders for each customer, including customers with zero orders.
SELECT
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;


-- Q8. JOIN WITH HAVING
-- Display customers whose total spending is greater than 5000.
SELECT
    c.name AS customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.amount) > 5000
ORDER BY total_spending DESC;


-- Q9. JOIN WITH ORDER BY
-- Display each customer's total spending from highest to lowest.
SELECT
    c.name AS customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spending DESC;


-- Q10. ADVANCED E-COMMERCE ANALYSIS
-- Include orders of at least 1000, retain customers spending at least 3000,
-- and sort total spending from highest to lowest.
SELECT
    c.name AS customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount >= 1000
GROUP BY c.customer_id, c.name
HAVING SUM(o.amount) >= 3000
ORDER BY total_spending DESC;
