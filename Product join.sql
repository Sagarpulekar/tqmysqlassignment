use products;
select * from supplier;
select * from item;
select i.itemid,i.itemname,i.cost,i.supid,s.supid,s.firstname,s.phonenumber
from item i inner join supplier s
on i.supid=s.supid;

select i.*,s.firstname,s.phonenumber
from item i  join supplier s
on i.supid=s.supid;

select i.* ,s.firstname,s.phonenumber
from item i join supplier s
on i.supid=s.supid and s.firstname="shree";

select itemid,itemname,cost,firstname,phonenumber
from item i,supplier s
where i.supid=s.supid;

