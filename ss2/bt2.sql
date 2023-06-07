create database if not exists salemanagement;
use salemanagement;
create table customer(
cID varchar(45) primary key,
cName varchar(45),
cAge date
);
create table product(
pID varchar(45) primary key,
pName varchar(45),
pPrice double);
create table oder(
oID varchar(45) primary key,
cID varchar(45),
oDate date,
oTotalPrice double,
foreign key(cID)references customer(cID));
create table OrderDetail(
oID varchar(45),
pID varchar(45),
primary key(oID, pID),
odQTY varchar(255),
foreign key (oID)references oder(oID),
foreign key (pID) references product(pID));