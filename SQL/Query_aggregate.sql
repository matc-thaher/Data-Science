/* Use COUNT() and a LIKE operator to determine the number 
of users that have an email ending in ‘.com’.*/

select count(email)
from users
where email like '%.com';

/*What are the most popular first names on Codeflix?
Use COUNT(), GROUP BY, and ORDER BY to create a list
of first names and occurrences within the users table.
Order the data so that the most popular names are 
displayed first. */

select first_name,
  count(*)
from users
group by 1
order by count(*) desc;

/* The UX Research team wants to see a distribution of
watch durations. They want the result to contain:
1. duration, which is the watch event duration, 
rounded to the closest minute,
2. count, the number of watch events falling into
this “bucket”*/

select round(watch_duration_in_minutes) AS duration,
  count(*) AS count
from watch_history
group by 1
order by 1 asc;

/* Find all the users that have successfully made a 
payment to Codeflix and find their total amount paid.
Sort them by their total payments (from high to low). */

select user_id, sum(amount) AS amount
from payments
where status = 'paid'
group by 1
order by 2 desc;

/* Generate a table of user ids and total watch 
duration for users who watched more than 400 minutes
of content.*/

select user_id, 
  sum(watch_duration_in_minutes) AS 'duration'
from watch_history
group by 1
having duration > 400;

/* To the nearest minute, how many minutes of 
content were streamed on Codeflix?*/

select round(sum(watch_duration_in_minutes)) AS 'total_duration'
from watch_history;

/* Which days in this period did Codeflix collect
the most money?
Your result should have two columns, pay_date and 
total amount, sorted by the latter descending.*/

select pay_date, sum(amount) as 'total_amount'
from payments
where status = 'paid'
group by 1
  order by 2 desc;

/* When users successfully pay Codeflix (status =
'paid'), what is the average payment amount?*/

select avg(amount)
from payments
where status = 'paid';

/* Of all the events in the watch_history table,
what is the duration of the longest individual 
watch event? What is the duration of the shortest?*/

select max(watch_duration_in_minutes) as max,
  min(watch_duration_in_minutes) as min
from watch_history;

