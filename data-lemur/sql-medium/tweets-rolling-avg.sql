-- A rolling average problem
/** 
To find a cumulative average for all the days we are required to use window function

day    counter
1      2
2      4
3      1
4      5 

Using a window function for average gives 
day    cum_avg
1      2
2      4 + 2 / 2 = 3
3      1 + 4 + 2 / 3 = 2.66
4      1 + 4 + 2 + 5 / 4 = 3 

Now if we want to a find a rolling average for 2 days - `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`

day    cum_avg_2
1      2 / 1 = 2
2      4 + 2 / 2 = 3
3      1 + 3 / 2 = 2
4      1 + 2 / 2 = 1.5
 **/
SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY
                user_id
            ORDER BY
                tweet_date ROWS BETWEEN 2 PRECEDING
                AND CURRENT ROW
        ),
        2
    ) as rolling_avg_3d
FROM
    tweets;