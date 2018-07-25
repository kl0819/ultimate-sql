-- Write this schema 
-- STUDENTS: id, first_name
-- PAPERS: title, grade, student_id 
CREATE TABLE students(
  id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(100)
);

CREATE TABLE papers ( 
  title VARCHAR(100),
  grade INT, 
  student_id INT, 
  FOREIGN KEY(student_id) 
    REFERENCES students(id)
    ON DELETE CASCADE 
);

-- Input data 
INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- PRINT THIS 
-- first_name | title | grade : no nulls 
SELECT first_name, title, grade 
FROM students, papers
WHERE students.id = papers.student_id
ORDER by 3 DESC; 

-- PRINT THIS 
-- first_name | title | Grade : all students even without paper 
-- left join?
SELECT 
  first_name, 
  title, 
  grade
FROM students
LEFT JOIN papers 
  ON students.id = papers.student_id;

-- PRINT THIS 
-- first_name | title | grade : same as above but handle NULL CASE 

SELECT
  first_name,
  IFNULL(title, 'MISSING') AS title,
  IFNULL(grade, 0) AS grade
FROM students
  LEFT JOIN papers
  ON students.id = papers.student_id;

-- PRINT THIS 
-- first_name | average score : in DESC order 
SELECT
  first_name,
  IFNULL(AVG(grade), 0) AS Average
FROM students
  LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY 1
ORDER BY 2 DESC;

-- PRINT THIS
-- Like above but include pasing_status 
SELECT
  first_name,
  IFNULL(AVG(grade), 0) AS Average,
  CASE
    WHEN AVG(grade) IS NULL THEN 'FAILING'
    WHEN AVG(grade) > 70 THEN 'PASSING'
    ELSE 'FAILING'
  END AS passing_status
FROM students
  LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY 1
ORDER BY 2 DESC;