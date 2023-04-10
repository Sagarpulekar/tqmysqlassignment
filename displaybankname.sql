CREATE DEFINER=`root`@`localhost` PROCEDURE `displaybanknames`(IN pannumber VARCHAR(10))
BEGIN 
SELECT b.name FROM bankdetails b 
JOIN bankcustomer c ON b.bankid=c.bankid
JOIN bankcustomermaster cm ON c.custid=cm.custid WHERE cm.pan_no=SRTE3366F AND DATEDIFF(NOW(),cm.birthdate)>=60;
END