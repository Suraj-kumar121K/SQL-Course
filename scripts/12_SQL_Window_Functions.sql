--> WHAT IS Window Functions 
    Window Function performs a calculation across a set of table rows that are related to the current row.

   Perform calculations(e.g. aggregation) on a specific subset of data, without losing the level of details of rows.
  |-----------------------------|---------------------------|
  |       GROUP BY              |        WINDOW             |
  |_____________________________|___________________________|
  |     Simple Aggregations     |      Aggregations         |
  |                             |            +              |
  |                             |      Keep details         |
  |_____________________________|___________________________|                                                       
  |          Simple             |       Advanced            |
  |       Data Analytics        |     Data Analytics        |
  |_____________________________|___________________________|

    
  |-----------------------------|---------------------------|
  |       GROUP BY Functions    |    WINDOW Functions       |  
  |_____________________________|___________________________|
  |            |COUNT()         |            |COUNT()       |
  |            |SUM()           |            |SUM()         |
  |Aggregations|AVG()           |Aggregations|AVG()         |
  |Functions   |MIX()           |Functions   |MIX()         |
  |            |MAX()           |            |MAX()         |
  |____________|________________|____________|______________|                                                       
                                _____________________________
                                |            |ROW_NUMBER()  |
                                |            |RANK()        |
                                |RANK        |DENSE_RANK()  |
                                |Functions   |CUME_DIST()   |
                                |            |PERCENT_RANK()|
                                |            |NTILE(n)      |
                                |____________|______________|
                                _____________________________
                                |            |LEAD()        |
                                |  Value     |LAG()         |
                                |(Analytics) |FIRST_VALUE() |
                                |Functions   |FIRST_VALUe() |
                                |____________|______________|
</> Window Syntax
                              Over Clause
   ___________   _________________________________________
  |           | |  ___________   ___________   _________  | 
  |   Window  | | | Partition | |   Order   | |  Frame  | |
  |  Function | | |  Clause   | |  Clause   | |  Clause | |
  |           | | |___________| |___________| |_________| |
  |___________| |_________________________________________|
  
  AVG(Sales OVER (PARTITION BY Category ORDER BY OrderDate ROWS UNBOUNDED PRECEDING)

f(x) WINDOW FUNCTIONS
     Perform calculations within a window
  </> Window Syntax
    Window Function                
      AVG(Sales) 
            |
         Function
        Expression

  --> Function Expression
      Arguments you pass to a function  

      Syntax
      Empty:- RANK() OVER (ORDER BY OrderDate)

      Column:- AVG(Sales) OVER (ORDER BY OrderDate)

      Number:- NTEIL(2) OVER (ORDER BY OrderDate)

      Multiple Arguments:- LEAD(Sales,2,10) OVER (ORDER BY OrderDate)

      Conditional Logic:- SUM(CASE WHEN Sales > 100 THEN 1 ELSE 0 END) OVER (ORDER BY OrderDate) 
 
                                        Over Clause
                                           \/
Window Function  __________________________||________________________________________________________                         
_______________|  |                                     Order Clause                                  |
      |        |  |                                          |                                        | 
 AVG(Sales)    |  |OVER (|PARTITION BY Category| - |ORDER BY OrderDate| _ |ROWS UNBOUNDED PRECEDING|) |
                                 |                                              |
                           PARTITION Clause                                Frame Clause


    OVER CLAUSE:- Tells SQL that the function used is a window function
    It defines a window or subset of data

    PARTITION BY:- Divides the result set into PARTITION(Windows)
    PARTITION by Divides the rows into groups, based on the column/s
 
   Without    | Total sales across all rows (Entire Result Set) 
  Partition By| SUM(Sales) OVER ()

  Partition By | Total sales each Product
 Single Column | Sum(Sales) OVER (PARTITION BY Product) 

  Partition By | Total sales for each combination of Product and Order  Status
  Combined-    | Sum(Sales) OVER (PARTITION BY Product, OrderStatus)

--> Common Window Functions
|      Function     |             Description                      |
| ----------------- | -------------------------------------------- |
| `ROW_NUMBER()`    | Assigns a unique number to each row in order |
| `RANK()`          | Gives rank with gaps for ties                |
| `DENSE_RANK()`    | Gives rank without gaps for ties             |
| `NTILE(n)`        | Divides rows into `n` equal groups           |
| `SUM()`           | Running or cumulative total                  |
| `AVG()`           | Average within a group (window)              |
| `MIN()` / `MAX()` | Minimum or maximum within a window           |
| `LAG()`           | Value from a **previous row**                |
| `LEAD()`          | Value from a **next row**                    |

/*-------------------------------------------------------------------------------------------------------------------------------------------*/ 

-- Find the total sales across all orders
SELECT
SUM(Sales) AS TotalSales
FROM Sales.Orders

-- Find the total sales for each product
SELECT
    ProductID,
SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY ProductID

/* Find the total sales for each product, 
Assitionally provide details such order id, order date */
SELECT
    OrderID,
    OrderDate,
    ProductID,
SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProducts
FROM Sales.Orders

-- Find the total sales across all orders., 
-- Assitionally provide details such order id, order date 
SELECT 
    OrderID,
    OrderDate,
SUM(Sales) OVER() AS TotalSales
FROM Sales.Orders

-- Find the total sales across all orders.
-- Find the total sales for each product 
-- Find the total sales for each combination of product and order status
-- Assitionally provide details such order id, order date 
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
SUM(Sales) OVER() AS TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) AS SalesByProducts,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS SalesByProductsAndStatus
FROM Sales.Orders

/* -->  Window Function Order By
        Sort the data within a window
           (Ascending | Descending)

  Syntax
  RANK() OVER (PARTITION BY Month ORDER BY Sales DESC)
 */

-- Rank each order on their sales highest to lowest
-- Assitionally provide details such order id, order date 
SELECT 
    OrderID,
    OrderDate,
    Sales,
RANK() OVER (ORDER BY Sales ASC) AS RankSales
FROM Sales.Orders

/* -->  Window FRAME
        Defines a subset of rows within each window that is 
        relevant for the calculation
           

  Syntax
  AVG(Sales) OVER (PARTITION BY Category ORDER BY OrderDate
       Rows  BETWEEN  CURRENT ROW AND UNBOUNDED PRECEDING)
      |____|          |_________|      |_________________|
    Frame Types      Frame Boundary        Frame Boundary
         |            (Lower value)        (Higher value)         
 ROWS ---|         CURRENT ROW ---|           |--- CURRENT ROW
RANGE ---|         N PRECEDING ---|           |--- N FoLLOWING
           UNBOUNDED PRECEDING ---|           |--- UNBOUNDED PRECEDING
 */
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
ROWS  BETWEEN  CURRENT ROW AND 2 FOLLOWING) AS TotalSales
FROM Sales.Orders

/*                 COMPACT FRAME
   For only PRECEDING, the CURRENT ROW can be skipped

   NORMAL FORM ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
   SHORT FROM ROWS 2 FOLLOWING

   NOTE:- Window Functions can't used to filter Data

   #4 RULE
      Window Function can be used together with GROUP BY in
      the same query, ONLY if the same columns are used
*/
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
ROWS 2 PRECEDING) AS TotalSales
FROM Sales.Orders

-- 4X Rule
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) AS TotalSales
FROM Sales.Orders
-- ORDER BY SUM(Sales) OVER(PARTITION BY OrderStatus) DESC 
WHERE ProductID IN (101, 102)

-- Rank Customers based on their total sales
SELECT 
   CustomerID,
SUM(Sales) AS TotalSales,
RANK() over(ORDER BY SUM(Sales) DESC) AS RankCustomers
FROM Sales.Orders
GROUP BY CustomerID

/* Aggregate Window Functions
AVG(Sales) OVER (PARTITION BY ProductID ORDER BY Sales */

/*                    COUNT()
   Returns the number of rows within a window

                      COUNT(*)
   counts all the rows in a table,
   regardless of whether any value is NULL
*/

-- Find the total number of orders
-- Find the total number of orders for each customers
-- Assitionally provide details such order id, order date 
Select 
    OrderID,
    OrderDate,
COUNT(*) OVER() ToatlOrders,
COUNT(*) OVER (PARTITION BY CustomerID) OrderByCustomers
FROM Sales.Orders 

-- Find the total number of customers
-- Find the total number of score for the customers
-- Assitionally provide details All Customers Details
Select 
    *,
COUNT(*) OVER() ToatlCustomers,
COUNT(1) OVER() ToatlCustomersOne,
COUNT(Score) OVER() TotalScores,
COUNT(Country) OVER() TotalCountry
FROM Sales.Customers

/*            DATA QUALITY ISSUE
   Duplicates leads to inaccuracies in analysis

   COUNT() can be used to identify duplicates

   #1 Overall Analysis
   #2 Category Analysis
   #3 Quality Checks: Identify NULLS
   #4 Quality Checks: Identify Duplicates
*/

-- Check whether the table 'orders' contains any duplicate rows
SELECT
   *
FROM (
   SELECT
       OrderID,
    COUNT(*) OVER (PARTITION BY OrderID) CheckPK
    FROM Sales.OrdersArchive
)t WHERE CheckPK > 1

/*                 SUM()
   Returns the sum of values within a window 
*/
SELECT
    OrderID,
    OrderDate,
    Sales,
    ProductID,
SUM(Sales) OVER () TotalSales,
SUM(Sales) OVER (PARTITION BY ProductID) SalesByProducts
FROM Sales.Orders

-- Find the percentag contribution of each product's sales to the total sales
SELECT
    OrderID,
    ProductID,
    Sales,
SUM(Sales) OVER () TotalSales,
ROUND (CAST (Sales AS Float) / SUM(Sales) OVER () * 100,2) AS percentagOfTotal
FROM Sales.Orders

/*                 AVG()
   Returns the Average of values within a window 
*/

-- Find the average sales across all orders
-- And Find the average sales for each product
-- Assitionally provide details such order id, order date 
SELECT
    OrderID,
    OrderDate,
    Sales,
    ProductID,
AVG(Sales) OVER () AS AvgSales,
AVG(Sales) OVER (PARTITION BY ProductID) AS AvgSalesBYProducts
FROM Sales.Orders

-- Find the average  scores of customers
-- Assitionally provide details such CustomerID, and LastName
SELECT
   CustomerID,
   LastName,
   Score,
COALESCE(Score,0) CustomerScore,
AVG(Score) OVER () AS AvgScore,
AVG(COALESCE(Score, 0)) OVER () AS AvgScoreWithoutNull
FROM Sales.Customers

-- Find all orders where are higher than average sales across all orders
SELECT
*
FROM(
     SELECT  
         OrderID,
         ProductID,
         Sales,
         AVG(Sales) OVER() AvgSales
      FROM Sales.Orders
)t WHERE Sales > AvgSales

/*                 MIN()
   Returns the lowest values within a window 

                   MAX()
    Returns the highest values within a window                
*/
-- Find the highest and lowest sales of all orders
-- Find the highest and lowest sales for each product
-- Additionally priovide details such order Id, order date
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
MAX(Sales) OVER() AS HighestSales,
MIN(Sales) OVER() AS LowestSales,
MAX(Sales) OVER(PARTITION BY ProductID) AS HighestSalesProduct,
MIN(Sales) OVER(PARTITION BY ProductID) AS LowestSalesProduct
FROM Sales.Orders

-- Show the employees who have the highest salaries
SELECT
 *
 FROM (
     SELECT
        *,
        MAX(Salary) OVER() HighestSalery
        FROM Sales.Employees
)t WHERE Salary = HighestSalery 

-- Find the deviation of each sales from the minimum and maximum sales amounts
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
MAX(Sales) OVER() AS HighestSales,
MIN(Sales) OVER() AS LowestSales,
Sales - MIN(Sales) OVER() AS DeviationFromMin, 
MIN(Sales) OVER() - Sales DeviationFromMax 
FROM Sales.Orders

/*        RUNNING & ROLLING TOTAL

         TRACKING                     TRACKING ANALYSIS
     Tracking Current Sales            Providing insights into
       With Target Sales                  Hisotrical Patterns

       They aggregate sequence of members, and the aggregation 
       is updates each time a new member a new member is add

     RUNNING TOTAL:- Aggregate all values from the beginning up to the current point without dropping off older date.
     
     ROLLING TOTAL:- Aggregate all value wiyhin a fixed time window (e.g.30 days).
     AS new date is added, the oldest date points will be dropped.
*/
-- Calculate moving average of sales for each product over time
-- Calculate moving average of sales for each product over time, including only the next order
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
AVG(Sales) OVER(PARTITION BY ProductID) AvgByProducts,
AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAvg,
AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAvg
FROM Sales.Orders

/*                     Ranking Window Functions 
                ROW_NUMBER()
   - Assign a unique number to each row.
   - It doesn't handle ties.
*/
-- Rank the orders based om their sales form hihgest to lowest
SELECT
    OrderID,
    ProductID,
    Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row
FROM Sales.Orders

/*              RANK()
   - Assign a rank to each row.
   - It handle ties.
   -It leaves gaps in ranking
*/
SELECT
    OrderID,
    ProductID,
    Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row,
RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank
FROM Sales.Orders

/*              DENSE_RANK()
   - Assign a rank to each row.
   - It handle ties.
   -It doesn't leaves gaps in ranking
*/
SELECT
    OrderID,
    ProductID,
    Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row,
RANK() OVER (ORDER BY Sales DESC) SalesRank_Rank,
DENSE_RANK() OVER (ORDER BY Sales DESC) SalesDENSE_RANK
FROM Sales.Orders

-- Find the top highest sales for each product
SELECT *
FROM (

    SELECT
        OrderID,
        ProductID,
        Sales,
     ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct
FROM Sales.Orders
)t WHERE RankByProduct = 1

-- Find the lowest 2 customers based on their total sales
SELECT *
FROM(
     SELECT
        CustomerID,
        SUM(Sales) AS TotalSales,
        ROW_NUMBER() OVER (ORDER BY SUM(Sales)) AS RankCustomers
     FROM Sales.Orders
     GROUP BY CustomerID
)t WHERE RankCustomers <= 2

-- ASSIGN UNIQUE idS TO THE ROWS OF THE 'Orders Achive' table
SELECT
     ROW_NUMBER() OVER (ORDER BY OrderID, OrderDate) AS UniqueID,
     *
FROM Sales.OrdersArchive

/*                   USE CASE
               IDENTIFY DUPLICATES
   Identify and remove duplicate rows to improve data quality
*/
-- Identify duplicate rows in the table 'Orders Achive'
-- and return a clean result without any duplicates
SELECT * from(
SELECT
     ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) AS rn,
     *
from sALES.OrdersArchive
)t WHERE rn > 1

/*                 ROW_NUMBER / USE CASE
   #1 Top - N Analysis
   #2 Bottom - N Analysis
   #3 Assign
   #4 Quality Checks: Identify Duplicates

                           NTILE()
   Divides the rows into a specified number of approximatelyequal groups(Buckets)
                         NTILE | USE CASES
       DATA ANALYST               DATA ENGINEER
    Data Segmentation            Equalizing load
                                   Processing
                   DATA SEGMENTATION
  Divides a dataset into distinct subsets based on certain criteria.

       CUME_DIST                      PERCENT_RANK
       position Nr                   Position Nr - 1
    ------------------            ---------------------
      Number of Rows                Number of Rows - 1

           Inclusive                           Exclusive
   (The current row is included)      (The current row is excluded)

                      CUME_DIST() 
   Cumulative Distribution calculates the distribution of data points within a window

                     PERCENT_RANK()
   Calculates the relative position of each row
*/
SELECT
     OrderID,
     Sales,
     NTILE(4) OVER(ORDER BY Sales DESC) AS FourBucket,
     NTILE(3) OVER(ORDER BY Sales DESC) AS ThreeBucket,
     NTILE(2) OVER(ORDER BY Sales DESC) AS TwoBucket,
     NTILE(1) OVER(ORDER BY Sales DESC) AS OneBucket
FROM Sales.Orders

-- Segment all orders into 3 categories: high, medium and low sales.
SELECT
     *,
CASE WHEN Buckets = 1 THEN 'High'
     WHEN Buckets = 2 THEN 'Medium'
     WHEN Buckets = 3 THEN 'Low'
END SalesSegmentations
FROM (
     SELECT
         OrderId,
         Sales,
     NTILE(3) OVER(ORDER BY Sales DESC) AS Buckets
     FROM Sales.Orders
)t 

-- In order to export the data, divide the orders into 2 groups.
SELECT
     NTILE(4) OVER(ORDER BY Sales DESC) AS Buckets,
     *
FROM Sales.Orders

-- Find the products that within the highest 40% of the price
SELECT 
    *,
CONCAT(DistRank * 100, '%') AS DistRankPerc
FROM (
     SELECT
         Product,
         Price,
       --  CUME_DIST() OVER (ORDER BY Price DESC) DistRank
         PERCENT_RANK() OVER (ORDER BY Price DESC) DistRank
     FROM Sales.Products
)t
Where DistRank <= 0.4

/*                   Value Window Functions
   LEAD():- Access a value from the next row within a window.

   LAG():- Access a value from the previous row within a window

              TIME SERIES ANALYSIS
   The process of analyzing the data to understand Patterns,
   trends, and behaviors over time.

               Year-over-Year(YOY)
   Analyze the overall growth or decline of the business's performance over time

               MONTH-OVER-MONTH(MOM)
   Analyze short-term trends and discover patterns in seasonality

*/
-- Analyze the month-over-month performance by finding the percentage change
-- in sales between the current and previous months.
SELECT
     *,
     CurrentMonthSales - PreviousMonthSales AS MoM_Change,
     ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/PreviousMonthSales * 100, 1) AS MoM_Perc
FROM (
     SELECT
         MONTH(OrderDate) AS OrderMonth,
         Sum(Sales) AS CurrentMonthSales,
         LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) AS PreviousMonthSales
     FROM Sales.Orders
     Group BY 
            MONTH(OrderDate)
)t

/*              CUSTOMER RETENTION ANALYSIS
   Measure customer's behavior and loyalty to help businesses build strong relationships with customers.
*/
-- In Order to analyze customer loyalty,
-- rank customers based on the average days between their orders
SELECT
     CustomerID,
     AVG(DaysUntilNextOrder) AvgDays,
     RANK() OVER (ORDER BY COALESCE(AVG(DaysUntilNextOrder), 999999)) AS RankAvg
     FROM(
          SELECT
               OrderID,
               CustomerID,
               OrderDate CurrentOrder,
               LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
               DATEDIFF(day,OrderDate, LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
          FROM Sales.Orders
)t
GROUP BY CustomerID

/*                       FIRST_VALUE()
   Access a value from the first row within a window.
          
                         LAST_VALUE()
   Access a value from the last row within a window.
*/
-- Find the lowest and highest sales for each product
SELECT
     OrderID,
     ProductID,
     Sales,
     FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) AS LowestSales,
     LAST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales
     ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS HighestSales,
     Sales - FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) AS SalesDifference
FROM Sales.Orders
