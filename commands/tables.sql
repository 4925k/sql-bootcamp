-- creating a table
create table if not exists :table_name
(
    username   varchar(15),
    content    varchar(140),
    favourites integer
);

-- show tables
\dt

-- describe table
\d :table_name
\d+ :table_name

-- dropping table
drop table if exists :table_name