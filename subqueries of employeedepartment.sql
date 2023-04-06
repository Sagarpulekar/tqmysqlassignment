use employeedatabase;
# show average salary expenses of some department 
select * from department;
select * from employee;
select avg(esalary), deptid from employee
group by deptId
having deptId = (select deptId from department where dname like 'quality');