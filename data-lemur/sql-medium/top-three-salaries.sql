/** 

A great example of `DENSE_RANK()` 

dense rank works just like the ROW_NUM() function but it does not create gaps if there are DUPLICATES found! 

NOTE: It's ideal to create a dense rank with just ONE order by as it can't handle more than 1 column! For example, the question had 
sorting based on first the department name, salary and employee name alphabetically. In the ORDER BY of the WINDOW function it's better
to just sort the rank of the column that we want. 

**/

WITH ranked_salary AS (
  SELECT 
    d.department_name, 
    name, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department_name ORDER BY salary DESC) as ranking
  FROM employee e
    LEFT JOIN department d ON e.department_id = d.department_id
)


SELECT 
  department_name,
  name,
  salary
FROM ranked_salary
WHERE ranking <= 3
ORDER BY department_name ASC, salary DESC, name ASC;

