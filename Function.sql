SHOW DATABASES;
USE college;
SHOW TABLES;

SELECT * FROM student1;

-- ASCII()
SELECT ASCII('m');

-- CHAR_LENGTH()
SELECT char_length('bhumika');

-- CHARACTER_LENGTH()
SELECT character_length('emanuel');

-- CONCATE()
-- SELECT 'anil' || ' '|| 'sharma' 
-- FROM student1;

SELECT CONCAT('anil', ' ', 'sharma') AS full_name 
FROM student1 where name='anil';

-- FIND_IN_SET()
SELECT name,FIND_IN_SET('i','a,b,c,d,e,f,g,h,i') 
as FindSet
FROM student1 WHERE name='anil';

-- FORMATE()
-- select sum(marks) as marks from student1;
-- SELECT name,FORMAT(0.446*100,'marks') + '%' AS percentage
-- FROM student1;

SELECT name, 
CONCAT(FORMAT(0.78 * 100, 2), '%')
AS percentage 
FROM student1
where roll_no=101;

-- LCASE()
SELECT LCASE('anil') 
FROM student1
WHERE roll_no=101;

-- LEFT()
SELECT LEFT('anil',2)
FROM student1
WHERE roll_no=101;

-- LENGTH()
SELECT LENGTH('anil')
FROM student1
WHERE roll_no=101;

-- LOCATE()
SELECT LOCATE('hu','bhumika',1)
AS LOCATION
FROM student1
WHERE roll_no=102;

-- UPPER()
SELECT UPPER(name)
AS NAME
FROM student1
WHERE roll_no BETWEEN 101 AND 105;

-- LTRIM()
SELECT REPLACE('anil', 'an', '') 
AS trim 
FROM student1 
WHERE roll_no = 101;

-- MID()
SELECT MID('bhumika',3,6) 
AS MidName
FROM student1
where roll_no=102;

-- POSITION()
SELECT position('i' IN 'bhumika')
AS POSITION
FROM student1
where roll_no=102;

-- REPEAT()
SELECT REPEAT('anil',2)
AS repeated_String
FROM student1
where roll_no=101;

-- REPLACE()
SELECT REPLACE('anil Sharma', 'anil', '') 
AS REPLACESTRING
FROM student1 
WHERE roll_no = 101;

-- REVERSE()
SELECT REVERSE('anil')
FROM student1
WHERE roll_no=101;

-- RIGHT()
SELECT RIGHT('anil',2)
FROM student1
WHERE roll_no=101;

-- SPACE()
SELECT space(5)
AS spaces
FROM student1
where roll_no=101;

-- SUBSTR()
SELECT SUBSTR('anil',1,2)
FROM student1
where roll_no=101;

-- SUBSTRING()
SELECT SUBSTRING('anil',3,1)
FROM student1
where roll_no=101;

-- SUBSTRING_INDEX()
SELECT SUBSTRING_INDEX('bhumika', 'u', 2) 
AS substring_result
FROM student1 
WHERE roll_no = 102;
