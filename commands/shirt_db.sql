-- create table
create table if not exists shirt_db (
    shirt_id serial primary key ,
    article text,
    color text,
    shirt_size varchar(1),
    last_worn int
);

-- insert multiple values
insert into shirt_db (article, color, shirt_size, last_worn)
values ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

-- insert single value
insert into shirt_db (article, color, shirt_size, last_worn)
values ('polo shirt', 'purple', 'M', '50');

-- select all
select article, color from shirt_db;

-- select with condition
select article, color, shirt_size, last_worn from shirt_db where shirt_size='M';

-- update
update shirt_db set shirt_size = 'L' where article = 'polo shirt';

update shirt_db set last_worn = 0 where last_worn =15;

update shirt_db set shirt_size = 'XS', color='off white' where color='white';

-- delete
delete from shirt_db where last_worn= 200;

delete from shirt_db where article = 'tank top';

delete from shirt_db;

-- drop

drop table if exists  shirt_db;