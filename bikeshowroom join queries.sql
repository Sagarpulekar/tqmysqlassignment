use bikeshowroomdb;
select * from customer;
select * from feedback_rating;
select * from model;
select * from payment_mode;
select * from purchase;
#Show names of customer & booking amount who has purchased model_id=102:
SELECT c.first_name,c.last_name, p.booking_amount
FROM customer c JOIN purchase p ON c.cust_id = p.cust_id
WHERE p.model_id = 102;

#Show name of customers who has purchased the same model:
SELECT c.first_name,c.last_name,m.model_name,m.model_id
FROM customer c JOIN purchase p join model m ON c.cust_id = p.cust_id and p.model_id=m.model_id
order by m.model_name;

#Show name of model, model_id who has maximum rating:
select * from model;
select * from feedback_rating;
SELECT m.model_name, m.model_id,f.rating
FROM model m join purchase p join feedback_rating f
on p.model_id=m.model_id and p.rating_id=f.rating_id and f.rating_id=1;


#Show total amount paid by each payment mode i.e cash, online, cheque:
select * from payment_mode;
select * from purchase;
SELECT p1.payment_type, SUM(p.booking_amount) AS total_amount
FROM purchase p jOIN payment_mode p1 ON p1.payment_id = p.payment_id
GROUP BY p1.payment_id;

select substring ("programming",4,8);

#Show names of customer who has paid in online mode:
select *from payment_mode;
select * from purchase;
SELECT c.firstname,c.lastname
FROM customers c
JOIN purchase p ON c.cust_id = p.cust_id
JOIN payment_mode p1 ON p.payment_id = p1.payment_id
WHERE p.payment_mode = 'online';

#Show the models whose booking amount is greater than the booking amount of "somename":
select * from customer;
SELECT m.name
FROM models m
JOIN bookings b ON m.model_id = b.model_id
JOIN customers c ON b.customer_id = c.customer_id
WHERE b.booking_amount > (
  SELECT b2.booking_amount
  FROM bookings b2
  JOIN customers c2 ON b2.customer_id = c2.customer_id
  WHERE c2.name = 'rupesh'
);

#Show the number of models purchased by male & female:
SELECT c.gender, COUNT(DISTINCT b.model_id) AS num_models
FROM customers