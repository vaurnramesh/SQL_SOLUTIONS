-- Using CTF --

WITH total_tweets_cte as (
  SELECT user_id, COUNT(tweet_id) as tweet_count_per_user
  FROM tweets
  WHERE EXTRACT (YEAR FROM tweet_date)='2022'
  GROUP BY user_id)

SELECT tweet_count_per_user as tweet_bucket, COUNT(user_id) as users_num
FROM total_tweets_cte
GROUP BY tweet_count_per_user

/** OUTPUT
tweet_bucket	users_num
1	2
2	1
**/
