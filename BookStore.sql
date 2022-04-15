create database BookStore_App
use BookStore_App


create table BookStore(
Book_ID int primary key identity(1,1),
Book_Name varchar(55),
Book_Image varchar(225),
Author_Name varchar(55),
Price int,
Rating float,
Quentity int,
Register_Date datetime
)

alter table BookStore add Book_Category varchar(225)

insert into BookStore(Book_Name, Book_Image, Author_Name, Price, Rating, Quentity, Register_Date)
values
('GROW YOUR BABY, NOT YOUR WEIGHT','https://images-eu.ssl-images-amazon.com/images/I/41b38veyGwL._AC_SX184_.jpg',' Durga Shakti Nagpal',250,4.7,58,GETDATE()),
('Bruised Passports','https://images-na.ssl-images-amazon.com/images/I/41TxUmdg6hL._SX322_BO1,204,203,200_.jpg',' Savi Munjal',302,4.2,68,GETDATE()),
('The Maverick Effect','https://images-na.ssl-images-amazon.com/images/I/51sJ6ZqgX1L._SX328_BO1,204,203,200_.jpg','Harish Mehta',559,5,89,GETDATE()),
('Youth and Truth','https://images-na.ssl-images-amazon.com/images/I/51-jW9K79IL._SX324_BO1,204,203,200_.jpg',' Sadhguru',149,4.8,108,GETDATE()),
('Zero Day','https://images-na.ssl-images-amazon.com/images/I/51RFcsBf5jL._SX324_BO1,204,203,200_.jpg',' S. Hussain Zaidi',250,4,44,GETDATE()),
('Burning Questions','https://images-na.ssl-images-amazon.com/images/I/416zXOA+nbS._SX320_BO1,204,203,200_.jpg',' Margaret Atwood',740,4.6,82,GETDATE())

insert into BookStore(Book_Name, Book_Image, Author_Name, Price, Rating, Quentity, Register_Date,Book_Category)
values
('Think and Grow Rich','https://images-na.ssl-images-amazon.com/images/I/41+eK8zBwQL._SX319_BO1,204,203,200_.jpg','Napoleon Hill',149,4.1,21,GETDATE(),'Business & Economics'),
('The Intelligent Investor','https://images-na.ssl-images-amazon.com/images/I/51DLoxAJ68L._SX324_BO1,204,203,200_.jpg','Benjamin Graham',480,4.5,11,GETDATE(),'Business & Economics')

select * from BookStore

update BookStore set Book_Category = 'Health, Family & Personal Development' where Book_ID = 1
update BookStore set Book_Category = 'Health, Family & Personal Development' where Book_ID = 2
update BookStore set Book_Category = 'Business & Economics' where Book_ID = 3
update BookStore set Book_Category = 'Health, Family & Personal Development' where Book_ID = 4
update BookStore set Book_Category = 'Literature & Fiction' where Book_ID = 5
update BookStore set Book_Category = 'Literature & Fiction' where Book_ID = 6
update BookStore set Book_Category = 'Literature & Fiction' where Book_ID = 7

create table Sales(
Sales_ID int identity(1001,1) primary key,
Book_ID int,
Book_Category varchar(225),
Sale_Prices int
)

insert into Sales(Book_ID,Book_Category,Sale_Prices)
values(1,'Health, Family & Personal Development',450),
	  (2,'Health, Family & Personal Development',550),
	  (3,'Business & Economics',800),
	  (4,'Health, Family & Personal Development',350),
	  (5,'Literature & Fiction',440),
	  (6,'Literature & Fiction',995),
	  (7,'Literature & Fiction',606),
	  (8,'Health, Family & Personal Development',325),
	   (9,'Business & Economics',269),
	    (10,'Business & Economics',705)

select * from Sales

create table Address(
Address_ID int identity(1,1) primary key,
City varchar(55),
State varchar(225)
)

insert into Address(City,State)
values('Pune','Maharashtra'),
('Mumbai','Maharashtra'),
('Nagpur','Maharashtra'),
('Hyderabad','Telengana'),
('Bangalore','Karnataka'),
('Chennai','Tamil Nadu'),
('Jaipur','Rajesthan'),
('Pune','Maharashtra'),
('Gurgao','Delhi'),
('Gaziabad','Delhi')

Select * from Address


create table Payment(
Payment_ID int primary key identity(101,1),
Account_ID int,
Order_ID int,
Order_Date date,
Delivery_Date date
)

insert into Payment(Account_ID,Order_ID,Order_Date,Delivery_Date)
values
(1001,2001,'2022/04/01','2022/04/07'),
(1002,2002,'2022/03/15','2022/03/21'),
(1003,2003,'2022/03/07','2022/03/13'),
(1004,2004,'2022/03/25','2022/03/30'),
(1005,2005,'2022/03/12','2022/03/17')

select * from Payment


create table Customer(
Customer_ID int primary key identity(1,1),
First_Name varchar(225),
Last_Name varchar(225),
Email varchar(45) unique,
Address_ID int foreign key references Address(Address_ID),
Payment_ID int foreign key references Payment(Payment_ID),
Book_ID int foreign key references BookStore(Book_ID)
)

insert into Customer(First_Name,Last_Name,Email,Address_ID,Payment_ID,Book_ID)
values
('Rohan','Singh','rohan25@gmail.com',2,105,3),
('Vicky','Singh','vksingh@gmail.com',6,106,1),
('Rahul','Yadav','rahul224@gmail.com',2,104,3),
('Wasim','Khan','wasim854@gmail.com',7,107,5),
('Akash','Yadav','akash875@gmail.com',8,103,4),
('Avneet','Kour','avneet878@gmail.com',2,105,3),
('Honey','Singh','yoyosingh@gmail.com',3,106,6),
('Salman','Khan','salman456@gmail.com',2,105,1),
('Hritike','Roshan','hritike741@gmail.com',8,103,1),
('Katrina','Kaif','kat5632@gmail.com',9,104,5)

select * from Customer

insert into Customer(First_Name,Last_Name,Email,Address_ID,Payment_ID,Book_ID)
values
('Rohan','Singh','rohan125@gmail.com',2,103,1),
('Rahul','Yadav','rahul24@gmail.com',2,106,2),
('Wasim','Khan','wasim84@gmail.com',7,103,4),
('Akash','Yadav','akash075@gmail.com',8,105,6)

create table Orders(
Order_ID int primary key identity(1,1),
Order_Placed_Date datetime default cast(getdate() as date),
Order_Delivered_Date datetime default cast(dateadd(day,7,getdate()) as date),
Customer_ID int Foreign key references Customer(Customer_ID),
Book_Id int foreign key references Bookstore(Book_ID)
)

--drop table Orders

insert into Orders(Customer_Id,Book_ID)
values(3,3)

insert into Orders(Customer_Id,Book_ID,Order_Placed_Date)
values(4,6,SYSDATETIME())


select * from Orders

---------------------------- trigger ddl command ----------------------
use DemoDB
create trigger saftey
on database
for
create_table,alter_table,drop_table
as
print'you can not create ,drop and alter table in this database'
rollback;

create table demo01(id int, name varchar(225))

---------------------------  trigger dml command ----------------------

create trigger TableSaftey
on Address
for
insert,update,delete
as
print'you can not insert,update and delete this table i'
rollback;



----------------- Transaction Commit, Rollback and Savepoint the data --------------------

--commit data
begin transaction
insert into Customer values
('Natasha','Romanoff','blackwidow@gmail.com',10,103,3,4016)
commit
select * from Customer

------------------ rollback data --------------------
begin transaction
update Customer set First_Name = 'Caption', Last_Name = 'Marvel' where Customer_ID = 18
rollback;

----------------- save point 1 -------------------------
begin transaction
--delete Customer where Customer_ID = 18
update Customer set First_Name = 'Tony' where Customer_ID = 24
save transaction sav1

------------------- save point 2 --------------------------
begin transaction
insert into Customer values
('Edwin','Jarvis','jarvis@gmail.com',9,104,1,4017)
insert into Customer values
('Howard','Stark','stark@yahoo.com',8,107,2,4018);
save transaction sav2

------------------------ rollback save point 1 ------------------
select * from Customer
rollback transaction sav1


------------------------------- Cursor --------------------------

DECLARE 
    @book_name varchar(255), 
    @price int;

DECLARE cursor_bookDetails CURSOR
FOR SELECT 
        Book_Name, 
        Price
    FROM 
        BookStore;


OPEN cursor_bookDetails;
/* Then, fetch each row from the cursor and print out the employee name and salary :*/

FETCH NEXT FROM cursor_bookDetails INTO 
    @book_name,
    @price 

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @book_name + CAST(@price AS varchar(55));
        FETCH NEXT FROM cursor_bookDetails INTO 
            @book_name, 
            @price;
    END;

close cursor_bookDetails

DEALLOCATE cursor_bookDetails


-----------------------------------------------------------------------------------------


SET NOCOUNT ON  
DECLARE @id int  
DECLARE @name varchar(225)  
DECLARE @prices int  
DECLARE @registardate datetime
  
DECLARE EMP_CURSOR CURSOR  
LOCAL  FORWARD_ONLY  FOR  
SELECT Book_ID,Book_Name,Price,Register_Date FROM BookStore  
OPEN EMP_CURSOR  
FETCH NEXT FROM EMP_CURSOR INTO @id,@name,@prices,@registardate  
WHILE @@FETCH_STATUS = 0  
BEGIN  
PRINT  'Book_ID: ' + CAST(@id AS varchar)+  '  Book_NAME '+@name +'  Price '  +CAST(@prices AS varchar)  +  '  Registar_Date ' +CAST(@registardate AS varchar)  
FETCH NEXT FROM EMP_CURSOR INTO  @id,@name,@prices,@registardate  
END  
CLOSE EMP_CURSOR  
DEALLOCATE EMP_CURSOR 

