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