use Excel
-- =========================
-- Subqueries
-- =========================
-- 26. Find orders where Sales is greater than the average Sales.

-- 27. Find the customer with the highest total Profit.

-- 28. Find the second highest Sales value.

-- 29. Find all products whose UnitPrice is greater than the average UnitPrice.

-- =========================
-- Window Functions
-- =========================
-- 30. Rank all customers based on total Sales using the RANK() function.

-- =========================
-- Advanced SQL Practice Questions
-- =========================
-- 31. Find the top 5 customers with the highest total Sales.

-- 32. Find the top 10 cities by total Profit.

-- 33. Find the category with the highest average Sales.

-- 34. Find the product that generated the highest total Profit.

-- 35. Display the top 3 salespersons by total Sales.


-- =========================
-- Advanced Subqueries
-- =========================
-- 36. Find all orders where Sales is greater than the average Sales.

-- 37. Find customers whose total Sales is above the overall average customer Sales.

-- 38. Find the second highest Sales amount.

-- 39. Find products whose UnitPrice is greater than the average UnitPrice.

-- 40. Find customers who have placed more orders than the average number of orders per customer.


-- =========================
-- Advanced Window Functions
-- =========================
-- 41. Rank customers by total Sales using RANK().

-- 42. Rank products by total Profit using DENSE_RANK().

-- 43. Display the top 3 orders from each city using ROW_NUMBER().

-- 44. Find the running total of Sales ordered by OrderDate.

-- 45. Display the previous and next Sales value using LAG() and LEAD().


-- =========================
-- Common Table Expressions (CTE)
-- =========================
-- 46. Use a CTE to find the top 10 customers by Profit.

-- 47. Use a CTE to calculate monthly Sales and display only months with Sales above ₹500,000.

-- 48. Use a CTE to calculate the average Profit by Category.

-- 49. Use a recursive CTE to generate numbers from 1 to 100.

-- 50. Use multiple CTEs to compare Sales and Profit by Region.


-- =========================
-- Advanced Date Functions
-- =========================
-- 51. Find monthly Sales for each year.

-- 52. Find quarterly Profit.

-- 53. Find the month with the highest Sales.

-- 54. Calculate the average Sales for each weekday.

-- 55. Find customers who placed orders in the last 30 days.


-- =========================
-- Business Analysis
-- =========================
-- 56. Find the most popular PaymentMode in each City.

-- 57. Calculate the Profit Margin (%) for every order.

-- 58. Find the Warehouse that processed the highest number of orders.

-- 59. Find the OrderStatus with the highest average Sales.

-- 60. Create a report showing City, Total Orders, Total Sales, Total Profit, and Average Sales, sorted by Total Sales in descending order.

-- ===========================================
-- WINDOW FUNCTIONS
-- ROW_NUMBER()
-- ===========================================
-- 1. Assign a row number to each customer based on Sales (Highest to Lowest).
SELECT
    CustomerName,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Number
FROM Industry;

SELECT * FROM Industry
-- 2. Assign a row number to each product within each Category.
SELECT 
      product,
      Category,
      ROW_NUMBER() OVER (PARTITION BY Category
        ORDER BY Product
    ) AS Row_Num
FROM Industry

-- 3. Assign a row number to each order within each Region.
SELECT 
     OrderID,
     City,
     OrderStatus, 
     Region,
     ROW_NUMBER() OVER (PARTITION BY Region ORDER BY OrderID) AS Row_Num
FROM Industry


-- ===========================================
-- RANK()
-- ===========================================
-- 4. Rank all products by Sales.
SELECT 
     Product,
     Sales,
     RANK() OVER (ORDER by Sales DESC) AS Total_Rank
FROM Industry

-- 5. Rank customers within each City based on Profit.
SELECT
    CustomerName,
    City,
    Profit,
    RANK() OVER (
        PARTITION BY City
        ORDER BY Profit DESC
    ) AS Total_Rank
FROM Industry;
-- 6. Rank salespersons by Total Sales.


-- ===========================================
-- DENSE_RANK()
-- ===========================================

-- 7. Give a dense rank to products based on Profit.

-- 8. Find the dense rank of customers within each State based on Sales.


-- ===========================================
-- SUM() OVER()
-- ===========================================

-- 9. Display each order along with the Total Sales of its Region.

-- 10. Show each product with the Total Sales of its Category.

-- 11. Calculate the Running Total of Sales ordered by Order Date.


-- ===========================================
-- AVG() OVER()
-- ===========================================

-- 12. Show each order with the Average Sales of its Category.

-- 13. Display each customer with the Average Profit of their Region.


-- ===========================================
-- MAX() / MIN()
-- ===========================================

-- 14. Display each order with the Highest Sales in its Region.

-- 15. Display each order with the Lowest Profit in its Category.


-- ===========================================
-- LAG()
-- ===========================================

-- 16. Show the Previous Order's Sales for each order.

-- 17. Show the Previous Profit within each Region.

-- 18. Calculate the Difference between Current Sales and Previous Sales.


-- ===========================================
-- LEAD()
-- ===========================================

-- 19. Show the Next Order's Sales.

-- 20. Show the Next Profit within each Category.

-- 21. Calculate the Difference between Current Sales and Next Sales.


-- ===========================================
-- NTILE()
-- ===========================================

-- 22. Divide all customers into 4 groups based on Sales.

-- 23. Divide all products into 5 groups based on Profit.


-- ===========================================
-- FIRST_VALUE()
-- ===========================================

-- 24. Display the Highest Sales in each Region for every row.

-- 25. Show the First Customer in each Category based on Sales.


-- ===========================================
-- LAST_VALUE()
-- ===========================================

-- 26. Display the Lowest Sales in each Region.

-- 27. Show the Last Customer in each Category based on Profit.


-- ===========================================
-- INTERVIEW-LEVEL QUESTIONS
-- ===========================================

-- 28. Find the Top 3 customers in each Region based on Sales.

-- 29. Find the Top 5 products in each Category based on Profit.

-- 30. Find the Second Highest Sale in each State.

-- 31. Find the Third Highest Profit in each City.

-- 32. Calculate the Running Profit by Order Date.

-- 33. Show the Total Sales, Average Sales, and Rank together for each Category.

-- 34. Compare each order's Sales with the Previous Order.

-- 35. Compare each order's Profit with the Next Order.

-- 36. Find customers whose Sales are above the average Sales of their Region.

-- 37. Find the Highest Sales Order in every City without using GROUP BY.