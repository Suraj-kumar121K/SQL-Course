/* ==============================================================================
   SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
   This guide covers the essential DML commands used for Add and Update
   database structures, including Adding, Updating, and deleting Row.
   Table of Contents:
     1. INSERT - Add a new data into a  Tables
     2. UPDATE - Modifying the rows Value
     3. DELETE - Removing the Value
=================================================================================
*/

/* ============================================================================== 
       INSERT
=============================================================================== */

INSERT INTO customers (id, first_name, country, score)
VALUES 
     (6, 'Suraj', 'Bihar', NULL),
     (7, 'Kamal', 'NULL', 100)

INSERT INTO customers (id, first_name, country, score)
VALUES 
      (8, 'Deepak', 'India', NULL)
 
INSERT INTO customers 
VALUES 
(9, 'Mohan', 'Germany', NULL)

INSERT INTO customers (id, first_name)
VALUES 
      (10, 'Rahul')

SELECT * FROM customers

SELECT * FROM customers

-- Insert Tha data from 'customers' into 'persons' 
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT  
id, 
first_name,
NULL,
'Unknown'
FROM customers

SELECT * FROM persons

/* ============================================================================== 
       UPDATE
=============================================================================== */
-- Change the score of customers 6 to 0
UPDATE customers
SET score = 0
WHERE id = 6

SELECT * 
FROM customers
WHERE id = 6

SELECT * 
FROM customers


/* Change the score of Customer 10 to 0
   and Update the country to UK  */

UPDATE customers
SET score = NULL,
    country = 'Germany'
WHERE id = 9

SELECT * FROM customers

/*Update all customers with a null score by setting their score to 0 */
UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT * 
FROM customers
WHERE score IS NULL

/* ============================================================================== 
       DELETE
=============================================================================== */

--DeletE all customers with an ID greater than 5.

DELETE FROM customers
WHERE id > 5

SELECT * 
FROM customers

-- Delete all data from table persons
DELETE FROM persons
