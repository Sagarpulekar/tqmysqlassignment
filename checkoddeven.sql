CREATE DEFINER=`root`@`localhost` PROCEDURE `checkoddeven`(IN num INT, OUT result VARCHAR(10))
BEGIN
IF num%2 = 0 THEN
SET result = 'Even';
ELSE
SET result = 'Odd';
END IF;
END