select * from department;
select * from employee;

-- Joins
select employee.emp_Id, employee.emp_Name , employee.emp_dept, 
department.DeptName, department.Salary 
from employee
Join department on
employee.emp_Id=department.Dept_Id 
Order by emp_Name Asc;

select employee.emp_Name, employee.emp_age as age, 
department.DepTZone , department.Salary
from employee
inner JOIN department on employee.emp_Id=department.Dept_Id
ORDER BY emp_age ASC; 

select sum(Salary) from department;

select count(emp_Name) from employee;

select min(Salary) from department;

select max(Salary) from department;

select e.emp_Id, e.emp_Name, e.emp_address,e.emp_phn_no,
d.DeptName, d.Salary
from employee e
inner join department d
on e.emp_Id  = d.Dept_Id
Where d.Salary = (Select max(Salary) from department);

select avg(Salary) from department;

Select e.emp_Id, e.emp_Name, d.Salary
from employee e
join department d on
e.emp_Id = d.dept_Id
where d.Salary = ( Select min(Salary) from department);




