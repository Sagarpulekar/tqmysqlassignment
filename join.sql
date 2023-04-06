use products;
select * from item;
select * from supplier;

#inner join
select * from item i join supplier s 
on i.supid=s.supid;

#equijoin
select * from item i join supplier s
where i.supid=s.supid;

#natural join
select * from item i natural join supplier s;

#
select * from item i join supplier s 
using (supid);

#nonequi
select * from item i cross join supplier s 
where i.supid<s.supid;

#leftouter
select * from item i left join supplier s  
on i.supid=s.supid;

#right outer 
select * from item i right join supplier s  
on i.supid=s.supid;