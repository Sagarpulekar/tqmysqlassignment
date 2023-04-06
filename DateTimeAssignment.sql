#write a query to display first day on month in sql
SELECT adddate(CURDATE(), INTERVAL-DAY(CURDATE()) + 1 DAY) AS FirstDayOfMonth;
#select subdate( adddate(curdate(), interval 1 day), interval day(curdate()) day);
use products;
select * from supplier;
SELECT firstname,birthdate,datediff(curdate(),birthdate),"%Y" as age
from supplier;


use studenttestdb;
select * from employees
where monthname (hire_date) = "june" ;

#write a query to get the years in which more than  10 employees joined
SELECT YEAR(hire_date) as hire_year, COUNT(*) as num_employees
FROM employees
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 10;


#write a query to get firstname  of employees who joined in 1987
SELECT first_name
FROM employees
WHERE YEAR(hire_date) = 1987;

#write a query to get department_name,manager_id and salary of manager for all managers who experience  is more than 5 years
SELECT d.department_name, e.first_name, e.salary
FROM departments d JOIN employees e ON d.manager_id = e.manager_id
and (DATEDIFF(curdate(), hire_date)/365) > 5;

#write a query to get employee_id,last_name and date of first salary of the employees
SELECT employee_id, last_name, last_day(hire_date) as first_salary_date
FROM employees ;


#write a query  to get first_name ,hiredate and experience  of the employee
SELECT first_name, hire_date, DATEDIFF(year, hire_date, GETDATE()) as experience
FROM employees;

#update salary of employees by 20 % who are working in IT department
select * from employees;
select * from departments;

UPDATE employees
SET salary = salary * salary(salary*0.20)
FROM employees e  JOIN departments ON e.department_id = d.department_id
WHERE department_name = 'IT';

use studentdb;
#update salary of faculty by 10 % who are teaching more than one course
select * from coursefaculty;
update faculty
set salary = salary +(0.2*salary)
where facultyid IN (select facultyid from coursefaculty
					group by facultyid
					having count(*) > 1
					);
select * from faculty;	  	 	
use bikeshowroomdb;
#Update the city of a showroom named "Super Bikes" to "Los Angeles" in the "showrooms" table of the "bikeshowroomdb" database.

#Write a query to display first date of the month
select subdate( adddate(curdate(), interval 1 day), interval day(curdate()) day);
select adddate(curdate(),interval 1 day);

#Date and Time

#Current Date

select curdate();

#AddDate(date, interval)

select adddate(curdate(),interval 10 day);

select adddate(curdate(),interval 1 month);


#Select month from curdate

select dayofmonth(curdate()); # day

select month(curdate());

select monthname(curdate());

# Add time
select addtime(current_time(),"1:00:0");
select addtime("12:45:00","1:00:0");

select current_time();

#subtract date
select date_sub(curdate(), Interval 1 day);

#dateDiff

select datediff(curdate(),"2023-01-31"); # returns number of days

use testcoursedb1;

# show the first_name, id and experience of the employee in the company

select EMPLOYEE_ID, FIRST_NAME, datediff(curdate(),hire_date)/365 as Experience
from employees;

#Date Format

select date_format(curdate(),"%d/%m/%Y");

select date_format(curdate(),"%W %D %M %Y");
#Write a query to display first day of the month
select adddate(curdate(),interval-day(curdate())+ 1 day);
#Write a query to display last day of the month
select last_day(curdate());
select makedate(year(curdate()), 1) AS FirstDayOfYear;
