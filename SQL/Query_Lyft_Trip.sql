/* Let’s examine the three tables. */

select * from trips;
select * from riders;
select * from cars;

/* Try out a simple cross join between riders and cars.
Is the result useful?*/

select * 
from riders
cross join cars;

/* answer to the question : no */

/* Suppose we want to create a Trip Log with
the trips and its users.
Find the columns to join between trips and riders
and combine the two tables using a LEFT JOIN.

Let trips be the left table. */

select *
from trips
left join riders
  on trips.rider_id = riders.id;

/* for specific column acces we can use */
select trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
from trips
left join riders 
  on trips.rider_id = riders.id;

/* Suppose we want to create a link between the
trips and the cars used during those trips.

Find the columns to join on and combine the trips
and cars table using an INNER JOIN. */

select *
from trips
join cars
  on trips.car_id = cars.id;

/* The new riders data are in! There are three 
new users this month.

Stack the riders table on top of the new 
table named riders2. */

select *
from riders
union
select *
from riders2;

/* What is the average cost for a trip? */

select avg(cost) as 'Avg_cost'
from trips;

/* 
Lyft is looking to do an email campaign for all the irregular users.

Find all the riders who have used Lyft less than 500 times! */

select id, 
  username,
  total_trips
from riders
where total_trips < 500;

/* Calculate the number of cars that are active. */

select count(*) as 'count'
from cars
where status = 'active';

/* It’s safety recall time for cars that have been on the road for a while.

Write a query that finds the two cars that have the highest trips_completed. */

select *
from cars
order by trips_completed desc
limit 2;