CREATE DATABASE joins;

USE joins;

CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', NULL),
(104, 'Diana', 3);

/*INNER JOIN*/
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
/*Only rows where dept_id matches in both tables
  Dono tables ka intersection*/

/*LEFT JOIN*/
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
/* saare employees aur vo departments jaha deptId comman hai */

/*RIGHT JOIN*/
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
/*All departments are shown*/

/*FULL OUTER JOIN*/
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION

SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
/*dono tables ka UNION*/


