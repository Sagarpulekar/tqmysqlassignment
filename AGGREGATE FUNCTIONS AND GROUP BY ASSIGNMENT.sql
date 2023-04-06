-- 1. Write a query to list the number of jobs available in the employees table.
SELECT COUNT(*) AS num_jobs FROM employees;
-- 2. Write a query to get the total salaries payable to employees.
SELECT SUM(salary) AS total_salary FROM employees;
-- 3. Write a query to get the minimum salary from employees table.
SELECT MIN(salary) AS min_salary
FROM  employees;
-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
select * from employees;
SELECT MAX(salary) AS max_salary FROM employees WHERE job_title = 'Programmer';
-- 5. Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(salary) AS avg_salary, COUNT(*) AS num_employees FROM employees WHERE department_id = 90;
-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary, SUM(salary) AS total_salary, AVG(salary) AS avg_salary FROM employees;
-- 7. Write a query to get the number of employees with the same job.
select * from jobs;
SELECT job_id, COUNT(*) AS num_employees FROM employees GROUP BY job_id;
-- 8. Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(salary) - MIN(salary) AS salary_range FROM employees; 

-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT manager_id, MIN(salary) AS lowest_salary FROM employees GROUP BY manager_id;

-- 10. Write a query to get the department ID and the total salary payable in each department.
SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id;
-- 11. Write a query to get the average salary for each job ID excluding programmer.
SELECT job_title, AVG(salary) AS avg_salary FROM employees WHERE job_title <> 'Programmer' GROUP BY job_title;
-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT job_title, SUM(salary) AS total_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary, AVG(salary) AS avg_salary FROM employees WHERE department_id = 90 GROUP BY job_title;
-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT job_title, MAX(salary) AS max_salary FROM employees WHERE salary >= 4000 GROUP BY job_title;
-- 14. Write a query to get the average salary for all departments employing more than 10 employees
SELECT AVG(salary) AS avg_salary, department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 10;



can we use truncate command 