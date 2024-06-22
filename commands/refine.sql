-- DISTINCT
select distinct author_fname from books;
select distinct concat(author_fname, ' ', author_lname) from books;
select distinct author_fname, author_lname from books;

-- ORDER BY
select * from books order by title;
select * from books order by title DESC;

-- can select the column number
select book_id, books.author_fname, books.author_lname from books order by 2;

-- can order with multiple columns, first then second
select book_id, books.author_fname, books.author_lname from books order by author_fname, book_id;

-- LIMIT
-- get only 10 results
select * from books limit 10;

-- get n results but skip m results
select * from books order by title limit 5 offset 5;

-- LIKE
-- use regex to match
select * from books where title like '%the%';

-- ILIKE -> like + case insensitive
select * from books where title ilike '%THE%';


-- exercises
select title from books where title ilike '%stories%';
select title, pages from books order by pages DESC limit 1;
select concat(title, ' - ', released_year) as summary from books ORDER BY released_year DESC LIMIT 3;
select title, author_lname from books where author_lname like '% %';
select title, released_year, stock_quantity from books order by stock_quantity limit 3;
select title, author_lname from books order by author_lname, title;
select concat('MY FAVOURITE AUTHOR IS ', author_fname, ' ', author_lname) as yell from books order by author_lname;