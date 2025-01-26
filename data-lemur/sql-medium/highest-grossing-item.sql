WITH rowNum_cte AS (
  SELECT 
    category,
    product,
    SUM(spend) as total_spend,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) as row_num
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
  GROUP BY category, product
)

SELECT 
  category,
  product,
  total_spend
FROM rowNum_cte
WHERE row_num < 3
ORDER BY category, row_num