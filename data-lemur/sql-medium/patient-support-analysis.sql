WITH null_cte AS (
  SELECT COUNT(*) AS null_counts
  FROM callers
  WHERE call_category IS NULL
    OR call_category = 'n/a'
)

SELECT 
  ROUND(100.0 * (null_counts::decimal / COUNT(callers.case_id)), 1) -- Using decimal is important to ensure floating point division
FROM callers
CROSS JOIN null_cte
GROUP BY null_counts

-- METHOD2: Using cross join is convinient but we can also use subqueries

SELECT
  ROUND(100.0 * null_counts / (SELECT COUNT(*) FROM callers), 1) AS uncategorised_call_pct
FROM null_cte