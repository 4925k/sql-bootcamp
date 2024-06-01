-- CHAR -- fixed size.
CREATE TABLE codes (
    state text,
    code CHAR(3)
);

-- INT, TINYINT,
create table family (
    father text,
    children smallint
);

-- DATE TIME
create table people (
    name text,
    birthdate DATE,
    birth_time time,
    birth_datetime timestamp
);

insert into
    people (name, birthdate, birth_time, birth_datetime)
VALUES (
        'Daemon',
        '2000-01-01',
        '10:20:30',
        '2004-01-01 10:20:30'
       );

-- GET CURRENT DATE AND TIME, SELECT PART OF TIME
select current_date;
select current_time;
select now();
select date_part('year', now());

-- EXERCISES
select current_time;            -- current time
select current_date;            -- current date
select to_char(now(), 'D');     -- current day -> number
select to_char(now(), 'DY');    -- current day -> name
select to_char(now(), 'MM/DD/YYYY');                -- date formatting
select to_char(now(), 'FMMonth DDth at HH:MM');     -- date formatting

create table tweets (
    content varchar(180),
    username varchar(15),
    created_at timestamp DEFAULT current_timestamp
);
