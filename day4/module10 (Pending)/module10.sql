--! common table expresssion
WITH average_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT *
FROM employees
WHERE salary > (
    SELECT avg_sal
    FROM average_salary
);

--! multiple CTE's
WITH department_salary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
department_count AS (
    SELECT department, COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
)
SELECT
    ds.department,
    ds.avg_salary,
    dc.total_employees
FROM department_salary ds
JOIN department_count dc
    ON ds.department = dc.department
WHERE ds.avg_salary > 45000;