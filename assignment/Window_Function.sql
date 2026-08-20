use Excel

-- Assign row numbers to all orders based on Order Date.
SELECT Order_ID,
       Order_Date,
       ROW_NUMBER() OVER(
           ORDER BY Order_Date
       ) AS Row_No
FROM Order_Data;

-- Get Latest Order
WITH Latest_Order AS (
    SELECT Order_ID,
           Customer_ID,
           Order_Date,
           ROW_NUMBER() OVER(
                PARTITION BY Customer_ID
                ORDER BY Order_Date DESC
           ) AS RN
    FROM Order_Data
)
SELECT *
FROM Latest_Order
WHERE RN = 1;

-- 1. Assign row numbers to all orders based on Order_Date.
SELECT Order_ID,
       Order_Date


FROM Order_data

-- Rank customers based on total sales.
SELECT Customer_ID,
       SUM(Sales) AS Total_Sales
FROM Order_data
GROUP BY Customer_ID

SELECT Customer_ID,
       SUM(Sales) AS Total_Sales,
       RANK() OVER(
            ORDER BY SUM(Sales) DESC
       ) AS Rank_No
FROM Order_data
GROUP BY Customer_ID;

SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       LAG(Salary) OVER(
       PARTITION BY Department 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Find rank of employees within each department
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       RANK() OVER(
       PARTITION BY Department 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Give unique row number to employees based on salary (highest salary first)
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       ROW_NUMBER() OVER( 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Assign dense rank department wise
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       DENSE_RANK() OVER(
       PARTITION BY Department 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Show previous employee salary within each department
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       LAG(Salary) OVER(
        PARTITION BY Department 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Show next employee salary within each department
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       LEAD(Salary) OVER(
        PARTITION BY Department 
       ORDER BY Salary DESC
       ) AS RN
FROM Employee_data

-- Find highest paid employee from every department
with Hight_Paid_Employee AS (
     SELECT Employee_ID,
           Employee_Name,
           Department,
           Salary,
           RANK() OVER(
                PARTITION BY Department
                ORDER BY Salary DESC
           ) AS High_Salary
     FROM Employee_Data
)
SELECT * 
FROM Hight_Paid_Employee
WHERE High_Salary = 1;

-- Find second highest paid employee from every department
with Hight_Paid_Employee AS (
     SELECT Employee_ID,
           Employee_Name,
           Department,
           Salary,
           RANK() OVER(
                PARTITION BY Department
                ORDER BY Salary DESC
           ) AS High_Salary
     FROM Employee_Data
)
SELECT * 
FROM Hight_Paid_Employee
WHERE High_Salary = 2;

-- Q8 Display top 3 highest paid employees from every department
with Hight_Paid_Employee AS (
     SELECT Employee_ID,
           Employee_Name,
           Department,
           Salary,
           RANK() OVER(
                PARTITION BY Department
                ORDER BY Salary DESC
           ) AS High_Salary
     FROM Employee_Data
)
SELECT * 
FROM Hight_Paid_Employee
WHERE High_Salary <= 3;

-- Q9 Show difference between current salary and previous salary
WITH Current_Salary AS (
     SELECT Employee_ID,
           Employee_Name,
           Department,
           Salary,
           LAG(Salary) OVER(
                  ORDER BY Employee_ID
           ) AS Previous_Salary
     FROM Employee_Data
)
SELECT Employee_ID,
       Employee_Name,
       Department,
       Salary,
       Previous_Salary,
       Salary - Previous_Salary AS Salary_Difference 
FROM Current_Salary

-- Q10 Show total salary of department on every employee row
WITH Show_Salary AS  (
     SELECT Employee_ID,
     Employee_Name,
     Department,
     SUM(Salary) OVER(
        PARTITION BY Department
     ) Total_Salary
     FROM Employee_Data
)
SELECT * FROM Show_salary


-- Q11 Show department average salary on every employee row
WITH Show_Salary AS  (
     SELECT Employee_ID,
     Employee_Name,
     Department,
     Salary,
     AVG(Salary) OVER(
        PARTITION BY Department
     ) Avg_Salary
     FROM Employee_Data
)
SELECT * FROM Show_salary

-- Q12 Create running total salary within department
WITH Show_Salary AS  (
     SELECT Employee_ID,
     Employee_Name,
     Department,
     Salary,
     SUM(Salary) OVER(
        PARTITION BY Department
        ORDER BY Employee_ID
     ) Running_Total
     FROM Employee_Data
)
SELECT * FROM Show_salary

-- Q14 Show salary gap with next employee
WITH Show_Salary AS (
     SELECT Employee_ID,
            Employee_Name,
            Department,
            Salary,
            LEAD(Salary) OVER(
                ORDER BY Employee_ID
            ) AS Next_Salary
     FROM Employee_Data
)
SELECT *,
       Next_Salary - Salary AS Salary_Gap
FROM Show_Salary;

-- Q15 Display top 5 highest paid employees from whole company
WITH Top_Employees AS (
    SELECT Employee_ID,
           Employee_Name,
           Department,
           Salary,
           ROW_NUMBER() OVER(
               ORDER BY Salary DESC
           ) AS RN
    FROM Employee_Data
)
SELECT *
FROM Top_Employees
WHERE RN <= 5;

-- ==========================================
-- JOIN + WINDOW FUNCTION 
-- ==========================================
WITH CTE AS (
    SELECT C.Customer_ID,
           C.Customer_Name,
           O.Order_ID,
           O.Order_Date,
           ROW_NUMBER() OVER(
                PARTITION BY C.Customer_ID
                ORDER BY O.Order_Date DESC
           ) AS RN
    FROM Customer_Data C
    INNER JOIN Order_Data O
    ON C.Customer_ID = O.Customer_ID
)
SELECT *
FROM CTE
WHERE RN = 1;

-- Find the latest order placed by every customer.
WITH Last_Customer AS (
     SELECT c.Customer_ID,
            c.Customer_Name,
            o.Order_ID,
            o.Order_Date,
            ROW_NUMBER() OVER(
                  PARTITION BY c.Customer_ID
                  ORDER BY o.Order_Date
            ) RN
     FROM Customer_Data AS c
     INNER JOIN Order_data AS o
     ON c.Customer_ID = o.Customer_ID
)
SELECT * 
FROM Last_Customer
WHERE RN = 1;

-- ==========================================
-- CASE WHEN
-- ==========================================
-- Basic Syntax
SELECT
    Employee_Name,
    Salary,
    CASE
        WHEN Salary >= 50000 THEN 'High Salary'
        WHEN Salary >= 30000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Category
FROM Employee_Data;

-- Iska logic:
   -- WHEN → condition check karega
   -- THEN → condition TRUE hone par ye value dega
   -- ELSE → koi condition TRUE na ho to ye value
   -- END → CASE statement khatam
   -- AS → output column ka naam

-- 1. Find employees and classify their salary:
-- Salary >= 60000  → 'Excellent'
-- Salary >= 40000  → 'Good'
-- Salary < 40000   → 'Average'
SELECT
    Employee_Name,
    Salary,
    CASE
        WHEN Salary >= 60000 THEN 'Excellent'
        WHEN Salary >= 40000 THEN 'Good'
        WHEN Salary <  40000 THEN 'Average'
        ELSE 'Low Salary'
    END AS Salary_Category
FROM Employee_Data;

-- Q1. Employee_Data
-- Display Employee_Name, Salary and create Salary_Category:
-- Salary >= 60000 → 'High'
-- Salary >= 40000 → 'Medium'
-- Otherwise → 'Low'

SELECT Employee_Name,
       Salary,
CASE
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 40000 THEN 'Medium'
    ELSE 'Low'
    END AS Salary_Category
FROM Employee_Data

-- Q2. Employee_Data
-- Display Employee_Name, Department and create Department_Type:
-- Department = 'IT' → 'Technical'
-- Department = 'HR' → 'Management'
-- Otherwise → 'Other'
SELECT Employee_Name,
       Department,
       CASE
          WHEN Department = 'IT' THEN 'Technical'
          WHEN Department = 'HR' THEN 'Management'
       ELSE 'Other'
       END AS Department_Type
FROM Employee_Data

-- ==========================================
-- JOIN + CASE WHEN
-- ==========================================
-- Display Customer_Name, Order_ID and Order_Amount.
-- Create Order_Category:
-- >= 50000 → 'High'
-- >= 20000 → 'Medium'
-- Otherwise → 'Low'
-- Tables: Customer_Data + Order_Data


-- Display Customer_Name, Product_Name and Price.
-- Create Price_Category:
-- >= 50000 → 'Premium'
-- >= 20000 → 'Standard'
-- Otherwise → 'Budget'
-- Tables: Customer_Data + Order_Data + Product_Data

-- Display Employee_Name, Order_ID and Order_Amount.
-- Create Order_Status:
-- >= 50000 → 'Large Order'
-- >= 20000 → 'Medium Order'
-- Otherwise → 'Small Order'
-- Tables: Employee_Data + Order_Data


-- Display Customer_Name, Order_ID and Order_Amount.
-- Create Customer_Order_Type:
-- >= 100000 → 'VIP'
-- >= 50000 → 'Premium'
-- Otherwise → 'Regular'
-- Tables: Customer_Data + Order_Data

-- Display Customer_Name, Product_Name, Price and Order_Amount.
-- Create Order_Category:
-- Order_Amount >= 50000 AND Price >= 20000 → 'Premium Order'
-- Order_Amount >= 50000 → 'High Value Order'
-- Order_Amount >= 20000 → 'Medium Value Order'
-- Otherwise → 'Low Value Order'
-- Tables: Customer_Data + Order_Data + Product_Data

-- ==========================================
-- Window Function + CASE WHEN
-- ==========================================
SELECT
    Employee_Name,
    Department,
    Salary,
    RANK() OVER(
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS Salary_Rank,
    CASE
        WHEN Salary >= 60000 THEN 'High'
        WHEN Salary >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM Employee_Data;


-- Display Employee_Name, Department and Salary.
-- Find the salary rank within each department.
-- Then create Rank_Status:
-- Rank = 1 → 'Top Performer'
-- Rank = 2 → 'Second Best'
-- Otherwise → 'Other'

-- Display Employee_Name, Department and Salary.
-- Assign ROW_NUMBER() within each department based on Salary DESC.
-- Create Employee_Level:
-- Row Number = 1 → 'Highest Paid'
-- Row Number <= 3 → 'Top 3'
-- Otherwise → 'Regular'

-- Display Employee_Name, Department and Salary.
-- Calculate total salary of each department using SUM() OVER().
-- Create Department_Size:
-- Total Department Salary >= 200000 → 'High Payroll'
-- Total Department Salary >= 100000 → 'Medium Payroll'
-- Otherwise → 'Low Payroll'

-- Display Employee_Name, Department and Salary.
-- Calculate average salary of each department using AVG() OVER().
-- Create Salary_Status:
-- Salary > Department Average → 'Above Average'
-- Salary = Department Average → 'Equal Average'
-- Otherwise → 'Below Average'

-- Display Employee_Name, Department and Salary.
-- Calculate salary rank within each department.
-- Compare employee salary with department average salary.
-- Create Employee_Status:
-- Rank = 1 AND Salary > Department Average → 'Top Performer'
-- Salary > Department Average → 'Above Average'
-- Otherwise → 'Below Average'