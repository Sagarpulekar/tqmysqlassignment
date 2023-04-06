create database payroll;
use payroll;
desc department;
select * from department;


#table employee
create table employee(
empid int primary key,
empname varchar(15) not null,
empjdate date,
empsal int
);

desc employee;

	
alter table employee
add column deptid int null;
select * from employee;
insert into employee
values(101,'sagar','2023/01/10',50000,3),
(102,'bhushan','2023/01/11',45000,4),
(103,'pritish','2023/01/12',48000,3);
insert into employee(empid,empname) values(104,'suyog');
insert into employee values(105,'vivek','2023/01/13',55000,3),
(106,'shan','2023/01/14',35000,4),
(107,'omkar','2023/01/15',48000,3);

insert into employee values(108,'rupali','2023/01/16',54000,3),
(109,'vaishnavi','2023/01/17',35000,4),
(110,'mamta','2023/01/18',48000,3);

select * from employee;
# update query
update employee set empsal=80000 where empid=101;
update employee set deptid=2, empsal=empsal+2000 where empname='sagar' and deptid=3;

drop  table department;

