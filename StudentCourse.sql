
use studentdb;
#table faculty
create table faculty(
facultyId int primary key,
fname varchar(30) not null,
phoneNo bigint not null,
salary float ,
email varchar(30));
drop table faculty;
desc faculty;
desc course;

#student table
create table student(
stid int,
sname varchar(30) not null,
email varchar(30),
phoneNo bigint not null,
courseId int,
feestatus varchar(10),
primary key (stid));
drop table student;
show databases;
desc student;

#inserting faculty details
insert into faculty
values(1, "Medha",9875578905,900000,"medha@gmail.com"),
 (2, "Kirab",9177800112,72000.50,"kiran@gmail.com"),
 (3, "Jayshree",8900675467,68000.5067,"jayshree@gmail.com"),
(4, "Shuruti",9873366895,55000.85,"shruti@gmail.com"),
(5,"Khadija",8977665540,34000,"khadija@gmail.com"),
(6,"Raksha",9006789760,45000,"raksha@gmail.com");

desc faculty;
select fname,salary
from faculty;
select * from faculty;
select * from student;
select * from course;
desc faculty;

alter table course
drop column facultyId;
desc course;

alter table course
drop column duration;

alter table course
add column duration varchar(30)
after cname;
insert into course
values(102,"java","3 months",30000);

select * from course;

alter table course
rename column duration to dur ;
desc course;

alter table course
change column dur duration varchar(30);

insert into course
values(102,"python","3 month",35000);

select* from course;

create table coursefaculty(
cfid int primary key not null,
courseId int not null,
facultyId int not null);
desc coursefaculty;

insert into coursefaculty
values(1,101,1),
(2,102,3),
(3,102,4),
(4,103,5),
(5,103,6),
(6,104,2),
(7,104,6),
(8,105,1);
desc coursefaculty;
