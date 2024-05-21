-- distinct
select distinct author_fname from books;
select distinct concat(author_fname, ' ', author_lname) from books;
select distinct author_fname, author_lname from books;

-- order by
select * from books order by title;
select * from books order by title DESC;

-- can select the column number
select book_id, books.author_fname, books.author_lname from books order by 2;

-- can order with multiple columns, first then second
select book_id, books.author_fname, books.author_lname from books order by author_fname, book_id;

