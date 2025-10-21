/* CONDITIONAL AGGREGATION
   Apply aggregate functions only on subsets of data that fulfill certain conditions.
*/
-- Count how many times each customer has made an order with sales greater than 30
-- 1st Steps
SELECT 
    OrderID,
    CustomerID,
    Sales,
    CASE
       WHEN Sales > 30 THEN 1
       ELSE 0
    END SalesFlag
FROM Sales.Orders
ORDER BY CustomerID

-- 2nd Steps
SELECT
    CustomerID,
    SUM(CASE
        WHEN Sales > 30 THEN 1
        ELSE 0
    END) TotalOrderHightSales,
    COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID

-- SQL Aggregate Functions | COUNT, SUM, AVG, MAX, MIN
-- Find the total number of orders
SELECT
COUNT(*) AS Total_nr_orders
fROM ORDERS

-- Find the total number of orders
SELECT
COUNT(*) AS Total_nr_orders,
SUM(sales) AS total_sales
FROM orders

-- Find the total sales of all orders
SELECT
COUNT(*) AS Total_nr_orders,
SUM(sales) AS total_sales
FROM orders

-- Find the average sales of all orders
SELECT
COUNT(*) AS Total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales
FROM orders

-- Find the highest sales of all orders
SELECT
COUNT(*) AS Total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS max_sales
FROM orders

-- Find the lowest score among customers
SELECT
customer_id,
COUNT(*) AS Total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS max_sales,
MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id
