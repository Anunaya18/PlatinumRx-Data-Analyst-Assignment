SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) latest
ON b.user_id = latest.user_id 
AND b.booking_date = latest.last_booking;
