create database products;
use products;
create table supplier(
supid int,
firstname varchar(30) not null,
lastname varchar(30) not null,
phonenumber bigint not null,
email varchar(50),
primary key(supid));
desc supplier;


create table item(
itemid int primary key,
itemname varchar(30),
cost float,
supid int,
foreign key(supid) references supplier(supid));

desc item;

insert into item
values
(1,"pendrive",670,102);
insert into item
values
(2,"hardisk",3000,101);
insert into item
values
(3,"webcam",950,103);
insert into item
values
(4,"monitor",2000,104);
insert into item
values
(5,"keyboard",1100,105);
select * from item;
select * from supplier;
desc item;







