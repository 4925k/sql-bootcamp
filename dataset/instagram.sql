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
    user_id int references users(id) not null,
    created_at timestamp default current_timestamp
);

-- comments
create table if not exists comments (
    id serial primary key,
    comment text not null,
    user_id int not null references users(id),
    photo_id int not null references photos(id),
    created_at timestamp default current_timestamp
);

-- likes
create table if not exists likes (
    user_id int not null references users(id),
    photo_id int not null references photos(id),
    created_at timestamp default current_timestamp,
    primary key (user_id, photo_id)
);

-- followers
create table if not exists follows (
    follower_id int not null references users(id),
    followee_id int not null references users(id),
    created_at timestamp default current_timestamp
);





-- insert data
insert into users (username) values ('Jhon'), ('Brad'), ('Charlie');

insert into photos (url, user_id)
values
    ('https://www.instagram.com/jhon/1', 1),
    ('https://www.instagram.com/jhon/2', 1),
    ('https://www.instagram.com/brad/1', 2),
    ('https://www.instagram.com/brad/2', 2),
    ('https://www.instagram.com/charlie/1', 3),
    ('https://www.instagram.com/charlie/2', 3);

-- comments data
insert into comments (comment, user_id, photo_id)
values
    ('Nice pic', 1, 1),
    ('Cool', 1, 2),
    ('Awesome', 2, 3),
    ('Great', 2, 4),
    ('Amazing', 3, 5),
    ('Fantastic', 3, 6);

-- likes data
insert into likes (user_id, photo_id)
values
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6);

-- followers data
insert into follows (follower_id, followee_id)
values
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2);

