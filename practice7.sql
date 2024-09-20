-- All Function 
show databases;

-- show databases 
USE kajaldb1;

SELECT 
    *
FROM
    employee;

SELECT 
    *
FROM
    department;

-- lower function 
SELECT 
    LOWER(DeptName)
FROM
    department;

-- Upper function
SELECT 
    UPPER(emp_Name) AS Name,
    UPPER(emp_address) AS Address,
    LOWER(emp_dept) AS Department
FROM
    employee;
 
 -- First letter Capital Or bakki small
SELECT 
    CONCAT((SUBSTRING(emp_Name, 1, 1)),
            LOWER(SUBSTRING(emp_Name, 2, LENGTH(emp_Name)))) AS Name
FROM
    employee;

-- length Function
SELECT 
    LENGTH(emp_Name) AS Name
FROM
    employee
LIMIT 2;

-- Right Function
SELECT 
    RIGHT(emp_Name, 10) AS EmpName
FROM
    employee;

-- Left Function
SELECT 
    LEFT(emp_Address, 10) AS Address
FROM
    employee; 
    
-- Trim
Select trim(emp_Name) as Name FROM employee; 

--   NSTR
SELECT instr(emp_Name) as Name FROM employee; 

-- Concate
select concat() from employee; 

select * from employee;
select count(emp_Name) from employee;

select count(*) as Records, emp_Name from employee
group by emp_Name;

-- sum
select sum(Salary) from department;

select * from department;
-- Avg
select avg(Salary) from department; 
select avg(Salary) from department where Dept_Id =2; 

-- View

Create view DepartmentDetails as 
Select DeptName, DepTZone, Salary 
from employee
where DeptId>4;






 
 


