-- A new concept MIN, MAX, type casting and a DATE_PART function
-- We are required to use DATE_PART as the column post_date is of type 'timestamp'

SELECT
  user_id,
  MAX(post_date::date) - MIN(post_date::date) AS days_between
FROM posts  
WHERE DATE_PART('year', post_date::date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) > 1;