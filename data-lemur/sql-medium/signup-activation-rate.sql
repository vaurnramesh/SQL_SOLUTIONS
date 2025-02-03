SELECT
  ROUND(
    SUM(CASE WHEN signup_action = 'Confirmed' THEN 1.0 ELSE 0 END) / 
    COUNT(text_id), 2) 
  AS activation_rate
FROM emails e 
LEFT JOIN texts t ON e.email_id = t.email_idva