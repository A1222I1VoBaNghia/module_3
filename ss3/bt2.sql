create database if not exists salemanagement;
use salemanagement;
create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge tinyint
);
create table product(
pID int primary key auto_increment,
pName varchar(45),
pPrice double
);
create table oder(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice int,
foreign key(cID) references customer(cID)
);
create table OrderDetail(
oID int,
pID int,
unique(oID, pID),
odQTY varchar(255),
foreign key (oID)references oder(oID),
foreign key (pID) references product(pID));

insert into Customer(cName ,CAge)
values('Minh Quan',10),
	  ('Ngoc Oanh',20),
      ('Hong Ha',50);
insert into oder (cID,oDate,oTotalPrice)
values (1,'2006-03-21',null),
	  (2,'2006-03-23',null),
      (1,'2003-03-16',null);
insert into Product(PName , PPrice)
values('May Giat',3),
      ('Tu Lanh',5),
      ('Dieu hoa',7),
      ('Quat',1),
      ('Bep Dien',2);
insert into OrderDetail(OID,PID,ODQTY)
values(1,1,3),
      (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
      
select oID, oDate, oTotalPrice from Oder;

select Customer.cName, Product.pName from Customer
join Oder on Customer.cID = Oder.cID 
join OrderDetail on Oder.oID = OrderDetail.oID 
join Product on OrderDetail.pID = Product.pID;

select c.cName from Customer c
join Oder o 
on c.cID = o.oID 
where c.cID not in (select o.cID);

select o.oID, o.oDate, (od.odQTY*p.pPrice) as oTotalPrice   from Oder o
join OrderDetail od
on o.oID = od.oID
join Product p
on od.pID = p.pID;