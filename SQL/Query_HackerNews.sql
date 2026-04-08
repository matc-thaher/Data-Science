/* What are the top five stories with the highest scores? */

SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

---------------------------------------
/* Hacker News Moderating */

/* Recent studies have found that online forums tend to
be dominated by a small percentage of their users (1-9-90 Rule).
Is this true of Hacker News?
Is a small percentage of Hacker News submitters taking the 
majority of the points? */

SELECT user, sum(score)
FROM hacker_news
group by 1
  having sum(score) > 200;

select (517+309+304+282) / 6366.0;

/* Oh no! While we are looking at the power users,
some users are rickrolling — tricking readers into
clicking on a link to a funny video and claiming 
that it links to information about coding.
The url of the video is:

https://www.youtube.com/watch?v=dQw4w9WgXcQ

How many times has each offending user posted this link? */

select url, count(*)
from hacker_news
where url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

------------------------------------
/* Which sites feed Hacker News? */

/* Hacker News stories are essentially links that take 
users to other websites.
Which of these sites feed Hacker News the most:
GitHub, Medium, or New York Times? */

SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   Else 'Others'
  END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;

---------------------------------------
/* What's the best time to post a story? */

SELECT strftime('%H', timestamp) as 'Hour',
   ROUND(AVG(score)) as 'Avg_score',
   COUNT(*) as 'count'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;