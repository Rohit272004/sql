create database if not exists ecommerce;

use ecommerce ;

create table customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT ,
    city  VARCHAR(50) 
);

INSERT INTO customers(name,city,age)
VALUES
    ('Amit', 'Mumbai', 22),
    ('Priya', 'Pune', 24),
    ('Rahul', 'Mumbai', 21),
    ("Neha","Delhi", 25),
    ("Karan","Pune",NULL);

select * from customers ;

ALTER TABLE customers ADD email VARCHAR(150);
ALTER TABLE customers MODIFY COLUMN email VARCHAR(255);
ALTER TABLE customers DROP COLUMN email;

UPDATE customers SET city = "Nashik" WHERE customer_id = 2;
UPDATE customers SET city = 'Delhi', age = 25 WHERE customer_id = 2;

DELETE FROM customers WHERE customer_id = 3;

CREATE TABLE orders(
    order_id INT PRIMARY KEY ,
    customer_id INT NOT NULL,
    amount INT ,
    status ENUM("Completed","Pending","Cancelled")
    --price DECIMAL(10,2) CHECK (price >= 0)
);

INSERT INTO orders VALUES 
(101,1,500,"Completed"),
(102,2,1200,"Pending"),
(103,1,800,"Completed"),
(104,3,300,"Cancelled"),
(105,4,2000,"Completed")



-- CREATE TABLE customers (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT,

--     name VARCHAR(100) NOT NULL,

--     email VARCHAR(150) UNIQUE,

--     age INT CHECK (age >= 18),

--     city VARCHAR(50) DEFAULT 'Mumbai'
-- );