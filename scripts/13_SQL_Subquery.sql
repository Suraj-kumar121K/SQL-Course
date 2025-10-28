         WHAT IS SUBQUERY
     --> A subquery (also called an inner query or nested query) is a query inside another SQL query.

      Non-Correlated Subquery                         Correlated Subquery 
      Subquery is independent of the main query       Subquery is dependent of the main query
      Easier to read                                  Harder to read and more complex
      Can be executed on its Own                      can't be executed on its Own.
      Executed only once leads to better Performance  Executed multiple times leads to bad Performance



              FROM Subquery
   Used as tempoarary table for the main query

   Syntax
   SELECT column1, column2,...
   FROM table_Name
   WHERE Condition) AS Alias

                   SELECT SUBQUERY
  Used to aggregate data side by side with the main query's 
  data, allowing for direct comparison.

  Syntax
    SELECT
        column1,
        (SELECT column FROM table1 WHERE Condition) AS alias
    FROM table1

    JOIN Subquery
    Used to prepare the data (filtering or aggregation) before
    joining it with other tables.

                     WHERE Subquery
   Used for complex filtering logic and makes query more flexible and dynamic
               COMPARISON OPERATORS
   Used to filter data by comparing two values

   Syntax
   SELECT column1, column2,...
   FROM table1
   WHERE column = ( SELECT column FROM table2 WHERE condition) AS Alias

                      IN OPERATOR
  Checks whether a value matches any value from a list.

                       EXISTS
  Check if a subquery returns any rows

  Syntax
       SELECT column1, column2,...
       FROM Table2
       WHERE EXISTS (SELECT 1
                     FROM Table1
                     WHERE Table1.ID = Table2.ID )
/*-------------------------------------------------------------------------------------------------------------------------------------------*/

/*Task: Find the products that have a price
        higher than the average price of all products */
-- Main Query
SELECT
*
FROM
-- Subquery
(SELECT 
ProductID,
Price,
AVG(Price) OVER () AvgPrice
FROM Sales.Products)t
WHERE Price > AvgPrice

-- Rank Customers based on their total amount of sales
-- Main Query
SELECT
*,
RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM
-- Subquery
(SELECT
CustomerID,
SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID)t

-- Show the product IDs, product names, prices, and the total number of orders
-- Main Query
SELECT
ProductID,
Product,
Price,
-- Subquery
    (SELECT COUNT(*) FROM Sales.Orders) AS TotalOrders
FROM Sales.Products;

-- Show all customer details and find the total orders of each customer
SELECT
c.*,
o.TotalOrders
FROM Sales.Customers c
LEFT JOIN (
SELECT
    CustomerID,
    COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID) o
ON c.CustomerID = o.CustomerID

-- Find the products that have a price higher than the average price of all products
SELECT
ProductID,
Price,
(SELECT AVG(Price) FROM Sales.Products) AS AvgPrice
FROM Sales.Products 
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)

-- Show the details of Order made by customers in Germany
SELECT
 *
FROM Sales.Orders
WHERE CustomerID IN
                 (SELECT
                 CustomerID
                 FROM Sales.Customers
                 WHERE Country = 'Germany')

-- Show the details to orders made by customers in Germany
SELECT
 *
FROM Sales.Orders o
WHERE NOT EXISTS
            (SELECT 1
            FROM Sales.Customers c
            WHERE Country = 'Germany'
            AND o.CustomerID = c.CustomerID)
