use JOIN_SQL
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    email VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees VALUES
(1,'Rahul','rahul@gmail.com','IT',50000),
(2,'Amit','amit@gmail.com','HR',40000),
(3,'Riya','riya@gmail.com','IT',60000),
(4,'Rahul','rahul@gmail.com','IT',50000),
(5,'Sita','sita@gmail.com','Finance',70000),
(6,'Amit','amit@gmail.com','HR',40000),
(7,'John','john@gmail.com','IT',55000),
(8,'Riya','riya@gmail.com','IT',60000),
(9,'Karan','karan@gmail.com','Sales',45000),
(10,'Rahul','rahul@gmail.com','IT',50000);

-- EASY LEVEL
-- 1. Find duplicate emails.
SELECT email, COUNT(*) AS count
FROM Employees
GROUP BY email
HAVING COUNT(*) > 1;

-- 2. Find duplicate employee names.
SELECT name, COUNT(*) AS name_count
FROM Employees
GROUP BY name
HAVING COUNT(*) > 1

-- 3. Count how many times each email appears.

-- 4. Show emails that appear more than once.

-- 5. Find duplicate salary records.


-- MEDIUM LEVEL

-- 6. Find duplicate rows based on name and email.

-- 7. Find employees whose name appears more than once.

-- 8. Show departments having duplicate employees.

-- 9. Count duplicate names.

-- 10. Find duplicate records based on name, email, salary.


-- ADVANCED LEVEL

-- 11. Delete duplicate rows but keep one record.

-- 12. Show only unique emails.

-- 13. Find employees whose email appears exactly 2 times.

-- 14. Find the most repeated employee name.

-- 15. Count total duplicate rows.

-- INTERVIEW LEVEL

-- 16. Find duplicate records using ROW_NUMBER().

-- 17. Delete duplicate emails using CTE.

-- 18. Find duplicate records except the first row.

-- 19. Find employees whose name and department both duplicate.

-- 20. Show duplicate employees with count.