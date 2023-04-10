use studentdb;

#fees should be greater than 20000 for we are using trigger.
alter table course
add column scount int;
update course
set scount=(select count(*)
			from student
            group by courseid
            having course.courseid=student.courseid);
            
#Before Insert : Doesnot allow fees less than 20000           
/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_INSERT` BEFORE INSERT ON `course` FOR EACH ROW BEGIN
if new.fees<20000
then
signal sqlstate '20000'
set message_text="fees should be greater than 20000";
end if;
END
insert into course
values(108,"go","4 month",19000,0);
insert into course
values(109,"go","4 month",20000,0);
delete from course where courseid in (107,108,109);*/


#*********************************************************************

insert into course
values(106,"go","4 month",19999,0);  #it will provide error 
insert into course
values(107,"go","4 month",20000,0);   #fees is getting added 
insert into course
values(108,"angular","4 month",20000,0); #fees is getting added

#In Student table
#After Insert : update the course : increase the scount
/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_AFTER_INSERT` AFTER INSERT ON `course` FOR EACH ROW BEGIN
update course
set scount=scount+1
where courseid=new.courseid;
END*/

drop table logtable;
#creating logtable
create table logtable(
					  logid int primary key auto_increment,
                       actiontask varchar(30),
                       done_on date,
                       details varchar(100));
                       
#Before Deleted
/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_DELETE` BEFORE DELETE ON `course` FOR EACH ROW BEGIN
if exists(select courseid from student where courseid=old.course.id)
then
signal sqlstate '24000'
set message_text="Student exists in this course... cannot delete it";
end if;
END*/


#Before Deleted add to logtable
/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_AFTER_DELETE` AFTER DELETE ON `course` FOR EACH ROW BEGIN
insert into logtable(action,done_on,details)
values("coursedeleted",now(),concat(old.courseid,old.cname,old.duration,old.fees,old.scount));
END*/


#before update trigger
/*CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_UPDATE` BEFORE UPDATE ON `course` FOR EACH ROW BEGIN
insert into logtable(action,done_on,details)
values("coursebeforeupdate",now(),concat(old.courseid,old.cname,old.duration,old.fees,old.scount));
END */

insert into logtable (actiontask,done_on,details)
values("deleting","2023-08-08","none");
select * from logtable;
select * from course;
insert into course
values(109,"security","4month",35000,0);