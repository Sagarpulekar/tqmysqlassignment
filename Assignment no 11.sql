create database bikeshowroomdb;
use bikeshowroomdb;

create table model(
model_Id int primary key,
model_Name varchar(45),
cost float) ;

create table customer(
cust_Id int primary key,
first_Name varchar(15),
last_Name varchar(20),
mobile_no bigint,
gender character);

create table purchase(
purchase_Id int primary key,
cust_Id int,
model_Id int,
booking_amount float,
payment_Id int,
purchase_date date,
rating_Id int);

create table payment_Mode(
payment_Id int primary key,
payment_type enum('11-online', '22-cash', '33-cheque') NOT NULL);
select*from payment_Mode;

create table feedback_rating (
  Rating_id int not null primary key,
  rating enum('5-excellent', '4-good', '3-average', '2-bad', '1-complaint') not null
);
#####################################
select*from customer;
select * from payment_mode;
desc payment_mode;
select * from purchase;
select * from feedback_rating;
delete from purchase where purchase_Id=20031;
drop table feedback_rating;
#######################################


create table feedback_rating (
  Rating_id int not null primary key,
  rating enum('1-complaint','2-bad','3-average','4-good', '5-excellent' ) not null
);
select * from purchase;
select * from feedback_rating;


#Adding email column in customer table:
alter table customer add email varchar(50);

#Showing the number of bikes sold of a particular model:
select * from purchase;
select count(*) as num_bikes_sold
from purchase where model_id =3010 ;

#Showing the total cost of each model name:
select*from model;
select*from purchase;
select model_Name, sum(cost) as total_cost
from model
group by model_name;


#Showing the number of ratings of each model for each rating type in decreasing order:
select * from feedback_rating;
select * from model;
select * from purchase;
select Model.model_name, feedback_rating.rating, count(*) AS num_ratings
FROM Model JOIN Purchase ON Model.model_id = Purchase.model_id
JOIN Feedback_rating ON Purchase.rating_id = Feedback_rating.rating_id
GROUP BY Model.model_name, Feedback_rating.rating
ORDER BY Model.model_name, num_ratings DESC;


#Increasing the cost of each bike by 10%:
update Model set cost = cost +(cost * 0.1);

#Showing the purchases whose booking amount is greater than 20,000:
select * from purchase;
select * from Purchase where booking_amount > 20000;

#Showing the customer whose mobile no is not given:
select * from customer;
####delete from customer where mobile_no between 8369703716 and 7774893456;
select * from Customer where mobile_no is null;

#Showing the average cost of all the model names:
select * from model;
select avg(cost) as average_cost from Model;

