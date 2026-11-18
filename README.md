# SQL Assignments – PostgreSQL

## Project Overview

This repository contains my SQL practice assignments using PostgreSQL. The project focuses on database creation, data insertion, SQL JOINs, filtering, and sorting.

## Project Objectives

- Understand relational database concepts.
- Create and manage tables using SQL.
- Practice Primary Key and Foreign Key relationships.
- Retrieve data from multiple tables.
- Apply SQL JOINs to practical examples.

## Database Structure

### 1. Customers Table

| Column | Data Type | Description |
|---|---|---|
| customer_id | INT | Primary Key |
| name | VARCHAR(100) | Customer name |
| city | VARCHAR(100) | Customer city |
| email | VARCHAR(150) | Customer email |

### 2. Orders Table

| Column | Data Type | Description |
|---|---|---|
| order_id | INT | Primary Key |
| customer_id | INT | Foreign Key |
| amount | NUMERIC(10,2) | Order amount |
| order_date | DATE | Order date |

## SQL Concepts Covered

1. CREATE TABLE
2. INSERT INTO
3. SELECT
4. INNER JOIN
5. LEFT JOIN
6. Table Aliases
7. WHERE Clause
8. IS NULL
9. ORDER BY
10. ASC and DESC

## Assignment 26 – SQL JOINs Practice

This assignment includes 10 practice questions covering:

- Basic INNER JOIN
- Customer names and order amounts
- Using table aliases
- Selecting columns from multiple tables
- LEFT JOIN
- Finding customers without orders
- Filtering orders by amount
- Filtering customers by city
- Sorting orders in descending order
- Creating a business-level customer and order report

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

## Repository File

[Assignment_26_SQL_Joins.sql](Assignment_26_SQL_Joins.sql)

## Learning Outcome

Through this assignment, I practised relational database operations and learned how to combine, filter, and sort data using SQL JOINs.

---

**Author:** Minakshi  
**Learning Path:** BCA | Data Analytics
