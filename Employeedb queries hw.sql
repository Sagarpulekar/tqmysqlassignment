use employeedatabase;
#Retrieve all employees and their corresponding department names and company names
select * from company;
select * from department
where companyId in (select companyId from company where companyName in ('GSSL','ECHJAY')); 
#Retrieve all departments and their corresponding company names
select * from company;
select * from department
where companyId in (select companyId from company where companyName LIKE 'GSSL'); 
#Retrieve all employees who work in a specific department
select * from department;
select * from employee
where deptId in (select deptId from employee where deptId in ('103','104'));
#Retrieve the total number of employees in each department
select * from employee;
select deptId,count(*) as total_employee 
from employee
group by deptId;
#Retrieve the top 5 highest-paid employees and their salaries
select * from employee
where esalary>=(select esalary from employee where ename like 'md')
order by esalary desc;

#ALTER queries:
#ALTER TABLE employee ADD gender VARCHAR();
select * from employee;
alter table employee
add gender character;

#Modify the experience column to allow null values
select * from employee;
alter table employee
modify column experience float null;
desc employee;

#Rename the company table to "organizations":
select * from company;
update company
set companyName="Goradia Special Steel Ltds"
where companyId=1000;

update company
set companyName="ECHJAY FORGING PVT LTD"
where companyId=1001; 


#Modify the location column to increase its size to 50 characters:
select * from employee;
desc employee;
ALTER TABLE employee modify COLUMN address varchar(50);

#SELECT queries:
#Select all employees who work in department 101 and company 1000:
select * from department;
SELECT * from employee
WHERE deptId in (select deptId from department where deptId=101);

#Select all employees who work in locationid 5 or cityid 20 :
select * from city;
select * from location;

#SELECT * FROM employee
#WHERE location = 6 OR city = 4;
#Select all employees who work in department 8, 10 or 12:

#SELECT * FROM employee
#WHERE department IN (8, 10, 12);
#Select all employees who do not work in department 5:

#SELECT * FROM employee
#WHERE department NOT IN (5);
#Select all employees ordered by their salary in descending order:

#SELECT * FROM employee
#ORDER BY salary DESC;
#Select all employees whose name contains the letter "a":

#SELECT * FROM employee
#WHERE employee_name LIKE '%a%';
#Select the total number of employees in each department:

#SELECT department, COUNT(*) as num_employees
#FROM employee
#GROUP BY department;
#Select the department with the highest average salary:

#SELECT department, AVG(salary) as avg_salary
#FROM employee
#GROUP BY department
#ORDER BY avg_salary DESC
#LIMIT 1;
#Select the department with at least 5 employees and an average salary greater than $50,000:

#SELECT department, COUNT(*) as num_employees, AVG(salary) as avg_salary
#FROM employee
#GROUP BY department
#HAVING num_employees >= 5 AND avg_salary > 50000;
#Select all employees hired between January 1, 2022 and December 31, 2022:

#SELECT * FROM employee
#WHERE hire_date BETWEEN '2022-01-01' AND '2022-12-31';
#Select all employees who have a salary greater than $100,000 and work in department 8 or 10:

#SELECT * FROM employee
#WHERE salary > 100000 AND department IN (8, 10);
#DELETE queries:
#Delete all employees who work in department 5:

#DELETE FROM employee
#WHERE department = 5;
#Delete all employees who were hired before January 1, 2020:

#DELETE FROM employee
#WHERE hire_date < '2020-01-01';
#Delete all employees who have a salary less than $50,000 and work in company 3:

#DELETE FROM employee
#WHERE salary < 50000 AND company = 3;
#Delete all employees who work in location 6 and have not been assigned to a department:

#DELETE FROM employee
#WHERE location = 6 AND department IS NULL;
#Delete all employees from the employee table:

#DELETE FROM employee;

#Update the salary of employee with employee_id = 1 to 60000:
#Update the department_id of employee with employee_id = 2 to 7:
#Update the city_id of all employees in company 2 to 5
#Update the hire_date of all employees in department 8 to January 1, 2022
#Update the hire_date of all employees in department 8 to January 1, 2022

