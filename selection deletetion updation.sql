SELECT * FROM studentdb.student;
use studentdb;
select * from student;

#- Show all students whose courseid is either 103 or 102, and whose name starts with o
select sname from student 
where courseId in (103, 102) and sname like  'o%';


# Show all faculty whose email is not null
select * from faculty;
select * from faculty
where email is not null;

# Show the number of students in each course
select * from student;
select courseId, count(*) as num_students
from student
group by courseId;

#Show the number of courses according to duration
select * from course;
select duration, count(*) as num_courses
from course
group by duration;

# Increase the fees of all courses by 10%
select * from course;
update course
set fees = fees * 0.1;

# Increase the salary of faculty by 20% whose experience is greater than 5 years
select * from faculty;
update faculty
set salary = salary * 0.2
where experience > 5;

#Delete course communication
select * from course;
delete from course
where cname = 'Communication';

#Delete the students who have not paid the fees
select * from student;
delete from  student
where feestatus = 'notpaid';

#Show the faculty in desc order of salary 
		select * from faculty;
        select * from faculty order by salary desc;
        
#Show the student in asc order of course id and if the course is same then desc order of joining date
        select * from student
         order by courseId asc,  joiningdate desc;

#Show the total student in each course in asc order
         select * from student;
         select courseId , count(*) as total from student 
         group by courseId order by courseId asc;
-- q13. Add the column joining date in faculty
        select * from faculty ;
        alter table faculty 
        add column location text;
        
-- q14. Change the column to experience of exp 
select * from faculty;
        alter table faculty rename column experience to exp;
		alter table faculty change column exp  experience float;
        
        desc faculty;
	#q15. between query
        select * from faculty;
        
        select * from faculty
        where facultyId between 1 and 5;
        
        select * from faculty where salary between 20000 and 80000 order by salary desc;
        
        





