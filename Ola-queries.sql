create database ola;
use ola;
# 1 retrieve all the successfull bookings
create view successful_booking as select * from bookings where booking_status = 'success'; 

# 2 average ride distance for each vehicle type
select vehicle_type, avg(ride_distance) as average_ride_distance from bookings group by vehicle_type;

# 3 total number of cancelled rides by customers
select count(booking_id) as rides_cancelled_by_customer from bookings where booking_status = 'canceled by customer';

# 4 top 5 customers who booked the highest numbers of rides
create view top_5_customers as select customer_id, count(booking_id) as bookings_by_customer from bookings group by customer_id order by count(customer_id) desc limit 5;

# 5 Number of rides cancelled by drivers due to personal and car-related issue
select count(canceled_rides_by_driver) from bookings where canceled_rides_by_driver = 'personal & car related issue';

# 6 Find the maxiumum and minimum driver rating for prime sedan bookings
select vehicle_type, max(driver_ratings) as max_rating, min(driver_ratings) as min_rating from bookings group by vehicle_type ;

# 7 Retrieve all rides where payment method was UPI
select booking_id, customer_id, payment_method from bookings where payment_method = 'upi';

# 8 Find the average customer rating per vehicle
select vehicle_type, round(avg(driver_ratings),2) as average_rating from bookings group by vehicle_type; 

# 9 Calculate the  total booking value of rides completed successfully
select sum(booking_value) as total_booking_value_of_successful_rides from bookings where incomplete_rides = 'no';

# 10 List all incomplete rides along with the reason
select booking_id, customer_id, incomplete_rides_reason as reason from bookings where incomplete_rides = 'yes';



