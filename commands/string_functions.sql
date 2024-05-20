-- CONCAT
SELECT concat(author_fname, ' ', author_lname) as full_name from books;

-- concat with separator value
SELECT concat_ws('-', author_fname, author_lname) as full_name from books;


-- SUBSTRING
select substring('hello world', 1, 5);      -- hello
select substring('hello world', 6);         -- world
select substring(title, 1, 15) as title from books;
-- getting short title
select concat(
               substring(title, 1, 10),
               '...'
            ) as short_title
        from books;
-- getting author initials
select
    concat(
            substring(author_fname, 1, 1),
            substring(author_lname, 1, 1)
    ) as initials
from
    books;

-- REPLACE
select replace('hello-world', 'world', 'dbk');

-- REVERSE
select reverse('hello-world');

-- CHAR LENGTH
select char_length('hello-world');

-- UPPER && LOWER
select upper('postgres');
select lower('POSTGRES');

-- https://www.postgresql.org/docs/9.1/functions-string.html -- OTHER STRING FUNCTIONS


-- exercises
select upper(reverse('why does my cat look at me with such hatred'));
select replace(title, ' ', '->') as title from books;
select author_fname as forwards, reverse(author_fname) as backwards from books;
select upper(concat(author_fname, ' ', author_lname)) as "full name in caps" from books;
select concat(title, ' was released in ', released_year) as blurb from books;
select title, char_length(title) as character_count from books;
select
    concat(substr(title, 1, 10), '...') as short_title,
    concat(author_lname, ',', author_fname) as author,
    concat(stock_quantity, ' in stock')
from
    books
where
    released_year = 2001;



