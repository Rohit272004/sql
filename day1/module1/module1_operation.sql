use ecommerce;

SELECT name AS Customer_name ,city AS location from customers;

SELECT order_id ,amount FROM orders WHERE amount > 500;

SELECT * FROM orders WHERE status = 'Completed' AND amount >= 500;
  
SELECT * FROM customers WHERE city = 'Mumbai' OR city = 'Delhi';
   
SELECT * FROM orders WHERE status = 'Completed' AND (amount = 500 OR amount = 2000);

SELECT * FROM customers WHERE city IN ("Mumbai","Delhi");

SELECT * FROM orders WHERE amount BETWEEN 500 AND 1200;

--name begins with A
SELECT * FROM cutstomers WHERE name LIKE "A%";

-- 'A%'	Starts with A
-- '%a'	Ends with a
-- '%it%'	Contains it
-- '_a%'	Second character is a

