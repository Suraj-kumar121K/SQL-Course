/* ==============================================================================
   SQL Operators
-------------------------------------------------------------------------------
   An operator is a symbol or keyword that performs a specific action on one or 
   more values or variables, known as operands.
   Type of Operators:
=================================================================================
*/

/* ============================================================================== 
   --> Comparison Operators
      1. =
      2. <> !=
      3. >
      4. >=
      5. <
      6. <=
=============================================================================== */
/*              =
Retrieve all customers from table */
SELECT *
FROM customers 
WHERE country = 'Germany'

/* Retrieve all customers who are not from Germany
               !=  */
SELECT *
FROM customers
WHERE country != 'Germany' 

/* Retrieve all customers with a score greater than 500
              >  */
SELECT * 
FROM customers
WHERE score > 500

/* Retrieve all customers with a score of 500 or more
              >=  */
SELECT * 
FROM customers
WHERE score >= 500

/* Retrieve all customers with a score less than 500
               < */
SELECT *
FROM customers
WHERE score < 500

/* Retrieve all customers with a score of 500 or less
              <=  */
SELECT *
FROM customers
WHERE score <= 500

/* ============================================================================== 
   --> Logical Operators
      AND:- All condition must be true
      OR:- At least one condition must be true
      NOT:- Excludes matching value 
=============================================================================== */

/*                                    AND
Retrieve all customers who are from USA and have a score greater than 500  */

SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

/*                                    OR
Retrieve all customers who are either from USA or have a score greater than 500  */
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500

/*                                   NOT
Retrieve all customers with a score not less than 500  */
SELECT *
FROM customers
WHERE NOT score < 500

/* ============================================================================== 
   --> Range Operators
     BETWEEN:- check if a value is within a range
=============================================================================== */
/*                                  BETWEEN
Retrieve all customers whose are falls in the range between 100 and 500  */

SELECT *
FROM customers
WHERE score BETWEEN 10 AND 500

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500

/* ============================================================================== 
   --> Membership Operators
     IN:- check if a value exists in a list
=============================================================================== */

/*                                     IN
Retrieve all customers from either Germany or USA */
SELECT *
FROM customers
WHERE country = 'Germany' OR country = 'USA'

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA')

/* ============================================================================== 
   --> Search Operators
     LIKE:- Search for a pattern in text
     M%, %in, %r%, b%
=============================================================================== */
/*                             M%, %in, %r%, b%        
Find all customers whose first name start with 'M' */
SELECT *
FROM customers
WHERE first_name LIKE 'M%'

-- Find all customers whose first name end with 'n'
SELECT *
FROM customers
WHERE first_name LIKE '%n'

-- Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%'

-- Find all customers whose first name has 'r' in the 3rd position
SELECT *
FROM customers
WHERE first_name LIKE '_r%'
