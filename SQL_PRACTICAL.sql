create database college;
CREATE DATABASE IF NOT EXISTS college;

CREATE DATABASE comapny;
DROP DATABASE comapny;
DROP DATABASE IF EXISTS comapny;

use college;

create table student(
id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL,
age INT NOT NULL
);

create table dept (
id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL
);

insert into dept values(101,"english"),(102,"IT");
select * from dept;

Update dept set id=103
where id=102;

Update dept set id=111
where id=101;

create table teacher (
id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL,
dept_id int,
foreign key (dept_id) References dept(id)
On UPDATE cascade
ON DELETE cascade
);

insert into teacher
values (101,"adam",101),(102,"John",102);
Drop table teacher;
select * from teacher;

INSERT INTO student VALUES(1,"kajal",20),(2,"Priya",18),(3,"Khushi",21),(4,"Riya",25),(5,"Ram",22),(6,"Rudra",24);

SELECT * FROM student;

SHOW DATABASES;

SHOW TABLES;

USE student;

-- Alter Table 
-- Add
ALTER TABLE student add column age int not null;

-- Drop Col
Alter table student drop column age;
select* from student_details;
ALTER table student drop column grade;

-- change col name
Alter table student change name stu_name varchar(50);
ALTER TABLE student change stu_name full_name varchar(50);

-- Rename table name
ALTER table student RENAME to Student_details;
ALTER table Student_details RENAME to student;
select * from student;

-- Truncate table
Truncate table student;
select * from student;


delete from student 
where marks<80;
-- Create a database for your comapny name XYZ.

Create database Acceture;

use Acceture;

CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

insert into employee values(1,"adam",25000),(2,"bob",30000),(3,"casey",40000);

ALTER TABLE employee MODIFY COLUMN salary INT DEFAULT 25000;

insert into employee (id,name) values (4,"Rahul");
select * from employee;

--  STUDENT TABLE

create table student1(
roll_no int Primary key auto_increment,
name varchar(50),
marks int not null,
grade  varchar(5),
city varchar (50)
);

insert into student1 values (101,"anil",78,"C","Pune"),(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),(104,"dhruv",96,"A","Delhi"),(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

select distinct city from student;
select * from student where marks +10 > 100;
select  * from student where city = "Delhi";
 
-- Operator

select * from student where marks>90 AND city="Mumbai";
select * from student where marks>90 or city="Mumbai";
select * from student where marks between 80 AND 100;
select * from student where city in ("Delhi","Mumbai");
select * from student where city not in ("Delhi","Mumbai");

-- limit
select * from student where marks>80 limit 3;

-- order by
  Select * from student order by name asc;
  select * from student order by marks desc limit 3;
  
-- Aggregate Function 
select count(roll_no) from student;
select sum(marks) from student;
select avg(marks) from student;
select max(marks) from student;
select min(marks) from student;

-- Group clause
select city from student group by city;
select city, count(roll_no) from student group by city;
select city, avg(marks) as marks from student group by city;
select city, sum(marks) from student group by city;
select city, max(marks) from student group by city;
select city, min(marks) from student group by city;

-- Having Clause
-- Count number of student in each city where max marks cross 90

Select Count(name) as count,city from student
group by city
having max(marks)>90;

SELECT city, count(roll_no) as number
FROM student
GROUP BY city
Having max(marks)>90;

SELECT city 
FROM student
Where grade='A'
GROUP BY city
Having max(marks)>95;

-- --Update query 
UPDATE student
SET grade= "O"
where grade="A";

UPDATE student 
SET marks=86
where roll_no=105;

UPDATE student 
SET grade="B"
where marks between 80 AND 90;

UPDATE student 
SET marks=marks+1;

UPDATE student 
SET marks=20
where roll_no=105;

select * from student;

-- --Save mode Query
SET SQL_SAFE_UPDATES =0;

-- Delete Query

delete from student where roll_no=105;
DELETE FROM student
WHERE marks<33;

select * from student;




-- Practice question
-- 1. Write the query to find avg marks in each city in ascending order.
  select city ,avg(marks) from student group by city order by city asc;

-- 2. for the given table find the total payment according to each payment method
  
  create database Customer;
  create table Payment(
  customer_id int primary key ,
  cust_name varchar (50),
  mode varchar(50),
  city varchar(100)
  );
  select * from payment;
   
SELECT mode, COUNT(cust_name) AS mode_count 
FROM payment 
GROUP BY mode 
ORDER BY mode DESC;


select * from student;
select grade, count(name) from student group by grade order by Grade ASC;


-- SUB QURIES
SELECT * FROM student1;

SELECT AVG(marks) 
FROM student1;

select name , marks
from student1 
where marks>74.3333;

-- syntax of subquires
-- select col
-- from table_name
-- where col_name operator
-- (subquery);

SELECT name, marks
FROM student1
where marks > 
(SELECT AVG(marks) FROM student1);

select roll_no
from student1
where roll_no%2=0;

SELECT roll_no,name 
from student1
WHERE roll_no IN(102,104,106);

-- Dyanamic
SELECT roll_no,name 
from student1
WHERE roll_no IN(select roll_no
from student1
where roll_no%2=0);

-- FROM
-- 1 method
select name ,city
from student1
where city="Delhi"
AND marks=(select max(marks) from student1 where city="Delhi");

-- 2nd Method
SELECT MAX(marks)
from (select * from student1 where city="Delhi") AS temp;


SELECT (SELECT max(marks) FROM student1),name from student1;









