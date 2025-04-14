# create database Ola;

use ola;


#  1. Retrieve all successful bookings:
select * from booking where Booking_Status = "Success";

#  2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) as Avg_Distance 
from booking group by vehicle_Type ;

select * from ride_distance_for_each_vehicle;


#  3. Get the total number of cancelled rides by customers:
create view cancelled_by_customer as 
SELECT COUNT(*) FROM booking
WHERE Booking_Status = 'Canceled by Driver';

select * from cancelled_by_customer;


#  4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
select Customer_ID,count(Booking_ID) as total_ride
from booking group by Customer_ID 
order by total_ride desc limit 5;

select * from top_5_customers;


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_P_I as 
select count(*) as cancel_p from booking where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from cancelled_by_P_I;



# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating_P_S as 
select max(Driver_Ratings) as MAX_D , min(Driver_Ratings) as MIN_D 
from booking where Vehicle_Type = 'Prime Sedan';


# 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as 
select * from booking where Payment_Method = "UPI";


# 8. Find the average customer rating per vehicle type:
create view AVG_Cust_Rating as
select Vehicle_Type,avg(Customer_Rating)  from booking group by Vehicle_Type;

 
# 9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
select sum(Booking_Value) as Total_Success_A from booking where Booking_Status  ='Success';
 
#  10. List all incomplete rides along with the reason:
 Create View Incomplete_Rides as
SELECT Booking_ID, Incomplete_Rides_Reason FROM booking WHERE Incomplete_Rides =
'Yes';