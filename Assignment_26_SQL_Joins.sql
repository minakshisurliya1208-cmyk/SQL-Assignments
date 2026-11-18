CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    email VARCHAR(150)
);

INSERT INTO customers
(customer_id, name, city, email)
VALUES
(1, 'Rahul', 'Ranchi', 'rahul@gmail.com'),
(2, 'Amit', 'Delhi', 'amit@gmail.com'),
(3, 'Priya', 'Patna', 'priya@gmail.com'),
(4, 'Sneha', 'Kolkata', 'sneha@gmail.com'),
(5, 'Rohan', 'Mumbai', 'rohan@gmail.com'),
(6, 'Neha', 'Ranchi', 'neha@gmail.com'),
(7, 'Karan', 'Bangalore', 'karan@gmail.com'),
(8, 'Anjali', 'Pune', 'anjali@gmail.com');

SELECT * FROM customers;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount NUMERIC(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO orders
(order_id, customer_id, amount, order_date)
VALUES
(101, 1, 2500, '2026-01-10'),
(102, 2, 1500, '2026-01-12'),
(103, 1, 3000, '2026-01-15'),
(104, 3, 4000, '2026-01-18'),
(105, 5, 2200, '2026-01-20'),
(106, 2, 1800, '2026-01-22'),
(107, 6, 5000, '2026-01-25'),
(108, 5, 3500, '2026-01-28'),
(109, 7, 1200, '2026-02-01'),
(110, 3, 2700, '2026-02-05');

SELECT * FROM orders;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;

-- Basic INNER JOIN
SELECT
    customers.name,
    customers.city,
    orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- Customer Name and Order Amount
SELECT
    customers.name,
    orders.order_id,
    orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- Q3: What is a Table Alias?
SELECT
    c.name,
    c.email,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 4: Select Columns from Multiple Tables
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 5: LEFT JOIN
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 6: Find Customers Who Have Never Placed an Order
SELECT
    c.customer_id,
    c.name,
    c.city
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Question 7: Filter Orders by Amount Greater Than 2500
SELECT
    c.name,
    o.order_id,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.amount > 2500;

-- Question 8: Filter Customers by City (Ranchi)
SELECT
    c.name,
    c.city,
    o.order_id,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.city = 'Ranchi';

-- Question 9: Sort Joined Records by Order Amount in Descending Order
SELECT
    c.name,
    o.order_id,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- Question 10: Business-Level Customer and Order Report
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id ASC;
