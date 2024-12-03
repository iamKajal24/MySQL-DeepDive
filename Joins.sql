show databases;
use college;
show tables;
select * from student;

Create table student(
id int primary key,
name varchar(50)
);

insert into student
values (101,"kajal"),(102,"Rahul"),(103,"Ram");

create table course(
id int primary key,
course varchar(50)
);

insert into course (id,course)
values 
(102,"english"),
(105,"Math"),
(103,"Science"),
(107,"Computer Science");

select * from student;
select * from course;

-- Inner join

select * 
from student s
INNER JOIN course c
on s.id=c.id;

-- LEFT JOIN

select *
from student s
Left join course c
ON s.id = c.id;

-- Right join
SELECT *
FROM student s
RIGHT JOIN course c 
ON s.id = c.id;

-- Full join
SELECT *
FROM student s
LEFT JOIN course C
ON s.id = c.id
union
SELECT *
FROM student s
RIGHT JOIN course c
ON s.id = c.id;

-- Left Exclusive Join
SELECT *
FROM student s
LEFT JOIN course c
ON s.id=c.id
WHERE c.id IS NULL;

-- Right Exclusive Join
SELECT * 
FROM student s
RIGHT JOIN course c
ON s.id=c.id
where s.id IS NULL;

-- SELF JOIN
CREATE TABLE employee1(
id INT PRIMARY KEY,
name varchar(50),
manager_id int
);

INSERT INTO 
employee1 VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

SELECT a.name as manager_name , b.name
FROM employee1 as a
JOIN employee1 as b
ON a.id=b.manager_id;

-- UNION
SELECT name FROM employee
union 
SELECT name FROM employee;

SELECT name FROM employee
union all
SELECT name FROM employee;

-- SUB QURIES
 