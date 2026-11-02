
--* Display the total number of Completed, Pending and Cancelled orders in a single row.
SELECT city ,COUNT(*)AS total_orders FROM orders GROUP BY city ; --! not in a single row

SELECT 
    SUM(CASE 
        WHEN city = 'Mumbai' THEN 1  
        ELSE 0
    END) AS mumbai ,
    SUM(CASE 
        WHEN city = 'Delhi' THEN 1  
        ELSE  0
    END) AS delhi ,
    SUM(CASE 
        WHEN city = 'Pune' THEN 1   
        ELSE  0
    END) AS pune 
FROM orders



--* Display the following for every city:
-- *- Total orders
-- *- Completed orders
-- *- Pending orders
-- *- Cancelled orders

SELECT 
    city ,
    count(*) AS total_orders,
    SUM(CASE 
        WHEN status = 'Completed' THEN 1
        ELSE  0
    END) AS completed_orders ,
    SUM(CASE 
        WHEN status = 'Pending' THEN 1
        ELSE  0
    END) AS pending_orders ,
    SUM(CASE 
        WHEN status = 'Cancelled' THEN 1
        ELSE  0
    END) AS cancelled_orders 
FROM orders
GROUP BY city;


-- *Display the following for every city:
-- *- Completed revenue
-- *- Pending revenue
-- *- Cancelled revenue

SELECT 
    city ,
    count(*) AS total_orders,
    SUM(CASE 
        WHEN status = 'Completed' THEN amount
        ELSE  0
    END) AS completed_revenue ,
    SUM(CASE 
        WHEN status = 'Pending' THEN amount
        ELSE  0
    END) AS pending_revenue,
    SUM(CASE 
        WHEN status = 'Cancelled' THEN amount
        ELSE  0
    END) AS cancelled_revenue
FROM orders
GROUP BY city;



--* Create one city-wise report containing:
--* - Total orders
--* - Completed orders
--* - Total revenue
--* - Completed revenue
--*- Average order amount

SELECT
    city ,
    COUNT(*) AS total_orders,

    SUM(CASE 
        WHEN status = 'Completed' THEN 1  
        ELSE  0 
    END) AS completed_orders,

    SUM(amount) AS total_revenue,

    SUM(CASE 
        WHEN status = 'Completed' THEN amount
        ELSE  0
    END) AS completed_revenue,

    AVG(amount) AS avg_amount
from orders
GROUP BY city;


--* A company wants to identify cities where:
--* - Completed revenue exceeds ₹1,000.
--* - There are at least two Completed orders.

SELECT 
    city ,
    COUNT(*) AS completed_orders,
    SUM(amount) completed_revenue
from orders
WHERE status = 'Completed'
GROUP BY city
HAVING SUM(amount) > 1000 AND COUNT(*) >= 2;


--different approach using case when
SELECT
    city,

    SUM(CASE
        WHEN status = 'Completed' THEN 1
        ELSE 0
    END) AS completed_orders,

    SUM(CASE
        WHEN status = 'Completed' THEN amount
        ELSE 0
    END) AS completed_revenue

FROM orders
GROUP BY city

HAVING
    SUM(CASE
        WHEN status = 'Completed' THEN amount
        ELSE 0
    END) > 1000

    AND

    SUM(CASE
        WHEN status = 'Completed' THEN 1
        ELSE 0
    END) >= 2;