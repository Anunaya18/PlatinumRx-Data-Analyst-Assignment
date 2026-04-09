-- 4. Most & Least Ordered Items Per Month

WITH item_data AS (
    SELECT 
        MONTH(bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE YEAR(bill_date) = 2021
    GROUP BY MONTH(bill_date), item_id
),

ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS most_rank,
           RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS least_rank
    FROM item_data
)

SELECT month, item_id, total_qty, 'MOST' AS type
FROM ranked WHERE most_rank = 1

UNION ALL

SELECT month, item_id, total_qty, 'LEAST' AS type
FROM ranked WHERE least_rank = 1;
