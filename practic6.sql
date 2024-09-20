SELECT 
    *
FROM
    kajaldb1.employee;
    
select * from kajaldb1.department;
    
-- upper case  
select upper(emp_Name) from employee;

-- lower case
SELECT LOWER(DeptName)
FROM department
ORDER BY DeptName DESC;





-- sum
SELECT 
    SUM(EmpAGE)
FROM
    employee2;
 
SELECT 
    SUM(Salary)
FROM
    department;
SELECT 
    AVG(Salary)
FROM
    department;
SELECT 
    COUNT(emp_age)
FROM
    employee
WHERE
    emp_age = 25;

SELECT 
    COUNT(*)
FROM
    employee2;
 
-- max

SELECT 
    MAX(EmpAGE) AS largestAGE
FROM
    employee2;

SELECT 
    MIN(EmpAGE) AS lowestAGE
FROM
    employee2;

-- UPDATE

SELECT 
    *
FROM
    employee2;

UPDATE employee2 
SET 
    EmpAGE = 30
WHERE
    EmpID = 1;

UPDATE employee2 
SET 
    FirstName = 'LAKSHMI',
    LastName = 'PANDIT'
WHERE
    EMPID = 1;

-- DELETE
DELETE FROM employee2 
WHERE
    EmpZONE = 'SOUTH';

DELETE FROM employee2 
WHERE
    EmpID = 1;

SELECT 
    COUNT(EmpID)
FROM
    employee2;

DELETE FROM student;

-- order by
SELECT 
    *
FROM
    employee2;

SELECT 
    *
FROM
    employee2
ORDER BY EmpAGE;

SELECT 
    *
FROM
    employee2
ORDER BY EmpAGE DESC;

SELECT 
    *
FROM
    employee2
ORDER BY FirstName ASC;
 
 
 --  LIMIT
 
SELECT 
    *
FROM
    employee
LIMIT 3;
 
 -- ALIAS
 
SELECT 
    FirstName AS Name1,
    LastName AS Name2,
    EmpAGE AS AGE_OF_EMPLOYEES
FROM
    employee2;
 
SELECT 
    *
FROM
    employee2;
 
 -- Auto current
 
 CREATE DATABASE kajaldb1;
 show databases;
 
 use kajaldb1;
 
 -- indexes
 
SELECT 
    *
FROM
    employee2;
 
 CREATE INDEX DEMOINDEX
 ON employee2(FirstName);
 
  CREATE INDEX DEMOINDEX2
 ON employee2(FirstName, LastName, EmpAGE);
 
 SHOW INDEXES FROM employee2;
 
 DROP Index DEMOINDEX on employee2;
 
 show indexes from employee2;
 
 Drop index DEMOINDEX2 ON employee2;
 show indexes from employee2;
 
 -- join
 
SELECT 
    *
FROM
    employee;
SELECT 
    *
FROM
    department;
 
SELECT 
    e.emp_Name, e.emp_dept, e.emp_address, d.DeptName, d.Salary
FROM
    employee e
        INNER JOIN
    department d ON e.emp_dept = d.DeptId;

--  drop 
desc employee2;
SELECT 
    *
FROM
    employee2;

drop table employee2;
SELECT 
    *
FROM
    employee2;

drop table student;

show databases;
desc kajaldb1;

SELECT 
    *
FROM
    employee;

SELECT 
    COUNT(emp_id), emp_Name, emp_age
FROM
    employee
GROUP BY emp_Name , emp_age
ORDER BY COUNT(emp_Id) DESC;

SELECT 
    COUNT(emp_id), emp_Name, emp_dept, emp_address
FROM
    employee
GROUP BY emp_Name , emp_dept , emp_address
ORDER BY COUNT(emp_Id) DESC;

SELECT 
    e.emp_Name, e.emp_dept, e.emp_address, d.DeptName, d.Salary
FROM
    employee e
        INNER JOIN
    department d ON e.emp_dept = d.DeptId;

-- Having 
SELECT 
    COUNT(emp_id), emp_Name
FROM
    employee
GROUP BY emp_Name
HAVING COUNT(emp_id) < 3;

SELECT 
    *
FROM
    employee;

SELECT 
    COUNT(emp_age), emp_dept, emp_address
FROM
    employee
GROUP BY emp_dept , emp_address
HAVING COUNT(emp_id) < 2;

SELECT 
    COUNT(emp_Id), emp_address
FROM
    employee
GROUP BY emp_address
HAVING COUNT(emp_Id) < 5
ORDER BY COUNT(emp_id) DESC;

SELECT 
    *
FROM
    department;
SELECT 
    *
FROM
    employee;
-- exists

SELECT 
    emp_Name, emp_age, emp_address, emp_phn_no
FROM
    employee
WHERE
    EXISTS( SELECT 
            DeptName
        FROM
            department
        WHERE
            employee.emp_ID = department.Dept_Id);
            
-- ANY AND ALL

SELECT 
    EMP_NAME(s)
FROM
    employee
WHERE
    emp_Id = ALL (SELECT 
            emp_ID
        FROM
            emp_age
        WHERE
            emp_age > 25);

SELECT 
    *
FROM
    employee
WHERE
    emp_age = ANY (SELECT 
            emp_age
        FROM
            employee
        WHERE
            emp_Name = 'kajal');
            
SELECT 
    *
FROM
    employee
WHERE
    emp_Id = ALL (SELECT 
            emp_ID
        FROM
            employee
        WHERE
            emp_Name = 'KAJAL');