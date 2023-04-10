CREATE DEFINER=`root`@`localhost` PROCEDURE `getweekdaydates`(IN weekday INT)
BEGIN
SELECT DATE_FORMAT(date, '%Y-%m-%d') FROM Calendar WHERE DAYOFWEEK(date) = weekday AND MONTH(date) = MONTH(NOW());

END