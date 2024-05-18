-- concat
SELECT concat(author_fname, ' ', author_lname) as full_name from books;

-- concat with separator value
SELECT concat_ws('-', author_fname, author_lname) as full_name from books;


-- substring
select substring('hello world', 1, 5);      -- hello
select substring('hello world', 6);         -- world
select substring('hello world', -5);        -- world

select substring(title, 1, 15) as title from books;

-- getting short title
select concat(
               substring(title, 1, 10),
               '...'
            ) as short_title
        from books;

-- getting author initials
select concat(
       substring(author_fname, 1, 1),
       substring(author_lname, 1, 1)
       ) as initials
from books;