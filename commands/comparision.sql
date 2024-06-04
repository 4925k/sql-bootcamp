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
