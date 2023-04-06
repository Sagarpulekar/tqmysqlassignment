use studenttestdb;
#1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.  
SELECT l.location_id, l.street_address, l.city,state_province, c.country_name
FROM locations l join departments d join countries c
ON l.location_id = d.location_id and c.country_id=l.country_id;


#2. Write a query to find the names (first_name, last name), department ID and name of all the employees.  
SELECT e.first_name,e.last_name,e.department_id,d.department_name
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;

#3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.  
select * from employees;
select * from departments;
select * from jobs;
select * from countries;
SELECT e.first_name,e.last_name,j.job_title,e.department_id,d.department_name,c.country_name 
FROM employees e JOIN jobs j join departments d join countries c
ON e.job_id = j.job_id and e.department_id = d.department_id and c.country_name = "London";

#4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).  
SELECT e.employee_id,e.last_name,e.manager_id,m.last_name as manager_name
FROM employees e JOIN employees m ON e.manager_id = m.employee_id;

#5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.  
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Jones')
ORDER BY hire_date;

#6. Write a query to get the department name and number of employees in the department.
SELECT departments.department_name,COUNT(*) AS num_employees
FROM departments
JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_id;
  
#7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
  SELECT employees.employee_id,jobs.job_title,DATEDIFF(job_history.end_date, job_history.start_date) AS duration_days
FROM job_history	
JOIN employees ON job_history.employee_id = employees.employee_id
JOIN jobs ON job_history.job_id = jobs.job_id
WHERE job_history.department_id = 90;

#8. Write a query to display the department ID, department name and manager first name.  
SELECT d.department_id, d.department_name, e.first_name 
FROM departments d JOIN e employees ON d.manager_id = e.employee_id;

#9. Write a query to display the department name, manager name, and city.
select * from departments;  
SELECT d.department_id, d.department_name, e.first_name 
FROM d departments  JOIN e employees join locations l ON d.manager_id = e.employee_id and d.location_id = l.location_id;

#10.Write a query to display the job title and average salary of  employees.  
SELECT j.job_title, AVG(e.salary) AS average_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_id;


#11.Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.  
SELECT jobs.job_title,CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name, 
employees.salary - jobs.min_salary AS salary_difference
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id;

#12.Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary 
SELECT job_history.* 
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id
WHERE employees.salary > 10000;

#13.Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.  
SELECT departments.department_name, 
CONCAT(employees.first_name, ' ', employees.last_name) AS manager_name, 
employees.hire_date, 
employees.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.employee_id = departments.manager_id AND DATEDIFF(CURRENT_DATE(), employees.hire_date) > 15*365;
