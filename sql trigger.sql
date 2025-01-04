create database trigger_learn;
show databases;
use trigger_learn;
show tables;

create table users(
user_id int primary key,
name varchar(100),
per_hour_salary int default 0,
working_hour int default 0,
total_salary int default 0
);

create table accounts(
acc_no int primary key,
user_id int ,
balance int default 0
);

alter table users add column acc_count int default 0;

show tables;
desc users;

insert into users (user_id,name,per_hour_salary,working_hour) values(1001,"kajal pandit",8000,6);

select * from users;
select * from accounts;

insert into accounts (acc_no,user_id,balance) values(20012,1005,243000);

update users set working_hour=11, per_hour_salary=4000 where user_id=1001;



DELETE FROM users
WHERE user_id = 1005;
