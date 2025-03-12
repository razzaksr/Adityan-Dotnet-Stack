-- DDL>> create, alter, drop
-- create database adityan;
use adityan;
-- create table customer(customer_id int not null, customer_name varchar(255) not null, customer_city varchar(255) not null, customer_contact bigint not null, customer_email varchar(100) not null, customer_doo date not null, username varchar(50) not null, password varchar(50) not null);
-- create table customer(customer_id int not null identity(1,1) primary  key, customer_name varchar(255) not null, customer_city varchar(255) not null, customer_contact bigint not null, customer_email varchar(100) not null, customer_doo date not null, username varchar(50) not null unique, password varchar(50) not null);
-- alter table customer add primary key (username);
-- alter table customer add customer_status int not null;
-- alter table customer drop column customer_doo;
-- alter table customer alter column customer_city int not null;

-- execute sp_help customer;
-- drop table customer;

-- auto increment: Oracle(sequence)
-- via identity while creating table

-- dml
-- insert into customer values(next value for customer_seq,'Rajiya R',636001, 8667002959, 'razaksrmd@gmail.com','rajiya','mohamed',1);
-- truncate table customer;

-- creating sequence
-- create sequence customer_seq as int start with 2025001 increment by 1;

-- dql
-- select * from customer;
-- read sequence:
-- select next value for customer_seq as my_num;
-- drop sequence:
-- drop sequence customer_seq;

-- adding sequence with customer table
-- alter table customer add constraint customer_seq primary key(customer_id);
-- update customer set customer_id = next value for customer_seq;