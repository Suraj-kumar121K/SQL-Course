Use Excel
-- =====================================================
-- LEVEL 1 — BASIC JOIN
-- =====================================================
-- 1. Join Customers and Orders using Customer_ID with INNER JOIN.
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Product_ID,
    o.Quantity,
    o.Sales
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID;

-- 2. Display Customer_Name and Order_ID.
select c.Customer_Name,
       o.Order_ID
FROM Customer_Data as c
inner join Order_data as o
ON c.Customer_ID = o.Customer_ID;

-- 3. Display Customer_Name, City, and Order Sales.
SELECT
    C.Customer_Name,
    C.City,
    O.Sales
FROM Customer_Data AS C
INNER JOIN Order_data AS O
ON C.Customer_ID = O.Customer_ID

-- 4. Join Orders and Products using Product_ID.
SELECT * FROM Order_data AS O
INNER JOIN Product_data AS P
ON O.Product_ID = P.Product_ID

-- 5. Display Product_Name and Order Quantity.
SELECT P.Product_Name,
       O.Quantity
FROM Order_data AS O
LEFT JOIN Product_data AS P
ON O.Product_ID = P.Product_ID


-- 6. Display Product_Name and Sales Amount.
SELECT P.Product_Name,
       O.Sales
FROM Product_data AS P
Inner JOIN Order_data AS O
ON P.Product_ID = O.Product_ID

-- 7. Join Orders and Employees using Employee_ID.
SELECT *
FROM Order_data AS O
Inner JOIN Employee_Data AS E
ON O.Employee_ID = E.Employee_ID

-- 8. Display Employee_Name and Order_ID.


-- 9. Display Employee_Name, Department, and Sales.

-- 10. Display Customer_Name, Product_Name, and Sales.


-- =====================================================
-- LEVEL 2 — LEFT JOIN / RIGHT JOIN
-- =====================================================

-- 11. Use LEFT JOIN to display all Customers and their Orders.
SELECT * FROM Customer_Data AS C
LEFT JOIN Order_data AS O
ON C.Customer_ID = O.Customer_ID

-- 12. Find Customers who have not placed any Orders.


-- 13. Use LEFT JOIN to display all Products and their Orders.

-- 14. Find Products that have never been ordered.

-- 15. Use LEFT JOIN to display all Employees and their Orders.

-- 16. Find Employees who have not handled any Orders.

-- 17. Join Orders with Customers using RIGHT JOIN.

-- 18. Join Products with Orders using RIGHT JOIN.

-- 19. Join Employees with Orders using RIGHT JOIN.

-- 20. Find unmatched records between Customers and Orders.


-- =====================================================
-- LEVEL 3 — MULTIPLE JOIN
-- =====================================================

-- 21. Join Customers, Orders, and Products in one query.
SELECT * FROM Customer_Data AS C
INNER JOIN Order_data AS O
ON C.Customer_ID = O.Customer_ID
Inner join Product_data AS P
ON O.Product_ID = P.Product_ID

-- 22. Join Customers, Orders, and Employees.

-- 23. Join Orders, Products, and Employees.

-- 24. Join Customers, Orders, Products, and Employees
--     using a four-table JOIN.

-- 25. Display Customer_Name, Product_Name, Employee_Name, and Sales.

-- 26. Display Customer City, Product Category, and Sales.

-- 27. Display Employee Department, Product Category, and Sales.

-- 28. Find Total Sales for each Customer using JOIN.

-- 29. Find Total Quantity Sold for each Product using JOIN.

-- 30. Find Total Sales for each Employee using JOIN.


-- =====================================================
-- LEVEL 4 — JOIN + GROUP BY / HAVING
-- =====================================================

-- 31. Find City-wise Total Sales using JOIN.

-- 32. Find Category-wise Total Sales.

-- 33. Find Department-wise Total Sales.

-- 34. Find the number of Orders for each Customer.

-- 35. Find the total number of Orders for each Product.

-- 36. Find the number of Orders handled by each Employee.

-- 37. Find Customers whose Total Sales are greater than 50,000.

-- 38. Find Products whose Total Sales are greater than 100,000.

-- 39. Find Employees who have handled more than 10 Orders.

-- 40. Find the Top 10 Customers based on Total Sales.

-- Basic Subquery
-- Employee_Data
-- Q1. Find employees whose salary is greater than the average salary of all employees.
SELECT *
FROM Employee_Data
WHERE Salary > (
      SELECT
            avg(Salary)
      FROM Employee_Data
);

-- Q2. Find the employee(s) who have the highest salary.
SELECT Employee_Name, Salary
FROM Employee_Data
WHERE Salary = (
    SELECT max(Salary)
    FROM Employee_Data
);

-- Q3. Find the employee(s) who have the lowest salary.
SELECT Employee_Name, Salary
FROM Employee_Data
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employee_Data
);

--Product_data
-- Q4. Find products whose Unit_Price is greater than the average Unit_Price.
SELECT Product_Name, Unit_Price
FROM Product_data
WHERE Unit_Price > (
    SELECT AVG(unit_Price)
    FROM Product_data
)

-- Q5. Find the product(s) having the highest Unit_Price.
SELECT Product_Name, Unit_Price
FROM Product_data
WHERE Unit_Price = (
    SELECT MAX(unit_Price)
    FROM Product_data
)

-- Q6. Find products whose Unit_Price is lower than the average Unit_Price.
SELECT Product_Name, Unit_Price
FROM Product_data
WHERE Unit_Price < (
    SELECT AVG(unit_Price)
    FROM Product_data
)
-- Order_data
-- Q7. Find orders whose Sales is greater than the average Sales of all orders.

SELECT * FROM Order_data
-- Q8. Find the order(s) having the highest Sales.

-- Q9. Find orders whose Quantity is greater than the average Quantity.

-- =========================================================
-- LEVEL 1 — BASIC SUBQUERY
-- =========================================================
-- Employee_Data

-- Q1. Find employees whose salary is greater than the average salary of all employees.

-- Q2. Find the employee(s) who have the highest salary.

-- Q3. Find the employee(s) who have the lowest salary.

-- Q4. Find employees whose salary is less than the average salary.

-- Q5. Find employees whose salary is equal to the highest salary.


-- Product_data
-- Q6. Find products whose Unit_Price is greater than the average Unit_Price.

-- Q7. Find the product(s) having the highest Unit_Price.

-- Q8. Find the product(s) having the lowest Unit_Price.

-- Q9. Find products whose Unit_Price is less than the average Unit_Price.

-- Q10. Find products whose Unit_Price is equal to the highest Unit_Price.


-- =========================================================
-- LEVEL 2 — ORDER_DATA
-- =========================================================
-- Q11. Find orders whose Sales is greater than the average Sales.

-- Q12. Find orders whose Sales is less than the average Sales.

-- Q13. Find the order(s) having the highest Sales.

-- Q14. Find the order(s) having the lowest Sales.

-- Q15. Find orders whose Quantity is greater than the average Quantity.

-- Q16. Find orders whose Quantity is less than the average Quantity.

-- Q17. Find orders whose Sales is equal to the highest Sales.

-- Q18. Find orders whose Sales is greater than the minimum Sales.

-- Q19. Find orders whose Quantity is equal to the highest Quantity.

-- Q20. Find orders whose Sales is greater than the average Sales
--     and display Order_ID and Sales.


-- =========================================================
-- LEVEL 3 — IN / NOT IN
-- =========================================================
-- Q21. Find customers who have placed at least one order.

-- Q22. Find customers who have never placed an order.

-- Q23. Find products that have been ordered at least once.

-- Q24. Find products that have never been ordered.

-- Q25. Find employees who have processed at least one order.

-- Q26. Find employees who have never processed an order.

-- Q27. Find customers who placed orders with Sales greater than 50,000.

-- Q28. Find products that appear in orders where Quantity is greater than 5.

-- Q29. Find employees who handled orders where Sales was greater than the average Sales.

-- Q30. Find customers who placed an order for a product whose
--     Unit_Price is greater than the average Unit_Price.


-- =========================================================
-- LEVEL 4 — MULTIPLE TABLES + SUBQUERY
-- =========================================================
-- Customer + Order
-- Q31. Find the customer(s) who generated the highest total Sales.

-- Q32. Find the customer(s) who generated the lowest total Sales.

-- Q33. Find customers whose total Sales is greater than the average customer total Sales.

-- Q34. Find customers whose total order Quantity is greater than the average customer order Quantity.

-- Q35. Find customers who placed more orders than the average number of orders per customer.


-- Product + Order
-- Q36. Find the product(s) with the highest total Sales.

-- Q37. Find the product(s) with the lowest total Sales.

-- Q38. Find products whose total Sales is greater than the average product total Sales.

-- Q39. Find products whose total Quantity sold is greater than the average product Quantity sold.

-- Q40. Find products that generated Sales greater than the average Sales of all orders.


-- =========================================================
-- LEVEL 5 — ADVANCED SUBQUERY
-- =========================================================
-- Employee + Order

-- Q41. Find the employee(s) who generated the highest total Sales.

-- Q42. Find employees whose total Sales is greater than the average employee total Sales.

-- Q43. Find employees whose total Quantity is greater than the average employee Quantity.

-- Q44. Find the employee(s) who handled the maximum number of orders.

-- Q45. Find employees who handled more orders than the average number of orders handled by employees.


-- =========================================================
-- LEVEL 6 — CHALLENGING
-- =========================================================
-- Q46. Find the customer who purchased the product with the highest Unit_Price.

-- Q47. Find customers who purchased products whose Unit_Price is greater than the average Unit_Price.

-- Q48. Find employees who handled orders containing the product with the highest Unit_Price.

-- Q49. Find the customer(s) whose total Sales is greater than the total Sales of customer C001.

-- Q50. Find the product(s) whose total Sales is greater than the total Sales of product P001.