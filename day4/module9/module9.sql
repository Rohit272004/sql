create database company;
use company;

create table employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department ENUM('IT','HR','Finance'),
    salary BIGINT);

ALTER TABLE employees MODIFY COLUMN department ENUM('IT','HR','Finance');
SELECT * FROM employees ;

INSERT INTO employees 
(employee_id	,name	,department	,salary)
VALUES 
(1,	'Amit','IT',50000),
(2, 'Rohit','HR',40000),
(3,	'Priya','IT',60000),
(4,	'Neha','Finance',45000),
(5,	'Rahul','HR',35000),
(6,	'Sneha','IT',70000);

--! subqueries 

--* returns one row column
SELECT * FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);


--* returns mutliple rows 
SELECT * FROM employees
WHERE department IN (
    SELECT department FROM employees WHERE salary > 60000 --can use NOT IN 
);

--* employee with max salary
SELECT * FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);

--* subquery in select clause
SELECT
    name,
    salary,
    (SELECT AVG(salary) FROM employees) AS company_avg_salary
FROM employees; 

