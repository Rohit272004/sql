--!part1
create companydb;
use companydb;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) CHECK (salary > 0),
    city VARCHAR(100) DEFAULT 'Mumbai'
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);


CREATE TABLE employee_details (
    employee_id INT,
    department_id INT,

    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),

    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO employees VALUES
(1,'Amit','amit@gmail.com',22,35000,'Mumbai'),
(2,'Priya', 'priyan@gmail.com',24,45000,'Pune'),
(3,'Rahul','rahul@gmail.com',25,50000,'Delhi');

update employees set salary = '50000',city = 'Mumbai' where name = 'Priya' 

DELETE FROM employee WHERE employee_id = 3 ;

ALTER TABLE employees ADD COLUMN joining_date DATE;


--! PART 2
SELECT * FROM orders WHERE amount > 700;

SELECT * FROM orders WHERE city IN ('Mumbai','Pune') AND amount > 500;

SELECT * FROM customers WHERE name LIKE '%a';
SELECT * FROM customers WHERE name LIKE 'A%';
SELECT * FROM customers WHERE name LIKE '%it%';

SELECT  order_id , amount FROM orders ORDER BY amount DESC LIMIT 3;

SELECT * FROM customers WHERE city IS NULL;

SELECT DISTINCT city from orders ;


--! part 3
START TRANSACTION;

UPDATE accounts SET balance = balance - 2000 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 2000 WHERE account_id = 2;

COMMIT;
