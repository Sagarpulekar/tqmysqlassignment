CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeeCountAndAvgSalary`(IN dept_id INT)
BEGIN
  DECLARE emp_count INT;
  DECLARE avg_salary DECIMAL(10,2);

  SELECT COUNT(*) INTO emp_count FROM Employee WHERE deptid = dept_id;
  SELECT AVG(salary) INTO avg_salary FROM Employee WHERE deptid = dept_id;

  SELECT emp_count AS employee_count, avg_salary AS average_salary;
END