--! Conditional Aggregation using CASE

SELECT
    order_id,
    amount,
    CASE
        WHEN amount > 1000 THEN 'High Value'
        ELSE 'Normal Value'
    END AS order_category
FROM orders;

--! Completed, Pending and Cancelled order counts in one row.
SELECT
    SUM(CASE
            WHEN status = 'Completed' THEN 1 --we can you amount value instead of 1 to calculate total completed amount
            ELSE 0
        END) AS completed_orders,

    SUM(CASE
        WHEN status = 'Pending' THEN 1
        ELSE 0
    END) AS pending_orders,

    SUM(CASE
        WHEN status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_orders

FROM orders;



--!
SELECT
    payment_date,

    COUNT(*) AS total_transactions,

    SUM(CASE
        WHEN status = 'Success' THEN 1
        ELSE 0
    END) AS successful_transactions,

    SUM(CASE
        WHEN status = 'Failed' THEN 1
        ELSE 0
    END) AS failed_transactions,

    SUM(CASE
        WHEN status = 'Success' THEN amount
        ELSE 0
    END) AS successful_amount,

    SUM(CASE
        WHEN status = 'Failed' THEN amount
        ELSE 0
    END) AS failed_amount

FROM payments
GROUP BY payment_date;