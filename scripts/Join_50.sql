USE JOIN_SQL
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    class VARCHAR(20),
    dob DATE,
    gender CHAR(1),
    city VARCHAR(50),
    contact_number VARCHAR(15)
);

INSERT INTO Students (student_id, first_name, last_name, class, dob, gender, city, contact_number) VALUES
(1, 'Suraj', 'Kumar', '10A', '2008-05-12', 'M', 'Patna', '9876543210'),
(2, 'Amit', 'Sharma', '10B', '2008-03-21', 'M', 'Gaya', '9876543211'),
(3, 'Priya', 'Singh', '10A', '2008-07-09', 'F', 'Patna', '9876543212'),
(4, 'Neha', 'Verma', '10C', '2008-01-30', 'F', 'Nalanda', '9876543213'),
(5, 'Rohit', 'Gupta', '10B', '2008-09-15', 'M', 'Patna', '9876543214'),
(6, 'Anjali', 'Kaur', '10A', '2008-11-02', 'F', 'Gaya', '9876543215'),
(7, 'Vikram', 'Yadav', '10C', '2008-12-25', 'M', 'Patna', '9876543216'),
(8, 'Riya', 'Jain', '10B', '2008-04-18', 'F', 'Nalanda', '9876543217'),
(9, 'Karan', 'Kohli', '10A', '2008-06-07', 'M', 'Patna', '9876543218'),
(10, 'Simran', 'Chawla', '10C', '2008-02-14', 'F', 'Gaya', '9876543219'),
(11, 'Aditya', 'Mehta', '10B', '2008-08-11', 'M', 'Patna', '9876543220'),
(12, 'Tanya', 'Rai', '10A', '2008-03-03', 'F', 'Nalanda', '9876543221'),
(13, 'Sahil', 'Singh', '10C', '2008-10-28', 'M', 'Gaya', '9876543222'),
(14, 'Pooja', 'Sharma', '10B', '2008-05-05', 'F', 'Patna', '9876543223'),
(15, 'Mayank', 'Verma', '10A', '2008-01-19', 'M', 'Nalanda', '9876543224'),
(16, 'Neelam', 'Gupta', '10C', '2008-07-22', 'F', 'Patna', '9876543225'),
(17, 'Rakesh', 'Kumar', '10B', '2008-09-09', 'M', 'Gaya', '9876543226'),
(18, 'Sonia', 'Singh', '10A', '2008-11-30', 'F', 'Patna', '9876543227'),
(19, 'Tarun', 'Mehta', '10C', '2008-02-02', 'M', 'Nalanda', '9876543228'),
(20, 'Divya', 'Rai', '10B', '2008-06-16', 'F', 'Patna', '9876543229');

CREATE TABLE Marks (
    mark_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    exam_date DATE,
    teacher VARCHAR(50),
    grade CHAR(2),
    remarks VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Marks (student_id, subject, marks, exam_date, teacher, grade, remarks) VALUES
(1, 'Math', 85, '2026-03-01', 'Mr. Sharma', 'A', 'Good work'),
(2, 'Science', 78, '2026-03-02', 'Ms. Singh', 'B', 'Needs improvement'),
(3, 'English', 92, '2026-03-01', 'Mr. Verma', 'A', 'Excellent'),
(4, 'Math', 67, '2026-03-03', 'Mr. Sharma', 'C', 'Average'),
(5, 'Science', 88, '2026-03-02', 'Ms. Singh', 'A', 'Well done'),
(6, 'English', 74, '2026-03-01', 'Mr. Verma', 'B', 'Can do better'),
(7, 'Math', 95, '2026-03-03', 'Mr. Sharma', 'A', 'Outstanding'),
(8, 'Science', 82, '2026-03-02', 'Ms. Singh', 'A', 'Good job'),
(9, 'English', 69, '2026-03-01', 'Mr. Verma', 'C', 'Below average'),
(10, 'Math', 77, '2026-03-03', 'Mr. Sharma', 'B', 'Satisfactory'),
(11, 'Science', 91, '2026-03-02', 'Ms. Singh', 'A', 'Excellent'),
(12, 'English', 83, '2026-03-01', 'Mr. Verma', 'A', 'Well done'),
(13, 'Math', 64, '2026-03-03', 'Mr. Sharma', 'C', 'Needs improvement'),
(14, 'Science', 72, '2026-03-02', 'Ms. Singh', 'B', 'Average'),
(15, 'English', 88, '2026-03-01', 'Mr. Verma', 'A', 'Good work'),
(16, 'Math', 90, '2026-03-03', 'Mr. Sharma', 'A', 'Excellent'),
(17, 'Science', 68, '2026-03-02', 'Ms. Singh', 'C', 'Below average'),
(18, 'English', 79, '2026-03-01', 'Mr. Verma', 'B', 'Satisfactory'),
(19, 'Math', 84, '2026-03-03', 'Mr. Sharma', 'A', 'Good job'),
(20, 'Science', 93, '2026-03-02', 'Ms. Singh', 'A', 'Outstanding');

-- =========================
-- 1️⃣ Basic SELECT Queries
-- =========================

-- 1. Display all columns from Students.
SELECT * FROM Students

-- 2. Display all columns from Marks.
SELECT * FROM Marks

-- 3. Show only first_name and last_name of students.
SELECT first_name, last_name 
FROM Students

-- 4. List all subjects from Marks (without duplicates).
SELECT DISTINCT subject
FROM Marks;

-- 5. Show students’ names and their city.
SELECT first_name, city
FROM Students

-- 6. Show students’ names who live in “Patna”.
SELECT (first_name + last_name) as full_name
From Students
WHERE city = 'Patna'

-- 7. Display marks for student_id = 5.
SELECT marks FROM Marks
WHERE student_id = 5

-- 8. Show all students in class “10A”.
SELECT * FROM Students
WHERE class = '10A'

-- 9. Display students whose first name starts with “S”.
SELECT * FROM Students 
WHERE first_name LIKE 'S%'

-- 10. Display students whose last name contains “Singh”.
SELECT * FROM Students 
WHERE last_name LIKE '%Singh%'


-- =========================
-- 2️⃣ Filtering & WHERE Clause
-- =========================

-- 11. Find students who scored more than 80 in any subject.
SELECT * 
FROM Students
JOIN Marks 
ON Students.student_id = Marks.student_id
WHERE Marks.marks > 80

-- 12. Show students who got grade “A”.
SELECT * 
FROM Students
JOIN Marks
ON Students.student_id = Marks.student_id
WHERE grade = 'A'

-- 13. Display students with marks between 70 and 90.
SELECT * 
FROM Students
JOIN Marks
ON Students.student_id = Marks.student_id
WHERE Marks.marks BETWEEN 70 AND  90

-- 14. Show students who appeared for “Math”.
SELECT * FROM Students
JOIN Marks
ON Students.student_id = Marks.student_id
WHERE Marks.subject = 'Math'

-- 15. Show students who scored less than 70 in any subject.
SELECT * FROM Students
JOIN Marks
ON Students.student_id = Marks.student_id
WHERE Marks.marks < 70

-- 16. Find female students (gender = 'F').
SELECT * FROM Students
WHERE gender = 'F'

-- 17. Show students whose city is either “Patna” or “Gaya”.
SELECT first_name, last_name, city
FROM Students
WHERE city IN ('Patna', 'Gaya')

-- 18. Display students who scored exactly 88.


-- 19. Show students who appeared for “Science” and scored above 85.


-- 20. Display students who scored grade “C” in any subject.



-- =========================
-- 3️⃣ Sorting & ORDER BY
-- =========================

-- 21. List all students by first_name ascending.

-- 22. List all students by marks descending.

-- 23. Show top 5 highest marks in “Math”.

-- 24. Display students ordered by city and then by last_name.

-- 25. Show students in descending order of grade (A > B > C).



-- =========================
-- 4️⃣ Aggregate Functions
-- =========================

-- 26. Find the average marks in “Math”.

-- 27. Find the maximum marks in “Science”.

-- 28. Find the minimum marks in “English”.

-- 29. Count the number of students in class “10B”.

-- 30. Count how many students scored grade “A”.

-- 31. Find the total marks obtained by student_id = 1 (sum of all subjects).

-- 32. Find the average marks for each subject.

-- 33. Count students in each city.

-- 34. Find the number of students who scored below 70.

-- 35. Display the highest and lowest marks in “Math”.



-- =========================
-- 5️⃣ JOIN Queries
-- =========================

-- 36. List all students along with their marks and subjects.

-- 37. Show students and their teachers for each subject.

-- 38. Find students who have marks in “Science” only.

-- 39. Display student names and grades where marks > 80.

-- 40. Show students and subjects where grade = “C”.

-- 41. List students with marks and teacher name, ordered by marks descending.

-- 42. Find students and marks for students in class “10A”.

-- 43. Show students’ names who scored A grade in English.

-- 44. Display all students along with their subjects, even if they have no marks (LEFT JOIN).

-- 45. Show all marks and student names, even if the student info is missing (RIGHT JOIN).



-- =========================
-- 6️⃣ Grouping & HAVING
-- =========================

-- 46. Find the average marks per student.

-- 47. Find the total marks per subject.

-- 48. Count the number of students getting grade “A” per subject.

-- 49. List subjects where average marks > 80.

-- 50. Display students with total marks > 250.

-- 1. Show all students whose city = 'Patna'.

-- 2. Find students whose marks > 80.

-- 3. Display records where marks < 70.

-- 4. Show students whose marks >= 90.

-- 5. Find students whose marks <= 75.


-- 6. Show students whose city != 'Patna'.

-- 7. Find marks where subject <> 'Math'.

-- 8. Display students whose grade != 'A'.

-- 9. Show records where teacher != 'Mr. Sharma'.

-- 10. Find students whose class <> '10A'.


-- 11. Find students whose marks > 80 AND subject = 'Math'.

-- 12. Show students whose city = 'Patna' AND gender = 'M'.

-- 13. Display students whose marks > 70 AND marks < 90.

-- 14. Show records where teacher = 'Ms. Singh' AND marks > 85.

-- 15. Find students whose grade = 'A' AND subject = 'Science'.


-- 16. Find students whose subject = 'Math' OR subject = 'Science'.

-- 17. Show students whose city = 'Patna' OR city = 'Gaya'.

-- 18. Display records where marks > 90 OR grade = 'A'.

-- 19. Find students whose teacher = 'Mr. Sharma' OR teacher = 'Mr. Verma'.

-- 20. Show students whose marks < 70 OR grade = 'C'.


-- 21. Find students whose marks BETWEEN 70 AND 90.

-- 22. Display students whose exam_date BETWEEN '2026-03-01' AND '2026-03-03'.

-- 23. Show students whose marks BETWEEN 80 AND 100.

-- 24. Find students whose marks BETWEEN 60 AND 75.

-- 25. Display records where student_id BETWEEN 5 AND 15.


-- 26. Show students whose city IN ('Patna','Gaya').

-- 27. Find marks where subject IN ('Math','English').

-- 28. Display students whose first_name LIKE 'S%'.

-- 29. Show students whose last_name LIKE '%a'.

-- 30. Find students whose subject NOT IN ('Math').

-- =========================
-- Basic JOIN Queries
-- =========================

-- 1. Display all students with their subject and marks.

-- 2. Show student first name, last name and subject.

-- 3. List all students who scored more than 80 marks.

-- 4. Show students and their marks in 'Math'.

-- 5. Display student name, subject, and grade.

-- 6. Find students who scored less than 70.

-- 7. Show all students with their exam dates.

-- 8. Display students who got grade 'A'.

-- 9. List student names and teachers for each subject.

-- 10. Show students who belong to class '10A' with their marks.

-- 11. Display students from city 'Patna' and their marks.

-- 12. Show all students with their subject and teacher.

-- 13. Find students who scored the highest marks.

-- 14. Display students who have marks between 70 and 90.

-- 15. Show students whose subject is 'Science'.

-- 16. Display student name and marks in descending order.

-- 17. List students who scored more than 85 in any subject.

-- 18. Show student names and remarks.

-- 19. Find students who got grade 'B'.

-- 20. Display students with their subject and exam date.

-- 21. Show students and their teachers for 'English'.

-- 22. List students whose marks are greater than the average marks.

-- 23. Display students with marks less than 75.

-- 24. Show students with subject 'Math' and marks greater than 80.

-- 25. Display students who belong to city 'Gaya'.

-- 26. Show student names and their contact numbers with marks.

-- 27. List students who have grade 'C'.

-- 28. Display students who scored exactly 90 marks.

-- 29. Show student name, subject and teacher sorted by marks.

-- 30. Display all students even if they don't have marks (LEFT JOIN).

-- =========================
-- 30 practice questions using JOIN + Set Operators (UNION, UNION ALL, INTERSECT, EXCEPT).
-- =========================
-- 1. Display student names and subjects using INNER JOIN.

-- 2. Show all students and their marks using LEFT JOIN.

-- 3. Display all marks even if student details are missing using RIGHT JOIN.

-- 4. Show all records from Students and Marks tables using FULL JOIN.

-- 5. Display student names and subjects where marks are greater than 80.

-- 6. List students from city 'Patna' with their marks.

-- 7. Show students who have taken 'Math' subject.

-- 8. Display students who scored less than 70 in any subject.

-- 9. List student names with teacher names using JOIN.

-- 10. Show student names, subjects, and exam dates.

-- 11. Combine students from class '10A' and class '10B' using UNION.

-- 12. Combine students from city 'Patna' and 'Gaya' using UNION ALL.

-- 13. Display common student IDs present in both tables using INTERSECT.

-- 14. Show students present in Students table but not in Marks table using EXCEPT.

-- 15. Combine subjects 'Math' and 'Science' using UNION.

-- 16. Display students who scored above 85 in Math or Science using UNION.

-- 17. Combine teachers teaching Math and English using UNION.

-- 18. Show common subjects between two queries using INTERSECT.

-- 19. Display students who have Math marks but not Science marks using EXCEPT.

-- 20. Show students with grade 'A' in Math or English using UNION.

-- 21. Combine results of students scoring above 90 and students scoring below 60.

-- 22. Show common students from two different JOIN queries using INTERSECT.

-- 23. Display students from class '10A' but not from city 'Patna' using EXCEPT.

-- 24. Combine student names from two different queries using UNION.

-- 25. Show subjects taught by 'Mr. Sharma' and 'Mr. Verma' using UNION.

-- 26. Display students who scored above average in two subjects using INTERSECT.

-- 27. Show students appearing in one subject but not another using EXCEPT.

-- 28. Combine marks of Math and Science using UNION ALL.

-- 29. Show students who scored above 80 in two different queries using INTERSECT.

-- 30. Display all student names and subjects from two separate queries using UNION.

-- WHERE PRACTICE

-- 1. Display all students whose marks are greater than 80.

-- 2. Show students whose subject is 'Math'.

-- 3. Display students from city 'Patna'.

-- 4. Show students whose marks are between 70 and 90.

-- 5. Display students whose grade is 'A'.

-- ORDER BY PRACTICE

-- 6. Display all students ordered by marks in ascending order.

-- 7. Show students ordered by marks in descending order.

-- 8. Display students ordered by first_name alphabetically.

-- 9. Show subjects ordered by exam_date.

-- 10. Display students ordered by city and then by marks.

-- GROUP BY PRACTICE

-- 11. Count number of students in each subject.

-- 12. Find average marks for each subject.

-- 13. Find maximum marks in each subject.

-- 14. Find minimum marks for each subject.

-- 15. Count number of students in each city.

-- HAVING PRACTICE

-- 16. Show subjects where average marks are greater than 80.

-- 17. Display subjects where total students are more than 2.

-- 18. Show cities where average marks are greater than 75.

-- 19. Display teachers who have more than 2 students.

-- 20. Show subjects where maximum marks are greater than 90.

-- DISTINCT PRACTICE

-- 21. Display distinct subjects from Marks table.

-- 22. Show unique cities from Students table.

-- 23. Display distinct grades from Marks table.

-- 24. Show distinct teacher names.

-- 25. Display unique classes from Students table.

-- TOP PRACTICE
-- 26. Display top 5 students with highest marks.

-- 27. Show top 3 marks from Marks table.

-- 28. Display top 10 students ordered by marks.

-- 29. Show top 5 lowest marks.

-- 30. Display top 3 students from subject 'Math'.

