-- Teaches you how to use two CTE's
-- String functions like to_char
-- And how to join based on multiple conditions


WITH highest_prices_cte AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
    MAX(open) AS highest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) as row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
),

lowest_prices_cte AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
    MIN(open) AS lowest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open ASC) as row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
)

SELECT
  h.ticker,
  h.highest_mth,
  h.highest_open,
  l.lowest_mth,
  l.lowest_open
FROM highest_prices_cte AS h
INNER JOIN lowest_prices_cte AS l
  ON h.ticker = l.ticker
  AND h.row_num = 1
  AND l.row_num = 1
ORDER BY h.ticker  
