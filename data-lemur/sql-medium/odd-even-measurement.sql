-- Very nice problem as it combines most things you've learnt so far! 
-- Casting, CTE, Windowfunctions, Filter and basic math :)

WITH rowNum_cte AS (
  SELECT
    (measurement_time::date) as measurement_day,
    measurement_value,
    ROW_NUMBER() OVER (PARTITION BY (measurement_time::date) ORDER BY measurement_time) as row_num,
    measurement_time
  FROM measurements
)

-- Generally Case When is not recommended solely because of query performance

-- SELECT
--   measurement_day,
--   SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum,
--   SUM(CASE WHEN row_num % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum
-- FROM rowNum_cte
-- GROUP BY measurement_day


SELECT
  measurement_day,
  SUM(measurement_value) FILTER(WHERE row_num % 2 = 0) as even_sum,
  SUM(measurement_value) FILTER(WHERE row_num % 2 != 0) as odd_sum
FROM rowNum_cte
GROUP BY measurement_day