/*
Procedures with exception handling:

begin try
end try
begin catch
	ERROR_MEESAGE()
end catch



TCL: transaction control language:
commit
rollback

begin transaction

commit transaction

rollback transaction
*/
-- drop procedure updateAndRead;
-- select * from sys.procedures;

/*

*/


/*
create or alter procedure withdraw @account_num bigint, @amount int, @infoerr varchar(255) output as
begin
	begin try
		update account set account_balance=account_balance-@amount where account_number=@account_num;
		set @infoerr = 'Withdrawn success';
	end try
	begin catch
		set @infoerr = 'Error due to '+ERROR_MESSAGE();
	end catch
end;
*/

-- exec updateAndRead;
-- select * from account;

/*
declare @msg varchar(255);
exec withdraw @account_num=93249934934, @amount = 1000, @infoerr = @msg output;
print @msg;
*/

/*
triggers:
when:
	instead of >> before
	after

types:
DML
DDL
Logon/ session
*/

-- select * from sys.sysusers;

-- DML trigger>> inset,update,delete

-- create table account_dml_log(log_id int identity(1,1) primary key, account_number bigint, operation varchar(255), doneat datetime);
/*
create or alter trigger dml_account on account after insert, delete as
begin
	if exists(select * from inserted)
	begin
		insert into account_dml_log(account_number, operation, doneat) select account_number, 'insert', GETDATE() from inserted;
	end;
	if exists(select * from deleted)
	begin
		insert into account_dml_log(account_number, operation, doneat) select account_number, 'delete', GETDATE() from deleted;
	end;
end;
*/

-- insert into account values(9999111221,'Sabarinathan S',3948.12,2);
-- delete from account where account_name='Aliya S';
-- select * from account_dml_log;


create or alter trigger dml_inst on account instead of insert as 
begin
	if exists(select 4 from inserted where customer is null)
	begin
		insert into account values(account_number, account_name,account_balance,0)
		return
	end
	insert into account values(9999111221,'Sabarinathan S',3948.12,2);
end;

