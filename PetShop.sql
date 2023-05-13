create database PetShop

create table Account(
ID int identity(1,1) primary key,
Email varchar(30),
Account varchar(30),
Password varchar(30),
FullName Nvarchar(50),
Phone varchar(10),
Address Nvarchar(max),
Role int check(Role = 0 or Role = 1 or Role = 2), --0:admin,1:customer,2:guest
Status int check(Status = 0 or Status = 1) --0:active,1:unactive
)

create table Category(
ID int identity(1,1) primary key,
CategoryName Nvarchar(50)
)

create table Pet(
ID int identity(1,1) primary key,
Name Nvarchar(100),
IDCate int foreign key references Category(ID),
Image varchar(max),
Price float,
Description Nvarchar(max),
Status int check(Status = 0 or Status = 1) --0:active,1:unactive
)

create table Orders(
ID int identity(1,1) primary key,
OrderDate date,
ShipDate date,
AccID int foreign key references Account(ID),
Status int check(Status = 0 or Status = 1 or Status = 2) --0:cancel,1:process,2:complete
)

create table OrderDetail(
ID int identity(1,1) primary key,
IDorders int foreign key references Orders(ID),
IDPet int foreign key references Pet(ID),
Quantity int check(Quantity >= 1)
)


--insert first
insert into Account(Account,Password,Role, Status) values('admin','123456',0,0)
--then
insert into Category(CategoryName) values ('Cat')
insert into Category(CategoryName) values ('Dog')
insert into Category(CategoryName) values ('Bird')
insert into Category(CategoryName) values ('Other')
--after
insert into Pet(Name,Price,IDCate,Status) values('Chó phốc sóc',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo mun đen',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Pug',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Husky',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Golden Retriever',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Chihuahua',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Poodle',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Chó Corgi Pembroke Wales',1200000,2,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Ba Tư',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Ragdoll',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Siberian',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Mỹ lông ngắn',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Savannah',1200000,1,0)
insert into Pet(Name,Price,IDCate,Status) values('Mèo Xiêm ',1200000,1,0)
