-- To get a count of unique values use COUNT(DISTINCT)! 

WITH rank_cte AS (
  SELECT  
    c.customer_id, 
    COUNT(DISTINCT p.product_category) as distinct_count
  FROM customer_contracts c
  LEFT JOIN products p ON c.product_id = p.product_id
  GROUP BY c.customer_id
)

SELECT 
  customer_id
FROM rank_cte
WHERE distinct_count = 3