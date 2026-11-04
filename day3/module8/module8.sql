--? uppercase and lowercase 
SELECT UPPER(name) FROM customers;
SELECT LOWER(name) FROM customers;

--? Concat
alter TABLE customers ADD COLUMN last_name VARCHAR(100);
UPDATE customers SET last_name = 'SAHU';
SELECT CONCAT(name,' ', last_name) AS full_name FROM customers;
SELECT CONCAT(name, ' ', customer_id) AS username FROM customers;


--? LENGTH() returns bytes. CHAR_LENGTH() returns the number of characters.
SELECT
    LENGTH(name),
    CHAR_LENGTH(name)
FROM customers;


--? TRIM
SELECT TRIM(name) FROM customers;
SELECT LTRIM(name) FROM customers;
SELECT RTRIM(name) FROM customers;

--? Replace
SELECT REPLACE(phone_number, '-', '')
FROM customers;

--? reverse
SELECT REVERSE(name) FROM customers;

--? rounds a number to a specified number of decimal places
SELECT city,
    ROUND(AVG(amount), 2) AS average_amount FROM orders
GROUP BY city;

--? ceil and floor
SELECT CEIL(10.2); SELECT floor(10.2);

--? abs and mod 
SELECT ABS(-500); SELECT MOD(10, 3);

--! handlin null values
--? coalesce
SELECT
    name,
    salary,
    COALESCE(bonus, 0) AS bonus --COALESCE(city, 'Unknown') AS clean_city
FROM employees;

--! date functions
SELECT CURDATE() ; SELECT NOW();

-- Extract individual components from a date. YEAR() MONTH() DAY()