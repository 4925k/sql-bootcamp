create table if not exists customers (
    id serial primary key,
    first_name text,
    last_name text,
    email text
);

create table if not exists orders (
    id serial primary key,
    customer_id int,
    order_date date,
    amount decimal(8, 2),
    foreign key (customer_id) references customers(id)
);