use studenttestdb;
#show the details of all employees and their departments:
select * from departments;
SELECT e.*, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

#Retrieve the details of all departments and their countries:
select * from countries;
select * from locations;
SELECT d.*, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

#Retrieve the details of all locations and their regions:
SELECT l.*, r.region_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

#write  a query to find  employeeid,lastname along with their  manager_id,manager name(last name ) using join in sql
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

select  * from employees;
select jh.*
from job history jh join employee e
on jh.employee_id=e.employee_id
and e.salary>10000;

#write a query to display  the job title and average salary of employee
