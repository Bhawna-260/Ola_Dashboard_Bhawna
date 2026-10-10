use ola;

select *
from Bookings;

#1. Retrieve all successful bookings:
create view Successful_bookings as 
select *
from bookings
where Booking_Status="Success";
select *
from Successful_bookings;

#2. Find the average ride distance for each vehicle type:
create view Ride_Distance_For_Each_Vehicle As
select Vehicle_Type , avg(Ride_Distance) as Avg_distance
from bookings
group by Vehicle_type;

Select *
from Ride_Distance_For_Each_Vehicle;

#3. Get the total number of cancelled rides by customers:
create view Cancelled_Rides_By_Customers As 
select count(*) 
from Bookings
where Booking_Status="Canceled by Customer";

Select *
from Cancelled_Rides_By_Customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as
Select Customer_ID , count(Booking_ID) as Count_bookings
from bookings
group by Customer_ID
order by Count_bookings desc limit 5;

select *
from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_due_to_personal_and_car_issues As
Select count(*)
from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";
select * from cancelled_due_to_personal_and_car_issues;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Min_Max_Rating_Prime_Sedan AS 
select min(Driver_Ratings) as Min_Rating , max(Driver_Ratings) as Max_Rating
from bookings
where Vehicle_Type="Prime Sedan";
select * from Min_Max_Rating_Prime_Sedan;
#7. Retrieve all rides where payment was made using UPI:
create view Rides_Where_Payment_Was_UPI As
select * 
from bookings 
where  Payment_Method="UPI";
select * from Rides_Where_Payment_Was_UPI;

#8. Find the average customer rating per vehicle type:
create view Average_customer_rating_per_vehicle as 
select Vehicle_Type, avg(Customer_Rating) as Avg_Rating
from bookings
group by Vehicle_Type;
select *
 from 
Average_customer_rating_per_vehicle;
#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as 
select Vehicle_Type, sum(Booking_Value) as Sum_Booking_Value
from bookings
where Booking_Status="Success"
group by Vehicle_Type;
select * 
from
 total_booking_value;
#10. List all incomplete rides along with the reason:
create view Incomplete_rides_reason as
select  Incomplete_Rides_Reason ,count(Incomplete_Rides) As count_of_Canceled_reason 
from bookings
where Incomplete_Rides ="Yes"
group by Incomplete_Rides_Reason;
select * 
from Incomplete_rides_reason;