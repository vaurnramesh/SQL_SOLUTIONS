-- How to find continuous days actvity for a user? 
-- You typically use a self-join to query hierarchical data or to compare rows within the same table
-- The date function `DATE(timestamp)` gives us the date to compare between each other
-- Here we are required to find the transaction_date 2 days continuously after the first transaction. 

SELECT 
    DISTINCT(t1.user_id)
FROM transactions t1
INNER JOIN transactions t2
    ON DATE(t2.transaction_date) = DATE(t1.transaction_date) + 1 -- We first compare users that have day + 1 using a self join
INNER JOIN transactions t3
    ON DATE(t3.transaction_date) = DATE(t1.transaction_date) + 2 -- Then compare users that have transaction day + 2 to find continuity! 
ORDER BY t1.user_id ASC


