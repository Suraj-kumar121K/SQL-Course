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
-->
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

 -- #4 Rule | COLUMN ALIASES
 SELECT
     CustomerID AS ID,
     LastName
FROM Sales.Customers  

     UNION

SELECT
     EmployeeID,
     LastName AS LastName
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
