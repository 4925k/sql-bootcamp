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