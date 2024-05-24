-- COUNT
select count(*) from books;
select count(author_fname) from books;
select count(distinct author_fname) from books;

-- GROUP BY
select author_lname from books group by author_lname;
select author_lname, COUNT(*) from books group by author_lname;

-- max and min
select MAX(pages) from books;
select MIN(pages) from books;

-- sub queries
select
    title, pages
from
    books
where
    pages = (
        select max(pages) from books
        );