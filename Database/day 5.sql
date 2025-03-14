-- instead of 
-- after
/*
create or alter trigger checkInsert on account instead of insert as
begin
	insert into account select account_number, account_name, ISNULL(account_balance,1000.0),ISNULL(customer,0) from inserted;
end;
*/

-- select * from sys.triggers;

-- insert into account values(2343234334333, 'Adityan',null,null);

/*
create or alter trigger preventDelete on account instead of delete as 
begin
	print 'You are unauthorize to delete';
end;
*/

-- delete from account where customer=2;


-- Normal forms

/*
keys:
primary
foreign key
unique
composite

UN normalized>> non atomic values
1NF
2NF
3NF


*/

-- credit card
-- create table creditcard_before_norm(card_number bigint not null primary key, card_cvv int not null, card_holder varchar(max) not null, card_status int not null);
-- insert into creditcard_before_norm values(87656765676764, 987, 'Razak Mohamed S',1);
-- insert into creditcard_before_norm values(8765676567676, 987999, 'Razak Mohamed S',1);
-- create table creditcard_after_first(card_number bigint not null primary key, card_cvv int not null, card_holder varchar(max) not null, card_status int not null, holder_permanent varchar(255) not null, holder_communicate varchar(max) not null);
-- insert into creditcard_after_first values(8765676567676, 987999, 'Razak Mohamed S',1,'Salem, Ponnammapet','Kakkaveri, Rasipuram');
-- create table creditcard_after_second(card_number bigint not null primary key, card_cvv int not null, card_holder varchar(max) not null, card_status int not null);
-- create table address_after_second(address_id int not null primary key, address varchar(max) not null, card_holder bigint not null foreign key(card_holder) references creditcard_after_second(card_number));
-- insert into creditcard_after_second values(8765676567676, 987999, 'Razak Mohamed S',1);
-- insert into address_after_second values(1, 'Salem, Ponnammapet', 8765676567676);
-- insert into address_after_second values(2, 'Rasipuram, Kakkaveri', 8765676567676);

-- create table address_after_third(address_id int not null primary key identity(1,1), address varchar(max) not null);
-- create table map_address_card_after_third(address_id int not null, card bigint not null);

-- insert into address_after_third values('Salem, Ponnammapet');
-- insert into address_after_third values('Rasipuram, Kakkaveri');

-- insert into map_address_card_after_third values(1,8765676567676);
-- insert into map_address_card_after_third values(2,8765676567676);

-- alter table map_address_card_after_third add constraint fk_address foreign key (address_id) references address_after_third(address_id);

-- exec sp_rename 'map_address_card_after_third.card','card_id', 'column';

-- alter table map_address_card_after_third add constraint fk_card foreign key (card_id) references creditcard_after_second(card_number);

/*
creditcard_after_second
address_after_third
map_address_card_after_third
*/