/*                       CASE STATEMENT
   Evaluates a list of conditions and returns a value when the 
   first condition is met.

   Syntax
   |-------------------------------------------|
   |CASE                                       |
   |    WHEN condition1 THEN result1           |
   |                                           |
   |    WHEN condition2 THEN result2           |
   |                                           |
   |    ...                                    |
   |                                           |
   |    ELSE result                            |
   |                                           |
   |END                                        |
   |-------------------------------------------|

   #1 CATEGORIZING DATA
          Main purpose is Data Transformation

          Derive new information
    - Create new Columns based on existing data.

    --> CATEGORIZING DATA:- Group the data different categories based on certain conditions.

    --> The data type of the results must be matching

     #2 MAPPING VALUES
        Transform the values from one from to another.

     #3 HANDLING NULLS
        Replace NULLS with a specific value.

        NULLS can lead to inaccurate results.
        which can lead to wrong decision-making. 

*/

/* Create report showing total sales for each of the following categories:
   High (sales over 50), Medium (sales 21-50), and Low (sales 20 or less)
   sort the categories from highest sales to lowest */
SELECT  
     Category,
     SUM(Sales) AS TotalSales
FROM(
     SELECT
          OrderID,
          Sales,
          CASE
             WHEN Sales > 50 THEN 'High'
             WHEN Sales > 20 THEN 'Medium'
             ELSE 'Low'
          END Category
          FROM Sales.Orders
)t
GROUP BY Category
ORDER BY TotalSales DESC

-- Retrive emplyee details with gender displayed as full text.
SELECT
     EmployeeID,
     FirstName,
     LastName,
     Gender,
     CASE
        WHEN Gender = 'F' THEN 'Female'
        WHEN Gender = 'M' THEN 'MALE'
        ELSE  'NOT Avaiable'
     END GenderFullText
FROM Sales.Employees

-- Retrive customers details with abbreviated country code
SELECT
     CustomerID,
     FirstName,
     LastName,
     Country,
     CASE
        WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA' THEN 'US'
        ELSE  'N/A'
     END CountryAbbr,
-- QUICK FROM
     CASE Country
        WHEN 'Germany' THEN 'DE'
        WHEN 'USA' THEN 'US'
        ELSE 'N/A'
     END CountryAbbr2
FROM Sales.Customers

SELECT DISTINCT Country
FROM Sales.Customers

-- Find the average score of customers and treaf nulls as 0
SELECT
    CustomerID,
    LastName,
    Score,
    CASE 
        WHEN Score IS NULL THEN 0
        ELSE Score
     END ScoreClean,
AVG(Score) OVER() AvgCustomer
FROM.Sales.Customers

-- Additionally provide details such CustomersID and LastName
SELECT
    CustomerID,
    LastName,
    Score,
    CASE 
        WHEN Score IS NULL THEN 0
        ELSE Score
     END ScoreClean,

AVG(CASE 
        WHEN Score IS NULL THEN 0
        ELSE Score
     END) OVER() AvgCustomerClean,
AVG(Score) OVER() AvgCustomer
FROM.Sales.Customers

