SELECT * FROM public.employees
ORDER BY emp_id ASC 

SELECT * FROM employees WHERE fname LIKE '%A%';

select dept, count(fname) from employees group by dept;

alter table person add column mob varchar(15) check (length(mob) >= 10);

insert into person(mob)
values (1234567890);

alter table person
Drop constraint person_mob_check;

alter table person drop column mob;

insert into person(mob) values (123);

select * from person;

insert into person (id,full_name,city) values(1,'kajal','Haridwar'),(2,'Riya Pandit','Delhi'),
(3,'Ramesh','Dehradun');

delete from person;

alter table person drop column mob;

select * from employees;

SELECT fname,salary,
CASE
WHEN salary >= 50000 THEN 'HIGH'
ELSE 'LOW'
END AS Sal_cat from employees;

SELECT fname,salary,
CASE
WHEN salary >= 100000 THEN 'HIGH'
WHEN salary BETWEEN 70000 AND 92000 THEN 'MID'
ELSE 'LOW'
END AS Sal_cat from employees;

SELECT 
CASE
WHEN salary >= 100000 THEN 'HIGH'
WHEN salary BETWEEN 70000 AND 92000 THEN 'MID'
ELSE 'LOW'
END AS Sal_cat , count(emp_id) from employees group by Sal_cat;

SELECT fname,salary,
CASE
WHEN salary > 0 THEN Round(salary*.10)
END AS bouns
FROM employees;


CREATE TABLE customers(
cust_id serial Primary key,
cust_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
ord_id serial Primary key,
ord_date DATE NOT NULL,
price NUMERIC NOT NULL,
cust_id INTEGER NOT NULL,
FOREIGN KEY (cust_id) REFERENCES
customers (cust_id)
);

select * from Customers;

select * from orders;

INSERT INTO Customers(cust_name)
VALUES
('Raju'),('Shyam'),('Alex'),('Paul');

INSERT INTO orders(ord_date,cust_id,price)
VALUES
('2024-01-01',1,250),
('2024-01-15',1,300),
('2024-02-01',2,150),
('2024-03-01',3,450),
('2024-04-01',2,550);

-- Joins

-- cross join 

select * from customers CROSS JOIN orders;

-- Inner Join
SELECT * FROM customers c
INNER JOIN orders o
ON
c.cust_id=o.cust_id;

SELECT c.cust_name, count(o.ord_id) FROM customers c
INNER JOIN orders o
ON
c.cust_id=o.cust_id
GROUP BY cust_name;

SELECT c.cust_name, SUM(o.price) FROM customers c
INNER JOIN orders o
ON
c.cust_id=o.cust_id
GROUP BY cust_name;

-- Left Join

SELECT * FROM customers c
LEFT JOIN orders o
ON
c.cust_id=o.cust_id;

-- Right Join
SELECT * FROM customers c
RIGHT JOIN orders o
ON
c.cust_id=o.cust_id;

-- Many to many

Create table students(
id serial primary key,
stud_name varchar(100)
);

create table courses(
c_id serial primary key,
course_name varchar(100) Not null,
fees Numeric Not null
);

create table enrollment(
enrollment_id serial primary key,
id int not null,
c_id int not null,
enrollment_date date not null,
Foreign key (id) References students(id),
foreign key (c_id) REFERENCES courses(c_id)
);

Insert into Students(Stud_name) Values ('Ram'),('Shyam'),('Mohan');

Insert into Courses(course_name,fees)
Values
('Mathematics',500.00),
('Physics',600.00),
('Chemistry',700.00);

INSERT INTO enrollment(id,c_id,enrollment_date)
VALUES
(1,1,'2024-01-01'), --Raju enrolled in mathematics
(1,2,'2024-01-15'),--Raju enrolled in Physics
(2,1,'2024-02-01'), --Shyam enrolled in mathematics
(2,3,'2024-01-15'), --Shyam enrolled in Chemistry
(3,3,'2024-03-25');  --Shyam enrolled in chemistry

select * from students;
select * from courses;
select * from enrollment;

select s.stud_name,c.course_name,enrollment_date,fees from
enrollment e
JOIN students s
ON e.id=s.id
JOIN courses c
ON c.c_id=e.c_id;

-- revision

-- stored precedure

-- update 
CREATE OR REPLACE PROCEDURE update_emp_salary(
p_employee_id INt,
p_new_salary numeric
)
Language plpgsql
as $$
begin
update employees
set salary =p_new_salary
where emp_id=p_employee_id;
end;
$$;

call update_emp_salary(3,710000);


-- insert

CREATE Or REPLACE PROCEDURE add_employee(
p_fname varchar,
p_lname varchar,
p_email varchar,
p_dept varchar,
p_salary numeric
)
language plpgsql
as $$
begin
insert into employees(fname,lname,email,dept,salary)
values(p_fname,p_lname,p_email,p_dept,p_salary);
end;
$$;

call add_employee('Shilpi','sharma','shilpi@gmail.com','IT',88000); 

select * from employees;

-- subquery
-- find name of the employees in each department having maximum salary

-- select e.emp_id,
-- e.fname,
-- e.salary
-- from employees e
-- where e.dept ='HR'
-- and e.salary = (select max(emp.salary)
-- from employees emp
-- where emp.dept ='HR');

CREATE OR REPLACE FUNCTION dept_max_sal_emp(dept_name varchar)
RETURNS TABLE (emp_id int,fname varchar,salary numeric)
as $$
begin
return query
select e.emp_id,
e.fname,
e.salary
from employees e
where e.dept =dept_name
and e.salary = (select max(emp.salary)
from employees emp
where emp.dept =dept_name);
end;
$$ language plpgsql;

select * from dept_max_sal_emp('Finance');

Select * from employees;

-- Window function

select fname, salary,
SUM(salary) OVER(ORDER BY salary)
FROM employees;

select fname, salary,
AVG(salary) OVER(ORDER BY salary)
FROM employees;

-- ROW_NUMBER()
SELECT
ROW_NUMBER() OVER(PARTITION BY dept),
fname,dept,salary
from employees;

-- RANK()

SELECT fname,salary,
RANK() OVER(ORDER BY salary)
FROM employees;

-- DENSE_RANK()

SELECT fname,salary,
DENSE_RANK() OVER(ORDER BY salary)
FROM employees;

-- LAG()
SELECT 
  fname, 
  salary,
  LAG(salary) OVER (ORDER BY emp_id) AS previous_salary
FROM employees;

-- LEAD()
SELECT 
  fname, 
  salary,
  (salary-LEAD(salary) OVER (ORDER BY salary desc)) salary_diff
FROM employees;

-- CTE
-- we want to calculate the average salary per department and then find all employees whose salary is above the average salary of their department

with avg_sal as (
select dept,avg(Salary) as avg_salary from employees GROUP BY dept
)
select 
e.emp_id,e.fname,e.dept,e.salary,a.avg_salary
FROM employees e
Join avg_sal a
ON
e.dept=a.dept
WHERE 
e.salary>a.avg_salary;
;

-- we want to find the highest-paid employees in each department

with max_sal as (
select dept,max(Salary) as max_salary from employees GROUP BY dept
)
select 
e.emp_id,e.fname,e.dept,e.salary
FROM employees e
Join max_sal a
ON
e.dept=a.dept
WHERE 
e.salary=a.max_salary;
;

-- TRIGGERS

select *from employees;
call update_emp_salary(2,-52000);

CREATE OR REPLACE FUNCTION check_salary()
RETURNS TRIGGER AS $$
BEGIN
IF NEW.salary < 0 THen
NEW.salary =0 ;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_salary
before UPDATE on employees
for each ROW
EXECUTE FUNCTION check_salary();





