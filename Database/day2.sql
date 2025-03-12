-- views: DDL
-- creating view
-- create view ends as select * from dbo.customer where customer_name like '%R';

-- executing view
-- select * from ends;

-- altering view
-- alter view ends as select * from dbo.customer where customer_name like 'R%';

-- drop
-- drop view ends;

-- DCL
-- login credentials
-- create login adhityan with password = 'adhi';
-- create login razak with password = 'mohamed';

-- users for that login credentials

-- use adityan;
-- select * from dbo.customer;
-- create user razak for login razak;
-- create user adhityan for login adhityan;

-- drop users
-- drop user razak;

-- grant privileages
-- alter role db_datareader add member adhityan;
-- grant select on customer to razak;


-- check login in system principals
-- select name from sys.server_principals;

use adityan;
select name from sys.database_principals;


-- after login via razak
use adityan;
-- select * from customer;
update customer set customer_status = 0 where username = 'razzaksr';

