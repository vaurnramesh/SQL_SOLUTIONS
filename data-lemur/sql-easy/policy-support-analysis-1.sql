WITH
    caller_count AS (
        SELECT
            policy_holder_id,
            COUNT(case_id)
        FROM
            callers
        GROUP BY
            policy_holder_id
    )
SELECT
    COUNT(policy_holder_id) AS policy_holder_count
FROM
    caller_count
WHERE
    count > 2