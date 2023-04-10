#Query to display the first day of the month (in datetime format) three months before the current month:
SELECT DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 3 MONTH), '%Y-%m-01');

#Query to display the last day of the month (in datetime format) three months before the current month:
SELECT LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH));

#Query to get the distinct Mondays from hire_date in employees table:
SELECT DISTINCT DATE_FORMAT(hire_date, '%Y-%m-%d') AS hire_date FROM employees WHERE WEEKDAY(hire_date) = 0;

#Query to get the first day of the current year:
SELECT DATE_FORMAT(NOW(), '%Y-01-01');

#Query to get the last day of the current year:
SELECT DATE_FORMAT(DATE_ADD(DATE_FORMAT(NOW(), '%Y-01-01'), INTERVAL 1 YEAR), '%Y-%m-%d');

#Query to calculate the age in years:
SELECT TIMESTAMPDIFF(YEAR, birthdate, NOW()) AS age FROM employees;

#Query to get the current date in the following format:
SELECT DATE_FORMAT(NOW(), '%M %e, %Y');

#Query to get the current date in the following format:
SELECT DATE_FORMAT(NOW(), '%W %M %Y');

#Query to extract the year from the current date:
SELECT YEAR(NOW());

#Query to get the DATE value from a given day (number in N):
SELECT DATE_ADD('2000-01-01', INTERVAL 730677 DAY);

#Query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30':
SELECT first_name, hire_date FROM employees WHERE hire_date BETWEEN '1987-06-01' AND '1987-07-30';

#Query to display the current date in the following format:
SELECT DATE_FORMAT(NOW(), '%W %D %M %Y %H:%i:%s');

#Query to display the current date in the following format:
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

#Query to display the current date in the following format:
SELECT DATE_FORMAT(NOW(), '%h:%i %p %b %e, %Y');

#Query to get the firstname, lastname who joined in the month of June:
SELECT first_name, last_name FROM employees WHERE MONTH(hire_date) = 6;

#Query to get the years in which more than 10 employees joined:
SELECT YEAR(hire_date) AS year, COUNT(*) AS count FROM employees GROUP BY year HAVING count > 10;

#Query to get first name of employees who joined in 1987:
SELECT first_name FROM employees WHERE YEAR(hire_date) = 1987;

#Query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years:
SELECT departments.department_name, employees.first_name, employees.last_name, employees.salary 
FROM employees 
JOIN departments ON employees.department_id = departments.department_id 
WHERE employees.employee_id = departments.manager_id 
AND DATEDIFF(NOW(), employees.hire_date) > 1825;