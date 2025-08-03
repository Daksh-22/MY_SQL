CREATE database JOINS_PRAC;

USE JOINS_PRAC;
###############################################################################################
CREATE TABLE Authors (
   AuthorID INT PRIMARY KEY,
   first_name VARCHAR(100),
   last_name VARCHAR(100),
   birth_year INT
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    YearPublished INT,
    price DECIMAL(6,2)
);
###############################################################################################
INSERT INTO Authors (AuthorID, first_name, last_name, birth_year)
VALUES 
    (1, 'George', 'Orwell', 1903),
    (2, 'J.K.', 'Rowling', 1965),
    (3, 'J.R.R.', 'Tolkien', 1892),
    (4, 'Agatha', 'Christie', 1890),
    (5, 'Dan', 'Brown', 1964);

INSERT INTO Books (BookID, Title, AuthorID, YearPublished, price)
VALUES 
    (101, '1984', 1, 1949, 15.99),
    (102, 'Animal Farm', 1, 1945, 12.50),
    (103, 'Harry Potter and the Philosopher\'s Stone', 2, 1997, 20.00),
    (104, 'Harry Potter and the Chamber of Secrets', 2, 1998, 22.00),
    (105, 'The Hobbit', 3, 1937, 18.75),
    (106, 'Murder on the Orient Express', 4, 1934, 14.00),
    (107, 'The Da Vinci Code', 5, 2003, 19.99),
    (108, 'Digital Fortress', NULL, 1998, 16.50);  
###############################################################################################

#vo saaari cheeze jo author and books table me comman hai
SELECT * 
FROM Authors
JOIN Books
ON Authors.AuthorID = Books.AuthorID;

#specified columns display krna bas
SELECT Authors.first_name , Books.Title , Books.price
FROM Authors
JOIN Books
ON Authors.AuthorID = Books.AuthorID;

#vo books jo 1950 ke baad h and in "ASC" order
SELECT a.first_name , b.Title
FROM Authors as a
JOIN Books as b
ON a.AuthorID = b.AuthorID
WHERE b.YearPublished > 1950
ORDER BY price;

#How many books each author has written
SELECT a.first_name , a.last_name , COUNT(*) as NumberOFBooksWritten
FROM Authors as a
JOIN Books as b
ON a.AuthorID = b.AuthorID
Group by a.AuthorID; 

###############################################################################################
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
    (1, 'Fiction'),
    (2, 'Fantasy'),
    (3, 'Mystery'),
    (4, 'Thriller'),
    (5, 'Science Fiction'),
    (6, 'Historical');

CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO BookCategories (BookID, CategoryID)
VALUES 
    (101, 1),  -- 1984 - Fiction
    (101, 5),  -- 1984 - Science Fiction
    (102, 1),  -- Animal Farm - Fiction
    (103, 2),  -- HP 1 - Fantasy
    (104, 2),  -- HP 2 - Fantasy
    (105, 2),  -- The Hobbit - Fantasy
    (106, 3),  -- Murder on Orient Express - Mystery
    (107, 4),  -- Da Vinci Code - Thriller
    (108, 4);  -- Digital Fortress - Thriller

########################################################################################
#JOINING ALL 4 TABLES
SELECT * 
FROM Authors a JOIN Books b ON a.AuthorID = b.AuthorID
JOIN 
BookCategories ON BookCategories.BookID = b.BookID
JOIN
Categories ON Categories.CategoryID = BookCategories.CategoryID;

#Return books before 2000 born before 1900
SELECT b.title 
FROM Books b
JOIN Authors a
ON b.AuthorID = a.AuthorID
WHERE a.birth_year <= 1900 AND b.YearPublished <= 2000; 

################################################################################################################################################################################
#"OUTER JOINS:"
CREATE DATABASE left_joins_tut;

USE left_joins_tut;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
-- Insert into Customer table
INSERT INTO Customer (CustomerID, CustomerName, Email, City)
VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Delhi'),
(2, 'Priya Mehta', 'priya@yahoo.com', 'Mumbai'),
(3, 'Rohit Singh', 'rohit@outlook.com', 'Bangalore'),
(4, 'Sneha Roy', 'sneha@gmail.com', 'Kolkata');

INSERT INTO Customer (CustomerID , CustomerName , Email , City)
VALUES (5 , 'Joey Alexander' , 'ja@yahoo.com', 'New York');
-- Insert into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2025-07-20', 1200.50),
(102, 2, '2025-07-21', 340.00),
(103, 1, '2025-07-25', 580.75),
(104, 3, '2025-07-28', 999.99);

INSERT INTO Orders (Orderid, CustomerID, OrderDate, TotalAmount)
VALUES (105, 3, '2023-02-01', 75.00);

#Pura Customer table"(regardless order place kia ya nhi)"chiye with corresponding Order table
SELECT * 
FROM Customer c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

#Sirf unka Info nikalna jinhone NewYork se order kia hai
SELECT c.CustomerID, c.CustomerName, IFNULL(o.OrderID, 0) AS OrderID
FROM
    (SELECT * FROM Customer WHERE City = 'New York') AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

################################################################################################################################################################################

CREATE DATABASE GokulDham;

USE GokulDham;

CREATE TABLE apartment (
	apartment_id INT primary key,
    apartment_number CHAR(50) NOT NULL,
    floor_number INT NOT NULL,
    wing_number CHAR(1) NOT NULL
    );
    
CREATE TABLE resident (
    resident_id INT PRIMARY KEY,
    first_name CHAR(50) NOT NULL,
    last_name CHAR(50) NOT NULL,
    occupation CHAR(50) NOT NULL,
    apartment_id INT,
    FOREIGN KEY (apartment_id) REFERENCES apartment(apartment_id)
);

INSERT INTO apartment (apartment_id, apartment_number, floor_number, wing_number)
VALUES 
    (1, 'A101', 1, 'A'),
    (2, 'B202', 2, 'B'),
    (3, 'C303', 3, 'C'),
    (4, 'D404', 4, 'D'),
    (5, 'E505', 5, 'E'),
    (6, 'F606', 6, 'F'),
    (7, 'G707', 7, 'G'),
    (8, 'H808', 8, 'H');

INSERT INTO resident (resident_id, first_name, last_name, occupation, apartment_id)
VALUES 
    (101, 'Rahul', 'Sharma', 'Engineer', 1),
    (102, 'Priya', 'Verma', 'Doctor', 2),
    (103, 'Amit', 'Kumar', 'Teacher', 3),
    (104, 'Neha', 'Singh', 'Designer', NULL),       -- No apartment
    (105, 'Ravi', 'Jain', 'Lawyer', 4),
    (106, 'Sneha', 'Rao', 'Artist', NULL),          -- No apartment
    (107, 'Karan', 'Mehta', 'Chef', 7),
    (108, 'Simran', 'Patel', 'Architect', 8);

#Count number of residents per apartmenet
SELECT 
    a.apartment_id, 
    a.apartment_number,
    COUNT(r.resident_id) AS ResidentsPerApartment
FROM apartment AS a
LEFT JOIN resident AS r
    ON a.apartment_id = r.apartment_id
GROUP BY a.apartment_id, a.apartment_number;

#Finding Unoccupied Apartments
SELECT 
	a.apartment_id,
    a.apartment_number
FROM resident as r
RIGHT JOIN apartment as a
	ON a.apartment_id = r.apartment_id
WHERE r.apartment_id IS NULL;

################################################################################################################################################################################
CREATE DATABASE union_demo;
USE union_demo;

-- Create tables for our demonstration
CREATE TABLE headquarters_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE branch_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    status VARCHAR(20)
);

##########################################################################################
-- UNION
CREATE DATABASE union_demo;
USE union_demo;

-- Create tables for our demonstration
CREATE TABLE headquarters_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE branch_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    status VARCHAR(20)
);
-- Sample Data
-- ====================================================================
-- Insert data into headquarters_employees
INSERT INTO headquarters_employees VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 'IT', 75000.00),
(102, 'Mary', 'Johnson', 'mary.johnson@company.com', '2019-06-22', 'HR', 65000.00),
(103, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(104, 'Susan', 'Brown', 'susan.brown@company.com', '2020-01-30', 'Marketing', 68000.00),
(105, 'Michael', 'Davis', 'michael.davis@company.com', '2018-09-12', 'IT', 78000.00);

-- Insert data into branch_employees
INSERT INTO branch_employees VALUES
(201, 'James', 'Wilson', 'james.wilson@company.com', '2019-04-18', 'Sales', 62000.00),
(202, 'Patricia', 'Moore', 'patricia.moore@company.com', '2020-07-25', 'Marketing', 59000.00),
(203, 'Linda', 'Taylor', 'linda.taylor@company.com', '2018-08-15', 'HR', 61000.00),
(204, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00), -- Duplicate employee who works at both locations
(205, 'Elizabeth', 'Anderson', 'elizabeth.anderson@company.com', '2019-12-03', 'Sales', 64000.00);

-- Insert data into customers
INSERT INTO customers VALUES
(1001, 'David', 'Miller', 'david.miller@email.com', '2019-02-14', 'Active'),
(1002, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2020-05-20', 'Active'),
(1003, 'Michael', 'Davis', 'michael.davis@email.com', '2018-11-30', 'Inactive'), -- Same name as an employee
(1004, 'Jennifer', 'Garcia', 'jennifer.garcia@email.com', '2021-01-05', 'Active'),
(1005, 'Robert', 'Martinez', 'robert.martinez@email.com', '2019-08-22', 'Active');

-- Basic:
SELECT first_name, salary FROM headquarters_employees
UNION ALL
SELECT employee_id, NULL FROM branch_employees;

-- Selecting comman value in all three (kuch comman h nahi vaise iss case me)
SELECT h.email
FROM headquarters_employees h
JOIN branch_employees b ON h.email = b.email
JOIN customers c ON h.email = c.email;

####################################################################################################
CREATE DATABASE friends_db;
USE friends_db;

-- Create tables for our demonstration
CREATE TABLE characters (
    character_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(100)
);

CREATE TABLE apartments (
    apartment_id INT PRIMARY KEY,
    building_address VARCHAR(100) NOT NULL,
    apartment_number VARCHAR(10) NOT NULL,
    monthly_rent DECIMAL(8, 2),
    current_tenant_id INT
);

INSERT INTO characters (character_id, first_name, last_name, occupation) VALUES
(1, 'Ross', 'Geller', 'Paleontologist'),
(2, 'Rachel', 'Green', 'Fashion Executive'),
(3, 'Chandler', 'Bing', 'IT Procurement Manager'),
(4, 'Monica', 'Geller', 'Chef'),
(5, 'Joey', 'Tribbiani', 'Actor'),
(6, 'Phoebe', 'Buffay', 'Massage Therapist'),
(7, 'Gunther', 'Smith', 'Coffee Shop Manager'),
(8, 'Janice', 'Hosenstein', 'Unknown');

-- Insert data into apartments
INSERT INTO apartments (apartment_id, building_address, apartment_number, monthly_rent, current_tenant_id) VALUES
(101, '90 Bedford Street', '20', 3500.00, 3),
(102, '90 Bedford Street', '19', 3500.00, 4),
(103, '5 Morton Street', '14', 2800.00, 6),
(104, '17 Grove Street', '3B', 2200.00, NULL),
(105, '15 Yemen Road', 'Yemen', 900.00, NULL),
(106, '495 Grove Street', '7', 2400.00, 1);
  
################################################################################################

CREATE DATABASE cross_joins;

USE cross_joins;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);
CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30) NOT NULL
);
INSERT INTO products (product_id, product_name) VALUES
(1, 'T-shirt'),
(2, 'Jeans'),
(3, 'Sweater'),
(4, 'Jacket');
INSERT INTO colors (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Black'),
(5, 'White');

select p.product_name, c.color_name from products p cross join colors c;

#################################################################################################
-- Create and use database
CREATE DATABASE self_join_tutorial;
USE self_join_tutorial;

-- Create employees table with manager_id referencing the same table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    manager_id INT,
    hire_date DATE
);

-- Insert sample employee data with hierarchical management structure
INSERT INTO employees VALUES
(1, 'James', 'Smith', 'CEO', 150000.00, 'Executive', NULL, '2010-01-15'),
(2, 'Sarah', 'Johnson', 'CTO', 140000.00, 'Technology', 1, '2011-03-10'),
(3, 'Michael', 'Williams', 'CFO', 140000.00, 'Finance', 1, '2012-07-22'),
(4, 'Jessica', 'Brown', 'HR Director', 110000.00, 'Human Resources', 1, '2013-05-18'),
(5, 'David', 'Miller', 'Senior Developer', 95000.00, 'Technology', 2, '2014-11-05'),
(6, 'Emily', 'Davis', 'Developer', 80000.00, 'Technology', 5, '2016-08-12'),
(7, 'Robert', 'Wilson', 'Junior Developer', 65000.00, 'Technology', 5, '2019-02-28'),
(8, 'Jennifer', 'Taylor', 'Accountant', 75000.00, 'Finance', 3, '2015-09-17'),
(9, 'Thomas', 'Anderson', 'Accountant', 72000.00, 'Finance', 3, '2017-06-24'),
(10, 'Lisa', 'Martinez', 'HR Specialist', 68000.00, 'Human Resources', 4, '2018-04-30');

-- Employees from same department
SELECT department,
       COUNT(*) AS emp_count, 
       GROUP_CONCAT(CONCAT(first_name, ' ', last_name) ORDER BY employee_id SEPARATOR ', ') AS employees
FROM employees
GROUP BY department;
                                   

