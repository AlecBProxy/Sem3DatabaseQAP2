-- Problem #1, "create tables" 

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR (40) NOT NULL,
    email VARCHAR (100) NOT NULL,
    school_enrollment_date DATE NOT NULL,
)

CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    department VARCHAR(40) NOT NULL,
)

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR (50) NOT NULL,
    course_description TEXT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
)

CREATE TABLE enrollments (
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id)

)

-- Problem #1 "insert data"

INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
('Jalen', 'Green', 'JG04@gmail.com', '2024-09-15'),
('Alperen', 'Sengun', 'AS28@gmail.com', '2024-09-14'),
('Amen', 'Thompson', 'AT01@gmail.com', '2024-09-13'),
('Dillon', 'Brooks', 'DB09@gmail.com', '2024-09-12'),
('Fred', 'VanVleet', 'FV05@gmail.com', '2024-09-11');

INSERT INTO professors (first_name, last_name, department)
VALUES
('Hakeem', 'Olajuwon', 'Math'),
('Clyde', 'Drexler', 'Physics'),
('Ralph', 'Sampson', 'Chemistry'),
('Tracy', 'McGrady', 'English')

INSERT INTO courses (course_name, course_description, professor_id)
VALUES
('Math 101', 'Rudimentary Algebra', 1),
('Physics 101', 'Intro to Physics', 2),
('Chemistry 101', 'Intro to Chemistry', 3)

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-05'),
(2, 2, '2025-01-04'),
(3, 3, '2025-01-03'),
(4, 1, '2025-01-04'),
(5, 2, '2025-01-05')

-- Problem #1 "Write SQL Queries"

SELECT students.first_name || ' ' || students.last_name AS full_name
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Physics 101';

SELECT courses.course_name, professors.first_name || ' ' || professors.last_name AS professor_name
FROM courses
INNER JOIN professors ON courses.professor_id = professors.professor_id;

