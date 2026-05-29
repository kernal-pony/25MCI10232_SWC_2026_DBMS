WITH cte AS
(
    SELECT
        user_id,
        created_at,
        LEAD(created_at)
        OVER
        (
            PARTITION BY user_id
            ORDER BY created_at
        ) AS next_purchase,
        ROW_NUMBER()
        OVER
        (
            PARTITION BY user_id
            ORDER BY created_at
        ) AS rn
    FROM amazon_transactions
)

SELECT user_id
FROM cte
WHERE rn = 1
  AND next_purchase - created_at
      BETWEEN 1 AND 7;
