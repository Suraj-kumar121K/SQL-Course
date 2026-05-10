USE JOIN_SQL

CREATE TABLE Suraj (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Class VARCHAR(10),
    Age INT
);

CREATE TABLE Kumar (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(30),
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Suraj(StudentID)
);

INSERT INTO Suraj VALUES
(1, 'Rahul', '10A', 15),
(2, 'Priya', '10A', 16),
(3, 'Amit', '10B', 15),
(4, 'Neha', '10B', 16),
(5, 'Rohan', '10A', 15),
(6, 'Sneha', '10C', 16),
(7, 'Arjun', '10C', 15),
(8, 'Kavya', '10B', 16),
(9, 'Vikram', '10A', 15),
(10, 'Pooja', '10C', 16);

INSERT INTO Kumar VALUES
(101, 1, 'Math', 85),
(102, 2, 'Science', 90),
(103, 3, 'Math', 78),
(104, 4, 'English', 88),
(105, 5, 'Science', 92),
(106, 6, 'Math', 81),
(107, 7, 'English', 75),
(108, 8, 'Science', 89),
(109, 9, 'Math', 84),
(110, 10, 'English', 91);

-- =========================
-- UNION (10 Questions)
-- =========================
-- 1. Write a query to show all student names and subjects in one column using UNION.
SELECT Name, Age
FROM Suraj 

UNION 

SELECT Subject, Marks 
FROM Kumar

-- 2. Display StudentID from Student table and StudentID from Mark table using UNION.
SELECT StudentID FROM SURAJ
UNION
SELECT StudentID FROM Kumar

-- 3. Show names of students from class '10A' and students who scored more than 85 marks using UNION.
SELECT Name FROM Suraj
WHERE Class = '10A' 

UNION

SELECT s.Name FROM Suraj s
JOIN Kumar k
ON s.StudentID = k.StudentID
WHERE Marks > 85

-- 4. Display all classes from Suraj table and all subjects from Kumar table using UNION.
SELECT Class FROM Suraj
UNION
SELECT Subject FROM Kumar

-- 5. Show students aged 15 and students who scored more than 90 marks using UNION.
SELECT Age FROM Suraj
WHERE Age = 15
UNION 
SELECT Marks FROM Kumar
WHERE Marks > 90

-- 6. Display StudentID of students in class '10B' and StudentID of students who studied Math using UNION.


-- 7. Show students named 'Rahul' and students who scored 90 marks using UNION.


-- 8. Display all unique student IDs from both tables using UNION.


-- 9. Show students from class '10C' and students who studied English using UNION.


-- 10. Display student names and subjects together in one list using UNION.


-- =========================
-- UNION ALL (10 Questions)
-- =========================
-- 1. Display StudentID from Student table and StudentID from Mark table using UNION ALL.

-- 2. Show student names and subject names together using UNION ALL.

-- 3. Display students from class '10A' and class '10B' using UNION ALL.

-- 4. Show students aged 15 and students aged 16 using UNION ALL.

-- 5. Display students who scored more than 80 marks and more than 90 marks using UNION ALL.

-- 6. Show StudentID of students in class '10C' and StudentID with marks above 85 using UNION ALL.

-- 7. Display all classes and subjects together using UNION ALL.

-- 8. Show students with marks in Math and English using UNION ALL.

-- 9. Display names of students and subjects in one result set using UNION ALL.

-- 10. Show StudentID from both tables even if duplicates exist using UNION ALL.


-- =========================
-- INTERSECT (10 Questions)
-- =========================

-- 1. Display StudentID that exist in both Student and Mark tables using INTERSECT.

-- 2. Show students in class '10A' who also scored more than 80 marks using INTERSECT.

-- 3. Display StudentID of students aged 15 who also have marks records using INTERSECT.

-- 4. Show students who studied Math and scored above 80 using INTERSECT.

-- 5. Display StudentID that appear in both queries using INTERSECT.

-- 6. Show students in class '10B' who also studied English using INTERSECT.

-- 7. Display students aged 16 who also scored above 85 marks using INTERSECT.

-- 8. Show StudentID of students in class '10C' who also appear in Mark table using INTERSECT.

-- 9. Display students who studied Science and scored above 85 using INTERSECT.

-- 10. Show students whose ID exists in both tables with marks above 80 using INTERSECT.


-- =========================
-- EXCEPT (10 Questions)
-- =========================

-- 1. Display StudentID from Student table that do not appear in Mark table using EXCEPT.

-- 2. Show students in class '10A' except those who scored more than 85 marks.

-- 3. Display students aged 16 except students who studied Math.

-- 4. Show StudentID from Student table except those with marks in English.

-- 5. Display students from class '10B' except students who scored above 90 marks.

-- 6. Show students aged 15 except those who appear in Mark table.

-- 7. Display students from Student table except those who studied Science.

-- 8. Show StudentID from Mark table except those from class '10A'.

-- 9. Display students from class '10C' except students who scored more than 80 marks.

-- 10. Show StudentID from Student table except those with subject 'Math' in Mark table.