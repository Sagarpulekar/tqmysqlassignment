create database bankdb;
use bankdb;



#######################################bankdetails table##########################################
create table bankdetails(
				  bankid bigint primary key, 
				  name varchar (50),
				  Address varchar(60),
				  city varchar (25),
				  state varchar(30)
				  );
drop table bank;

#######################################bankcustomer table##########################################
create table bankcustomer(
					  cust_id bigint primary key,
					  bankid bigint
					 );
drop table customer;
alter table bankcustomer
add FOREIGN KEY (bankid) REFERENCES bankdetails (bankid);

#######################################bankaccounts table##########################################
create table bankaccounts(
					  Acc_no bigint primary key,
					  cust_id bigint ,
                      Acctype_id varchar(30),
                      Balance float,
                      open_date date);
                      ALTER TABLE BANKACCOUNTS
                      add foreign key(bankid) references bankdetails(bankid);
				      ALTER TABLE BANKACCOUNTS                 
				      add FOREIGN KEY (cust_id) REFERENCES bankcustomer (cust_id),
					  add FOREIGN KEY (Acctype_id) REFERENCES bankaccounttype (acctype_id);
      
#######################################bankaccounttype table##########################################
create table bankaccounttype(
                         acctype_id varchar(30) primary key,
						 acctype varchar(25));
					 
  
  #######################################banktransaction table##########################################
  
create table banktransaction(	
					     transaction_id varchar(50) primary key,
                         Acc_no bigint,
                         amount float,
                         transcation_type enum("1-debit","2-credit"),
                         transcation_date date);
						  ALTER TABLE banktransaction
                          add FOREIGN KEY (Acc_no) REFERENCES bankaccounts (Acc_no);
                                                    
#######################################bankcustomermaster table##########################################
create table bankcustomermaster(
				           cust_id bigint primary key,
                           cname varchar (50),
						   contact bigint,
                           birth_date date,
                           pan_no varchar (15));
select * from bankcustomermaster;
alter table bankcustomermaster
add column bankid bigint;

##################################Queries---------------------------------------------------------------------

# a) Display all bank name, cname , city from all  bank in ascending order of bankname  and descending order of city name 
SELECT b.name, b.city, cm.cname
FROM bankdetails b 
JOIN bankcustomermaster cm ON cm.bankid = b.bankid
ORDER BY b.name ASC, b.city DESC;

# b) write query to increase balance increase it by 25%  of existing balance for customer whose bank is SBI. 
UPDATE bankaccounts
SET Balance = balance + (balance*0.25)
WHERE bankid IN (SELECT bankid from bankdetails where name = 'STATEBANKOFINDIA');
select * from bankaccounts;

#c) find the count of SBI bank customers as per the city. 
select city, COUNT(*)
from bankdetails b
join bankcustomer c ON b.bankid = c.bankid
where b.name = 'STATEBANKOFINDIA'
group by city;

#  d) find customer who credits amount more than 20000 in april
SELECT cm.cname
FROM bankcustomermaster cm
inner join bankcustomer c on cm.bankid = c.bankid
inner join bankaccounts a on c.cust_id = a.cust_id
inner join banktransaction t ON t.Acc_no = a.Acc_no
WHERE t.amount > 20000 AND MONTH(t.transcation_date) = 4 AND YEAR(t.transcation_date) = YEAR(CURRENT_DATE());

# e) find the 3rd largest transaction from Axis bank.

select t.transaction_id, t.amount
FROM banktransaction t
join bankaccounts a ON t.Acc_no = a.Acc_no
join bankcustomer c ON a.cust_id = c.cust_id
join bankdetails b ON c.bankid = b.bankid
where b.name = 'AXISBANKOFINDIA'
order by t.amount DESC
LIMIT 2,1;


# f) create procedure which display all  bank name of customer  whose pan_no is 'APS1023MA' and customer is senior citizen.

/* CREATE DEFINER=`root`@`localhost` PROCEDURE `displaybanknames`(IN pannumber VARCHAR(10))
BEGIN 
SELECT b.name FROM bankdetails b 
JOIN bankcustomer c ON b.bankid=c.bankid
JOIN bankcustomermaster cm ON c.custid=cm.custid WHERE cm.pan_no=SRTE3366F AND DATEDIFF(NOW(),cm.birthdate)>=60;
END*/

# g) Find the number of customer on the basis of account type
select acctype, COUNT(*)
from bankaccounts a
join bankaccountType ba ON a.acctype_id = ba.acctype_id
group by acctype;

# h) Display the time span of the account being opened
select * from bankcustomermaster;
select ba.acc_no,cm.cust_id, cm.cname, datediff(curdate(),open_date),"%Y" AS days_open
from bankaccounts ba
JOIN bankcustomerMaster cm ON ba.cust_id = cm.cust_id;

# i) Display the accountno, balance, customer name, age of the customer
select a.Acc_no, a.Balance, cm.cname, timestampdiff(YEAR, cm.birth_date, CURDATE()) AS age
from bankaccounts a
join bankcustomer c ON a.cust_id = c.cust_id
join bankcustomermaster cm ON c.BANKid = cm.BANKid;