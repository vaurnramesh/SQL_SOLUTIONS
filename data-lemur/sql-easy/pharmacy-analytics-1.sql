SELECT
    drug,
    total_sales - cogs as total_profit
FROM
    pharmacy_sales
ORDER BY
    total_profit DESC
LIMIT
    3;