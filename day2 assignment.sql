create database social_db;
use social_db;
show tables;

drop table Facebook;
drop table Twitter;

create table Facebook(Id int primary key, Name varchar(25), tid int,
                      foreign key(tid) references Twitter(tid));
                      
insert into Facebook values(101,'Jack',1),(102,'Sagar',2),(103,'Bhushan',3);

alter table Facebook
add foreign key(tid) references Twitter(tid);

create table Twitter(tid int primary key, Following varchar(35));

select * from Twitter;
select * from Facebook;

desc Facebook;
desc Twitter;

#17. Write a query to truncate the table facebook

  truncate table Facebook;

  select * from Facebook;
  
#=============================================================================================================================================



#1.	Write a query to create database for example “products.”
create database products;

#2.	Write a query to drop the same database for example “products.”
drop database products;

#3.	write a query to create table laptop
create table laptop(lpid int , lname varchar(15), version varchar(10));

#4.	Write a query to create schema having name “organization”.
create database organizatioin;

#        5. Schema organization consist of 2 tables
#                  i. Employee with field id, name, salary
#                  Ii. Department with field department id, department name varchar (15), hod 

    use organization;
    create table Employee(id int primary key, name varchar(15), salary double);
    create table Department(did int primary key, dname varchar(15)); 

# 6. Write a query to add column emp_email_id(varchar (50)) to employee table.
    alter table Employee add column emp_emial_id varchar(50);

#7. Write a query to add column no of employee to department after department 
    alter table Department add column no_emp_dpt int after did;

#  8.  Write a query to modify the column department name with varchar (50)
    alter table Department modify name varchar(50);

    drop table Department;
    drop table Employee;

#  10. Write a query to change name of employee table to employee_details.
    alter table Employee rename to employee_details;

#    11. Write a query to change the name of the column salary to salary_per_month
   alter table Employee rename column salary to salary_per_month;

#  12. Write a query to set primary key
    alter table Employee add primary key(id);

# 13. Write a query to set primary key while creating a table of your choice 
    create table Customer(id int PRIMARY KEY , name varchar(25));

# 14. Write a query to show composite primary key 
    alter table orders add constraint pk_orders primary key(order_id,customer_id);

# 15. Write a query to drop the primary key
    alter table customer drop primary key;

# 16. Write a query to show how to set appropriate foreign key and primary key
     create table Facebook(Id INT NOT NULL PRIMARY KEY , Name VARCHAR(50), tid INT UNIQUE);
     create table Twitter(tid INT PRIMARY KEY, FOREIGN KEY(tid) REFERENCES Facebook(tid));

# Write a query to truncate the table facebook ?



