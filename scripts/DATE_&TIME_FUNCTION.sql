/*      WHAT IS DATE & TIME 

        PART EXTRACTION           FORMAT & CASTING     CALCULATIONS       VALIDATION
        1. DAY                    1. FORMAT            1. DATEADD         1. ISDATE 
        2. MONTH                  2. CONVER            2. DATEDIFF
        3. YEAR                   3. CAST
        4. DATEPART
        5. DATENAME
        6. DATETRUNC
        7. EOMONTH
*/

SELECT 
     OrderID,
     OrderDate,
     ShipDate,
     CreationTime
FROM Sales.Orders

 -- Date & Time  Values
 SELECT 
     OrderID,
     CreationTime,
     '2025-08-20' HardCoded
FROM Sales.Orders

/*                             GETDATE() 
  RETURNS THE current date and time at the moment when the query is executed.
*/

SELECT 
     OrderID,
     CreationTime,
     '2025-08-20' HardCoded,
     GETDATE() Today
FROM Sales.Orders

-- DATE & TIME FUNCTIONS OVERVIEW

/*       PART EXTRACTION 
DAY: DAY()
        returns the day from a date
MONTH:- MONTH()
        Returns the month from a date       
YEAR:- YEAR()
       Returns the year from a date
Syntax
       DAY(date)
       MONTH(date)
       YEAR(date)
*/

SELECT 
     OrderID,
     CreationTime,
     YEAR(CreationTime) YEAR,
     MONTH(CreationTime) month,
     DAY(CreationTime) Day
FROM Sales.Orders


/* DATEPART()
   Returns a specific part of a date as a number.

   Syntax
   DATEPART(part, date)

   Example
   DATEPART(Month, OrderDate)
   DATEPART(mm, '2025-08-20')
*/

SELECT 
     OrderID,
     CreationTime,
     DATEPART(year, CreationTime) year_dp,
     DATEPART(month, CreationTime) month_dp,
     DATEPART(day, CreationTime) Day_dp,
     DATEPART(hour, CreationTime) hour_dp,
     DATEPART(quarter, CreationTime) quarter_dp,
     DATEPART(week, CreationTime) week_dp,
     YEAR(CreationTime) YEAR,
     MONTH(CreationTime) month,
     DAY(CreationTime) Day
FROM Sales.Orders

/* DATENAME() 'String name'
   Returns the name of a specific part of a date.

   Syntax
   DATENAME(part, date)

   Example
   DATENAME(Month, OrderDate)
   DATENAME(mm, '2025-08-20')
*/

SELECT 
     OrderID,
     CreationTime,
--   DATENAME Example
     DATENAME(month, CreationTime) Month_dp,
     DATENAME(weekday, CreationTime) weekday_dp,
     DATENAME(day, CreationTime) day_dp,
     DATENAME(year, CreationTime) year_dp,
--   DATEPART Example
     DATEPART(year, CreationTime) year_dp,
     DATEPART(month, CreationTime) month_dp,
     DATEPART(day, CreationTime) Day_dp,
     DATEPART(hour, CreationTime) hour_dp,
     DATEPART(quarter, CreationTime) quarter_dp,
     DATEPART(week, CreationTime) week_dp,
     YEAR(CreationTime) YEAR,
     MONTH(CreationTime) month,
     DAY(CreationTime) Day
FROM Sales.Orders
