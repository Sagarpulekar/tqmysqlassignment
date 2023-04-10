CREATE DEFINER=`root`@`localhost` PROCEDURE ` get_factorial`(IN num INT, OUT result INT)
BEGIN
DECLARE fact INT DEFAULT 1;
	DECLARE temp INT DEFAULT 1;
	WHILE temp <= num DO
	SET fact = fact * temp;
	SET temp = temp + 1;
	END WHILE;
	SET result = fact;
END