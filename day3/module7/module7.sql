--! Inner joins returns only records that have matching values in both tables.
SELECT
    customers.name,
    orders.order_id,
    orders.amount
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id;


--!LEFT JOIN preserves every row from the left table.

SELECT 
    customers.name,
    orders.order_id,
    orders.amount
FROM customers 
LEFT JOIN orders 
 ON customers.customer_id = orders.customer_id;


--!RIGHT JOIN preserves every record from the right tables
SELECT
    customers.name,
    orders.order_id,
    orders.amount
FROM customers
RIGHT JOIN orders
    ON customers.customer_id = orders.customer_id;


--! CROSS JOIN returns every possible combination of rows from two tables.
SELECT
    SELECT
    products.product,
    payments.payment_method
FROM products
CROSS JOIN payments;

--!A SELF JOIN means joining a table with itself.
SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;

--! join 3 tables
SELECT
    e.name,
    d.department_name,
    s.salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
INNER JOIN salaries s
    ON e.employee_id = s.employee_id;


--!Union and Union ALL
SELECT customer_id, name, city
FROM online_customers

UNION

SELECT customer_id, name, city
FROM offline_customers;

SELECT customer_id, name, city
FROM online_customers

UNION ALL

SELECT customer_id, name, city
FROM offline_customers;

--!Order by along with union
SELECT customer_id, name
FROM online_customers

UNION ALL

SELECT customer_id, name
FROM offline_customers

ORDER BY name; --group records by name 

