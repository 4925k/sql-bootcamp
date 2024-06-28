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

-- inactive users -> people who have never posted a photo
select username from users
left join photos on users.id = photos.user_id
where photos.id is null;

-- who got the most likes\
select distinct username from users
join photos on users.id = photos.user_id
where photos.id = (
    select photos.id from photos
    join likes on photos.id = likes.photo_id
    group by photos.id
    order by count(*) desc
    limit 1
);


-- avg number of likes per photo
select  (select count(*) from photos) / (select count(*) from users ) as avg_posts;

-- top 5 used hashtags
select tags.tag_name, count(*) as used from photo_tags
join tags on photo_tags.tag_id = tags.id
group by tags.id
order by used desc
limit 5;

-- user who has liked all the photos
select username, count(*) as liked_photos from users
inner join likes on users.id = likes.user_id
group by users.id
having count(*) = (select count(*) from photos);
