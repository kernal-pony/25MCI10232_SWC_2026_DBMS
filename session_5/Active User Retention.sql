
SELECT
    7 AS month,
    COUNT(DISTINCT curr_month.user_id) AS monthly_active_users
FROM user_actions curr_month
WHERE EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
  AND EXISTS (
        SELECT 1
        FROM user_actions last_month
        WHERE last_month.user_id = curr_month.user_id
          AND EXTRACT(MONTH FROM last_month.event_date) = 6
          AND EXTRACT(YEAR FROM last_month.event_date) = 2022
  );
