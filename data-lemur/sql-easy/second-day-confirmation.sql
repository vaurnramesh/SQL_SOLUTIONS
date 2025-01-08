SELECT DISTINCT
    user_id
FROM
    emails e
    LEFT JOIN texts t ON e.email_id = t.email_id
WHERE
    EXTRACT(
        DAY
        FROM
            signup_date
    ) = EXTRACT(
        DAY
        FROM
            action_date
    ) - 1
    AND t.signup_action = 'Confirmed';