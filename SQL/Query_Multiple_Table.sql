/* Let’s see which plans are used by which premium members!
The column membership_plan_id in premium_users should match
the column id in plans. */

select user_id,
  description
from plans
join premium_users
  on plans.id = premium_users.membership_plan_id;

/* Let’s see the titles of songs that were played by each user!

The column song_id in plays should match the column id in songs. */

select user_id,
  play_date,
  title
from plays
join songs
  on plays.song_id = songs.id;

/* Which users aren’t premium users? */

 select id
 from users
 left join premium_users
  on users.id = premium_users.user_id
  where premium_users.user_id is null;

/* Use a left join to combine january 
and february on user_id and select user_id from january */

WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'
)
select january.user_id
from january
left join february
  on january.user_id = february.user_id
  where february.user_id is null;

/* For each month in months, we want to know if each user
in premium_users was active or canceled. */

 select user_id,
  purchase_date,
  cancel_date,
  months
from premium_users
cross join months;

 SELECT premium_users.user_id,
  months.months,
  CASE
    WHEN (
      premium_users.purchase_date <= months.months
      )
      AND
      (
        premium_users.cancel_date >= months.months
        OR
        premium_users.cancel_date IS NULL
      )
    THEN 'active'
    ELSE 'not_active'
  END AS 'status'

FROM premium_users
CROSS JOIN months;

/* Songify has added some new songs to their catalog.
How to combine them? */

select *
from songs
union
select *
from bonus_songs
limit 10;

/* Besides stacking one table on top of another, we can
also use UNION to quickly make a “mini” dataset. */

SELECT '2017-01-01' as month
UNION
SELECT '2017-02-01' as month
UNION
SELECT '2017-03-01' as month;

/* How many times each song was played? */

with play_count as (
  SELECT song_id,
   COUNT(*) AS 'times_played'
FROM plays
GROUP BY song_id
)
select title,
  artist,
  times_played
from songs
join play_count
  on songs.id = play_count.song_id;
