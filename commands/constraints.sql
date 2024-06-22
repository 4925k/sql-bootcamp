-- CONSTRAINT
create table contacts (
    name text,
    number text UNIQUE
);

-- insert value
insert into contacts (name, number) VALUES ('jhon', 'abc-xyz');

-- duplicate number will not work
insert into contacts (name, number) VALUES ('jhon', 'abc-xyz');


-- CHECK CONSTRAINT - inline custom constraints
create table babies (
    name text,
    age int check ( age > 0 )
);

-- insert valid data
insert into babies values ('ram', 5);

-- invalid data
insert into babies values ('shyam', -5);


-- CHECK CONSTRAINT - custom named constraint
create table babies_2 (
    name text,
    age int
    constraint age_check check ( age > 0 )
);