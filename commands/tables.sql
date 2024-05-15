-- creating a table
-- not null values
-- default values
-- primary keys (cannot be null)
-- serial -> auto increment value
create table if not exists employees
(
    id        serial primary key,
    last_name text not null,
    first_name text not null,
    middle_name text,
    age int not null ,
    current_status text not null default 'employed'
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
       ('punted', 5);

-- get all data from table
select * from dogs;