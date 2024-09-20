SELECT * FROM employee;
SELECT * FROM department;

-- Joins 
-- A JOIN clause is used to combine rows from two or more tables,

select employee.emp_Name, department.Dept_Id, department.Salary
from employee 
INNER JOIN department ON
employee.emp_Id = department.Dept_Id;

select employee.emp_Name, department.Dept_Id, department.Salary
from employee 
join department ON
employee.emp_Id = department.Dept_Id;

  -- UNION
  SELECT emp_ID from employee
  UNION Dept_Id from department;
  
  -- GROUP BY Statement
--   GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group

-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- ORDER BY column_name(s);

select count(emp_ID), emp_dept
from employee
group by kajaldb1.employee
order by count(emp_ID) desc; 


