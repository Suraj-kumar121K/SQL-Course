/*       WHAT IS NULL 
   NULL means nothing, Unknown!

   NULL is not equal to anything!
        - NULL is not zero
        - NULL is not empty string
        - NULL is not blank space

             NULL Functions
   ISNULL:- Replaces 'NULL' with a specified value

   Syntax
       ISNULL(value, replacement_value)

   Examples
          ISNULL(Shipping_Address, 'unknown')

                           COALESCE
 COALESCE():- Returns the first non-null value from a list

   Syntax
       COALESCE(value1, value2, value3, ...)

   Examples
          COALESCE(Shipping_Address, Billing_Address, 'unknown')
*/

/*                 ISNULL VS COALESCE
|---------------------------|-------------------------------|
|         ISNULL            |         COALESCE              |
|---------------------------|-------------------------------|
|1. Limited to two value    |1.       Unlimited             |
|                           |                               |
|2.        Fast             |2.      Slow                   |
|                           |                               |
| 3. SQL Server --> ISNULL  |3. Available in All Databases  |
|    Oracle --> NVL         |                               |
|    MYSQL --> IFNULL       |                               |
|---------------------------|-------------------------------|
*/

-- DATA AGGREGATION
-- Find the average scores of the customers
SELECT
     customerID,
     Score,
COALESCE(Score, 0) Score2,
AVG(Score) OVER () AvgScore,
AVG(COALESCE(Score, 0)) OVER () AvgScore2
FROM Sales.Customers

/*    MATHEMATICAL OPERATIONS
         ISNULL | COALESCE
           - USE CASE -
Handle The NULL before doing mathematical operations
*/

-- Display the full name of customers in a single field
-- by merging their first and last names,
-- and add 10 bouns points to each customer's score.
SELECT
    CustomerID,
    FirstName,
    LastName,
    FirstName + ' ' + COALESCE(LastName, '') AS FullName,
    Score,
    COALESCE(Score, 0) + 10 AS ScoreWithBonus
FROM Sales.Customers

/*      HANDLING NULLS JOINS
           ISNULL | COALESCE
             - USE CASE -
   Handle The NULL before JOINING tables


        HANDLING NULLS SORTING DATA
           ISNULL | COALESCE
             - USE CASE -
   Handle The NULL before SORTING DATA

   #1 METHOD
   Repalce the NULLs with very big number 
*/

-- Sort the customers from lowest to highest score,
-- With nulls appearing last
SELECT 
     customerID,
     Score,
COALESCE(Score, 999999)
FROM Sales.Customers
ORDER BY COALESCE(Score, 999999)

SELECT 
     customerID,
     Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


/*                   NULLIF
   NULLIF():- Compares two expression returns.
            - NULL, if they are equal.
            - First Value, if they are not equal. 
   Syntax
   NULLIF(value1, value2)

   Examples
   NULLIF(Shipping_Address, Billing_Address)

                 NULLIF
             - USE CASE -
   Preventing the error of dividing by zero
*/

-- Find the sales price for each order bi diviing sales by quantity
SELECT
     OrderID,
     Sales,
     Quantity,
    Sales / NULLIF(Quantity, 0) AS Price
FROM Sales.Orders
 

/* IS NULL:- Returns TRUE if the value IS NULL 
             Otherwise it returns FALSE.

   IS NOT NULL:- Returns TRUE if the value IS NOT NULL 
                 Otherwise it returns FALSE.
    
    Syntax
         Value IS NULL
         Value IS NOT NULL

    Example
         Shipping_Address IS NULL 
         Shipping_Address IS NOT NULL

           IS NULL | IS NOT NULL
              - USE CASE -
      Searching for missing information
*/

-- Identify the customers who have no scores
SELECT *
FROM Sales.Customers
WHERE Score IS NULL

-- List all customers who have scores
SELECT *
FROM Sales.Customers
WHERE Score IS NOT NULL

/*                  IS NULL USE CASE
                       ANTI JOINS
            LEFT ANTI JOIN | RIGHT ANTI JOIN
                      - USE CASE -
      Finding the unmatched rows between two tables
*/
-- list all details for customers who have not placed any orders
SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

/*            NULL
   means nothing, unknown!

              EMPTY STRING "
   String value has zero characters

              BLANK SPACE ' '
   String value has one or more space characters            
*/
WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, ' '
)
SELECT 
*,
DATALENGTH (Category) CategoryLen
FROM Orders

/*             HANDLING NULLS DATA POLICIES 
   Set of rules that defines how data should be handled.

   #1 DATA POLICY
      Only use NULLs and empty strings, but avoid blanks
    
   #2 DATA POLICY
      Only use NULLS and avoid using empty strings and but blanks spaces
   
   #3 DATA POLICY
      Use the default value 'unknown' and avoid using nulls, empty string, and blank spaces.

                     #2 DATA POLICY
                       - USE CASE -
   Replacing empty strings and blanks with NULL during data preparation 
   before inserting into a database to optimize storage and
   performance.

                     #3 DATA POLICY
                       - USE CASE -
   Replacing empty strings, blanks, NULL with default value
   during data preparation before using it in reporting to 
   improve readiblity and reduce confusion
*/
-- 1st steps
WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
SELECT 
*,
TRIM(Category) policy1
FROM Orders


-- 2nd steps
WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
SELECT 
*,
TRIM(Category) policy1,
NULLIF(TRIM(Category), '') policy2 
FROM Orders

-- 3rd steps
WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
SELECT 
*,
TRIM(Category) policy1,
NULLIF(TRIM(Category), '') policy2 ,
COALESCE(NULLIF(TRIM(Category), ''), 'unknown') policy3
FROM Orders


