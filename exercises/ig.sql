-- find the oldest users
select * from users
order by created_at
limit 5;

-- find which day of the week the most users signed up
select
    to_char(created_at, 'Day') as day,
    count(*) as count
from
    users
group by day
order by count desc;