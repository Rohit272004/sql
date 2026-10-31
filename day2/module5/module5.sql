
-- !WHERE: Select employees who work in the IT department.
-- !GROUP BY: Group those employees by department.
-- !HAVING: Keep departments with more than 10 employees.


--* customers whose total spending is greater than ₹1,000.
SELECT
    customer_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

-- !cities where Only Completed orders are considered. Total Completed revenue must exceed ₹1,000.

SELECT 
    city ,
    SUM(amount) AS total_revenue 
FROM orders WHERE status = 'Completed'
GROUP BY city 
HAVING SUM(amount) > 1000;