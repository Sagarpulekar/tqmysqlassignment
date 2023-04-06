use studenttestdb;

#write query to find name of employee work in IT department
select first_name, last_name
from employees
where department_id = (select department_id
from departments where department_name='IT');

#write a query to find name of employee whose salary is greater than average salary of all the employee
select first_name,last_name from employees
where salary>(select avg(salary) from employees);

#write names of employee whose aalary is eqaul to the min_salary of job_id
select * from employees; 
SELECT first_name,last_name
FROM employees
where salary=(select min_salary
from jobs
where employees.job_id=jobs.job_id);
