-- SQL sorts by status first. 
-- If two rows have the same status, it uses amount to determine their relative order.
SELECT order_id, status, amount FROM orders
ORDER BY status ASC, amount DESC;

-- displays five orders per page.
SELECT order_id, amount FROM orders
ORDER BY order_id
LIMIT 5 OFFSET 5;

SELECT DISTINCT city FROM customers;
SELECT DISTINCT city, age FROM customers; --returns unique city-and-age combinations
