SELECT * FROM hotel.hotel_reservations;









-- 1.What is the total number of reservations in the dataset?
SELECT COUNT(*) AS total_reservations
FROM hotel_reservations;









-- 2.Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY type_of_meal_plan
ORDER BY total_reservations DESC
LIMIT 1;

-- 3.What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS avg_price_for_children
FROM hotel_reservations
WHERE no_of_children > 0;

-- 4.How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS reservations_in_2018
FROM hotel_reservations
WHERE YEAR(arrival_date) = 2018;

-- 5.What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY room_type_reserved
ORDER BY total_reservations DESC
LIMIT 1;

-- 6.How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS weekend_reservations
FROM hotel_reservations
WHERE no_of_weekend_nights > 0;

-- 7.What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS highest_lead_time,
       MIN(lead_time) AS lowest_lead_time
FROM hotel_reservations;

-- 8.What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY total_reservations DESC
LIMIT 1;

-- 9.How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS confirmed_reservations
FROM hotel_reservations
WHERE booking_status = 'Not_Canceled';

-- 10.What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS total_adults,
       SUM(no_of_children) AS total_children
FROM hotel_reservations;


-- 11.What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_for_children
FROM hotel_reservations
WHERE no_of_children > 0;

-- 12.How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS month,
       COUNT(*) AS reservations_per_month
FROM hotel_reservations
GROUP BY month
ORDER BY month;


-- 13.What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved,
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights_per_room_type
FROM hotel_reservations
GROUP BY room_type_reserved;



-- 14.For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved,
       COUNT(*) AS total_reservations,
       AVG(avg_price_per_room) AS avg_price_for_room_type
FROM hotel_reservations
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY total_reservations DESC
LIMIT 1;



-- 15.Find the market segment type that generates the highest average price per room.
SELECT market_segment_type,
       AVG(avg_price_per_room) AS avg_price_per_room
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC
LIMIT 1;