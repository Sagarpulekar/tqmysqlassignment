#subqueries
use studentdb;
select * from student;
select * from course;

select * from student 
where courseId in (select courseId from student where firstname like 'shree');
select * from faculty;
select * from coursefaculty;
select * from course
where exists (select * from faculty where facultyId = 5 AND facultyId = facultyId);
