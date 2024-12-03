show databases;
use college;
show tables;

SELECT * FROM student1;

-- current date and time
SELECT NOW();

-- current date
SELECT CURDATE();

-- current time
SELECT CURTIME();

-- DATE
SELECT name,marks,city, CURDATE()
AS DATE , CURTIME() AS TIME FROM student1;

-- EXTRACT()-> Single part of a date/time.alter
SELECT name,city, CURDATE() 
AS EXTRACT FROM student1;

SELECT name, EXTRACT(DAY FROM BIRTHTIME) 
AS birthday from student1;

-- DATE_ADD()
SELECT name, DATE_ADD(BirthTime, Interval 1 YEAR) 
AS BirthTimeModified From student1;

-- DATEDIFF()
SELECT DATEDIFF(day, '2024-01-03', '2024-01-13') AS DateDiff 
FROM student1;

-- DATE_FORMATE()
SELECT name, city, 
DATE_FORMAT(date_of_birth,'%Y-%m-%d')
AS DATE 
FROM student1;


