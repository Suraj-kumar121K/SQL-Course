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

/*                       DATETRUNC() 
  Truncates the data to the specific part.

   Syntax
   DATETRUNC(part, date)
*/

SELECT 
     OrderID,
     CreationTime,
     -- DATETRUNC(month, CreationTime) Month_dt,
     DATETRUNC(minute, CreationTime) minute_dt,
     DATETRUNC(day, CreationTime) day_dt,
     DATETRUNC(year, CreationTime) year_dt
FROM Sales.Orders

-- 2nd step
SELECT
     DATETRUNC(month, CreationTime) Creation,
     COUNT(*)
FROM Sales.Orders
Group By DATETRUNC(month, CreationTime)

/* EOMONTH() 
  Returns the last day of a month.

   Syntax
   EOMONTH(date)
*/
SELECT 
     OrderID,
     CreationTime,
     EOMONTH(CreationTime) EndofMonth,
     CAST(DATETRUNC(month, CreationTime) AS DATE) StartofMonth
FROM Sales.Orders

-- Data Aggregations
-- How many orders were placed each year ?
SELECT 
     YEAR(OrderDate),
COUNT(*) NrOfOrders
FROM Sales.Orders
Group By YEAR(OrderDate)

-- How many orders were placed each month
-- 1st steps
SELECT 
     MONTH(OrderDate),
COUNT(*) NrOfOrders
FROM Sales.Orders
Group By MONTH(OrderDate)

-- 2nd steps
SELECT 
DATENAME(MONTH, OrderDate) AS OrderDate,
COUNT(*) NrOfOrders
FROM Sales.Orders
Group By DATENAME(MONTH, OrderDate)

-- Show all orders that were placed during the month og February
SELECT
*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2

--                        Functions Comparison
-- All possible parts can be used in DAtePART SQL Function
SELECT 
     'Year' DatePart,
     DATEPART(year, GETDATE()) AS DatePart_Output,
     DATENAME(year, GETDATE()) AS DateName_output,
     DATETRUNC(year, GETDATE()) AS DateTrunc_output
UNION ALL
SELECT
     'YY',
     DATEPART(yy, GETDATE()) AS DatePart_Output,
     DATENAME(yy, GETDATE()) AS DateName_output,
     DATETRUNC(yy, GETDATE()) AS DateTrunc_output
UNION ALL
SELECT
     'YYYY',
     DATEPART(yyyy, GETDATE()) AS DatePart_Output,
     DATENAME(yyyy, GETDATE()) AS DateName_output,
     DATETRUNC(yyyy, GETDATE()) AS DateTrunc_output
UNION ALL
SELECT
     'Quarter',
     DATEPART(quarter, GETDATE()) AS DatePart_Output,
     DATENAME(quarter, GETDATE()) AS DateName_output,
     DATETRUNC(quarter, GETDATE()) AS DateTrunc_output
UNION ALL
SELECT
     'QQ',
     DATEPART(qq, GETDATE()) AS DatePart_Output,
     DATENAME(qq, GETDATE()) AS DateName_output,
     DATETRUNC(qq, GETDATE()) AS DateTrunc_output
UNION ALL
SELECT
     'Q',
     DATEPART(q, GETDATE()) AS DatePart_Output,
     DATENAME(q, GETDATE()) AS DateName_Output,
     DATETRUNC(q, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'Month',
     DATEPART(month, GETDATE()) AS DatePart_Output,
     DATENAME(month, GETDATE()) AS DateName_Output,
     DATETRUNC(month, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'MM',
     DATEPART(mm, GETDATE()) AS DatePart_Output,
     DATENAME(mm, GETDATE()) AS DateName_Output,
     DATETRUNC(mm, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'M',
     DATEPART(m, GETDATE()) AS DatePart_Output,
     DATENAME(m, GETDATE()) AS DateName_Output,
     DATETRUNC(m, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'DayOfYear',
     DATEPART(dayofyear, GETDATE()) AS DatePart_Output,
     DATENAME(dayofyear, GETDATE()) AS DateName_Output,
     DATETRUNC(dayofyear, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'DY',
     DATEPART(dy, GETDATE()) AS DatePart_Output,
     DATENAME(dy, GETDATE()) AS DateName_Output,
     DATETRUNC(dy, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'DD',
     DATEPART(dd, GETDATE()) AS DatePart_Output,
     DATENAME(dd, GETDATE()) AS DateName_Output,
     DATETRUNC(dd, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'D',
     DATEPART(d, GETDATE()) AS DatePart_Output,
     DATENAME(d, GETDATE()) AS DateName_Output,
     DATETRUNC(d, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'Week',
     DATEPART(week, GETDATE()) AS DatePart_Output,
     DATENAME(week, GETDATE()) AS DateName_Output,
     DATETRUNC(week, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'WK',
     DATEPART(wk, GETDATE()) AS DatePart_Output,
     DATENAME(wk, GETDATE()) AS DateTrunc_Output,
     DATETRUNC(wk, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'WW',
     DATEPART(ww, GETDATE()) AS DatePart_Output,
     DATENAME(ww, GETDATE()) AS DateName_Output,
     DATETRUNC(ww, GETDATE()) AS DateTrunc_Output
SELECT
    'WeekDay',
    DATEPART(weekday, GETDATE()) AS DatePart_Output,
    DATENAME(weekday, GETDATE()) AS DateName_Output,
    NULL AS DateTrunc_Output
UNION ALL
SELECT
     'DW',
     DATEPART(dw, GETDATE()) AS DatePart_Output,
     DATENAME(dw, GETDATE()) AS DateName_Output,
     DATETRUNC(dw, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'Hour',
     DATEPART(hour, GETDATE()) AS DatePart_Output,
     DATENAME(hour, GETDATE()) AS DateName_Output,
     DATETRUNC(hour, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'HH',
     DATEPART(hh, GETDATE()) AS DatePart_Output,
     DATENAME(hh, GETDATE()) AS DateName_Output,
     DATETRUNC(hh, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'Minute',
     DATEPART(minute, GETDATE()) AS DatePart_Output,
     DATENAME(minute, GETDATE()) AS DateName_Output,
     DATETRUNC(minute, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'MS',
     DATEPART(ms, GETDATE()) AS DatePart_Output,
     DATENAME(ms, GETDATE()) AS DateName_Output,
     NULL AS DateTrunc_Output
UNION ALL
SELECT
     'Microsecond',
     DATEPART(microsecond, GETDATE()) AS DatePart_Output,
     DATENAME(microsecond, GETDATE()) AS DateName_Output,
     NULL AS DateTrunc_Output
UNION ALL
SELECT
     'MCS',
     DATEPART(mcs, GETDATE()) AS DatePart_Output,
     DATENAME(mcs, GETDATE()) AS DateName_Output,
     NULL AS DateTrunc_Output
UNION ALL
SELECT
     'Nanosecond',
     DATEPART(nanosecond, GETDATE()) AS DatePart_Output,
     DATENAME(nanosecond, GETDATE()) AS DateName_Output,
     NULL AS DateTrunc_Output
UNION ALL
SELECT
     'NS',
     DATEPART(ns, GETDATE()) AS DatePart_Output,
     DATENAME(ns, GETDATE()) AS DateName_Output,
     NULL AS DateTrunc_Output
UNION ALL
SELECT
     'ISOWEEK',
     DATEPART(iso_week, GETDATE()) AS DatePart_Output,
     DATENAME(iso_week, GETDATE()) AS DateName_Output,
     DATETRUNC(iso_week, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'ISOWK',
     DATEPART(isowk, GETDATE()) AS DatePart_Output,
     DATENAME(isowk, GETDATE()) AS DateName_Output,
     DATETRUNC(isowk, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT
     'ISOWW',
     DATEPART(isoww, GETDATE()) AS DatePart_Output,
     DATENAME(isoww, GETDATE()) AS DateName_Output,
     DATETRUNC(isoww, GETDATE()) AS DateTrunc_Output


/* WHAT IS FORMATTING & CASTING
   FORMATTING:- Changing the format of a value from one to another.

   CASTING:- Change the data type from one to another.

   FORMAT():- Formats a date or time value
   SYNTAX
    FORMAT(value, format [culture])      culture --> optional

    Examples
       FORMAT(orderDate, 'dd/mm/yyyy')
       FORMAT(orderDate, 'dd/mm/yyyy', 'Style' ex- Ind-ia)
       FORMAT(1234.56, 'D', 'fr-FR')

*/
SELECT
     OrderID,
     CreationTime,
FORMAT(CreationTime, 'MM-dd-yyyy') USA_Format,
FORMAT(CreationTime, 'dd-MM-yyyy') EURO_Format,
FORMAT(CreationTime, 'dd') dd,
FORMAT(CreationTime, 'ddd') ddd,
FORMAT(CreationTime, 'dddd') dddd,
FORMAT(CreationTime, 'MM') mm,
FORMAT(CreationTime, 'MMM') mmm,
FORMAT(CreationTime, 'MMMM') mmmm
FROM Sales.Orders

-- Show CreationTime using the following format:
-- Day Web Jan Q1 2025 12:34:56 PM
SELECT
     OrderID,
     CreationTime,
'Day ' + FORMAT(CreationTime, 'ddd MMM') + 
' Q' + DATENAME(quarter, CreationTime) + ' ' +
FORMAT(CreationTime, 'yyyy hh:mm:tt') AS CustomeFormat
FROM Sales.Orders

-- Data Aggregations
SELECT
FORMAT(OrderDate, 'MMM yy') AS OrderDate,
COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')

-- Data Standardization


-- ALl numeric format specifiers can be used in FORMAT SQL Function
SELECT 'N' AS FormatType, FORMAT(1234.56, 'N') AS FormattedValue
UNION ALL
SELECT 'P' AS FormatType, FORMAT(1234.56, 'P') AS FormattedValue
UNION ALL
SELECT 'C' AS FormatType, FORMAT(1234.56, 'C') AS FormattedValue
UNION ALL
SELECT 'E' AS FormatType, FORMAT(1234.56, 'E') AS FormattedValue
UNION ALL
SELECT 'F' AS FormatType, FORMAT(1234.56, 'F') AS FormattedValue
UNION ALL
SELECT 'N0' AS FormatType, FORMAT(1234.56, 'N0') AS FormattedValue
UNION ALL
SELECT 'N1' AS FormatType, FORMAT(1234.56, 'N1') AS FormattedValue
UNION ALL
SELECT 'N2' AS FormatType, FORMAT(1234.56, 'N2') AS FormattedValue
UNION ALL
SELECT 'N_de_DE' AS FormatType, FORMAT(1234.56, 'N', 'de-DE') AS FormattedValue
UNION ALL
SELECT 'N_en_US' AS FormatType, FORMAT(1234.56, 'N', 'en_US') AS FormattedValue

/*                      CONVERT()
   Converts a date or time value to a different data type & Formats the value
   Syntax
       CONVERT(data_type, value [,style])
   Examples
          CONVERT(INT, '124')
          CONVERT(VARCHAR, OrderDate, '34')
*/
SELECT
CONVERT(INT, '123') AS [String to Int CONVERT],
CONVERT(DATE, '2025-08-20') AS [Datetime to Date CONVERT],
CreationTime,
CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT]
FROM Sales.Orders

SELECT
CreationTime,
CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders

-- ALL STYLES

/*                      CAST()
   Converts a value to a specified data type 

   Syntax
       CAST(value AS data_type)

   Examples
         CONVERT('124' AS INT)
         CONVERT('2025-08-20' AS DATE)
*/
SELECT
CAST('123' AS INT) AS [String to Int],
CAST(123 AS VARCHAR) AS [Int to string],
CAST('2025-08-20' AS DATE) AS [String to date],
CAST('2025-08-20' as datetime2) AS [String to datetime],
CreationTime,
CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders
