select EXTRACT(month from submit_date)as mth,
       product_id as product,
        ROUND(AVG(stars), 2) AS avg_stars
from reviews

group by mth,product_id
order by mth, product_id
