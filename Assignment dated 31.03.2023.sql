#Assignment dated:-31.03.2023
use studenttestdb;
#1. Write a query to find the names (first_name, last_name) and the salaries of the employees who have a higher salary than the employee whose last_name='Bull'.
select * from employees;
select first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'Bull');

#2. Write a query to find the names (first_name, last_name) of all employees who works in the IT department.  
select * from departments;
select first_name, last_name
from employees
where department_id = (select department_id from departments where department_name = 'IT');
#3. Write a query to find the names (first_name, last_name) of the employees who have a manager and work for a department based in the United States.   
#Hint : Write single-row and multiple-row subqueries 
select * from employees;
select * from departments;
select * from countries;
select * from locations;
select first_name, last_name
from employees
where manager_id in
(select employee_id from employees where manager_id is not null and department_id in
(select department_id from departments where location_id = 1400));

#3. Write a query to find the names (first_name, last_name) of the employees who are managers.
select first_name, last_name
from employees
where employee_id in (select manager_id from employees);  
#4. Write a query to find the names (first_name, last_name), the salary of the employees whose salary is greater than the average salary.  
select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees);

#5. Write a query to find the names (first_name, last_name), the salary of the employees whose salary is equal to the minimum salary for their job grade.  
select first_name, last_name, salary
from employees
where salary = (select min(salary) from employees e2 where e2.job_id = employees.job_id);

#6. Write a query to find the names (first_name, last_name), the salary of the employees who earn more than the average salary and who works in any of the IT departments.  
select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees where department_id in
(select department_id from departments where department_name = 'IT'));


#7. Write a query to find the names (first_name, last_name), the salary of the employees who earn more than Mr. Bell.  
select first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'Bell');


#8. Write a query to find the names (first_name, last_name), the salary of the employees who earn the same salary as the minimum salary for all departments.  
select first_name, last_name, salary
from employees
where salary = (select min(salary) from employees e2 where e2.job_id = employees.job_id);

#9. Write a query to find the names (first_name, last_name), the salary of the employees whose salary greater than the average salary of all departments.  
select first_name, last_name, salary 
from employees 
where salary > (select avg(salary) from employees);

#10. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than
#the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.  
select first_name, last_name, salary
from employees
where salary > (select max(salary) from employees where job_id = 'SH_CLERK')
order by salary asc;

#11.Write a query to find the names (first_name, last_name) of the employees who are not supervisors.  
select * from employees;
select * from departments;
select first_name, last_name
from employees
where manager_id=0; #not in (select  manager_id from employees);

#12. Write a query to display the employee ID, first name, last names, and department names of all employees.  
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

#13. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.  
select e.employee_id, e.first_name, e.last_name, e.salary
from employees e
where e.salary > (select avg(salary) from employees where department_id = e.department_id);

#14. Write a query to fetch even numbered records from employees table.  
select * from employees 
where mod(employee_id, 2) = 0;

#15. Write a query to find the 5th maximum salary in the employees table.
select distinct salary from employees 
order by salary desc limit 4,1;

#16. Write a query to find the 4th minimum salary in the employees table.  
select distinct salary from employees 
order by salary asc limit 3,1;

#17. Write a query to select last 10 records from a table.  
select * from (select * from employees order by employee_id desc limit 10) 
sub ORDER BY employee_id asc;

#18. Write a query to list department number, name for all the departments in which there are no employees in the department.  
select department_id, department_name from  departments
where department_id not in(select department_id from employees);

#19. Write a query to get 3 maximum salaries.  
select distinct salary from employees order by salary desc limit 3;

#20. Write a query to get 3 minimum salaries.  
select distinct salary from employees order by salary asc limit 3;

#21. Write a query to get nth max salaries of employees.  
SELECT DISTINCT Salary 
FROM employees E1 
WHERE n-1 = (SELECT COUNT(DISTINCT Salary) 
			FROM Employees E2 
            WHERE E2.Salary > E1.Salary
			);
/*SELEC salar
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2;
    
    select min(salary)from
    (select distinct(salary) from employees
    order by salary desc
    limit 3)as thirdhighest;*/

#show first_name,employees_id,experience of employee in the compnay
select * from employees;	
SELECT first_name, employee_id, DATEDIFF(curdate(), hire_date)/365 as experience
FROM employees;
SELECT first_name, employee_id, DATEDIFF(curdate(), hire_date)/12 as experience
FROM employees;

    