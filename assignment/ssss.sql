-- =========================
-- Filtering & Sorting
-- =========================
-- 1. Display all orders where Sales > 20,000.
SELECT *
FROM Industry
where Sales > 20000

-- 2. Find customers from Delhi whose Profit > 5,000.
SELECT City, Profit
FROM Industry 
WHERE City = 'Delhi' and Profit > 5000

-- 3. Display orders where DiscountPct is between 10 and 20.
SELECT * 
FROM Industry
WHERE DiscountPct between 10 and 20

-- 4. Show all Electronics products sorted by Sales (highest first).
SELECT Product, Category, Sales
FROM Industry
where Category = 'Electronics'
Order by Sales DESC

-- 5. Display the top 10 highest Sales orders.
SELECT TOP(10) *
FROM Industry
ORDER BY Sales DESC;

-- =========================
-- Aggregate Functions
-- =========================
-- 6. Find the total Sales of all orders.
SELECT SUM(Sales) as Total_Sales
FROM Industry

-- 7. Find the average Profit.
SELECT AVG(Profit) as average_Profit
FROM Industry


-- 8. Find the maximum UnitPrice.
SELECT max(UnitPrice) as max_UnitPrice
FROM Industry

-- 9. Find the minimum Cost.
SELECT MIN(Cost) as minimum_Cost
FROM Industry

-- 10. Count the total number of Delivered orders.
SELECT COUNT(OrderID) AS Delivered_Orders
FROM Industry
WHERE OrderStatus = 'Delivered';

-- =========================
-- GROUP BY
-- =========================
-- 11. Calculate total Sales by City.
SELECT City, SUM(Sales) As Total_Sales
From Industry
Group BY City
order by City Desc

-- 12. Calculate total Profit by State.
SELECT State, Sum(Profit) AS Total_State
From Industry
Group BY State

-- 13. Calculate average Sales by Category.
SELECT Category, AVG(Sales) AS AVG_sales
From Industry
Group BY Category

-- 14. Find total Quantity sold by Product.
SELECT Product, sum(Quantity ) AS Total_Quantity 
From Industry
Group BY Product

-- 15. Count the number of orders by PaymentMode.
SELECT PaymentMode, COUNT(*) AS Total_Orders
FROM Industry
GROUP BY PaymentMode

-- =========================
-- HAVING
-- =========================
select * from Industry
-- 16. Show cities where total Sales is greater than ₹500,000.
SELECT City, SUM(Sales) as total_sales
FROM Industry
Group By City
Having SUM(Sales) > 500000

-- 17. Show products where total Quantity sold is greater than 100.
SELECT product, SUM(Quantity) as total_Quantity
FROM Industry
Group By product
Having SUM(Quantity) > 100

-- 18. Display Salespersons whose total Profit is greater than ₹50,000.
SELECT Salesperson, SUM(Profit) as total_Profit
FROM Industry
Group By Salesperson
Having SUM(Profit) > 50000

-- =========================
-- Date Functions
-- =========================
-- 19. Find all orders placed in January.
SELECT *
FROM Industry
WHERE MONTH(OrderDate) = 1;

-- 20. Find monthly Sales.
SELECT 
    YEAR(OrderDate) AS Sales_Year,
    MONTH(OrderDate) AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM Industry
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate);

-- 21. Find yearly Sales.
SELECT 
    YEAR(OrderDate) AS Sales_Year,
    SUM(Sales) AS Total_Sales
FROM Industry
GROUP BY YEAR(OrderDate);

-- 22. Find quarterly Sales.
SELECT 
    YEAR(OrderDate) AS Sales_Year,
    DATEPART(QUARTER, OrderDate) AS Sales_Quarter,
    SUM(Sales) AS Total_Sales
FROM Industry
GROUP BY 
    YEAR(OrderDate),
    DATEPART(QUARTER, OrderDate);

-- =========================
-- Ranking & Top Analysis
-- =========================
-- 23. Find the Top 10 Customers by total Sales.
SELECT TOP(10) CustomerName,
SUM(Sales) AS Total_Sales
FROM Industry
Group BY CustomerName
ORDER BY Total_Sales DESC

-- 24. Find the Top 5 Products by Profit.
SELECT TOP(5) Product,
SUM(Profit) AS Total_Profit
FROM Industry
Group BY Product
ORDER BY Total_Profit DESC

-- 25. Find the Bottom 5 Products by Sales.
SELECT TOP(5)
    Product,
    SUM(Sales) AS Total_Sales
FROM Industry
GROUP BY Product
ORDER BY Total_Sales ASC;

