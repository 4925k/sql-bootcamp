-- CHAR -- fixed size.
CREATE TABLE codes (
    state text,
    code CHAR(3)
);

-- INT, TINYINT,
create table family (
    father text,
    children smallint
)

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
        'Dameon',
        '2000-01-01',
        '10:20:30',
        '2004-01-01 10:20:30'
       );
