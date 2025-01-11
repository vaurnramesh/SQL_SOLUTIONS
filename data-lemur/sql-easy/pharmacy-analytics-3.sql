-- A great use of concat
-- If you're ordering by an aggregate, aggregate in the ORDER BY too! 
SELECT
    manufacturer,
    CONCAT (
        '$',
        ROUND(SUM(total_sales / 1000000), 0),
        ' million'
    ) as sales_mil
FROM
    pharmacy_sales
GROUP BY
    manufacturer
ORDER BY
    SUM(total_sales) DESC;

------------------------------------------------------    
-- Solution2 using CTE and a manual concat! **/
WITH
    drug_sales AS (
        SELECT
            manufacturer,
            SUM(total_sales) as sales
        FROM
            pharmacy_sales
        GROUP BY
            manufacturer
    )
SELECT
    manufacturer,
    ('$' || ROUND(sales / 1000000) || ' million') AS sales_mil
FROM
    drug_sales
ORDER BY
    sales DESC,
    manufacturer;