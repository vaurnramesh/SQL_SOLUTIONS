SELECT
    EXTRACT(
        MONTH
        FROM
            submit_date
    ) as mth,
    product_id,
    ROUND(AVG(stars), 2) as avg_stars
FROM
    reviews
GROUP BY
    product_id,
    EXTRACT(
        MONTH
        FROM
            submit_date
    )
ORDER BY
    1,
    2