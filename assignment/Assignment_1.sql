
CREATE DATABASE ASSIGNMENT_1
USE ASSIGNMENT_1

-- Create Department Table
CREATE TABLE Department (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    location VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    deptno INT,   
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

-- Insert Department Data
INSERT INTO Department VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Insert Employee Data
INSERT INTO Employee VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

-- 1) Write a query to display employees department number in ascending order and salary in descending order.
SELECT deptno, salary 
FROM Employee
ORDER BY deptno ASC, salary DESC

-- 2) Write a query to display the number of employees working in each job and display job in ascending order.
SELECT job, count(*) AS total_emp
FROM Employee
GROUP BY job
ORDER BY job ASC

-- 3) Write a query to display the job of the employee if the employee has 'I' in the third character in job.
SELECT job
FROM Employee
WHERE job LIKE '__I%';

-- 4) Write a query to display salary and employee name in ascending order.
SELECT  ename, salary 
FROM Employee
ORDER BY salary ASC;

select * from Employee

-- 5) Write a query to display maximum salary of employees working in each department in descending order.
SELECT deptno, MAX(salary) AS max_salary
FROM Employee
GROUP BY deptno
ORDER BY max_salary DESC;

-- 6) Write a query to display employees whose name starts with 'A' and job starts with 'M'.
SELECT * 
FROM Employee
WHERE ename LIKE 'A%'AND job LIKE 'M%'

-- 7) Write a query to display commission of the employees in ascending order.
SELECT * FROM Employee
ORDER BY commission ASC

-- 8) Write a query to display employees according to hire date except PRESIDENT.
SELECT *
FROM Employee
WHERE job <> 'PRESIDENT'
ORDER BY hiredate;

-- 9) Write a query to display location of the employees in descending order.
SELECT e.ename, d.location
FROM Employee e
JOIN Department d
ON e.deptno = d.deptno
ORDER BY D.location DESC;

-- 10) Write a query to display employee names according to EMPNOs.
SELECT deptno, ename 
FROM Employee
ORDER BY ename ASC