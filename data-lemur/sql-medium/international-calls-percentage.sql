-- How do you join if one column represents two informations (here - caller and receiver). Note the main table needs two primary keys!
/**

            TABLE 1:                                    TABLE 2:                    

|               |                  |                |               |               
| primary key 1 |  primary key 2   |  =========>    | primary key 1 | ========> JOINED TABLE 1, 2
|               |                  |                |               |





**/

WITH call_receive_cte AS (
  SELECT 
    caller.country_id as caller_country,
    receiver.country_id as receiver_country
  FROM phone_calls AS calls
  LEFT JOIN phone_info AS caller
    ON calls.caller_id = caller.caller_id
  LEFT JOIN phone_info AS receiver
    ON calls.receiver_id = receiver.caller_id
)

SELECT
  ROUND(100.0 *
  COUNT(caller_country) FILTER (
    WHERE caller_country != receiver_country
  ) / 
  COUNT(caller_country), 1)
FROM call_receive_cte