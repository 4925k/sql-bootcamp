-- CROSS JOINS

-- normal flow
select id from customers where last_name = 'George';
select * from orders where customer_id = 1;

-- subquery
select * from orders
where customer_id = (
    select id from customers where last_name = 'George'
    );

-- dumb join -- combine every customer with every order
select * from customers, orders;

-- INNER JOIN - intersection between set A and B.
select * from customers
join orders on customers.id = orders.customer_id;

-- join defaults to inner join
select first_name, last_name, order_date, amount from customers
join orders on customers.id = orders.customer_id

-- INNER JOINS WITH GROUP BY
select first_name, last_name, sum(amount) as total from customers
join orders on customers.id = orders.customer_id
group by first_name, last_name
order by total;

-- LEFT JOIN
select first_name, last_name, order_date, amount from customers
left join orders on customers.id = orders.customer_id

-- LEFT JOIN with GROUP BY
select first_name,
       last_name,
       coalesce(sum(amount), 0),
       count(order_date) as numOfOrders
from
    customers
left join
        orders on customers.id = orders.customer_id
group by
    first_name, last_name;

-- RIGHT JOIN
select order_date, amount, first_name, last_name from orders
right join customers on orders.customer_id = customers.id;

-- EXERCISES

create table students (
    id serial primary key,
    first_name text
);

create table papers (
    title text,
    grade int,
    student_id int,
    foreign key (student_id) references students(id)
)

INSERT INTO students (first_name) VALUES
                                      ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
                                                   (1, 'My First Book Report', 60),
                                                   (1, 'My Second Book Report', 75),
                                                   (2, 'Russian Lit Through The Ages', 94),
                                                   (2, 'De Montaigne and The Art of The Essay', 98),
                                                   (4, 'Borges and Magical Realism', 89);

select first_name, title, grade from papers
join students s on papers.student_id = s.id;

select first_name, title, grade from students
left join papers p on students.id = p.student_id;

select
    first_name,
    coalesce(round(avg(grade), 2), 0) as average,
    case
        when avg(grade) >= 75 then 'PASSING'
        else 'FAILING'
    end as passing_status
from students
left join
    papers p on students.id = p.student_id
group by
    first_name;