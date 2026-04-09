-- 1. Last booked room
SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) t
ON b.user_id = t.user_id AND b.booking_date = t.last_booking;

-- 2. Billing in Nov 2021
SELECT bc.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date)=11 AND YEAR(bc.bill_date)=2021
GROUP BY bc.booking_id;

-- 3. Bills >1000
SELECT bc.bill_id,
SUM(bc.item_quantity * i.item_rate) AS amount
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
WHERE MONTH(bc.bill_date)=10 AND YEAR(bc.bill_date)=2021
GROUP BY bc.bill_id
HAVING amount > 1000;

-- 4. Most & least ordered items
WITH data AS (
SELECT MONTH(bill_date) m, item_id,
SUM(item_quantity) qty
FROM booking_commercials
WHERE YEAR(bill_date)=2021
GROUP BY m,item_id
)
SELECT * FROM data;

-- 5. 2nd highest bill
WITH t AS (
SELECT MONTH(bc.bill_date) m, b.user_id,
SUM(bc.item_quantity*i.item_rate) total
FROM booking_commercials bc
JOIN bookings b ON bc.booking_id=b.booking_id
JOIN items i ON bc.item_id=i.item_id
GROUP BY m,b.user_id
)
SELECT * FROM t;
