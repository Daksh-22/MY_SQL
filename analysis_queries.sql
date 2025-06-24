-- Step 1: Create the database only if it doesn't exist
CREATE DATABASE IF NOT EXISTS college;

-- Step 2: Select the database
USE college;

-- Step 3: Drop the table only if it exists (avoid error on DROP)
DROP TABLE IF EXISTS students;

-- Step 4: Create the students table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NULL
);

-- Step 5: Insert data into the students table
INSERT INTO students (id, name, age) VALUES
    (1, "Daksh", 20),
    (2, "Aryan", 21),
    (3, "Mukul", 22);

-- Step 6: View all data
SELECT * FROM students;

-------------------------------------------------------------------------------

CREATE DATABASE XYZ;

USE XYZ;

CREATE TABLE info(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT null);
    
INSERT INTO info (id , name , salary) VALUES
	(1,"ADAM",250000),
	(2,"BOB",275000),
    (3,"CASEY",200000);
    
SELECT * FROM info;

-----------------------------------------------------------------------------------

CREATE DATABASE prac;

USE prac;

    
SELECT * FROM val;

 SELECT AVG(marks)
 FROM val;

SELECT city
FROM val
GROUP BY city;

SELECT city, AVG(marks)
FROM val
GROUP BY city
ORDER BY AVG(marks) DESC;

DROP TABLE IF EXISTS val;

CREATE TABLE val(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT null,
    grade VARCHAR(50),
    city VARCHAR(50)
    );

    
INSERT INTO val
	(rollno,name,marks,grade,city)
VALUES
	(101,"Daksh",91,"A","New Delhi"),
    (102,"Dev",88,"A","New Delhi"),
    (103,"Arav",71,"B","New York"),
    (104,"Zayn",87,"A","Pune"),
    (105,"Mohit",60,"C","Bihar"),
	(106,"Tom",60,"C","Pune"),
	(107,"Shalini",99,"A","Bihar"),
	(108,"Ravya",79,"B","New York"),
	(109,"Vrinda",90,"A","Pune");

SELECT city, count(name)
FROM val
GROUP BY city
HAVING MAX(marks) >= 90;

SET SQL_SAFE_UPDATES = 0;  /* allows updation of values */

UPDATE val
SET grade = 'O'
WHERE grade = 'A';

 

CREATE TABLE dept(
id INT PRIMARY KEY,
name varchar(50)
);

CREATE TABLE teachers(
id INT PRIMARY KEY,
name varchar(50),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)
);

ALTER TABLE val
ADD COLUMN age INT;  

ALTER TABLE val 
DROP COLUMN age;

ALTER TABLE val
MODIFY city VARCHAR(100) NOT NULL;

ALTER TABLE val
DROP grade;

DELETE FROM val
WHERE marks<=80;

ALTER TABLE val
CHANGE COLUMN name full_name VARCHAR(50);

CREATE TABLE table_1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NULL
);

INSERT INTO table_1 
(id, name, age)
VALUES
(1, 'decs', 16),
(2, 'grtg', 18),
(3, 'qggjh', 19),
(4, 'ssdf', 29);

CREATE TABLE table_2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NULL
);

INSERT INTO table_2
(id, name, age)
VALUES
(1, 'rrr', 166),
(3, 'gg', 55),
(7, 'qg', 69),
(5, 'ssf', 29);

/*JOINS*/

SELECT* FROM 
table_1
INNER JOIN table_2
ON table_1.id = table_2.id; 

SELECT* FROM 
table_1
RIGHT JOIN table_2
ON table_1.id = table_2.id;

SELECT* FROM 
table_1
LEFT JOIN table_2
ON table_1.id = table_2.id
UNION
SELECT* FROM 
table_1
RIGHT JOIN table_2
ON table_1.id = table_2.id;  


/*SUB-QUERY*/
SELECT name, marks
FROM val
WHERE marks >= (SELECT AVG(marks) FROM val);