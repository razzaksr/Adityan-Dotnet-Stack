--- Stored procedure:
--- 

/*
create or alter name_of_fun @input_arg, @output_arg as
begin
end
*/

/*
insert into account values(2346347445,'Sabarinathan S',84558.3,2)
insert into account values(1232434344343,'Aliya S',48.3,3)
insert into account values(93249934934,'Rajiya R',1923.3,3)
insert into account values(93477348734,'Rasheedha R',93482.23,1)
*/

/*
-- procedure to apply charges and read values
create or alter procedure updateAndRead 
as 
begin 
-- updating
update account set account_balance = account_balance-50 where account_balance<=10000;
-- read
select * from account;
end
*/
-- exec updateAndRead;
-- select * from sys.procedures;

/*
-- procedure to update specific row via input
create or alter procedure addInterest @start float, @end float
as
begin
update account set account_balance=account_balance+100 where account_balance between @start and @end;
select * from account;
end
*/
-- exec addInterest @start=500, @end=50000;

-- since output variables gonna be print after the call of procedure, so we need create a variable first then print
/*
-- procedure to delete and returns the count of deletion done
create or alter procedure delAccounts @customer_id int, @count_of_deleted INT output
as
begin
delete from account where customer = @customer_id;
-- varibale creation inside procedure
set @count_of_deleted = @@ROWCOUNT;
end
*/
/*
declare @my_count int;

exec delAccounts @customer_id=2, @count_of_deleted=@my_count output;

print 'No of suspended accounts are '+ cast(@my_count as nvarchar(10));
*/

-- drop procedure updateAndRead;