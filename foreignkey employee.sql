use employeedatabase;
select * from employee;
select * from department;

alter table employee
add constraint fk_department
foreign key(deptId)
references department(deptId);

desc employee;
alter table employee
add constraint fk_department
foreign key(deptId)
references department(deptId)
on delete no action
on update no action;