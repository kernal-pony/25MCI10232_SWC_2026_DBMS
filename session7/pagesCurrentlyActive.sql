SELECT SUM(CASE WHEN status = 'active' THEN 1 ELSE 0 END) 
FROM (
    SELECT page_id, status, 
           ROW_NUMBER() OVER (PARTITION BY page_id ORDER BY changed_at DESC) as rn
    FROM page_status_log
) AS ranked_logs
WHERE rn = 1;
