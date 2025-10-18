/*                          WHAT IS SET OPERATORS
Set Operations in SQL combine the results of multiple queries into a single result set.

                              #1 Rule | SQL CLAUSES
--> SET Operators can be used almost in all clauses, WHERE | JOIN | GROUP BY | HAVING

--> ORDER BY is allowed only once at the end of query

                              #2 Rule | NUMBER OF COLUMNS
--> The number of columns of each queary must be the same

                              #3 Rule | DATA TYPES
--> Data Types of columns in each query must be Compatible

                              #4 Rule | ORDER OF COLUMNS
--> THE ORDER of columns of each query must be same

                              #5 Rule | COLUMN ALIASES
--> The columns names is the result set are determined by the column names specified in the first query.

                              #6 Rule | CORRECT COLUMNS
--> Event if all rules are met and SQL shows no errors, the result may be incorrect.

--> Incorrect column selection leads to inaccurate results.
*/
--  #1 Rule | SQL CLAUSES
SELECT
     FirstName,
     LastName
FROM Sales.Customers    
     UNION
SELECT
     FirstName,
     LastName
FROM Sales.Employees

-- #2 Rule | NUMBER OF COLUMNS
SELECT
     CustomerID,
     LastName
FROM Sales.Customers    
     UNION
SELECT
     FirstName,
     LastName
FROM Sales.Employees

 -- #3 Rule | DATA TYPES
 SELECT
     CustomerID,
     LastName
FROM Sales.Customers    
     UNION
SELECT
     EmployeeID,
     LastName
FROM Sales.Employees

-- #4 Rule | ORDER OF COLUMNS
 SELECT
     FirstName,
     CustomerID
FROM Sales.Customers    
     UNION
SELECT
     EmployeeID,
     LastName
FROM Sales.Employees

 -- #5 Rule | COLUMN ALIASES
 SELECT
     CustomerID AS ID,
     LastName
FROM Sales.Customers  

     UNION

SELECT
     EmployeeID,
     LastName AS LastName
FROM Sales.Employees

-- #6 Rule | CORRECT COLUMNS
SELECT
     FirstName,
     LastName
FROM Sales.Customers  

     UNION

SELECT
     FirstName,
     LastName
FROM Sales.Employees

/*                            WHAT IS UNION OPERATORS
UNION operator is a set operator used to combine the result sets of two or 
more SELECT statements into a single result set.
*/

/*                            WHAT IS UNIONALL OPERATORS
The UNION ALL operator in SQL is used to combine the result sets of two or more 
SELECT statements into a single result set.
*/

/*                            WHAT IS EXCEPT OPERATORS
An EXCEPT operator is a set operator in SQL that returns distinct rows from the 
first query that are not present in the second query
*/

/*                            WHAT IS INTERSECT OPERATORS
INTERSECT operator is a set operator in SQL and other database management systems that 
returns only the rows that are common to two or more SELECT statements.
*/

WHAT IS UNION OPERATORS
--> Returns all district rows from both queries.

--> Removes duplicate rows from the result.

-->                         ORDER OF QUERIES 
The order of queries in a UNION operaters does not affect the result
*/
-- Combine the data from employees and customers into one table.
-- 1st step
SELECT *
FROM Sales.Customers

SELECT *
FROM Sales.Employees
 
-- 2nd step
SELECT 
     FirstName,
     LastName
FROM Sales.Customers
    UNION
SELECT 
     FirstName,
     LastName
FROM Sales.Employees 

/*                           WHAT IS UNIONALL OPERATERS
  Returns all rows from both queries, including duplicates.
   
-->         UNION ALL VS UNION
- UNION ALL is generally faster then UNION

- Use UNION ALL to find duplicates and quality issues

- If you`re confident there are no duplicates, use UNION ALL
*/
-- Combine the data from employees and customers into one table, including duplicates.
SELECT 
     FirstName,
     LastName
FROM Sales.Customers
    UNION ALL
SELECT 
     FirstName,
     LastName
FROM Sales.Employees 

/*                            WHAT IS EXCEPT OPERATORS
   - Returns all distinct rows from the first query that are not found in the second query

   - It is the only one where the order of queries affects the final result.

   - ORDER OF QUERIES:- The order of queries in a EXCEPT does affect the result !!
*/
-- Find employees who are not customers at the same time
SELECT 
     FirstName,
     LastName
FROM Sales.Customers
    EXCEPT
SELECT 
     FirstName,
     LastName
FROM Sales.Employees 


/*                            WHAT IS INTERSECT OPERATORS
  Returns only the rows that are common in both queries
*/
-- Find the Employees, who are also Customers.
SELECT 
     FirstName,
     LastName
FROM Sales.Customers
    INTERSECT
SELECT 
     FirstName,
     LastName
FROM Sales.Employees 

/*                UNION USE CASES COMBINE INFORMATION
  Combine similar information before analyzing the data
*/
-- Orders are stored in separate tables(Orders and OrdersArchive).
-- Combine all orders into one report without duplicates.
--1st steps
SELECT
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.Orders
      UNION
SELECT 
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.OrdersArchive

--2nd steps
SELECT
'Orders' AS SourceTable,
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.Orders
      UNION
SELECT 
'OrdersArchive' AS SourceTable,
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID

/*                     EXCEPT USE CASE DELTA DETECTION
  Identifying the differences or changes(delta) between two batches of data.

                        DATA COMPLETENESS CHECK
EXCEPT OPERATOR CAN BE USED TO COMPARE TABLES TO DELECT DISCREPANCIES BETWEEN DATABASES.
*/
