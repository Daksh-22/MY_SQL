CREATE DATABASE practice;

USE practice;

CREATE TABLE sales (
    region VARCHAR(50),
    product VARCHAR(50),
    revenue INT
);

-- Sample Data
INSERT INTO sales (region, product, revenue) VALUES
('North', 'ProductA', 500),
('North', 'ProductB', 800),
('North', 'ProductC', 200),
('North', 'ProductD', 700),
('South', 'ProductA', 600),
('South', 'ProductB', 300),
('South', 'ProductC', 900),
('South', 'ProductD', 400);

/*TOP 3 PRODUCTS BY REVENUE*/
SELECT product , revenue
FROM sales
ORDER BY revenue DESC
LIMIT 3;

CREATE TABLE orders (
    customer_id INT,
    order_date DATE
);

-- Sample Data
INSERT INTO orders (customer_id, order_date) VALUES
(101, '2023-01-01'),
(102, '2023-01-02'),
(101, '2023-01-05'),
(103, '2023-01-06'),
(104, '2023-01-07'),
(102, '2023-01-08'),
(105, '2023-01-09');

SELECT * FROM orders;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

/* "COUNT(*) > 1" detects repetition */