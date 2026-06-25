select sender_id,
      count(*) as message_count
from messages
WHERE 
    EXTRACT(MONTH FROM sent_date) = 8 
    AND EXTRACT(YEAR FROM sent_date) = 2022
group by sender_id
order by message_count desc
Limit 2
