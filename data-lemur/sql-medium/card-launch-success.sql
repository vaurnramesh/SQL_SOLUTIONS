-- How to create a new column using window functions? This is beyond just using ranks! 

WITH card_launch AS (
  SELECT
    card_name,
    issued_amount,
    concat('1/', issue_month, '/', issue_year)::date as issue_date,
    MIN(concat('1/', issue_month, '/', issue_year)::date) OVER (
      PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)

SELECT 
  card_name, 
  issued_amount
FROM card_launch
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;