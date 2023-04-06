use studentdb;
select*from course;
select*from faculty;


select s.* from student
join course on s.courseId = c.courseId
join faculty on c.facultyId = f.facultyId
where faculty.fname = 'Raksha';

select*from student;
select s.sname,s.joiningdate,s.stid,s.feestatus,f.name
from student s join coursefaculty cs join faculty f
on s.courseid=cs.facultyid=f.facultyid and f.name="
raksha";

select s.*,c.cname
from  student s join course c
on s.courseid = c.courseid and c.cname = 'Java';

#student details whose course duration is 4 months
select * from student;
select s.*,c.cname,c.duration	
from student s join course c
on s.courseid =c.courseid and c.duration="4 month";

# # Show the course who faculty salary is greater than 60000
select c.cname,f.fname,f.salary 
from course c join coursefaculty cs join faculty f
on c.courseid=cs.courseid and cs.facultyid=f.facultyid and f.salary>60000;

#show faculty name of have faculty whose salary is greater than salary of shuruti
select * from faculty;
select f.fname,f.salary
from faculty f1 join faculty f2
on f1.salary>f2.salary and f2.fname="Shuruti";

# SHOW NAME WHOSE EPERIENCE IS GREATER THAN JAYASHREE
select f1.fname,f1.experience
from faculty f1 join faculty f2
on f1.experience > f2.experience and f2.fname="Jayshree";

# show faculty whose salary is greater than average salary
select f1.fname, avg(f2.salary) as 'average'
from faculty f1
join on f1.salary>f2.average;

SELECT f.fname
FROM faculty f
JOIN (SELECT AVG(salary) AS avg_salary FROM faculty) AS a
ON f.salary > a.avg_salary;

#show course name details where course faculty id 5
select * from course;
select c.*
from course c join coursefaculty cf join ;



#show the faculty details whos are teaching more than one course
SELECT f.*
FROM faculty f
JOIN courses c ON f.faculty_id = c.faculty_id
GROUP BY f.faculty_id
HAVING COUNT(*) > 1;







