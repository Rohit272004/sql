
--** how many orders each city received for each status
SELECT 
    city,
    status,
    COUNT(*) AS total_orders
FROM orders 
GROUP BY city,status ;


--** WHERE filters individual rows before grouping. GROUP BY forms groups from the remaining rows.
--! total revenue per city, but only consider Completed orders
SELECT 
    city,
    SUM(amount) AS total_revenue
FROM orders
WHERE status = "Completed"
GROUP BY city; 


--* Total orders
--* Total revenue
--* Average order value
--* Number of completed orders
SELECT 
    count(*) AS total_orders,
    SUM(amount) AS revenue,
    AVG(amount) AS avg_value,
    (SELECT COUNT(*) FROM orders WHERE status = "Completed") AS completed_orders
FROM orders;