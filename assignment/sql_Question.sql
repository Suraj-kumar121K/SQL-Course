Use Excel
-- =====================================================
-- LEVEL 1 — JOIN
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
SELECT o.Order_ID, e.Employee_Name
FROM Employee_Data as e
INNER JOIN Order_data as o
ON e.Employee_ID = o.Employee_ID

-- 9. Display Employee_Name, Department, and Sales.
SELECT e.Employee_Name, e.Department, o.Sales
FROM Employee_Data as e
INNER JOIN Order_data as o
ON e.Employee_ID = o.Employee_ID


-- 10. Display Customer_Name, Product_Name, and Sales.
SELECT C.Customer_Name, 
       P.Product_Name,   
       O.Sales
FROM Customer_Data AS C
INNER JOIN Order_data AS O
ON C.Customer_ID = O.Customer_ID
INNER JOIN Product_data as P
ON O.Product_ID = P.Product_ID


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

-- Q1. Display Employee Name and Order ID.
SELECT e.Employee_Name, 
       o.Order_ID
FROM Employee_Data AS e
INNER JOIN Order_Data AS o
ON e.Employee_ID = o.Employee_ID

-- Q2. Display Customer Name and Order Date.
SELECT c.Customer_Name,
       o.Order_Date
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID

-- Q3. Display Product Name and Quantity.
SELECT p.Product_Name,
       o.Quantity
FROM Product_data AS p
INNER JOIN Order_data AS o
ON p.Product_ID = o.Product_ID

-- Q4. Display Employee Name and Sales Amount.
SELECT e.Employee_Name,
       o.Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID

-- Q5. Display Customer Name and Sales Amount.
SELECT c.Customer_Name,
       o.Sales
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID

-- Q6. Display Product Name and Sales Amount.
SELECT p.Product_Name,
       o.Sales
FROM Product_data AS p
INNER JOIN Order_data AS o
ON p.Product_ID = o.Product_ID

-- Q7.Display Employee Name, Customer Name, and Order ID.
SELECT e.Employee_Name,
       c.Customer_Name,
       o.Order_ID
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
INNER JOIN Customer_data as c
ON C.Customer_ID = O.Customer_ID

-- Q8. Display Customer Name, Product Name, and Quantity.
SELECT c.Customer_Name,
       p.Product_Name,
       o.Quantity
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
INNER JOIN Product_data AS p
ON p.Product_ID = o.Product_ID

-- Q9. Display Order ID, Employee Name, and Product Name.
SELECT o.Order_ID,
       e.Employee_Name,
       p.Product_Name
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
INNER JOIN Product_data AS p
ON p.Product_ID = o.Product_ID

-- Q10. Display Employee Name, Customer Name, and Product Name.
SELECT e.Employee_Name,
       c.Customer_Name,
       p.Product_Name
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
INNER JOIN Customer_Data AS c
ON C.Customer_ID = o.Customer_ID
INNER JOIN Product_data AS p
ON p.Product_ID = o.Product_ID

-- CROSS JOIN
SELECT
    e.Employee_Name,
    p.Product_Name,
    c.Customer_Name
FROM Employee_Data e
CROSS JOIN Product_Data p
CROSS JOIN Customer_Data c;

-- Q6. Customer Wise Total Sales
SELECT
    c.Customer_Name,
    SUM(o.Sales) AS Total_Sales
FROM Customer_Data c
INNER JOIN Order_Data o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Name;

-- Product Wise Total Sales
SELECT
    p.Product_Name,
    SUM(o.Sales) AS Total_Sales
FROM Product_Data p
INNER JOIN Order_Data o
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_Name;
-- Q8. Employee Wise Total Sales
SELECT
    e.Employee_Name,
    SUM(o.Sales) AS Total_Sales
FROM Employee_Data e
INNER JOIN Order_Data o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name;

-- Q9. Top 5 Customers
SELECT TOP 5
    c.Customer_Name,
    SUM(o.Sales) AS Total_Sales
FROM Customer_Data c
INNER JOIN Order_Data o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC;

-- Q10. Top Selling Product
SELECT TOP 1
    p.Product_Name,
    SUM(o.Sales) AS Total_Sales
FROM Product_Data AS p
INNER JOIN Order_Data AS o
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC;

-- JOIN + Aggregate Functions
-- Q11 Find the Total Sales.
SELECT 
      SUM(SALES) AS Total_Sales
FROM Order_data


-- Q12 Count the Total Orders.
SELECT
    COUNT(Order_ID) AS Total_Order
FROM Order_data

-- Q13 Find Employee-wise Total Sales.
SELECT 
       e.Employee_Name,
       SUM(o.Sales) AS Total_Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name

-- Q14 Find Customer-wise Total Sales.
SELECT  
      c.Customer_Name,
      SUM(o.Sales) as Total_Sales
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Name

-- Q15 Find Product-wise Total Sales.


-- Q16 Find Category-wise Total Sales.

-- Q17 Find City-wise Total Sales.

-- Q18 Find Department-wise Total Sales.

-- Q19 Find Product-wise Total Quantity Sold.

-- Q20 Find Employee-wise Order Count.

-- JOIN + WHERE
-- Q21 Display orders handled by employees from Delhi.
SELECT 
       o.Order_ID,
       e.Employee_Name,
       e.Employee_City,
       o.Order_Date,
       o.Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON o.Employee_ID = e.Employee_ID
WHERE e.Employee_City = 'Delhi';

-- Q22 Display orders placed by customers from Mumbai.
SELECT o.Order_ID,
       c.Customer_Name,
       c.City,
       o.Order_Date
FROM Customer_Data AS c
INNER JOIN Order_data AS o
on c.Customer_ID = o.Customer_ID
WHERE c.City = 'Mumbai'

-- Q23 Display orders where Sales is greater than 50,000.
select *
FROM Order_data AS o
WHERE o.Sales > 50000

-- Q24 Display orders for Electronics products.
SELECT o.*
FROM Product_data AS p
INNER JOIN Order_data AS o
ON p.Product_ID = o.Product_ID
WHERE p.Category = 'Electronics';

-- Q25 Display all Cancelled Orders.
SELECT * FROM Order_data
WHERE Order_Status = 'Cancelled'

-- Q26 Display all Pending Orders.
SELECT * FROM Order_data
WHERE Order_Status = 'Pending'

-- Q27 Display orders paid through UPI.
SELECT * FROM Order_data
WHERE Payment_Method = 'UPI'

-- Q28 Display orders handled by the Sales Department.
SELECT o.*,
       e.Department
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
WHERE e.Department = 'Sales'

-- Q29 Display orders of customers whose age is above 30.
SELECT o.*
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
WHERE c.Age > 30

-- Q30 Display orders placed by Female customers.
SELECT o.*
FROM Customer_Data AS c
INNER JOIN Customer_Data AS o
ON c.Customer_ID = o.Customer_ID
WHERE c.Gender = 'Female'

-- GROUP BY + HAVING
-- Q31 Display employees whose total sales exceed 100,000.
SELECT 
      e.Employee_Name,
      SUM(o.Sales) AS Total_Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
on e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name
HAVING SUM(o.Sales) > 100000

-- Q32 Display customers who placed more than 3 orders.
SELECT c.Customer_ID,
       c.Customer_Name,
       c.City,
       COUNT(o.Order_ID) AS TOTAL_Orders
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID,
         c.Customer_Name,
          c.City
HAVING COUNT(o.Order_ID) > 3
-- Q33 Display products whose total sales exceed 50,000.
SELECT p.Product_ID,
       p.Product_Name,
       SUM(o.Sales) AS Total_Sales
FROM Product_data AS p
INNER JOIN Order_data AS o
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID,
         p.Product_Name
HAVING SUM(o.Sales) > 50000

-- Q34 Display cities whose total sales exceed 100,000.
SELECT c.City,
       SUM(o.Sales) AS Total_Sales
FROM Customer_Data AS c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
HAVING SUM(o.Sales) > 100000

-- Q35 Display departments whose total sales exceed 200,000.
SELECT e.Department,
       SUM(o.Sales) AS Total_Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Department
HAVING SUM(o.Sales) > 200000

-- Q36 Find the Top 5 Customers by Sales.
SELECT TOP 5
           c.Customer_Name,
           SUM(o.Sales) AS Total_Sales
FROM Customer_Data as c
INNER JOIN Order_data AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC

-- Q37 Find the Top 5 Employees by Sales.
SELECT TOP 5
           e.Employee_Name,
           SUM(o.Sales) AS Total_Sales
FROM Employee_Data as e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name
ORDER BY Total_Sales DESC

-- Q38 Find the Top 5 Products by Sales.
SELECT TOP 5
           p.Product_Name,
           SUM(o.Sales) AS Total_Sales
FROM Product_data as p
INNER JOIN Order_data AS o
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC

-- Q39 Find the Product with the Lowest Sales.
SELECT TOP 1
           p.Product_Name,
           SUM(o.Sales) AS Total_Sales
FROM Product_data as p
INNER JOIN Order_data AS o
      ON p.Product_ID = o.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales ASC

-- Q40 Find the City with the Highest Sales.
SELECT TOP 1
           c.City,
           SUM(o.Sales) AS Total_Sales
FROM Customer_Data as c
INNER JOIN Order_data AS o
      ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
ORDER BY Total_Sales DESC

-- Q41: Find the Employee with the Lowest Sales.
SELECT TOP 1
           e.Employee_Name,
           SUM(o.Sales) AS Total_Sales
FROM Employee_Data AS e
INNER JOIN Order_data AS o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name
ORDER BY Total_Sales ASC

-- 4-Table JOIN
-- Q41 Display Employee Name, Customer Name, Product Name, and Sales.

-- Q42 Display Employee Name, Department, Product Name, and Quantity.

-- Q43 Display Customer Name, City, Product Name, and Sales.

-- Q44 Display Customer Name, Gender, Product Name, and Quantity.

-- Q45 Display Employee Name, Customer Name, Product Name, and Order Status.

-- Q46 Find Department-wise Product Sales.

-- Q47 Find City-wise Product Sales.

-- Q48 Find Employee-wise Product Sales.

-- Q49 Find Customer-wise Product Purchase Count.

-- Q50 Find Category-wise Customer Count.

-- Q51 Find the Top 3 Employees by Total Sales.

-- Q52 Find the Top 3 Products by Revenue.

-- Q53 Find the Most Active Customer.

-- Q54 Find the Most Ordered Product.

-- Q55 Find the City with the Highest Revenue.

-- Q56 Find the Department with the Highest Revenue.

-- Q57 Find the Average Order Value for Each Customer.

-- Q58 Find the Average Order Value for Each Product.

-- Q59 Find Month-wise Sales Trend.

-- Q60 Find Department-wise Average Salary and Total Sales.

-- =====================================================
-- LEVEL 1 — Subquery
-- =====================================================
-- Q1 Find employees whose salary is greater than average salary.
SELECT Employee_Name,
       Salary
FROM Employee_Data
WHERE Salary > (
        SELECT AVG(Salary) 
        FROM Employee_Data
)

-- Q2 Find employees whose salary is less than average salary.
SELECT Employee_Name,
       Salary
FROM Employee_Data
WHERE Salary < (
        SELECT AVG(Salary) 
        FROM Employee_Data
)

-- Q3 Find employee(s) with highest salary.
SELECT *
FROM Employee_Data
WHERE Salary = (
                SELECT MAX(Salary) 
                FROM Employee_Data
);
-- Q4 Find employee(s) with lowest salary.
SELECT * 
FROM Employee_Data
WHERE Salary = (
            SELECT MIN(Salary)
            FROM Employee_Data
);

-- Q5 Find products whose unit price is greater than average price.
SELECT Product_ID,
       Product_Name,
       Unit_Price
FROM Product_data
WHERE Unit_Price > (
        SELECT AVG(Unit_price)
        FROM Product_data
);

-- Q6 Find products whose unit price is lower than average price.
SELECT Product_ID,
       Product_Name,
       Unit_Price
FROM Product_data
WHERE Unit_Price < (
        SELECT AVG(Unit_price)
        FROM Product_data
);

-- Q7 Find product(s) with highest unit price.
SELECT * 
FROM Product_data
WHERE Unit_Price = (
      SELECT
      MAX(Unit_Price) 
      FROM Product_data
);

-- Q8 Find product(s) with lowest unit price.
SELECT * 
FROM Product_data
WHERE Unit_Price = (
      SELECT
      MIN(Unit_Price) 
      FROM Product_data
);

-- Q9 Find orders whose sales are above average sales.
SELECT * 
FROM Order_data
WHERE Sales > (
      SELECT
      AVG(Sales)
      FROM Order_data
);

-- Q10 Find orders whose sales are below average sales.
SELECT * 
FROM Order_data
WHERE Sales < (
      SELECT
      AVG(Sales)
      FROM Order_data
);

-- Q11 Find customers older than average age.
SELECT Customer_ID,
       Customer_Name,
       Age
FROM Customer_Data
WHERE Age > (
      SELECT AVG(Age)
      FROM Customer_Data
);


-- Q12 Find customers younger than average age.
SELECT Customer_ID,
       Customer_Name,
       Age
FROM Customer_Data
WHERE Age < (
      SELECT AVG(Age)
      FROM Customer_Data
);

-- Q13 Find customer(s) with highest age.
SELECT *
FROM Customer_Data
WHERE Age = (
      SELECT MAX(Age)
      FROM Customer_Data
);

-- Q14 Find customer(s) with lowest age.
SELECT *
FROM Customer_Data
WHERE Age = (
      SELECT MIN(Age)
      FROM Customer_Data
);

-- Q15 Find orders having maximum sales.
SELECT *
FROM Order_data
WHERE Sales = (
      SELECT MAX(Sales)
      FROM Order_data
);
-- =====================================================
-- Multiple Row Subquery
-- =====================================================
-- Q1 Find customers who placed orders.
SELECT * 
FROM Customer_Data
WHERE Customer_ID IN (
      SELECT Customer_ID
      FROM Order_data
)

-- Q2 Find customers who never placed orders.
SELECT *
FROM Customer_Data
WHERE Customer_ID NOT IN (
      SELECT Customer_ID
      FROM Order_data
);

-- Q3 Find employees who handled orders.
SELECT Employee_Name 
FROM Employee_Data
WHERE Employee_ID IN (
      SELECT Employee_ID
      FROM Order_data
);

-- Q4 Find employees who never handled orders.
SELECT Employee_Name 
FROM Employee_Data
WHERE Employee_ID NOT IN (
        SELECT Employee_ID 
        FROM Order_data
);
-- Q5 Find products that were sold.
SELECT *
FROM Product_data
WHERE Product_ID IN (
    SELECT Product_ID
    FROM Order_data
);

-- Q6 Find products that were never sold.
SELECT *
FROM Product_data
WHERE Product_ID NOT IN (
    SELECT Product_ID
    FROM Order_data
);

-- Q7 Find customers who purchased products from Electronics category.
SELECT *
FROM Customer_Data
WHERE Customer_ID IN (
        SELECT Customer_ID
        FROM Order_data
        WHERE Product_ID IN (
            SELECT Product_ID
            FROM Product_data
            WHERE Category = 'Electronics'
        )
)

-- Q8 Find customers who purchased active products.
SELECT * 
FROM Customer_Data
WHERE Customer_ID IN (
      SELECT Customer_ID
      FROM Order_data
      WHERE Product_ID IN (
            SELECT Product_ID 
            FROM Product_data
            WHERE Product_Status = 'active'
      )
);

-- Q9 Find employees who sold products from Electronics category.
SELECT * 
FROM Employee_Data
WHERE Employee_ID in (
      SELECT Employee_ID
      FROM Order_data
      WHERE Product_ID IN (
            SELECT Product_ID
            FROM Product_data
            WHERE Category = 'Electronics'
      )
);
-- Q10 Find products sold in cancelled orders.

-- Q11 Find customers who paid using UPI.

-- Q12 Find customers who purchased products costing above average price.

-- Q13 Find employees who handled orders with sales above average sales.

-- Q14 Find customers who placed orders through Online channel.

-- Q15 Find products sold through Distributor channel.

-- Q16 Find customers who purchased more than one product.

-- Q17 Find employees who handled more than one order.

-- Q18 Find customers who purchased highest priced products.

-- Q19 Find products purchased by customers from Mumbai.

-- Q20 Find employees who handled orders from Delhi customers.

-- =====================================================
-- Correlated Subquery 
-- =====================================================

-- Q26 Find customers having at least one order.

-- Q27 Find customers with no orders.

-- Q28 Find employees having at least one order.

-- Q29 Find employees with no orders.

-- Q30 Find products having at least one sale.

-- Q31 Find products with no sales.

-- Q32 Find customers who bought active products.

-- Q33 Find employees who handled cancelled orders.

-- Q34 Find customers who paid using UPI.

-- Q35 Find customers who purchased more than one product.

-- =====================================================
-- LEVEL 1 — Correlated Subquery
-- =====================================================
-- Q21 Find employees whose salary is above department average salary.

-- Q22 Find employees whose salary is below department average salary.

-- Q23 Find highest salary employee in each department.

-- Q24 Find lowest salary employee in each department.

-- Q25 Find customers older than average age of their city.

-- Q26 Find customers younger than average age of their city.

-- Q27 Find highest age customer in each city.

-- Q28 Find lowest age customer in each city.

-- Q29 Find highest sales order for each employee.

-- Q30 Find lowest sales order for each employee.

-- Q31 Find highest sales order for each customer.

-- Q32 Find lowest sales order for each customer.

-- Q33 Find most expensive product in each category.

-- Q34 Find cheapest product in each category.

-- Q35 Find products priced above category average.

-- Q36 Find products priced below category average.

-- Q37 Find employees whose total sales are above average employee sales.

-- Q38 Find customers whose total sales are above average customer sales.

-- Q39 Find products whose total sales are above average product sales.

-- Q40 Find cities whose total sales are above average city sales.

-- =====================================================
-- LEVEL 1 — Scalar Subquery
-- =====================================================
-- Q46 Show employee name along with company average salary.

-- Q47 Show customer name along with average customer age.

-- Q48 Show product name along with average product price.

-- Q49 Show order id along with maximum sales.

-- Q50 Show employee name along with total employee count.

-- =====================================================
-- LEVEL 1 — Nested Subquery
-- =====================================================
-- Q51 Find customer who placed the highest sales order.

-- Q52 Find employee who handled the highest sales order.

-- Q53 Find product sold in the highest sales order.

-- Q54 Find city of customer who placed highest sales order.

-- Q55 Find category of the product having highest unit price.

-- =====================================================
-- Aggregate + Subquery
-- =====================================================
-- Q56 Find departments whose average salary is above company average salary.

-- Q57 Find cities whose average customer age is above overall average age.

-- Q58 Find customers whose total sales exceed average customer sales.

-- Q59 Find employees whose total sales exceed average employee sales.

-- Q60 Find products whose total sales exceed average product sales.

-- =====================================================
-- LEVEL 1 — JOIN + Subquery
-- =====================================================
-- Q41 Find customer names who placed orders above average sales.

-- Q42 Find employee names who handled highest sales order.

-- Q43 Find product names whose price is above average product price.

-- Q44 Find customers who purchased highest priced product.

-- Q45 Find employees who sold cheapest product.

-- Q46 Find cities having customers with highest sales orders.

-- Q47 Find departments having employees with above average salary.

-- Q48 Find products sold by employees from Delhi.

-- Q49 Find customers who purchased products from Electronics category.

-- Q50 Find employees who handled orders from Mumbai customers.

-- Q51 Find products sold in orders above average sales.

-- Q52 Find customer names whose orders were cancelled.

-- Q53 Find employees who handled cancelled orders.

-- Q54 Find products purchased through UPI payments.

-- Q55 Find customers who bought inactive products.

-- Q56 Find employees who sold active products.

-- Q57 Find top selling product category.

-- Q58 Find employee handling maximum number of orders.

-- Q59 Find customer placing maximum number of orders.

-- Q60 Find city generating highest sales.

-- =====================================================
-- Real Business Problems
-- =====================================================
-- Q61 Find top 5 customers contributing highest revenue.

-- Q62 Find bottom 5 customers contributing lowest revenue.

-- Q63 Find top 5 employees by revenue.

-- Q64 Find bottom 5 employees by revenue.

-- Q65 Find top 5 products by revenue.

-- Q66 Find bottom 5 products by revenue.

-- Q67 Find category generating maximum revenue.

-- Q68 Find category generating minimum revenue.

-- Q69 Find city generating highest revenue.

-- Q70 Find city generating lowest revenue.

-- Q71 Find customers whose spending is above average customer spending.

-- Q72 Find employees whose performance is above average employee performance.

-- Q73 Find products whose sales are above average product sales.

-- Q74 Find customers with more orders than average customers.

-- Q75 Find employees handling more orders than average employees.

-- Q76 Find products sold more times than average products.

-- Q77 Find most preferred payment method.

-- Q78 Find most used sales channel.

-- Q79 Find customer who purchased the maximum quantity.

-- Q80 Find employee who generated the maximum sales.