-- A great use of the sum function to aggregate fields. 
-- Basically, it compressed the data even further, using just `total_sales - cogs` didn't give us the full picture
SELECT
    manufacturer,
    COUNT(drug),
    ABS(SUM(total_sales - cogs)) as total_loss
FROM
    pharmacy_sales
WHERE
    total_sales - cogs <= 0
GROUP BY
    manufacturer
ORDER BY
    total_loss DESC;