use products;
# show total no ot items supplied by supplier with name shree
select supid from supplier where firstname like "shree";
# show total no ot items supplied by supplier with name shree
select count(*) as 'total item' , supid from item
where supid=(select supid from supplier where firstname like 'shree');

# show itemid and item name supplied by supplier with name shree
select * from item;
select itemid,itemname,supid from item
where supid=(select supid from supplier where firstname like 'shree');

select * from supplier;
select * from item
where supid in (select supid from supplier where firstname in ('shree','akash'));

#show itemid and itemname supplied by supplier whose supid is greater than supid of supplier with name ravi
select * from supplier;
select * from item
where supid >= (select supid from supplier where firstname like "shree" );

#subquery with in <any,<all,>any,>all clause
select * from supplier;
#show all items supplied by supid is either matching with supid of ravi or mayur
select * from item
where supid in (select supid from supplier where firstname in ('ravi','mayur'));
# show item details whose supid is greater than either supid of ravi or mayur
select * from item
where supid >any(select supid from supplier where firstname in ('ravi','mayur'));
# show item details whose supid is greater than all supid of ravi or mayur
select * from item
where supid >all(select supid from supplier where firstname in ('ravi','akash')); 
# show item details whose supid is lesser than either supid of ravi or mayur
select * from item
where supid <any(select supid from supplier where firstname in ('ravi','mayur'));
# show item details whose supid is lesser than all supid of ravi or mayur
select * from item
where supid <all(select supid from supplier where firstname in ('ravi','mayur'));


#subquery with insert, update and delete

#update item cost by increasing it by 50rs
select * from item;
update item set cost=cost+50;
#update item cost by increasing it by 100rs supplied by shree
select * from supplier;


update item set cost=cost+100
where supid = (select supid from supplier where firstname like 'shree');
select * from item;

create table item1(
itemid int primary key not null,
itemname varchar(45) not null,
itemcost float not null,
supid int not null); 

#insert subquery
insert into item(select * from item1);
select * from item;

#subquery in delete clause
delete from item 
where supid=(select supid from supplier where firstname like "mayur");
select * from item;


select * from faculty;
update faculty
set salary = salary +10000
where facultyId in (
  select facultyId FROM (SELECT facultyId, salary, AVG(salary) OVER () AS avg_salary FROM faculty ) subquery
  WHERE salary > avg_salary);








