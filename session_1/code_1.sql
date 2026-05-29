SELECT
    a.date,
    SUM(
        CASE
            WHEN b.action = 'accepted' THEN 1
            ELSE 0
        END
    ) * 1.0
    /
    SUM(
        CASE
            WHEN a.action = 'sent' THEN 1
            ELSE 0
        END
    ) AS acceptance_rate
FROM fb_friend_requests a
LEFT JOIN fb_friend_requests b
ON a.user_id_sender = b.user_id_sender
AND a.user_id_receiver = b.user_id_receiver
AND b.action = 'accepted'
WHERE a.action = 'sent'
GROUP BY a.date
HAVING SUM(
        CASE
            WHEN b.action = 'accepted' THEN 1
            ELSE 0
        END
      ) > 0;
