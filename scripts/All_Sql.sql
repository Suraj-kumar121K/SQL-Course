CREATE DATABASE ALL_MIS
USE ALL_MIS

CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    marks INT
);

INSERT INTO student VALUES
(1, 'Amit', 18, 'Delhi', 75),
(2, 'Rahul', 20, 'Mumbai', 85),
(3, 'Ankit', 19, 'Delhi', 60),
(4, 'Priya', 21, 'Kolkata', 90),
(5, 'Neha', 18, 'Mumbai', 55),
(6, 'Rohit', 22, 'Delhi', 40),
(7, 'Simran', 20, 'Chennai', 70),
(8, 'Aman', 19, 'Delhi', 88),
(9, 'Karan', 23, 'Mumbai', 95),
(10, 'Pooja', 21, 'Kolkata', 65);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);

INSERT INTO employee VALUES
(1, 'Amit', 50000, 1, NULL),
(2, 'Rahul', 60000, 2, 1),
(3, 'Neha', 55000, 1, 1),
(4, 'Karan', 70000, 2, 2),
(5, 'Simran', 45000, 3, 2),
(6, 'Pooja', 80000, NULL, 3);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance');

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Rahul', 'Mumbai'),
(3, 'Neha', 'Kolkata'),
(4, 'Karan', 'Delhi');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 2, 1000),
(103, 1, 700),
(104, 3, 300);

-- Level 1 (Very Easy)
-- Show all records from the students table
SELECT * FROM student;

-- Display only the name column
SELECT first_name FROM student;

-- List all unique cities
SELECT DISTINCT city FROM student;

-- Sort students by age in ascending order
SELECT first_name, age FROM student
ORDER BY age ASC;

-- Sort students by marks in descending order
SELECT first_name, marks FROM student
ORDER BY marks DESC;

-- Level 2 (Filtering)
-- Find students with age > 18
SELECT * FROM student
WHERE age > 18;

-- Find students with marks < 50
SELECT * FROM student
WHERE marks < 50;

-- Find students from 'Delhi'
SELECT * FROM student
WHERE city = 'Delhi';

-- Find students with age = 20 and city = 'Mumbai'
SELECT * FROM student
WHERE age = 20 and city = 'Mumbai';

-- Find students with age > 18 AND marks > 60
SELECT * FROM student
WHERE age > 18 AND marks > 60;

-- Level 3 (Conditions)
-- Find students from 'Delhi' OR 'Mumbai'
SELECT * FROM student
WHERE city = 'Delhi' OR city = 'Mumbai';

-- Find students NOT from 'Delhi'
SELECT * FROM student
WHERE city != 'Delhi';

-- Find students with marks BETWEEN 50 AND 80
SELECT * FROM student
WHERE marks BETWEEN 50 AND 80;

-- Find students with age IN (18, 20, 22)
SELECT * FROM student
WHERE age IN (18, 20, 22);

-- Find students whose name starts with 'A' (use LIKE)
SELECT * FROM student
WHERE first_name LIKE 'A%';

-- Level 4 (Sorting & Limiting)
-- Get top 5 students by marks
SELECT TOP(5) * FROM student
ORDER BY marks DESC;

-- Get 3 students with lowest marks
SELECT TOP 3 * FROM student
ORDER BY marks ASC;

-- Sort students by city, then by marks
SELECT * FROM student
ORDER BY city ASC, marks DESC;

-- Find the student with second highest marks
SELECT TOP 1 *
FROM student
WHERE marks < (SELECT MAX(marks) FROM student)
ORDER BY marks DESC;

-- Find the topper (highest marks)
SELECT TOP 1 * FROM student
ORDER BY marks DESC;

-- Level 5 (Aggregate Functions)
-- Count total number of students
SELECT COUNT(*) FROM student;

-- Find average marks
SELECT AVG(marks) FROM student;

-- Find maximum marks
SELECT MAX(marks) FROM student;

-- Find minimum marks
SELECT MIN(marks) FROM student;

-- Find sum of all marks
SELECT SUM(marks) AS TOTAL_SUM
FROM student;

-- Level 6 (GROUP BY)
-- Count students in each city

-- Find average marks for each city
SELECT AVG(marks) AS AVG_CITY
FROM student

-- Count students for each age

-- Find cities with more than 3 students

-- Find cities with average marks greater than 70

-- Level 7 (Intermediate Logic)
-- Find students with marks greater than average marks

-- Find the student with lowest marks

-- Find duplicate names

-- Find students with name length greater than 5

-- Find difference between max and min age

-- Level 8 (Slightly Tricky)
-- Find second lowest marks

-- Find top 3 unique marks

-- Find students having same marks

-- Find topper from each city

-- Find students with marks > 60 and age < 20

-- ++++++++++++++++++++++++++++
-- Level 1 (Basic INNER JOIN)
-- ++++++++++++++++++++++++++++
-- Q1: Get employee names with their department names

-- Q2: Show all employees and their department IDs + names

-- Q3: Get employees who belong to 'HR' department

-- Q4: Show employee name and salary with department name

-- Q5: Count employees in each department


-- 🔹 Level 2 (LEFT JOIN)
-- Q6: Show all employees with department names (including those without department)

-- Q7: Find employees who are not assigned to any department

-- Q8: Show all departments even if they have no employees

-- Q9: Count employees in each department (include empty departments)

-- Q10: List departments with zero employees


-- 🔹 Level 3 (RIGHT JOIN)
-- Q11: Show all departments with employees

-- Q12: Find departments without employees using RIGHT JOIN

-- Q13: Display all records from departments with matching employees

-- Q14: Count employees per department using RIGHT JOIN

-- Q15: Show department names even if no employee exists


-- 🔹 Level 4 (Multiple JOINS)
-- Q16: Show customer names with their orders

-- Q17: Show customer name, city, and order amount

-- Q18: Find total order amount per customer

-- Q19: List customers who have placed orders

-- Q20: List customers who have NOT placed any orders


-- 🔹 Level 5 (Aggregate + JOIN)
-- Q21: Find total salary per department

-- Q22: Find average salary per department

-- Q23: Find highest salary in each department

-- Q24: Find departments where avg salary > 50000

-- Q25: Count number of orders per customer


-- 🔹 Level 6 (Intermediate Logic)
-- Q26: Find employee with highest salary in each department

-- Q27: Find second highest salary in each department

-- Q28: List employees earning more than department average

-- Q29: Find duplicate departments (if any)

-- Q30: Find customers with highest order amount


-- 🔹 Level 7 (Advanced)
-- Q31: Find employees working in same department

-- Q32: Self join: find employees with same salary

-- Q33: Show manager-employee relationship (self join)

-- Q34: Find customers who placed more than 2 orders

-- Q35: Find departments with more than 3 employees


-- 🔹 Level 8 (Tricky / Interview Level)
-- Q36: Find top 3 salaries per department

-- Q37: Find employees who earn more than their manager

-- Q38: Find customers with no orders using LEFT JOIN

-- Q39: Find departments where no employee earns > 50000

-- Q40: Combine multiple joins + group by + having