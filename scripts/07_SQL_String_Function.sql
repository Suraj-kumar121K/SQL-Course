--                               Row-Level Functions    
--WHAT IS SQL String FUNCTION
/* Type of String Function in SQL
-->  Manipulation        --> Calculation        --> String Extraction
1. Concat                     1. Len                1.Left
2. Upper                                            2.Right 
3. Lower                                            3.Substring
4. Trim
5. Replace
*/

-- 1. Concat:- Combines multiple string into one
-- Show a list of customers first names together with their country in one column.
SELECT
     first_name,
     country,
CONCAT(first_name,' - ', country) AS name_country
FROM customers

-- 2. Upper:- Converts all characters to Upper Case
-- 2. Lower:- Converts all characters to Lower Case

-- Transform the customer`s first name to Lower Case 
SELECT
     first_name,
     country,
CONCAT(first_name,' - ', country) AS name_country,
LOWER(first_name) AS Lower_Case,
UPPER(country) AS Upper_Case
FROM customers

-- Transform the customer`s first name to Upper Case 
SELECT
     first_name,
     country,
CONCAT(first_name,' - ', country) AS name_country,
LOWER(first_name) AS Lower_Case,
UPPER(country) AS Upper_Case
FROM customers

-- 4. Trim:- Removes Leading and Traling space
-- Find customers whose first name contains leading or trailing spaces 
SELECT
     first_name,
     LEN(first_name) len_name,
     LEN(TRIM(first_name)) len_trim_name,
     LEN(first_name) - LEN(TRIM(first_name)) flag
FROM customers
-- WHERE first_name != TRIM(first_name)

-- 5. Replace:- Replaces specific characyer with a new character
SELECT 
'123-456-7890',
REPLACE('123-456-7890', '-', '/') AS clean_phone

SELECT 
'report.txt' AS old_filename,
REPLACE('report.txt', '.txt', '.csv') AS new_filename

--> Calculation
-- 1. Len:- Counts how many characters

-- Calculate the length of each customer`s first name.
SELECT
first_name,
LEN(first_name) AS len_name
FROM customers

--> String Extraction
-- LEFT:- Extracts specific Number of Characters from the start

-- RIGHT:- Extracts specific Number of Characters from the END
-- Retrieve the first two charachers of each first name.
SELECT 
     first_name,
     LEFT(first_name, 2) last_2_char,
     LEFT(TRIM(first_name), 2) first_2_char
FROM customers

-- Retrieve the last two charachers of each first name.
SELECT 
     first_name,
     LEFT(TRIM(first_name), 2) first_2_char,
     Right(first_name, 2) last_2_char
FROM customers

-- 3.Substring:- Extracts a part of string at a specified position
-- Retrieve a list of customers' first names after removing the first character.
SELECT
     first_name,
     SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM customers

-- SQL Number Functions
-- 1:- ROUND 

SELECT 
    3.561,
 ROUND(3.516, 2) AS round_2, 
 ROUND(3.516, 1) AS round_1,
 ROUND(3.516, 0) AS round_0,
 
 -- 2.ABS:- Returns the absolute(positive) value of a number, removing any negetive sign 
SELECT
    -10,
ABS(-10),
ABS(10)

