
--* Find cities where the total revenue is greater than ₹2,000.
SELECT  city , SUM(amount) AS total_revenue FROM orders GROUP BY city HAVING SUM(amount) > 2000;

--* Find customers who have placed more than one order.
SELECT customer_id , COUNT(*) AS total_orders FROM orders GROUP BY customer_id HAVING COUNT(*) > 1

--* Find order statuses having at least two orders.
SELECT status , COUNT(*) AS total_orders FROM orders GROUP BY status HAVING COUNT(*) > 2;

--* cities where the average order amount is greater than ₹900 and the total number of orders is greater than 2.
SELECT city, AVG(amount) AS avg_amount , COUNT(*) AS total_orders FROM orders GROUP BY city HAVING AVG(amount) > 900 AND count(*) > 2;


--* customers whose total spending exceeds ₹1,000 and whose order count is at least 1.
SELECT customer_id , SUM(amount) AS total_spending , COUNT(*) AS total_orders FROM orders GROUP BY customer_id HAVING SUM(amount) > 1000 AND COUNT(*) >= 1;
 

--*total revenue from Completed orders for each city, but display only cities whose Completed revenue exceeds ₹1,000.
SELECT city , SUM(amount) AS total_revenue FROM orders WHERE status = 'Completed' GROUP BY city HAVING SUM(amount) > 1000;

--* report of cities that have generated more than ₹2,000 in revenue. Show city, number of orders, total revenue and average order value.
SELECT city , COUNT(*) AS total_orders , SUM(amount) AS total_revenue , AVG(amount) AS avg_order_value FROM orders GROUP BY city HAVING SUM(amount) > 2000;

--* customers who have placed at least two orders and spent more than ₹1,000.
SELECT customer_id ,COUNT(*) AS total_orders , SUM(amount) AS total_spent FROM orders GROUP BY customer_id HAVING COUNT(*) >= 2 AND SUM(amount) > 1000;