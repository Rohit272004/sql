START TRANSACTION;

UPDATE customers
SET city = 'Pune'
WHERE customer_id = 3;

SELECT customer_id, name, city
FROM customers
WHERE customer_id = 3;

-- If correct:
COMMIT;

-- If incorrect, use ROLLBACK instead of COMMIT.
-- ROLLBACK;




--savepoint 
START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT first_update;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

ROLLBACK TO SAVEPOINT first_update;

COMMIT;