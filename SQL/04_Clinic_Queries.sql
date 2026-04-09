-- 1 Revenue by channel
SELECT sales_channel, SUM(amount)
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY sales_channel;

-- 2 Top 10 customers
SELECT uid, SUM(amount) total
FROM clinic_sales
GROUP BY uid
ORDER BY total DESC
LIMIT 10;

-- 3 Monthly profit
SELECT MONTH(cs.datetime) m,
SUM(cs.amount) revenue,
SUM(e.amount) expense,
SUM(cs.amount)-SUM(e.amount) profit
FROM clinic_sales cs
LEFT JOIN expenses e ON cs.cid=e.cid
GROUP BY m;
