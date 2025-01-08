-- A good example of self inner join
WITH
    employee_manager_cte AS (
        SELECT
            mgr.employee_id,
            mgr.name as employee_name,
            mgr.salary,
            emp.manager_id,
            emp.name as manager_name,
            emp.salary as manager_salary
        FROM
            employee as mgr
            INNER JOIN employee AS emp ON emp.employee_id = mgr.manager_id
    )
SELECT
    employee_id,
    employee_name
FROM
    employee_manager_cte
WHERE
    salary > manager_salary