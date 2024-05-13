-- creating a table
create table if not exists :table_name
(
    username   varchar(15) not null,
    content    varchar(140) not null,
    favourites integer not null default 0
);

-- show tables
\dt

-- describe table
\d :table_name
\d+ :table_name

-- dropping table
drop table if exists :table_name;

-- insert data into table
insert into dogs (name, age)
values ('muffin', 11);

-- insert multiple data into table
insert into dogs (name, age)
values ('goldie', 3),
       ('punte', 5);

-- get all data from table
select * from dogs;