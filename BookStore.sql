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


insert into BookStore(Book_Name, Book_Image, Author_Name, Price, Rating, Quentity, Register_Date)
values
('GROW YOUR BABY, NOT YOUR WEIGHT','https://images-eu.ssl-images-amazon.com/images/I/41b38veyGwL._AC_SX184_.jpg',' Durga Shakti Nagpal',250,4.7,58,GETDATE()),
('Bruised Passports','https://images-na.ssl-images-amazon.com/images/I/41TxUmdg6hL._SX322_BO1,204,203,200_.jpg',' Savi Munjal',302,4.2,68,GETDATE()),
('The Maverick Effect','https://images-na.ssl-images-amazon.com/images/I/51sJ6ZqgX1L._SX328_BO1,204,203,200_.jpg','Harish Mehta',559,5,89,GETDATE()),
('Youth and Truth','https://images-na.ssl-images-amazon.com/images/I/51-jW9K79IL._SX324_BO1,204,203,200_.jpg',' Sadhguru',149,4.8,108,GETDATE()),
('Zero Day','https://images-na.ssl-images-amazon.com/images/I/51RFcsBf5jL._SX324_BO1,204,203,200_.jpg',' S. Hussain Zaidi',250,4,44,GETDATE()),
('Burning Questions','https://images-na.ssl-images-amazon.com/images/I/416zXOA+nbS._SX320_BO1,204,203,200_.jpg',' Margaret Atwood',740,4.6,82,GETDATE())

select * from BookStore


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