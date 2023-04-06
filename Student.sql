SELECT * FROM studentdb.student;
# where clause
select * from student;
select sname,courseId
from student; 	
desc student;
#show student whose fee is notpaid
select sname
from student
where feestatus="notpaid";
	
#show student whose fee is half
select sname
from student
where feestatus="half";

#show student whose fee is null
select sname
from student
where feestatus is null;


#show student whose fee not paid or half
select sname
from student
where feestatus="half" or feestatus="notpaid";


#show student whose fee not paid, half using in
select sname
from student
where feestatus in ("notpaid","half");

select sname
from student
where feestatus="notpaid" and courseId=106;

select * from student;
select sname
from student
where feestatus="paid" and (courseId=101 or courseId=102);


