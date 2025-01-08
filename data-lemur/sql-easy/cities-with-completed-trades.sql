SELECT
    city,
    COUNT(t.user_id) as total_orders
FROM
    trades t
    LEFT JOIN users u ON t.user_id = u.user_id
WHERE
    t.status = 'Completed'
GROUP BY
    city
ORDER BY
    total_orders DESC
LIMIT
    3;