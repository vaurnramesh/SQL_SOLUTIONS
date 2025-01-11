SELECT DISTINCT
    (card_name),
    MAX(issued_amount) - MIN(issued_amount)
FROM
    monthly_cards_issued
GROUP BY
    card_name;