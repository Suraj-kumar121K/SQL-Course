-- CTE = COMMON TABLE EXPRATION
USE Excel

-- Syntax
-- WITH CTE_Name AS (
--  SELECT Column1, Column2
 -- FROM Table_Name
 -- WHERE Condition
 --)
 -- SELECT *
-- FROM CTE_Name;

WITH Employee_Sales AS (
    SELECT Employee_ID, SUM(Sales) AS Total_Sales
    FROM Order_data
    GROUP BY Employee_ID
)
SELECT *
FROM Employee_Sales;

WITH Electronics_Product AS (
    SELECT Product_ID
    FROM Product_data
    WHERE Category = 'Electronics'
)
SELECT *
FROM Employee_Data
WHERE Employee_ID IN (
      SELECT Employee_ID
      FROM Order_data
      WHERE Product_ID IN (
            SELECT Product_ID
            FROM Electronics_Product
      )
);

-- Multiple CTE
WITH Electronics_Product AS (
     SELECT Product_ID
     FROM Product_data
     WHERE Category = 'Electronics'
),
Employee_Sales AS (
     SELECT Employee_ID
     FROM Order_data
     WHERE Product_ID IN (
           SELECT Product_ID
           FROM Electronics_Product
     )
)
SELECT *
FROM Employee_Data
WHERE Employee_ID IN (
      SELECT Employee_ID
      FROM Employee_Sales
);

-- Q1 Find active products using CTE.
with Active_Product AS (
     SELECT *
     FROM Product_data
     WHERE Product_status = 'Active'
)
SELECT *
FROM Active_Product;

-- ++++++++++++++++++++++++++++++
-- Basic CTE
-- ++++++++++++++++++++++++++++++
-- Q1 Find all active products using CTE.
WITH Active_products AS(
     SELECT *
     FROM Product_data
     WHERE Product_Status = 'Active'
)
SELECT *
FROM Active_products

-- Q2 Find all customers from Mumbai using CTE.
WITH Customer_city AS (
     SELECT * 
     FROM Customer_Data
     WHERE City = 'Mumbai'
)
SELECT * 
FROM Customer_city

-- Q3 Find employees from Delhi using CTE.
WITH Employee_City AS(
            SELECT * 
            FROM Employee_Data
            WHERE Employee_City = 'Delhi'
)
SELECT *
FROM Employee_City

-- Q4 Find products whose price is greater than 10000.
WITH Product_Price AS (
     SELECT *
     FROM Product_data
     WHERE Unit_Price > 10000
)
SELECT *
FROM Product_Price

-- Q5 Find customers whose age is above 30.
WITH Customer_Age AS (
     SELECT *
     FROM Customer_Data
     WHERE Age > 30
)
SELECT *
FROM Customer_Age 

-- Q6 Find employees whose salary is above 50000.
WITH Employee_Salary AS (
     SELECT *
     FROM Employee_Data
     WHERE Salary > 50000
)
SELECT *
FROM Employee_Salary

-- Q7 Find cancelled orders using CTE.
WITH Cancel_Order AS (
       SELECT *
       FROM Order_data
       WHERE Order_Status = 'Cancelled'
)
SELECT *
FROM Cancel_Order 

-- Q8 Find Delivered orders using CTE.
WITH Delivered_Orders AS (
     SELECT * 
     FROM Order_data
     WHERE Order_Status = 'Delivered'
)
SELECT *
FROM Delivered_Orders

-- Q9 Find female customers using CTE.
WITH Female_Customer AS (
     SELECT *
     FROM Customer_data
     WHERE Gender = 'Female'
)
SELECT *
FROM Female_Customer

-- Q10 Find products from Electronics category.
WITH Electronics_Product AS (
     SELECT *
     FROM Product_data
     WHERE Category = 'Electronics'
)
SELECT *
FROM Electronics_Product

-- Q11 Find employees from Sales department.
WITH Employee_sales AS (
     SELECT *
     FROM Employee_Data
     WHERE Department = 'Sales'
)
SELECT *
FROM Employee_sales

-- Q12 Find orders with sales greater than 10000.
WITH Female_Customer AS (
     SELECT *
     FROM Customer_data
     WHERE Gender = 'Female'
)
SELECT *
FROM Female_Customer

-- Q13 Find customers from Kolkata.
WITH All_Customers_IN_Kolkata AS (
     SELECT *
     FROM Customer_data
     WHERE City = 'Kolkata'
)
SELECT *
FROM All_Customers_IN_Kolkata

-- Q14 Find inactive products.
WITH Inactive_products AS (
     SELECT *
     FROM Product_data
     WHERE Product_Status = 'Inactive'
)
SELECT *
FROM Inactive_products

-- Q15 Find employees working in Bengaluru.
WITH Employee_Working AS (
     SELECT *
     FROM Employee_Data
     WHERE Employee_City = 'Bengaluru'
)
SELECT *
FROM Employee_Working

-- ++++++++++++++++++++++++++++++
-- CTE + Aggregate Functions
-- ++++++++++++++++++++++++++++++
-- Q16 Find total sales made by each employee.
WITH Total_Sales AS (
     SELECT Employee_ID,
            SUM(Sales) AS Total_sales
     FROM Order_data
     GROUP BY Employee_ID
)
SELECT * 
FROM Total_Sales

-- Q17 Find total orders placed by each customer.
WITH Total_Order AS (
     SELECT Customer_ID,
            COUNT(*) AS Total_Orders
     FROM Order_data
     GROUP BY Customer_ID
)
SELECT c.Customer_Name,
       t.Total_Orders
FROM Total_Order AS t
INNER JOIN Customer_Data AS c
ON t.Customer_ID = c.Customer_ID;

-- Q18 Find average salary by department.
WITH Department_average_salary AS (
     SELECT Department,
            AVG(Salary) AS avg_salary
     FROM Employee_Data
     GROUP BY Department
)
SELECT * 
FROM Department_average_salary

-- Q19 Find highest product price.
WITH High_Product AS (
     SELECT MAX(Unit_Price) AS High_Price
     FROM Product_data
)
SELECT p.* 
FROM Product_data AS p
JOIN High_Product AS h
ON p.Unit_Price = h.High_Price

-- Q20 Find lowest product price.
WITH Lowest_Product AS (
     SELECT MIN(Unit_Price) AS lowest_Price
     FROM Product_data
)
SELECT p.* 
FROM Product_data AS p
JOIN Lowest_Product AS l
ON p.Unit_Price = l.lowest_Price

-- Q21 Find total quantity sold for each product.
WITH Total_Product AS (
     SELECT Product_ID,
            SUM(Quantity) Total_quantity
     FROM Order_data
     GROUP BY Product_ID
)
SELECT p.Product_Name,
       t.Total_quantity
FROM Total_Product AS t
INNER JOIN Product_data AS p
ON t.Product_ID = p.Product_ID

-- Q22 Find total sales by order status.
WITH Total_Sales AS (
     SELECT Order_Status,
            SUM(Sales) AS Total_Sales
     FROM Order_data
     GROUP BY Order_Status
)
SELECT * 
FROM Total_Sales

-- Q23 Find number of customers in each city.
WITH Total_Number AS (
       SELECT City,
              COUNT(Customer_ID) as Total_City
       FROM Customer_Data
       GROUP BY City
)
SELECT * 
FROM Total_Number

-- Q24 Find number of employees in each department.
WITH Total_Employee AS (
     SELECT Department,
            COUNT(*) AS Total_Department
     FROM Employee_Data
     GROUP BY Department
)
SELECT * 
FROM Total_Employee

-- Q25 Find average customer age by city.
WITH Avg_Customer AS (
    SELECT City,
           AVG(Age) AS Avg_age
    FROM Customer_Data
    GROUP BY City
)
SELECT * 
FROM Avg_Customer

-- ++++++++++++++++++++++++++++++
-- CTE + Subquery
-- ++++++++++++++++++++++++++++++
-- Q26 Find customers who placed at least one order.
WITH Customer AS (
    SELECT *
    FROM Customer_Data
    WHERE Customer_ID IN (
        SELECT 
              Customer_ID
        FROM Order_data
    )
)
SELECT * 
FROM Customer

-- Q27 Find customers who never placed an order.
WITH Not_present_Customer AS (
    SELECT *
    FROM Customer_Data
    WHERE Customer_ID NOT IN (
        SELECT Customer_ID
        FROM Order_data
    )
)
SELECT * FROM Not_present_Customer

-- Q28 Find employees who handled at least one order.

-- Q29 Find employees who never handled any order.

-- Q30 Find products that were ordered at least once.

-- Q31 Find products never ordered.

-- Q32 Find employees who sold Electronics products.

-- Q33 Find customers who ordered Electronics products.

-- Q34 Find employees who sold active products only.

-- Q35 Find customers who purchased products costing more than 5000.

-- ++++++++++++++++++++++++++++++
-- CTE + JOIN
-- ++++++++++++++++++++++++++++++
-- Q36 Display customer names with their order IDs.

-- Q37 Display employee names with their handled orders.

-- Q38 Display product names with order details.

-- Q39 Display customer name and product name for each order.

-- Q40 Display employee name and product name for each order.

-- Q41 Display customer city and total orders.

-- Q42 Display employee department and total sales.

-- Q43 Display category-wise sales.

-- Q44 Display customer name, product name, and employee name.

-- Q45 Display orders handled by employees from Delhi.

-- ++++++++++++++++++++++++++++++
-- Real Business Problems
-- ++++++++++++++++++++++++++++++
-- Q46 Find the top-selling product by quantity.

-- Q47 Find the customer who placed the most orders.

-- Q48 Find the employee with the highest total sales.

-- Q49 Find the category generating the highest revenue.

-- Q50 Find customers who purchased more than 5 different products.