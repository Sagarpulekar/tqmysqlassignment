create database Sample_db;

use Sample_db;

create table Book(book_Id varchar(5) primary key,
				  book_Name varchar(25), 
				  author_Id int,
			      price double);

alter table Book 
add foreign key(author_Id) REFERENCES Author(author_Id);

desc Book;

#====================================================================================
                  
create table Author(author_Id int primary key, authorName varchar(25),
					phoneNum varchar(12), email varchar(50),
                    address varchar(135), city varchar(25));  
                    
drop table Author;
 
#====================================================================================
 
create table Awards(awardId varchar(5) primary key, awardtypeId varchar(5),
					authorId int , book_Id varchar(5), year int);   
 
alter table Awards 
add foreign key(awardtypeId) REFERENCES AwardMaster(awardtypeId); 

alter table Awards 
add foreign key(book_Id) REFERENCES Book(book_Id);

alter table Awards
add foreign key(authorId) references Author(author_Id);


 #==================================================================================== 

create table AwardMaster(awardtypeId varchar(5) primary key, awardName varchar(50),
                         awardPrice double);   
                         
alter table AwardMaster
add foreign key(awardtypeId) REFERENCES Awards(awardtypeId);
                          
drop table AwardMaster;                         


use sample_db;

create table Movies(movieId int primary key,
					movieName varchar(50),
                    releaseYear int ,
                    boxofficeCollection bigint);
                    
                    
create table Roles(rollId int primary key,
                   rollName enum('1-producer' ,
                                 '2-director', '3-hero',
                                 '4-heroine', '5-villain'
                                 ) not null);
drop table Roles;  
                               
select * from Roles;    

#======================================================================

create table Celebrity(celebrityId int primary key,
                       celebrityName varchar(30),
					   bod date,
                       phoneNum varchar(12),
                       email varchar(50)); 
                       
 #=====================================================================
 
 create table Bollywood(Bollywood_Id varchar(5) primary key,
                       celebrityId int,
					   movieId int,
                       rollId int,
                       FOREIGN KEY (celebrityId) REFERENCES Celebrity(celebrityId),
                       FOREIGN KEY (movieId) REFERENCES Movies(movieId),
                       FOREIGN KEY (rollId) REFERENCES Roles(rollId)
                       );
				   
