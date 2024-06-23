-- database
-- create database instagram;
--
-- -- user instagram
-- \c instagram;

-- users
create table if not exists users (
    id serial primary key,
    username varchar(100) not null unique,
    created_at timestamp default current_timestamp
);


-- photos
create table if not exists photos (
    id serial primary key,
    url text not null,
    user_id int references users(id),
    created_at timestamp default current_timestamp
);



-- insert data
insert into users (username) values ('Jhon'), ('Brad'), ('Charlie');

insert into photos (url, user_id) values
('https://www.instagram.com/jhon/1', 1),
('https://www.instagram.com/jhon/2', 1),
('https://www.instagram.com/brad/1', 2),
('https://www.instagram.com/brad/2', 2),
('https://www.instagram.com/charlie/1', 3),
('https://www.instagram.com/charlie/2', 3);