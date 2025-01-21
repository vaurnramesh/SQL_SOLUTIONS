-- Case when and then using a Column. A great example! 
WITH
    send_open_cte AS (
        SELECT
            act.user_id,
            SUM(
                CASE
                    WHEN activity_type = 'send' THEN time_spent
                    ELSE 0
                END
            ) AS send,
            SUM(
                CASE
                    WHEN activity_type = 'open' THEN time_spent
                    ELSE 0
                END
            ) AS open,
            age.age_bucket
        FROM
            activities AS act
            INNER JOIN age_breakdown AS age ON act.user_id = age.user_id
        GROUP BY
            act.user_id,
            age.age_bucket
    )
SELECT
    age_bucket,
    ROUND((100.0 * send) / (send + open), 2) as send_perc,
    ROUND((100.0 * open) / (send + open), 2) as open_perc
FROM
    send_open_cte
ORDER BY
    age_bucket ASC;