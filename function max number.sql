CREATE DEFINER=`root`@`localhost` FUNCTION `max_number`(a int,b int)
 RETURNS int 
BEGIN
declare max int;
if(a>b) then
set max_num=a;
else 
set max_num=b;
end if;
return max_num;
END