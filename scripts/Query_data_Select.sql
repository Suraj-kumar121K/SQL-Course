/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	 10. COOL STUFF - Additional SQL Features
=================================================================================
*/
-- Rrtrieve ALL Customer Data
SELECT * FROM customers;

SELECT * FROM orders;

/* Retrieve each customer`s name, country and score
                               */
SELECT 
     first_name,
     country,
     score
FROM customers

/* Retrieve customer with a score not equel to 0
                   WHERE           */
SELECT * 
FROM customers
WHERE score != 0;

/* Retrive customer from Germany
             WHERE         */
SELECT  
    first_name,
    country
FROM customers
WHERE country = 'Germany'

/* Retrive all customers and sort the results by the highest score first
                  ORDER BY                            */
SELECT * 
FROM customers
ORDER BY score DESC

/* Retrive all customers and sort the results by the country and then by the highest score
                   ORDER BY  */
SELECT * 
FROM customers
ORDER BY country ASC, score DESC

/* Find the total score for each country
               Group By        */
SELECT 
    country,
    sum(score) AS total_score
FROM customers
GROUP BY country

/* Find the total score and total number of customers for each country */
SELECT 
     country,
     SUM(score) AS total_score,
     COUNT(id) AS total_customers
FROM customers
GROUP BY country

/*Find the average score for each country considering only
customers with a score not equal to 0 and return only those 
countries with an average score greater than 430
                  HAVING        */
SELECT 
     country,
     AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

/* Return Unique List of All Countries
              DISTINCT    */
SELECT DISTINCT id
FROM  customers

/* Retrieve only 3 Customers 
          TOP       */
SELECT TOP 3 *
FROM customers

/*Retrieve the top 3 Customers with the Highest Scores */
SELECT TOP 3 *
FROM customers
ORDER BY score DESC

/*Retrieve the Lowest 2 Customers based on the Scores */
SELECT TOP 2 *
FROM customers
ORDER BY score ASC

-- Get the Most Recent Orders
SELECT top 2 *
FROM orders
ORDER BY order_date DESC

-- coding order
