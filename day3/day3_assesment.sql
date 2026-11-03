--* Calculate total, average, minimum and maximum order amount
SELECT 
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount
FROM order;


--* Find the total revenue per customer
SELECT 
    customer_id,
    SUM(amount) AS total_revenue
FROM orders GROUP BY customer_id ;

--* city with more than 2 orders and avg order value > 900
SELECT 
    city,
    COUNT(*) AS total_orders,
    AVG(amount) AS avg_order_value
from orders 
GROUP BY city HAVING COUNT(*) > 2 AND AVG(amount) > 900;

--* 1. Find Completed revenue for every city using conditional aggregation. (5)
SELECT
    city,
    SUM(CASE
        WHEN status = 'Completed' THEN amount
        ELSE 0
    END) AS completed_revenue

FROM orders
GROUP BY city;


-- *Display all customers and their order IDs, including customers without orders.
SELECT 
    customers.name,
    customers.customer_id,
    orders.order_id
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id ;


-- *Find customers who have never placed an order.
SELECT 
    customers.name,
    customers.customer_id,
    orders.order_id
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id 
WHERE orders.order_id is NULL;


--* Find orders whose customer ID doesn't exist in the customers table.
SELECT 
    orders.customer_id,
    orders.order_id
FROM customers RIGHT JOIN orders ON customers.customer_id = orders.customer_id 
WHERE customers.customer_id IS NULL;


--* Display employee name, department name and salary using a JOIN.
SELECT 
    e.name ,
    d.name,
    s.salary
FROM employees e 
INNER JOIN department d ON e.department_id = d.department_id
INNER JOIN salaries s ON e.employee_id = s.employee_id;


--* Display every employee with their manager's name using a SELF JOIN.
SELECT 
    e.name AS employee,
    m.name AS manager
FROM employees e LEFT JOIN employees m ON e.employee_id = m.employee_id;