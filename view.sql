show databases;
use college;
show tables;
select * from student1;

-- VIEW
Create view view1 as
select roll_no,name,marks from student1;

select * from view1;

select name, marks 
from view1
WHERE marks>90;

DROP VIEW view1;

SELECT * from view1 
where marks>(select avg(marks) from view1);

select * from view1
where marks>90;

-- USE Join view 

Create view view2 as 
select f.fname,d.dname from 
Faculty f,department d
where f.deptid=d.deptid;

select name from view1;

 