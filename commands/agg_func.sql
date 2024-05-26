-- COUNT
select count(*) from books;
select count(author_fname) from books;
select count(distinct author_fname) from books;

-- GROUP BY
select author_lname from books group by author_lname;
select author_lname, COUNT(*) from books group by author_lname;

-- GROUP BY Multiple Columns
select author_fname, author_lname, Count(*) from books group by author_fname, author_lname;
select concat(author_fname, ' ', author_lname) as author, count(*) from books group by author;

-- MAX & MIN
select MAX(pages) from books;
select MIN(pages) from books;

-- MAX & MIN + GROUP BY
select author_lname, min(released_year) from books group by author_lname;
select author_lname, max(released_year) from books group by author_lname;
select
    concat(author_fname, ' ', author_lname) as author,
    count(*) as total_books,
    min(released_year) as first_release,
    max(released_year) as recent_release
from
    books
group by
    author_fname, author_lname;


-- sub queries
select
    title, pages
from
    books
where
    pages = (
        select max(pages) from books
    );

-- SUM
select sum(pages) from books;
select author_lname, sum(pages) from books group by author_lname;

-- AVG
select avg(released_year) from books;
select avg(pages) from books;
select released_year, avg(stock_quantity) from books group by released_year;

-- EXERCISES
-- total number of books
select count(*) from books;
-- how many books for released each year
select count(*), released_year from books group by released_year;
-- total number of books in stock
select sum(stock_quantity) from books;
-- avg release year for each author
select
    concat(author_fname, ' ', author_lname) as author,
    avg(released_year)
from
    books
group by author_fname, author_lname;
-- name of the author with the longest book
select
    concat(author_fname, ' ', author_lname) as fullname
from books
where book_id = (
    select book_id from books order by pages DESC LIMIT 1
    );

-- get number of books and average pages for all years
select
    released_year as year,
    count(*) as "# books",
    avg(pages) as "avg pages"
from
    books
GROUP BY
    released_year
ORDER BY
    year;
