-- NOT EQUAL
select * from books WHERE released_year != 2003;

-- NOT ILIKE
select * from books where title not ilike '% %'; -- no spaces in title

-- GREATER THAN
select * from books where stock_quantity > 100;
select * from books where stock_quantity >= 100;


-- LESS THAN OR EQUAL TO
select * from books where stock_quantity <= 20;

-- LOGICAL AND
select * from books where stock_quantity <= 20 AND released_year >= 2001;

-- LOGICAL OR
select * from books where author_fname = 'David' OR author_fname = 'Dave';

-- BETWEEN
select * from books where released_year between 2001 AND 2020;

-- IN
select * from books where author_fname IN ('Dave', 'Neil');
select * from books where author_fname NOT IN ('Dave', 'Neil');

-- CASE
select title,
       case
           WHEN stock_quantity < 50 THEN 'low'
           WHEN stock_quantity < 100 THEN 'half'
        ELSE 'full'
END as stock
from books;

-- IS NULL
select * from books where title IS NULL;
delete from books where title IS NULL;

-- EXERCISES
select * from books where released_year < 1980;     -- books before 1980 (non inclusive)
select * from books where author_lname IN ('Eggers', 'Chabon'); -- books by eggers or chabon
-- books by lahiri after 2000
select
    *
from
    books
where
    author_lname = 'Lahiri' AND released_year > 2000;
-- books with 100-200 pages
select * from books where pages BETWEEN 100 AND 200;
-- author lname starts with c or s
select * from books where author_lname like 'C%' OR author_lname like 'S%';
-- custom
select
    title,
    author_lname,
    case
        when title ilike '%stories%' THEN 'Short Stories'
        when title in ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
        else 'Novel'
    end as TYPE
from
    books;
-- group number of books by author
select
    author_fname,
    author_lname,
    case
        when count(*) < 1 then 'no book'
        when count(*) = 1 then '1 book'
        else concat(count(*),' books')
    end as COUNT
from
    books
group by
    author_fname, author_lname;