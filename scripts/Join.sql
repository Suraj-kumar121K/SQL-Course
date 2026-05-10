use JOIN_SQL
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    class VARCHAR(10),
    gender VARCHAR(10),
    city VARCHAR(50)
);

INSERT INTO Student VALUES
(1, 'Rahul', 'Sharma', '10', 'Male', 'Delhi'),
(2, 'Priya', 'Verma', '9', 'Female', 'Mumbai'),
(3, 'Aman', 'Singh', '10', 'Male', 'Lucknow'),
(4, 'Neha', 'Gupta', '8', 'Female', 'Delhi'),
(5, 'Rohit', 'Kumar', '9', 'Male', 'Patna'),
(6, 'Pooja', 'Shah', '10', 'Female', 'Ahmedabad'),
(7, 'Vikas', 'Yadav', '8', 'Male', 'Kanpur'),
(8, 'Anjali', 'Mehta', '9', 'Female', 'Surat'),
(9, 'Arjun', 'Patel', '10', 'Male', 'Vadodara'),
(10, 'Sneha', 'Joshi', '8', 'Female', 'Pune'),
(11, 'Karan', 'Malhotra', '9', 'Male', 'Chandigarh'),
(12, 'Riya', 'Kapoor', '10', 'Female', 'Delhi'),
(13, 'Deepak', 'Chauhan', '8', 'Male', 'Jaipur'),
(14, 'Simran', 'Kaur', '9', 'Female', 'Amritsar'),
(15, 'Mohit', 'Agarwal', '10', 'Male', 'Agra'),
(16, 'Kavita', 'Mishra', '8', 'Female', 'Varanasi'),
(17, 'Sandeep', 'Rana', '9', 'Male', 'Dehradun'),
(18, 'Nisha', 'Arora', '10', 'Female', 'Ludhiana'),
(19, 'Ajay', 'Thakur', '8', 'Male', 'Shimla'),
(20, 'Meena', 'Saxena', '9', 'Female', 'Bhopal');

CREATE TABLE Mark (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    grade CHAR(2),
    exam_date DATE
);

INSERT INTO Mark VALUES
(1, 1, 'Math', 85, 'A', '2025-01-10'),
(2, 2, 'Science', 78, 'B', '2025-01-11'),
(3, 3, 'English', 90, 'A', '2025-01-12'),
(4, 4, 'History', 67, 'C', '2025-01-13'),
(5, 5, 'Math', 88, 'A', '2025-01-14'),
(6, 6, 'Science', 75, 'B', '2025-01-15'),
(7, 7, 'English', 82, 'B', '2025-01-16'),
(8, 8, 'Math', 91, 'A', '2025-01-17'),
(9, 9, 'Science', 69, 'C', '2025-01-18'),
(10, 10, 'English', 73, 'B', '2025-01-19'),
(11, 11, 'Math', 95, 'A', '2025-01-20'),
(12, 12, 'Science', 64, 'C', '2025-01-21'),
(13, 13, 'English', 77, 'B', '2025-01-22'),
(14, 14, 'History', 81, 'B', '2025-01-23'),
(15, 15, 'Math', 70, 'B', '2025-01-24'),
(16, 16, 'Science', 89, 'A', '2025-01-25'),
(17, 17, 'English', 68, 'C', '2025-01-26'),
(18, 18, 'Math', 84, 'A', '2025-01-27'),
(19, 19, 'Science', 72, 'B', '2025-01-28'),
(20, 20, 'English', 79, 'B', '2025-01-29');

-- ========================
-- INNER JOIN
-- ========================
-- 1 Show students with their subjects and marks.
SELECT Student.first_name, Mark.subject, Mark.marks
FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.mark_id

-- 2 Show students who appeared for Math.
SELECT * FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Mark.subject = 'Math'

-- 3 Show students who scored more than 80.
SELECT * FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Mark.marks >= 80

-- 4 Show students who got grade 'A'.
SELECT Student.first_name, Student.last_name, Mark.subject, Mark.grade
FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Mark.grade = 'A'

-- 5 Display students with marks between 70 and 90.
SELECT * FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE marks BETWEEN 70 AND 90

-- 6 Show female students with their marks.
SELECT Student.first_name, Student.last_name,Student.gender, Mark.subject, Mark.grade
FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Student.gender = 'Female'

-- 7 Show male students who scored more than 75.
SELECT S.first_name, S.last_name, S.gender, M.subject, M.marks
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE S.gender = 'Male' AND M.marks > 75

-- 8 Display students from Patna with their marks.
SELECT Student.first_name, Student.last_name, Student.city, Mark.subject, Mark.marks
FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Student.city = 'Patna' 

-- 9 Show students who scored less than 60.
SELECT * FROM Student
INNER JOIN Mark
ON Student.student_id = Mark.student_id
WHERE Mark.marks < 60

-- 10 Show students who appeared for Science exam.
SELECT S.first_name, S.last_name , M.subject, M.exam_date
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.subject = 'Science'

-- 11 Display students who got grade 'B'.
SELECT S.first_name, S.last_name , M.subject, M.grade
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.grade = 'B'

-- 12 Show students who scored above 90 in Math.
SELECT S.first_name, S.last_name , M.subject, M.marks
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.subject = 'Math' AND M.marks > 90

-- 13 Show students whose exam date is after '2025-01-10'.
SELECT S.first_name, S.last_name , M.subject, M.exam_date
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.exam_date = '2025-01-10'

-- 14 Display students who got grade 'A' in English.
select S.first_name, S.last_name, M.grade, M.subject
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.grade = 'A' AND M.subject = 'English'

-- 15 Show students with marks below 50.
select S.first_name, S.last_name, M.subject, M.marks
FROM Student S
INNER JOIN Mark M
ON S.student_id = M.student_id
WHERE M.marks < 50

-- 16 Display students whose teacher is 'Sharma'.
SELECT s.first_name, s.last_name, m.subject
FROM Student s
INNER JOIN Mark m
ON s.student_id = m.student_id
WHERE s.last_name = 'Sharma'

-- 17 Display students with marks greater than 85.
SELECT s.first_name, s.last_name, m.subject, m.marks
FROM Student s
INNER JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks > 90

-- 18 Show students who appeared for Math and scored >70.
SELECT s.first_name, s.last_name, m.subject, m.marks
FROM Student s
INNER JOIN Mark m
ON s.student_id = m.student_id
WHERE m.subject = 'Math' AND m.marks > 70

-- 19 Show students whose marks are between 60 and 80.
SELECT s.first_name, s.last_name, m.subject, m.marks
FROM Student s
INNER JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks BETWEEN 60 AND 90
-- ========================
-- LEFT JOIN
-- ========================
-- 1 Show all students with their marks (if available).
SELECT * FROM Student
LEFT JOIN Mark
ON Student.student_id = Mark.student_id

-- 2 Show students who do not have marks records.
SELECT s.first_name, s.last_name, m.subject, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks IS NULL


-- 3 Show all students with subjects they attempted.
SELECT s.first_name, s.last_name, m.subject, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id

-- 4 Show all students with grades if they exist.
SELECT s.first_name, s.last_name, m.grade
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id 

-- 5 Show students with marks including those without exams.
SELECT s.first_name, s.last_name, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id 

-- 6 Show students with exam dates if available.


-- 7 Show students with subjects but include students with no subjects.


-- 8 Show students with teacher names if assigned.


-- 9 Show all students with remarks if any.


-- 10 Show students with marks less than 70 including students with no marks.


-- 11 Show students with Math marks if they appeared.


-- 12 Show students with Science marks if they appeared.


-- 13 Show all students with grades 'A' if available.


-- 14 Show students with exam dates after 2024 including those without exams.


-- 15 Show all students with marks sorted by marks.


-- 16 Show students with subjects attempted including those with none.


-- 17 Show students with teacher information if present.


-- 18 Show students who have no marks records.

-- 19 Show students with remarks 'Good' if present.

-- 20 Show all students with their subject list.

-- ========================
-- RIGHT JOIN
-- ========================

-- 1 Show all marks records with student details if available.

-- 2 Show marks for all subjects including students info.

-- 3 Show marks with student names if present.

-- 4 Show all exam records even if student data missing.

-- 5 Show marks with grades including missing students.

-- 6 Show all subjects attempted by students.

-- 7 Show all exam dates with student names.

-- 8 Show marks with teacher names.

-- 9 Show all remarks with student names.

-- 10 Show marks greater than 80 with student details.

-- 11 Show marks less than 50 with student details.

-- 12 Show all Math exam records with students.

-- 13 Show Science marks with students.

-- 14 Show marks with grade 'A' including missing student info.

-- 15 Show all exam records after 2024.

-- 16 Show all subject marks sorted by marks.

-- 17 Show marks with teacher 'Verma'.

-- 18 Show marks with remarks 'Excellent'.

-- 19 Show marks between 60 and 80 with students.

-- 20 Show all subject exams with student data.


-- ========================
-- CROSS JOIN
-- ========================
-- 1 Show all combinations of students and subjects.

-- 2 Combine every student with every teacher.

-- 3 Show all student–subject pairs.

-- 4 Show all students with all exam dates.

-- 5 Combine students with all grades.

-- 6 Show all student and subject combinations.

-- 7 Show students with all teacher assignments.

-- 8 Combine students with all subjects.

-- 9 Show all students with all remarks options.

-- 10 Show all students with all possible exam dates.

-- 11 Combine every student with every subject teacher.

-- 12 Show all student and exam combinations.

-- 13 Combine students with all grades list.

-- 14 Show all student and subject combinations.

-- 15 Show all student and marks possibilities.

-- 16 Combine students with all test schedules.

-- 17 Show student-teacher combinations.

-- 18 Combine students with all subject options.

-- 19 Show student and exam combinations.

-- 20 Combine students with all evaluation remarks.

-- ========================
-- SELF JOIN
-- ========================
-- 1 Show students from the same city.

-- 2 Show students in the same class.

-- 3 Show students who share the same last name.

-- 4 Show pairs of students from Patna.

-- 5 Show students in class 10A together.

-- 6 Show students with same gender pairs.

-- 7 Show students with same birth year.

-- 8 Show students living in the same city.

-- 9 Show students in the same class but different names.

-- 10 Show students with same contact prefix.

-- 11 Show students with same first letter of name.

-- 12 Show students sharing the same city and class.

-- 13 Show students with same last name but different city.

-- 14 Show students born in the same year.

-- 15 Show student pairs from Delhi.

-- 16 Show students with same gender in same class.

-- 17 Show students sharing same DOB.

-- 18 Show students with same last name.

-- 19 Show students from same city but different class.

-- 20 Show student pairs with same class.