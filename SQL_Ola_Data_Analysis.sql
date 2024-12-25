CREATE DATABASE Ola;
USE Ola;

SELECT * FROM Ola.bookingscsv;

#1. Retrieve all Successfull bookings:
SELECT * FROM bookingscsv
WHERE Booking_Status = 'Success';

CREATE VIEW Successfull_bookings AS
SELECT * FROM bookingscsv
WHERE Booking_Status = 'Success';

SELECT * FROM Successfull_bookings;

#2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance 
FROM bookingscsv
GROUP BY Vehicle_Type; 
 
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance 
FROM bookingscsv
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle ;

#3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) 
FROM bookingscsv
WHERE Booking_Status = 'Canceled by Customer';

CREATE VIEW canceled_rides_by_customer AS
SELECT COUNT(*) 
FROM bookingscsv
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customer;

#4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides 
FROM bookingscsv
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

CREATE VIEW Top_5_Customers AS 
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides 
FROM bookingscsv
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM bookingscsv
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

CREATE VIEW Canceled_Rides_by_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM bookingscsv
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Canceled_Rides_by_Drivers_P_C_Issues;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) AS max_Sedan_rating, MIN(Driver_Ratings) AS min_Sedan_rating
FROM bookingscsv
WHERE Vehicle_Type = 'Prime Sedan';

 #7. Retrieve all rides where payment was made using UPI:
SELECT * FROM bookingscsv
WHERE Payment_Method = 'UPI';

CREATE VIEW UPI_Payment AS 
SELECT * FROM bookingscsv
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

#8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookingscsv
GROUP BY Vehicle_Type;

CREATE VIEW Avg_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookingscsv
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_Ride_value 
FROM bookingscsv 
WHERE Booking_Status = 'Success';

CREATE VIEW total_successful_Ride_value AS
SELECT SUM(Booking_Value) as total_successful_Ride_value 
FROM bookingscsv 
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_Ride_value;

#10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookingscsv 
WHERE Incomplete_Rides = 'Yes';

CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookingscsv
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;


