CREATE TABLE employees (
   emp_no serial PRIMARY KEY,
   department VARCHAR(20),
   salary INT
);

INSERT INTO employees (department, salary) VALUES
   ('engineering', 80000),
   ('engineering', 69000),
   ('engineering', 70000),
   ('engineering', 103000),
   ('engineering', 67000),
   ('engineering', 89000),
   ('engineering', 91000),
   ('sales', 59000),
   ('sales', 70000),
   ('sales', 159000),
   ('sales', 72000),
   ('sales', 60000),
   ('sales', 61000),
   ('sales', 61000),
   ('customer service', 38000),
   ('customer service', 45000),
   ('customer service', 61000),
   ('customer service', 40000),
   ('customer service', 31000),
   ('customer service', 56000),
   ('customer service', 55000);

SELECT
    emp_no,
    department,
    salary,
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

SELECT emp_no, department, salary, MIN(salary), MAX(salary)
FROM employees
group by emp_no;

select emp_no, department, salary, count(*)
over (partition by department) as dept_count
from employees;

-- over only and over + partition by
select emp_no, department, salary,
       sum(salary) over (partition by department) as dept_total,
       sum(salary) over() as grand_total
from employees;

select
    emp_no,
    department,
    salary,
    sum(salary) over( partition by department order by salary) as dept_running_total,
    sum(salary) over( order by salary) as grand_running_total
from employees;

select
    emp_no,

