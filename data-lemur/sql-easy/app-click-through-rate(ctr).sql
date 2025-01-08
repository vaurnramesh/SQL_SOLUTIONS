-- Great example of case when and then in the SELECT statement
SELECT
    app_id,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN event_type = 'click' THEN 1
                ELSE 0
            END
        ) / SUM(
            CASE
                WHEN event_type = 'impression' THEN 1
                ELSE 0
            END
        ),
        2
    ) as ctr
FROM
    events
GROUP BY
    app_id;

-- An alternate way: Using an aggregate function when we use FILTER & EXTRACT function
SELECT
    app_id,
    ROUND(
        100.0 * SUM(1) FILTER (
            WHERE
                event_type = 'click'
        ) / SUM(1) FILTER (
            WHERE
                event_type = 'impression'
        ),
        2
    ) as ctr
FROM
    events
WHERE
    EXTRACT(
        YEAR
        FROM
            timestamp
    ) = '2022'
GROUP BY
    app_id;