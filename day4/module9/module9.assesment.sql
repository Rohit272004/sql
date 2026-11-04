--* Q1. Find employees earning more than the company's average salary.
SELECT * FROM employees WHERE salary > (
    SELECT AVG(salary) FROM employees
);

--* Q2. Find employees receiving the highest salary in the company.
SELECT * FROM employees WHERE salary = (
    SELECT MAX(salary) FROM employees 
);

--* Q3. Find employees working in departments where at least one employee earns more than ₹60,000.
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE e.department_id IN (
    SELECT e2.department_id
    FROM employees e2
    INNER JOIN salaries s
        ON e2.employee_id = s.employee_id
    WHERE s.salary > 60000
);

--* Q4. Find employees earning less than the minimum salary of the IT department.
SELECT * FROM employees WHERE salary < (
    SELECT MIN(salary) FROM employees WHERE department = 'IT'
)

--* Q5. Display employee names, salaries and the company's average salary in the same result.
SELECT name , salary ,
    (SELECT AVG(salary) from employees) AS company_avg_salary
FROM employees ;

--* Q6. Interview challenge: Find the second-highest distinct salary using a subquery
SELECT MAX(salary) FROM employees WHERE salary < (SELECT max(salary) FROM employees);


--* Q7 Find employees earning more than the average salary of their own department.
SELECT * FROM employees e WHERE salary > (
    SELECT AVG(salary) FROM employees s WHERE e.department = s.department
);
