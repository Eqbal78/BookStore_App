-------------------------------------- Store Procedure ----------------------------------

--use BookStore_App

---------------------------------------- Add Records in BookStore Table ---------------------------

create procedure Sp_AddBookRecords
(
@Bk_Name varchar(255),
@Bk_Image varchar(225),
@Bk_Author_Name varchar(55),
@Bk_Price int,
@Bk_Rating float,
@Bk_Quentity int,
@Bk_Register_Date datetime
)
as
begin
insert into BookStore(Book_Name, Book_Image, Author_Name, Price, Rating, Quentity, Register_Date)
values (@Bk_Name,@Bk_Image,@Bk_Author_Name,@Bk_Price,@Bk_Rating,@Bk_Quentity,@Bk_Register_Date)
end

exec Sp_AddBookRecords 'Tomb of Sand','https://images-na.ssl-images-amazon.com/images/I/41Hp+mTN4oL._SX310_BO1,204,203,200_.jpg','Geetanjali Shree',559,4.3,63,'2022/03/21'


-------------------------------- Display Records From BookStore Table --------------------------------

create procedure Sp_DisplayBook
as
begin
  select * from BookStore
end

exec Sp_DisplayBook

--------------------------- Delete Record From BookStore Table ------------------

create procedure Sp_DeleteBookStoreRecords
@Bk_ID int
as
begin
  delete from BookStore where Book_ID = @Bk_ID
end

exec Sp_DeleteBookStoreRecords 7


--------------------------- Update Record From BookStore Table ------------------


alter procedure Sp_UpdateBookStoreRecords
(
@Bk_ID int,
@Bk_Price int
)
as
begin
	Update BookStore set Price = @Bk_Price where  Book_ID = @Bk_ID
end

exec Sp_UpdateBookStoreRecords 7,504


---------------------------- Search Record From BookStore Tables -------------------

create procedure Sp_SearchBookStoreRecord
@Bk_Name varchar(225)
as
begin
  select * from BookStore where Book_Name = @Bk_Name
end

exec Sp_SearchBookStoreRecord 'Zero Day'


create procedure Sp_SearchBookStoreRecordByAuthorName
@Bk_Author_Name varchar(225)
as
begin
  select * from BookStore where Author_Name = @Bk_Author_Name
end

exec Sp_SearchBookStoreRecordByAuthorName 'Harish Mehta'


-------------------------------- Add Records in Customer Table ---------------------


alter table Customer add Account_ID int
update Customer set Account_ID = 4001 where Customer_ID = 1
update Customer set Account_ID = 4002 where Customer_ID = 2
update Customer set Account_ID = 4003 where Customer_ID = 3
update Customer set Account_ID = 4004 where Customer_ID = 4
update Customer set Account_ID = 4005 where Customer_ID = 5
update Customer set Account_ID = 4006 where Customer_ID = 6
update Customer set Account_ID = 4007 where Customer_ID = 7
update Customer set Account_ID = 4008 where Customer_ID = 8
update Customer set Account_ID = 4009 where Customer_ID = 9
update Customer set Account_ID = 4010 where Customer_ID = 10
update Customer set Account_ID = 4011 where Customer_ID = 13
update Customer set Account_ID = 4012 where Customer_ID = 14
update Customer set Account_ID = 4013 where Customer_ID = 15
update Customer set Account_ID = 4014 where Customer_ID = 16

create procedure Sp_AddCustomerRecords
(
@Cs_First_Name varchar(225),
@Cs_Last_Name varchar(225),
@Cs_Email varchar(255),
@Cs_Address_ID int,
@Cs_Payment_ID int ,
@Cs_Book_ID int,
@Cs_Account_ID int
)
as
begin
insert into Customer(First_Name,Last_Name,Email,Address_ID,Payment_ID,Book_ID,Account_ID)
values(@Cs_First_Name,@Cs_Last_Name, @Cs_Email, @Cs_Address_ID,@Cs_Payment_ID,@Cs_Book_ID,@Cs_Account_ID)
end

exec Sp_AddCustomerRecords 'Salman','Khan','salman541@gmail.com',5,103,3,4015

------------------------- Display Records From Customer Table -----------------------------

create procedure Sp_DisplayCustomerRecords
as
begin
  select * from Customer
end

exec Sp_DisplayCustomerRecords


------------------------- Delete Records From Customer --------------------------------

create procedure Sp_DeleteCustomerRecords
@Cs_ID int
as
begin
  delete from Customer where Customer_ID = @Cs_ID
end

exec Sp_DeleteCustomerRecords 17




--------------------------- Update Record From Customer Table ------------------


create procedure Sp_UpdateCustomerRecords
(
@Cs_ID int,
@Cs_First_Name varchar(225),
@Cs_Last_Name varchar(225)
)
as
begin
	Update Customer set First_Name = @Cs_First_Name, Last_Name = @Cs_Last_Name where  Customer_ID = @Cs_ID
end

exec Sp_UpdateCustomerRecords 17,'Allu','Arjun'


-------------------------------------- Add Record From Address Table -------------------


create procedure Sp_AddAddressRecords
(
@Ad_City varchar(225),
@Ad_State varchar(225)
)
as
begin
insert into Address(City,State)
values(@Ad_City,@Ad_State)
end

exec Sp_AddAddressRecords 'Kerla','Tamil Nadu'

------------------------------ Add Data in Order table

create procedure sp_OrderPlaced
(
	@book_id int,
	@customer_id int,
	@order_PlacedDate datetime
)
as
begin
insert into Orders(Book_ID,Customer_ID,Order_Placed_Date,Order_Delivered_Date) 
	values(@book_id,@customer_id,@order_PlacedDate,DATEADD(DAY,7,@order_PlacedDate))

end 

exec sp_OrderPlaced 6,7,'2022/02/24'
exec sp_OrderPlaced 2,8,'2020/02/24'
exec sp_OrderPlaced 1,7,'2020/09/14'
exec sp_OrderPlaced 5,2,'2021/04/04'
exec sp_OrderPlaced 3,10,'2021/08/20'
exec sp_OrderPlaced 4,1,'2020/05/22'


----------------------------- Find the Name using If-Else -----------------------------


alter procedure Sp_NameFinder
( @name varchar(50) )
as
begin
  if((select [First_Name] from [Customer] where [First_Name] = @name) = @name)
    begin
	Print 'The record with name: '+@name+' is there in the table'
    end
   else
    begin
	Print 'The record with name: '+@name+' is not there in the table'
    end
end

exec Sp_NameFinder 'Honey'

---------------------------- Get Data from Order tables with Some Conditions -----------------------

alter procedure Sp_GetDataOrder
@Places_Date datetime
as 
begin
	declare @sales int
	select 
        @sales  = SUM(Price * Quentity) 
    from
        BookStore
        INNER JOIN Orders ON Orders.Book_id = BookStore.Book_id
    where
        YEAR(Order_Placed_Date) = @Places_Date;

	select @sales as TotalAmountPerYear ;

    if @sales > 50000
    begin
        PRINT 'Great! The sales amount in 2020 is greater than 50000';
    end
	else
	begin	
		PRINT 'The sales amount in 2020 is less than 50000';
	end
end

exec Sp_GetDataOrder 2021

select * from BookStore
select * from Orders


----------------------------------------- Create Function Call in Store Procedure -----------------------

alter function Fun_Order_Details_With_Condition
(
@Place_Date datetime,
@Place_Date_01 datetime
)      
returns table       
as      
return(select BookStore.Book_ID, BookStore.Book_Name from BookStore INNER JOIN Orders ON Orders.Book_ID = BookStore.Book_ID
		where YEAR(Orders.Order_Placed_Date) Between @Place_Date AND @Place_Date_01) 


alter procedure Sp_CallingFunction
(
@Order_Place_Date datetime,
@Order_Place_Date_01 datetime
)
as 
begin
select * from Fun_Order_Details_With_Condition(@Order_Place_Date,@Order_Place_Date_01)
end

exec Sp_CallingFunction 2020,2021

--------------------------------------------------------------------------------


create function Fun_Get_Data_OrdersDetails
(
 @Place_Date datetime
)      
returns table    
as 
		return(select SUM(Price * Quentity) as TotalAmountPerYear from BookStore INNER JOIN Orders ON Orders.Book_ID = BookStore.Book_ID
		where YEAR(Orders.Order_Placed_Date) = @Place_Date)



alter procedure Sp_CallingFunction01
(
@Order_Place_Date datetime
)
as 
begin
select * from Fun_Get_Data_OrdersDetails(@Order_Place_Date)
end

exec Sp_CallingFunction01 2021




create function Fun_Get_AllData
(
 @Place_Date datetime
)      
returns int--varchar(225) 
as
begin
declare @sale int
		select @sale = SUM(Price * Quentity) from BookStore INNER JOIN Orders ON Orders.Book_ID = BookStore.Book_ID
		where YEAR(Orders.Order_Placed_Date) = @Place_Date;

		  if @sale > 50000
		begin
			PRINT ('Great! The sales amount in 2020 is greater than 50000');
		end
		else
		begin	
			PRINT ('The sales amount in 2020 is less than 50000');
		end
		return (select @sale as TotalAmountPerYear); 
end

