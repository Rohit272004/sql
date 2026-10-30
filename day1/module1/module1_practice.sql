-- Q1 Find the two highest-value completed orders worth at least ₹500.

SELECT order_id, customer_id , amount 
    FROM orders 
    WHERE status = "Completed" AND amount >= 500
    ORDER BY amount DESC
    LIMIT 2;

-- Display only the names and ages of all customers.
select name ,age from customers;

-- Find all orders with an amount less than or equal to ₹800.
SELECT * FROM orders WHERE amount <= 800;

-- Find orders whose status is Completed and whose amount is greater than ₹500.
SELECT * FROM orders WHERE status = "Completed" AND amount > 500;

-- Find customers who live in Pune or Delhi using IN.
SELECT * FROM customers WHERE city IN ("Delhi","Pune");

-- Find orders with an amount between ₹300 and ₹1,200, inclusive.
SELECT * FROM orders WHERE amount BETWEEN 300 AND 1200;

SELECT * FROM cutstomers WHERE name LIKE "%a"; --name ending with a 

-- Find customers whose age is missing.
SELECT * FROM customers WHERE age is NULL;

-- . Find the three largest order amounts, from highest to lowest.
SELECT * FROM orders ORDER BY amount DESC LIMIT 3;


