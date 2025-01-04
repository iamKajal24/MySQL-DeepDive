-- create trigger : trigger syntax
delimiter //
Create trigger before_insert_users
before insert
on users for each row
begin
-- body of trigger
set NEW.total_salary = NEW.per_hour_salary * New.working_hour;
end; //
delimiter ;

-- update trigger : trigger syntax -> 
-- update total salary ko based on updation of perhour salary and working hour 

delimiter //
create trigger before_update_users
before update
on users for each row
begin
set NEW.total_salary = NEW.per_hour_salary * New.working_hour;
end; //
delimiter ;

-- delete trigger : trigger syntax -> 
DELIMITER //
CREATE TRIGGER before_delete_users
BEFORE DELETE
ON users
FOR EACH ROW
BEGIN
    -- Example: Insert the deleted record into a backup table
    INSERT INTO users(user_id, name, per_hour_salary, working_hour, total_salary)
    VALUES (OLD.user_id, OLD.name, OLD.per_hour_salary, OLD.working_hour, OLD.per_hour_salary * OLD.working_hour);

    -- Alternatively, you could log the deletion in a log table
    INSERT INTO delete_log (user_id, deleted_at)
    VALUES (OLD.user_id, NOW());
END; //

DELIMITER ;

-- create trigger : to update account_count of users
delimiter //
create trigger before_open_account
before insert
on accounts
for each row
begin
update users set acc_count = acc_count + 1 where user_id= NEW.user_id;
end; //
delimiter ;

-- create trigger : to close account_count of users

delimiter //
create trigger before_close_account
before delete
on accounts
for each row
begin
update users set acc_count = acc_count - 1 where user_id= OLD.user_id;
end; //
delimiter ;


