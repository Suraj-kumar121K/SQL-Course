use JOIN_1
-- Table 1: employees
CREATE TABLE Employees(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	dept_id INT,
	city VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Amit', 101, 'Delhi'),
(2, 'Rahul', 102, 'Mumbai'),
(3, 'Sneha', 103, 'Patna'),
(4, 'Priya', 101, 'Delhi'),
(5, 'Karan', 102, 'Pune'),
(6, 'Neha', 103, 'Kolkata'),
(7, 'Rohit', 101, 'Lucknow'),
(8, 'Anjali', 102, 'Patna'),
(9, 'Vikas', 103, 'Delhi'),
(10, 'Pooja', 101, 'Mumbai');

-- Table 2: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- Table 3: salary
CREATE TABLE salary (
    emp_id INT PRIMARY KEY,
    salary INT,
    bonus INT
);

INSERT INTO salary VALUES
(1, 50000, 5000),
(2, 45000, 4000),
(3, 60000, 7000),
(4, 52000, 4500),
(5, 48000, 3000),
(6, 65000, 8000),
(7, 47000, 3500),
(8, 55000, 6000),
(9, 70000, 9000),
(10, 53000, 5000);

-- 1. Show employee names with department names
SELECT E.name,
       d.dept_name
FROM Employees E
JOIN departments d
ON E.dept_id = d.dept_id


-- 2. Show employee names with salary
SELECT E.name,
       S.salary
FROM Employees E
JOIN salary S
ON E.id = S.emp_id

-- 3. Show employee name, department, and salary
SELECT E.name,
       D.dept_name,
       S.salary
FROM Employees E
JOIN departments D
ON E.dept_id = D.dept_id
JOIN salary S
ON E.id = S.emp_id

-- 4. Show employees from IT department
SELECT E.name, 
       D.dept_name
FROM Employees E
JOIN departments D
ON E.dept_id = D.dept_id
WHERE dept_name = 'IT'

-- 5. Show employees whose salary > 50000
SELECT E.name, 
       S.salary
FROM Employees E
JOIN salary S
ON E.id = S.emp_id
WHERE salary > 50000

-- 6. Show employees from Delhi with salary > 50000
SELECT E.name,
       E.city,
       S.salary
FROM Employees E
JOIN salary S
ON E.id = S.emp_id
WHERE city = 'Delhi' AND salary > 50000

-- 7. Show HR employees

-- 8. Show Finance employees with bonus > 7000

-- 9. Show employees from Patna

-- 10. Show employees whose salary BETWEEN 45000 AND 60000

-- 11. Sort employees by salary DESC

-- 12. Sort employees by bonus ASC

-- 13. Show top 3 highest salary employees

-- 14. Show lowest salary employee

-- 15. Sort employees by department name

-- 16. Find average salary department-wise

-- 17. Count employees department-wise

-- 18. Find maximum salary department-wise

-- 19. Find total bonus department-wise

-- 20. Count employees city-wise

SELECT * FROM Employees
SELECT * FROM departments
SELECT * FROM salary

-- Q1. Total Salary (salary + bonus)
SELECT E.name,
       S.salary,
       S.bonus,
       (S.salary + S.bonus) AS tatal_salary
FROM Employees E
JOIN salary S
ON E.id = S.emp_id

-- Q2. Departments having avg salary > 50000
SELECT D.dept_name,
       AVG(S.salary) AS Total_salary
FROM Employees E
JOIN departments D
ON E.dept_id = D.dept_id
JOIN salary S
ON E.id = S.emp_id
GROUP BY d.dept_name
HAVING AVG(S.salary) > 50000

-- Q16. Second highest salary employee
select 