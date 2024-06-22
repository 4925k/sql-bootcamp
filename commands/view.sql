-- creating a view
create view reviews_view as
select
    title,
    rating,
    concat(first_name, ' ', last_name) as reviewer
from
    reviews
        join reviewers r on reviews.reviewer_id = r.id
        join series s on reviews.series_id = s.id;

-- querying the view
select * from reviews_view;

-- dropping the view
drop view reviews_view;

-- having
select title, count(rating) from reviews_view
group by title having count(rating) > 3;

-- rollup
select title, avg(rating) from reviews_view
group by rollup(title);

