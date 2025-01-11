-- Converting from int to decimal is essential to round

WITH sum_cte as (SELECT 
  SUM(order_occurrences::DECIMAL * item_count::DECIMAL) as total_items,
  SUM(order_occurrences::DECIMAL) as total_orders
FROM items_per_order)

SELECT ROUND(total_items/total_orders, 1) FROM sum_cte