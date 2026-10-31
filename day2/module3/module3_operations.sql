use ecommerce;

--*Total orders
SELECT COUNT(*) FROM orders;

SELECT COUNT(customer_id) FROM orders; --Does not count NULL values

--*Total value of all orders 
SELECT SUM(amount) FROM orders;

--*total amount of completed orders
SELECT SUM(amount) FROM orders WHERE status = "Completed";

--*avg order value
SELECT AVG(amount) FROM orders;
--avg of completed orders 
SELECT AVG(amount) FROM orders WHERE status = "Completed";


--*min and max 
SELECT MIN(amount) AS minimum , MAX(amount) AS maxiumum FROM orders ;


-- Total transactions.
-- Total revenue.
-- Average transaction value.
-- Maximum transaction value.
SELECT 
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    AVG(amount) AS avg_transaction,
    MAX(amount) AS max_value
FROM orders 