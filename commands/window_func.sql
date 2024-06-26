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

-- rank of salary among department and overall
select
    employees.emp_no,
    employees.department,
    employees.salary,
    rank() over(partition by department order by salary desc) as dept_rank, -- give rank to each row within department
    rank() over(order by salary desc) as overall_rank, -- can skip numbers if multiple rows have same number
    row_number() over (order by salary desc) as row_number, -- give row number to each row
    dense_rank() over (order by salary desc) as overall_dense_rank -- rank but no skipping
from employees order by row_number;

-- ntile() divide partition into n groups
select
    emp_no,
    department,
    salary,
    ntile(4) over(partition by employees.department order by salary desc) as dept_quartile,
    ntile(4) over(order by salary desc) as quartile
from employees order by department;

-- first value -> gives the first value of the window
select
    emp_no,
    department,
    salary,
    first_value(emp_no) over(order by salary desc) as highest_paid,
    first_value(emp_no) over(partition by department order by salary desc) as highest_paid_dept
from employees;

-- lead and lag -> access values from other rows in the window
select
    emp_no,
    department,
    salary,
    lag(salary) over(order by salary) as previous_salary,
    lead(salary) over(order by salary) as next_salary
from employees order by salary desc ;
