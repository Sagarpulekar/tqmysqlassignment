create database testdb;
use testdb;
#1. Write a stored procedure to check factorial of given no
	/*CREATE DEFINER=`root`@`localhost` PROCEDURE ` get_factorial`(IN num INT, OUT result INT)
BEGIN
DECLARE fact INT DEFAULT 1;
	DECLARE temp INT DEFAULT 1;
	WHILE temp <= num DO
	SET fact = fact * temp;
	SET temp = temp + 1;
	END WHILE;
	SET result = fact;
END */

#2. Write a stored procedure to check whether entered no is odd or even 
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `checkoddeven`(IN num INT, OUT result VARCHAR(10))
BEGIN
IF num%2 = 0 THEN
SET result = 'Even';
ELSE
SET result = 'Odd';
END IF;
END */

#3. Stored procedure to get the count of the employee where department id is passed as an argument
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_counte`(IN dept_id INT, OUT emp_count INT)
BEGIN
SELECT COUNT(*) INTO emp_count FROM Employee WHERE department_id = dept_id;
END*/
 
#4. Stored procedure to get the count of the employee and the average salary of department where department id is passed 
    #as an argument. Employee and Department are two separate tables containing deptid common.
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeeCountAndAvgSalary`(IN dept_id INT)
BEGIN
  DECLARE emp_count INT;
  DECLARE avg_salary DECIMAL(10,2);

  SELECT COUNT(*) INTO emp_count FROM Employee WHERE deptid = dept_id;
  SELECT AVG(salary) INTO avg_salary FROM Employee WHERE deptid = dept_id;

  SELECT emp_count AS employee_count, avg_salary AS average_salary;
END*/

#5. Stored to list all dates which belong to particular weekday passed as an argument in the current month
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `getweekdaydates`(IN weekday INT)
BEGIN
SELECT DATE_FORMAT(date, '%Y-%m-%d') FROM Calendar WHERE DAYOFWEEK(date) = weekday AND MONTH(date) = MONTH(NOW());

END */

#6. Consider Student table with sid,sname,m1,m2,m3 total,teacherid.
CREATE TABLE Student (
  sid INT PRIMARY KEY,
  sname VARCHAR(50),
  m1 INT,
  m2 INT,
  m3 INT,
  total INT,
  teacherid INT,
  FOREIGN KEY (teacherid) REFERENCES Teacher(teacherid)
);
ALTER TABLE `testdb`.`student` 
CHANGE COLUMN `total` `total` INT NULL DEFAULT (m1+m2+m3) ;

   #Consider Teacher table with teacherid, teachername,subject.
   CREATE TABLE Teacher (
  teacherid INT PRIMARY KEY,
  teachername VARCHAR(50),
  subject VARCHAR(50)
);

#1.Create trigger which will check wheather all marks are in range between 0 to 100 before inserting record in Student table.
   # If not , then it should display error message
/*CREATE DEFINER=`root`@`localhost` TRIGGER `checkmarksrange` BEFORE INSERT ON `student` FOR EACH ROW BEGIN

IF NEW.m1 NOT BETWEEN 0 AND 100 OR NEW.m2 NOT BETWEEN 0 AND 100 OR NEW.m3 NOT BETWEEN 0 AND 100 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Marks should be between 0 and 100';
END IF;
END*/

#2. Write a Trigger for, if teacher record gets deleted then automatically teacheridshould become null in related records in teacher table.
/*CREATE TRIGGER delete_teacher
AFTER DELETE ON Teacher
FOR EACH ROW
BEGIN
UPDATE Student SET teacherid = NULL WHERE teacherid = OLD.teacherid;
END*/
delete from teacher where teacherid like 5;

#3.Write a Trigger for – If teacherid in teacher table gets changed then it should be automatically updated in related records in Student table.
/*CREATE DEFINER=`root`@`localhost` TRIGGER `teacher_AFTER_UPDATE` AFTER UPDATE ON `teacher` FOR EACH ROW BEGIN
UPDATE Student SET teacherid = NEW.teacherid WHERE teacherid = OLD.teacherid;

END */

#4.Write Trigger for audit purpose for any DML action on Student table
/*CREATE DEFINER=`root`@`localhost` TRIGGER `student_audit` AFTER INSERT ON `student` FOR EACH ROW BEGIN
INSERT INTO Student_Audit (sid, sname, m1, m2, m3, total, teacherid, action)
VALUES (NEW.sid, NEW.sname, NEW.m1, NEW.m2, NEW.m3, NEW.total, NEW.teacherid, 'insert');

END*/

/*CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_UPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
INSERT INTO Student_Audit (sid, sname, m1, m2, m3, total, teacherid, action)
VALUES (NEW.sid, NEW.sname, NEW.m1, NEW.m2, NEW.m3, NEW.total, NEW.teacherid, 'update');
END

CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_DELETE` AFTER DELETE ON `student` FOR EACH ROW BEGIN
INSERT INTO Student_Audit (sid, sname, m1, m2, m3, total, teacherid, action)
VALUES (OLD.sid, OLD.sname, OLD.m1, OLD.m2, OLD.m3, OLD.total, OLD.teacherid, 'delete');
END
*/

