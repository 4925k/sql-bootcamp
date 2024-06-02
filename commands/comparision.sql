-- NOT EQUAL
select * from books WHERE released_year != 2003;

-- NOT ILIKE
select * from books where title not ilike '% %'; -- no spaces in title

-- GREATER THAN
select * from books where stock_quantity > 100;