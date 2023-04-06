#write a query to Get all employees with their respective departments 
use studenttestdb;
select * from departments;
SELECT e.first_name,e.last_name, d.department_name
FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;

#Query to find no of males and females in each department 
SELECT d.department_name, e.gender, COUNT(e.employee_id) AS count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name, e.gender;

#Query to produce summary report of each department name  in which whether it has employee or not
SELECT d.department_name, COUNT(e.employee_id) AS count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

#Query to get the name of emp according to manager 
SELECT e.first_name, e.last_name, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;



#Query to get the name of emp who have manager 
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.manager_id IS NOT NULL;


#Query to find the employee for whom Nikhil is the immediate manager 
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Nikhil');


#Query to find no of employees under each manager 
SELECT m.first_name, m.last_name, COUNT(e.employee_id) AS count
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY m.first_name, m.last_name;


#query to find those employees who have more than three  employees working under them directly 
SELECT e.first_name, e.last_name
FROM employees e
WHERE (SELECT COUNT(*) FROM employees WHERE manager_id = e.employee_id) > 3;


#Query to find all pairs of employees in department 20 who were hired in the same year
SELECT e1.name, e2.name
FROM employee e1
INNER JOIN employee e2 ON e1.id < e2.id 
                      AND e1.dept_id = 20 
                      AND e2.dept_id = 20 
                      AND YEAR(e1.hire_date) = YEAR(e2.hire_date);

#Query to get name of employee who have salary greater than sonali 
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.salary > (SELECT salary FROM employees WHERE first_name = 'Sonali');

#Get the name of employee whose salary is greater than the average salary of the organization
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

#Get the name of the employee who have hired in the same year as sonali
SELECT first_name, last_name
FROM employees
WHERE YEAR(hire_date) = YEAR((SELECT hire_date FROM employees WHERE first_name = 'Sonali'));

#Get the name of manager of wasim 
SELECT m.first_name, m.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.first_name = 'Wasim';

#In which city the Nikhil lives
SELECT l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id

#Get the count of all employees where Nikhil as a manager 
select COUNT(*) AS employee_count
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Nikhil');


#Per job how many employess in marketing department get more than 40000
SELECT job_title, COUNT(*) AS employee_count
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
JOIN departments ON employees.department_id = departments.department_id
WHERE departments.department_name = 'Marketing'
AND employees.salary > 40000
GROUP BY job_title;


#Get the name of the emp who getting the highest salary in dept 20
SELECT first_name || ' ' || last_name AS employee_name
FROM employees
WHERE department_id = 20
ORDER BY salary DESC
LIMIT 1;


#Get the employees who get the maximum salary amongst all managers 
SELECT first_name || ' ' || last_name AS employee_name, salary
FROM employees
WHERE (employee_id, salary) IN 
    (SELECT manager_id, MAX(salary) 
     FROM employees 
     GROUP BY manager_id)
ORDER BY salary DESC;


#List of all cities either they are in mp or up 
SELECT DISTINCT city
FROM locations
JOIN countries ON locations.country_id = countries.country_id
JOIN regions ON countries.region_id = regions.region_id
WHERE (regions.region_name = 'Madhya Pradesh' OR regions.region_name = 'Uttar Pradesh');


#Get the count of all cities in india 
SELECT COUNT(DISTINCT city) AS city_count
FROM locations
JOIN countries ON locations.country_id = countries.country_id
WHERE countries.country_name = 'India';


#Sum salary of employee working in mumbai 
SELECT SUM(salary) AS total_salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id
WHERE locations.city = 'Mumbai';


#Get the list of the managers of the organization
SELECT DISTINCT managers.first_name || ' ' || managers.last_name AS manager_name
FROM employees AS managers
JOIN employees AS employees ON managers.employee_id = employees.manager_id;
