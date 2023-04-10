CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_counte`(IN dept_id INT, OUT emp_count INT)
BEGIN
SELECT COUNT(*) INTO emp_count FROM Employee WHERE department_id = dept_id;
END