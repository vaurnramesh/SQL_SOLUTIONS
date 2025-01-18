WITH
    max_salary_cte as (
        SELECT
            MAX(salary) as highest_salary
        FROM
            employee
    )
SELECT
    MAX(salary) as second_highest_salary
FROM
    employee
WHERE
    salary < (
        SELECT
            highest_salary
        FROM
            max_salary_cte
    );