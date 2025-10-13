
/* ==============================================================================
   SQL JOIN
-------------------------------------------------------------------------------
  A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

TYPE OF SQL JOIN
=================================================================================
*/
/*                  WHAT IS NO JOINS
--> Returns data from table without combining them. */

-- Retrieve all data from customers and orders in two different results.

SELECT * 
FROM customers

SELECT *
FROM orders

/*               WHAT IS INNER JOINS
--> Returns only matching Rows From both table  */

-- Get all customers along with their orders, but only for customers who have placed an order

-- 1st step
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id

-- 2nd Steps
SELECT 
    customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id

-- 3rd Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
INNER JOIN orders AS O
ON C.id = O.customer_id

/*               WHAT IS LEFT JOINS
--> Returns All Rows From Left and only Matching from Right */

-- Get alla customers along with their orders, including those without order.
-- 1st Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id

-- 2nd Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM orders AS O
LEFT JOIN customers AS C
ON C.id = O.customer_id

/*               WHAT IS RIGH JOINS
--> Returns All Rows From Right and only Matching from left */

-- Get alla customers along with their orders, including orders without matching customers.
-- 1st Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id

-- 2nd Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM orders AS O
RIGHT JOIN customers AS C
ON C.id = O.customer_id

/*               WHAT IS FULL JOINS
--> Returns All Rows From Both table */

-- Get alla customers along with their orders, even if there`s no match.;

-- 1st Steps
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
FULL JOIN orders AS O
ON C.id = O.customer_id
