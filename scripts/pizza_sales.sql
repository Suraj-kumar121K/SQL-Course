-- PIZZA SALES SQL QUERIES

-- A. KPI’s
-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

-- Average Order Value
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM pizza_sales

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

-- 5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

-- B. Daily Trend for Total Orders
SELECT DATENAME(MONTH, order_date) AS order_day, COUNT(DISTINCT order_id) AS 
total_orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
