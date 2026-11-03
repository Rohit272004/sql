SELECT * FROM customers ;

--*Display customer names, order IDs and amounts for customers who have placed orders.
select 
    customers.name ,
    orders.order_id,
    orders.amount
FROM customers INNER JOIN orders 
ON customers.customer_id = orders.customer_id;

--*Display all customers and their order IDs, including customers who haven't placed any orders.
select 
    customers.name ,
    orders.order_id,
    orders.amount
FROM customers LEFT JOIN orders 
ON customers.customer_id = orders.customer_id;

--*Find customers who have never placed an order.
SELECT 
    customers.name ,
    orders.order_id,
    orders.amount
FROM customers LEFT JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE order_id is NULL;


--*Display all orders and the corresponding customer names, including orders whose customer ID doesn't exist in the customers table.
SELECT 
    customers.name ,
    orders.order_id,
    orders.amount
FROM customers RIGHT JOIN orders 
ON customers.customer_id = orders.customer_id;


--*Display each customer's name and total spending.
SELECT 
    customers.name,
    SUM(orders.amount) AS total_spending
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY orders.customer_id;


--*Using the employees, departments and salaries tables, display:
-- - Employee name
-- - Department name
-- - Salary
SELECT 
    e.name ,
    d.name,
    s.salary
FROM employees e 
INNER JOIN department d ON e.department_id = d.department_id
INNER JOIN salaries s ON e.employee_id = s.employee_id;

--*Using the employee table, display each employee's name and their manager's name.
SELECT 
    e.name AS employee,
    m.name AS manager
FROM employees e LEFT JOIN employees m ON e.employee_id = m.employee_id;


--*Find customers who have placed more than one order. Display their names and total order counts.
SELECT
    customers.name ,
    COUNT(orders.order_id) AS total_orders
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id 
HAVING COUNT(orders.order_id) > 1;



 --! Union Assesment
-- *Write a query using UNION to combine online_customers and offline_customers.
SELECT customer_id , customer_name from online 
UNION
SELECT customer_id , customer_name from offline; 
 
-- *Q2. Write the same query using UNION ALL.
SELECT customer_id , customer_name from online 
UNION ALL
SELECT customer_id , customer_name from offline; 

--*company has 2025_sales and 2026_sales tables with identical columns: sale_id, product_id, amount. Combine both datasets without removing duplicate rows.
SELECT sale_id ,product_id , amount from 2025_sales
UNION ALL 
SELECT sale_id , product_id , amount FROM 2026_sales ;